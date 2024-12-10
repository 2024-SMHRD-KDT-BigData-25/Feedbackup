package com.smhrd.basic.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
public class AnalysisController {

    @PostMapping("/start_capture")
    public ResponseEntity<Map<String, Object>> analyzeAudio(@RequestParam("audio") MultipartFile audioFile) {
        // 음성 분석 처리 로직 (예: 파일 저장, 분석)
        // 결과 반환
        Map<String, Object> result = new HashMap<>();
        result.put("recognized_text", "샘플 텍스트");
        result.put("average_pitch", 123.45);
        result.put("relative_tremor", 0.0123);
        return ResponseEntity.ok(result);
    }

    @PostMapping("/process_frame")
    public ResponseEntity<Map<String, Integer>> processFrame(@RequestParam("frame") MultipartFile frame) {
        // 제스처 인식 처리 로직 (예: 이미지 분석)
        // 결과 반환
        Map<String, Integer> result = new HashMap<>();
        result.put("hair_touch_count", 1);
        result.put("nose_touch_count", 2);
        return ResponseEntity.ok(result);
    }
}
