package com.smhrd.basic.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smhrd.basic.model.MavenMember;
import com.smhrd.basic.service.UserService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class UserController {
	
	private final UserService service;
	
	@GetMapping("/users/signup")
	public String signupForm() {
		return "signup";
	}
	
	@PostMapping("/users")
	public String signup(@ModelAttribute MavenMember member) {
		int res = service.signup(member);
		
		if(res==0) {
			return "redirect:/users/signup";
		}else {
			return "redirect:/";
		}
	}
	
	@GetMapping("/users/{id}/delete")
	public String delete(@PathVariable String id,HttpSession session) {
		
		int res = service.delete(id);
		
		if (res>0) {
			session.removeAttribute("member");
		}
		return "redirect:/";
	}
	
	@GetMapping("/users/{id}/edit")
	public String updateForm() {
		return "update";
	}
	
	@PostMapping("/users/{id}/edit")
	public String update(MavenMember member, HttpSession session) {
		int res = service.update(member);
		
		if(res==0) {
			return "redirect:/users/"+member.getId()+"/edit";
		}else {
			session.setAttribute("member", member);
			return "redirect:/";
		}
	}
	
	@GetMapping("/users")
	public String listPage(Model model) { // + forwarding
		List<MavenMember> list = service.getList();
		model.addAttribute("list",list);
		
		return "list";
	}
	
	@RequestMapping( value= "/users/check-id", method = RequestMethod.POST )
	@ResponseBody 
    public Map<String, Boolean> checkId(
    		@RequestParam String userId
    		) {
        boolean exists = service.checkIdExist(userId); // 중복 여부 체크
        Map<String, Boolean> response = new HashMap<>();
        response.put("exists", exists); // exists가 true면 중복, false면 사용 가능
        return response;
    }
	
}
