package com.smhrd.basic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IndexController {

	// localhost:8087/myapp/
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String indexPage() {
		// View-Resolver
		// prefix : /WEB-INF/views/
		// suffic : .jsp
		return "index";

	}
	// TTS 페이지 매핑
	@RequestMapping(value = "/tts", method = RequestMethod.GET)
	public String ttsPage() {
		return "tts"; // ttsPage.jsp를 반환
	}	
}