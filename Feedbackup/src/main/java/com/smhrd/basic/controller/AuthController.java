package com.smhrd.basic.controller;

import java.util.UUID;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import com.smhrd.basic.config.NaverConfig;
import com.smhrd.basic.model.MavenMember;
import com.smhrd.basic.service.AuthService;
import com.smhrd.basic.service.NaverAuthService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class AuthController {

	private final AuthService service;
	private final NaverConfig naverConfig; // 생성자 주입
	private final NaverAuthService naverAuthService;

	@GetMapping("/login")
	public String loginForm() {
		return "login";
	}

	@PostMapping("/login")
	public String login(MavenMember member, HttpSession session) {
		// @ModelAttribute는 생략 가능
		MavenMember res = service.login(member);

		if (res == null) {
			return "redirect:/login";
		} else {
			session.setAttribute("member", res);
			return "redirect:/";
		}
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("member");
		return "redirect:/";
	}

	// 네이버 로그인 페이지로 리다이렉트
	@GetMapping("/users/naverlogin")
	public RedirectView naverLogin(HttpSession session) {
	    String state = UUID.randomUUID().toString(); // 랜덤한 state 값 생성
	    session.setAttribute("state", state); // 세션에 state 저장
	    System.out.println("생성된 state 값: " + state); // 디버깅: 생성된 state 값 로그 출력

	    String loginUrl = "https://nid.naver.com/oauth2.0/authorize?response_type=code" +
	            "&client_id=" + naverConfig.getClientId() +
	            "&redirect_uri=" + naverConfig.getRedirectUri() +
	            "&state=" + state;

	    return new RedirectView(loginUrl);
	}

	@GetMapping("/users/naverlogin/callback")
	public String callback(@RequestParam String code, @RequestParam String state, HttpSession session) {
	    // 세션에서 저장된 state 값 가져오기
	    String sessionState = (String) session.getAttribute("state");
	    session.removeAttribute("state"); // 사용 후 제거

	    System.out.println("네이버에서 받은 state: " + state); // 디버깅용: 네이버로부터 전달된 state 값
	    System.out.println("서버에 저장된 sessionState: " + sessionState); // 디버깅용: 세션에 저장된 state 값

	    if (!state.equals(sessionState)) {
	        throw new IllegalStateException("CSRF 방지: state 값이 일치하지 않습니다!");
	    }

	    try {
	        // 1. Access Token 발급
	        System.out.println("Code: " + code); // 디버깅: 네이버에서 받은 인증 코드
	        System.out.println("State: " + state); // 디버깅: 상태 값

	        String accessToken = naverAuthService.getAccessToken(code, state);
	        System.out.println("Access Token: " + accessToken); // 디버깅: 발급받은 Access Token

	        // 2. 사용자 정보 조회
	        JSONObject userProfile = naverAuthService.getUserProfile(accessToken);
	        System.out.println("User Profile: " + userProfile.toString()); // 디버깅: 사용자 정보

	        // 사용자 정보를 세션에 저장
	        session.setAttribute("user", userProfile);

	        return "redirect:/"; // 로그인 성공 시 홈으로 리다이렉트
		} catch (Exception e) {
			e.printStackTrace();
	        return "error"; // 실패 시 에러 페이지로 이동
	    }
	}
}