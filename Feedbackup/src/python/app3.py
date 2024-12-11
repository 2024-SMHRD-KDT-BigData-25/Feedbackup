from flask import Flask, render_template, jsonify, request
from flask_cors import CORS
import cv2
import pyaudio
import wave
import threading
import librosa
import numpy as np
import torch
from transformers import AutoModelForSpeechSeq2Seq, AutoProcessor, pipeline
import logging
import mediapipe as mp
import math

# Flask 앱 설정
app = Flask(__name__)
CORS(app)

# Mediapipe 설정
mp_hands = mp.solutions.hands
mp_face_detection = mp.solutions.face_detection
mp_drawing = mp.solutions.drawing_utils

# 로깅 설정
logging.basicConfig(level=logging.DEBUG)

# Whisper 모델 설정 (서버 시작 시 한 번만 로드)
device = "cuda:0" if torch.cuda.is_available() else "cpu"
model_id = "openai/whisper-large-v3-turbo"

print("모델 로딩 시작...")
model = AutoModelForSpeechSeq2Seq.from_pretrained("openai/whisper-large-v3-turbo")
print("모델 로딩 완료.")

model.to(device)

processor = AutoProcessor.from_pretrained(model_id)

pipe = pipeline(
    "automatic-speech-recognition",
    model=model,
    tokenizer=processor.tokenizer,
    feature_extractor=processor.feature_extractor,
    device=device
)

# 음성 캡처 클래스
class AudioCapture:
    def __init__(self, filename):
        self.chunk = 1024
        self.format = pyaudio.paInt16
        self.channels = 1
        self.rate = 44100
        self.filename = filename
        self.frames = []
        self.p = pyaudio.PyAudio()
        self.stream = None
        self.stop_event = threading.Event()

    def start(self):
        try:
            self.stream = self.p.open(format=self.format, channels=self.channels,
                                      rate=self.rate, input=True,
                                      frames_per_buffer=self.chunk)
            self.frames = []
            logging.debug("음성 캡처 시작...")
        except Exception as e:
            logging.error(f"음성 캡처 시작 중 오류 발생: {e}")

    def record(self):
        try:
            while not self.stop_event.is_set():
                data = self.stream.read(self.chunk, exception_on_overflow=False)
                self.frames.append(data)
        except Exception as e:
            logging.error(f"음성 캡처 에러: {e}")

    def stop(self):
        if self.stream is not None:
            self.stop_event.set()
            self.stream.stop_stream()
            self.stream.close()
            self.p.terminate()

            with wave.open(self.filename, 'wb') as wf:
                wf.setnchannels(self.channels)
                wf.setsampwidth(self.p.get_sample_size(self.format))
                wf.setframerate(self.rate)
                wf.writeframes(b''.join(self.frames))
            logging.debug(f"음성이 저장되었습니다: {self.filename}")

# 비디오 및 음성 캡처 함수
def capture_video_and_audio():
    filename = "captured_audio.wav"
    audio_capture = AudioCapture(filename)
    cap = cv2.VideoCapture(0)

    if not cap.isOpened():
        logging.error("웹캠을 열 수 없습니다.")
        return None

    # Mediapipe 모델 초기화
    hands = mp_hands.Hands(static_image_mode=False, max_num_hands=2, min_detection_confidence=0.5, min_tracking_confidence=0.5)
    face_detection = mp_face_detection.FaceDetection(min_detection_confidence=0.5)

    # 오디오 캡처 시작
    audio_capture.start()
    audio_thread = threading.Thread(target=audio_capture.record)
    audio_thread.start()

    logging.debug("웹캠이 열렸습니다. 'q'를 눌러 종료하세요.")
    while True:
        ret, frame = cap.read()

        if not ret:
            logging.error("웹캠에서 프레임을 읽지 못했습니다.")
            break
        
        # Flip the frame horizontally for a mirrored view
        frame = cv2.flip(frame, 1)
        rgb_frame = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)

        # 손 감지
        hand_results = hands.process(rgb_frame)
        # 얼굴 감지
        face_results = face_detection.process(rgb_frame)

        # 얼굴 감지 부분에서 img 대신 frame을 사용
        if face_results.detections:
            for detection in face_results.detections:
                bboxC = detection.location_data.relative_bounding_box
                ih, iw, _ = frame.shape  # img 대신 frame 사용
                face_bbox = (int(bboxC.xmin * iw), int(bboxC.ymin * ih),
                            int(bboxC.width * iw), int(bboxC.height * ih))

                # 얼굴 그리기
                mp_drawing.draw_detection(frame, detection)

        # 손 위치를 분석
        hand_on_head = False
        hand_on_nose = False
        if hand_results.multi_hand_landmarks:
            for hand_landmarks in hand_results.multi_hand_landmarks:
                mp_drawing.draw_landmarks(frame, hand_landmarks, mp_hands.HAND_CONNECTIONS)
                for landmark in hand_landmarks.landmark:
                    if face_bbox:
                        x, y = int(landmark.x * frame.shape[1]), int(landmark.y * frame.shape[0])
                        if face_bbox[0] <= x <= face_bbox[0] + face_bbox[2] and face_bbox[1] <= y <= face_bbox[1] + face_bbox[3]:
                            hand_on_head = True
                            break

        # 웹캠 프레임 표시
        cv2.imshow('Webcam', frame)

        if cv2.waitKey(1) & 0xFF == ord('q'):
            break

    cap.release()
    cv2.destroyAllWindows()
    audio_capture.stop()
    audio_thread.join()

    return filename

