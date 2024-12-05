package com.smhrd.basic.service;

import com.smhrd.basic.config.NaverConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.http.*;
import org.json.JSONObject;

@Service
public class NaverAuthService {

    @Autowired
    private NaverConfig naverConfig;

    // 네이버 토큰 발급
    public String getAccessToken(String code, String state) {
        String tokenUrl = "https://nid.naver.com/oauth2.0/token";
        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        String body = "grant_type=authorization_code" +
                "&client_id=" + naverConfig.getClientId() +
                "&client_secret=" + naverConfig.getClientSecret() +
                "&code=" + code +
                "&state=" + state;

        HttpEntity<String> requestEntity = new HttpEntity<>(body, headers);

        try {
            // 네이버 API 호출
            ResponseEntity<String> response = restTemplate.exchange(tokenUrl, HttpMethod.POST, requestEntity, String.class);

            // 응답 처리
            if (response.getStatusCode().is2xxSuccessful()) {
                JSONObject jsonResponse = new JSONObject(response.getBody());
                return jsonResponse.getString("access_token");
            } else {
                throw new RuntimeException("네이버 토큰 요청 실패: " + response.getStatusCode());
            }
        } catch (Exception e) {
            throw new RuntimeException("네이버 로그인 Access Token 발급 중 오류 발생: " + e.getMessage(), e);
        }
    }

    // 네이버 사용자 정보 조회
    public JSONObject getUserProfile(String accessToken) {
        String profileUrl = "https://openapi.naver.com/v1/nid/me";
        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + accessToken);

        HttpEntity<String> requestEntity = new HttpEntity<>(headers);

        ResponseEntity<String> response = restTemplate.exchange(profileUrl, HttpMethod.GET, requestEntity, String.class);

        return new JSONObject(response.getBody());
    }
}