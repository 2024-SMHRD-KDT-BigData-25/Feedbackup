package com.smhrd.basic.controller;

import org.apache.hc.client5.http.impl.classic.CloseableHttpClient;
import org.apache.hc.client5.http.impl.classic.CloseableHttpResponse;
import org.apache.hc.client5.http.impl.classic.HttpClients;
import org.apache.hc.core5.http.HttpEntity;
import org.apache.hc.core5.http.io.entity.EntityUtils;
import org.apache.hc.core5.http.ContentType;
import org.apache.hc.client5.http.classic.methods.HttpPost;
import org.apache.hc.client5.http.entity.mime.MultipartEntityBuilder;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;

@Controller
public class SttController {

    @PostMapping("/stt")
    public ResponseEntity<String> transcribeAudio(@RequestParam("file") MultipartFile file) {
        try (CloseableHttpClient httpClient = HttpClients.createDefault()) {
            // Flask 서버 URL 설정
            HttpPost uploadFile = new HttpPost("http://127.0.0.1:5000/stt");

            // Multipart 요청 생성
            MultipartEntityBuilder builder = MultipartEntityBuilder.create();
            builder.addBinaryBody(
                "file",
                file.getInputStream(),
                ContentType.APPLICATION_OCTET_STREAM,
                file.getOriginalFilename()
            );

            HttpEntity multipart = builder.build();
            uploadFile.setEntity(multipart);

            // 요청 실행
            try (CloseableHttpResponse response = httpClient.execute(uploadFile)) {
                HttpEntity responseEntity = response.getEntity();
                if (responseEntity == null) {
                    return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                                         .body("Error: Response entity is null");
                }
                // InputStream으로 응답 읽기
                InputStream inputStream = responseEntity.getContent();
                StringBuilder result = new StringBuilder();
                try (BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream, StandardCharsets.UTF_8))) {
                    String line;
                    while ((line = reader.readLine()) != null) {
                        result.append(line);
                    }
                }
                return ResponseEntity.ok(result.toString());
            }
            
        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                                 .body("Error: " + e.getMessage());
        }
    }
}