# 음성 피치 및 떨림 분석 함수
def extract_pitch_and_tremor(file_path, sr=None, fmin=85, fmax=350):
    y, sr = librosa.load(file_path, sr=sr)
    intervals = librosa.effects.split(y, top_db=50)
    y = np.concatenate([y[start:end] for start, end in intervals])

    pitches, voiced_flags, voiced_probs = librosa.pyin(
        y, sr=sr, fmin=fmin, fmax=fmax, frame_length=2048, hop_length=512
    )
    times = librosa.times_like(pitches, sr=sr, hop_length=512)
    pitches = np.nan_to_num(pitches)

    non_zero_pitches = pitches[pitches > 0]
    average_pitch = np.mean(non_zero_pitches) if len(non_zero_pitches) > 0 else 0.0

    pitch_diff = np.abs(np.diff(pitches))
    pitches_nonzero = np.where(pitches[:-1] <= 1e-3, 1e-3, pitches[:-1])
    valid_ratios = pitch_diff / pitches_nonzero
    valid_ratios = valid_ratios[valid_ratios < np.percentile(valid_ratios, 95)]
    relative_tremor = np.mean(valid_ratios) if len(valid_ratios) > 0 else 0.0

    return pitches, times, average_pitch, relative_tremor

# Flask 라우팅 설정
@app.route('/')
def index():
    return render_template('index3.html')

# 머리카락, 코 만지기 카운트를 위한 전역 변수
hair_touch_count = 0
nose_touch_count = 0

# Flask 라우팅 설정
@app.route('/process_frame', methods=['POST'])
def process_frame():
    global hair_touch_count, nose_touch_count  # 전역 변수 사용
    
    try:
        # 클라이언트로부터 받은 이미지 처리
        frame = request.files['frame'].read()
        np_frame = np.frombuffer(frame, np.uint8)
        img = cv2.imdecode(np_frame, cv2.IMREAD_COLOR)  # 이미지를 디코딩하여 img 변수에 저장

        # Mediapipe로 동작 인식 수행
        hands = mp_hands.Hands(static_image_mode=False, max_num_hands=2, min_detection_confidence=0.5, min_tracking_confidence=0.5)
        face_detection = mp_face_detection.FaceDetection(min_detection_confidence=0.5)

        rgb_frame = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
        hand_results = hands.process(rgb_frame)
        face_results = face_detection.process(rgb_frame)

        # 얼굴과 손 위치를 분석
        hand_on_head = False
        hand_on_nose = False
        face_bbox = None

        if face_results.detections:
            for detection in face_results.detections:
                bboxC = detection.location_data.relative_bounding_box
                ih, iw, _ = img.shape
                face_bbox = (int(bboxC.xmin * iw), int(bboxC.ymin * ih),
                            int(bboxC.width * iw), int(bboxC.height * ih))

                # 얼굴 그리기
                mp_drawing.draw_detection(img, detection)

            # 손 위치를 분석
            if hand_results.multi_hand_landmarks:
                for hand_landmarks in hand_results.multi_hand_landmarks:
                    for landmark in hand_landmarks.landmark:
                        x, y = int(landmark.x * img.shape[1]), int(landmark.y * img.shape[0])

                        if face_bbox:
                            # 머리 만짐 감지 (얼굴 상단 영역: face_bbox의 y값과 높이로 정의)
                            head_area_top = face_bbox[1]  # 얼굴의 상단 y 위치
                            head_area_bottom = face_bbox[1] + face_bbox[3] * 0.4  # 얼굴 상단 40% 범위
                            if head_area_top <= y <= head_area_bottom:
                                if face_bbox[0] <= x <= face_bbox[0] + face_bbox[2]:
                                    hand_on_head = True

                            # 코 만짐 감지 (코 영역: 얼굴 중간 부분)
                            nose_area_top = face_bbox[1] + face_bbox[3] * 0.4  # 얼굴 중간 y값
                            nose_area_bottom = face_bbox[1] + face_bbox[3] * 0.6  # 얼굴 중간 아래 60%까지
                            if nose_area_top <= y <= nose_area_bottom:
                                if face_bbox[0] + face_bbox[2] * 0.4 <= x <= face_bbox[0] + face_bbox[2] * 0.6:
                                    hand_on_nose = True


            # 감지된 동작에 따라 카운트 업데이트
            if hand_on_head:
                hair_touch_count += 1
            if hand_on_nose:
                nose_touch_count += 1

        return jsonify({
            'hand_on_head': hand_on_head,
            'hand_on_nose': hand_on_nose,
            'hair_touch_count': hair_touch_count,
            'nose_touch_count': nose_touch_count
        })

    except Exception as e:
        logging.error(f"프레임 처리 중 오류 발생: {e}")
        return jsonify({'error': '프레임 처리 중 오류 발생'}), 500

