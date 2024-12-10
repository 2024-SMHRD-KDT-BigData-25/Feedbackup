package com.smhrd.basic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ModelController {
	@GetMapping("/users/model")
	public String ModelForm() {
		return "model_test"; // model_test.jsp 템플릿 렌더링
	}
}