@app.route('/start_capture', methods=['POST'])
def start_capture():
    if 'audio' not in request.files:
        return jsonify({"error": "No audio file uploaded"}), 400

    audio_file = request.files['audio']
    try:
        # 음성 파일 저장
        audio_file.save("captured_audio.wav")

        # 음성 파일에서 텍스트 변환 (Whisper 모델 사용)
        audio_path = "captured_audio.wav"
        recognized_text = transcribe_audio(audio_path)

        # 음성 분석 (피치 및 떨림)
        pitches, times, average_pitch, relative_tremor = extract_pitch_and_tremor(audio_path)

        # 분석 결과 반환
        return jsonify({
            "recognized_text": recognized_text,
            "average_pitch": average_pitch,
            "relative_tremor": relative_tremor
        })
    except Exception as e:
        print(f"오류 발생: {e}")  # 오류 상세 로그 출력
        return jsonify({"error": f"Server processing error: {str(e)}"}), 500


def transcribe_audio(file_path):
    """Whisper 모델을 사용하여 음성을 텍스트로 변환"""
    audio_input, _ = librosa.load(file_path, sr=16000)  # Whisper 모델의 입력 크기와 일치하도록 설정
    audio_tensor = torch.tensor(audio_input).unsqueeze(0).to(device)

    # Whisper 모델에 적합한 입력으로 변환
    result = pipe(audio_input, return_timestamps=True)  # 타임스탬프 정보도 반환하도록 설정

    return result['text']

# 결과를 저장할 임시 저장소 (예: 메모리 또는 파일)
saved_results = []

@app.route('/save_results', methods=['POST'])
def save_results():
    try:
        # 클라이언트에서 보낸 데이터 읽기
        data = request.json
        if not data:
            return jsonify({"error": "No data received"}), 400

        # 데이터 저장 (여기서는 메모리에 저장)
        saved_results.append(data)
        print("저장된 데이터:", data)

        # 저장 성공 응답
        return jsonify({"message": "Results saved successfully", "saved_data": data}), 200

    except Exception as e:
        print("오류 발생:", e)
        return jsonify({"error": "Failed to save results"}), 500

@app.route('/get_results', methods=['GET'])
def get_results():
    # 저장된 결과를 반환
    return jsonify({"saved_results": saved_results})

@app.route('/reset_results', methods=['POST'])
def reset_results():
    global saved_results
    saved_results = []  # 데이터를 초기화
    return jsonify({"message": "데이터가 초기화되었습니다."}), 200

@app.route('/reset_touch_counts', methods=['POST'])
def reset_touch_counts():
    # 서버 측에서 카운트를 초기화하는 코드
    global hair_touch_count, nose_touch_count
    hair_touch_count = 0
    nose_touch_count = 0
    return jsonify({
        "hair_touch_count": hair_touch_count,
        "nose_touch_count": nose_touch_count
    })

print("Flask 서버 시작 중...")
if __name__ == '__main__':
    app.run(host='127.0.0.1', port=5700, debug=True)
