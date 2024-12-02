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
	
	@RequestMapping(value = "/users/check-id", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> checkId(@RequestParam String userId) {
	    Map<String, Object> response = new HashMap<>();
	    
	    // 1. 아이디 길이가 4자리 이상인지 체크
	    if (userId.length() < 4) {
	        response.put("valid", false);
	        response.put("message", "아이디는 4자리 이상이어야 합니다.");
	        response.put("exists", false);  // 중복 여부는 중요하지 않음
	    } else {
	        // 2. 아이디 중복 여부 체크
	        boolean exists = service.checkIdExist(userId);
	        
	        if (exists) {
	            response.put("valid", true);  // 중복된 아이디일 경우
	            response.put("message", "이미 존재하는 아이디입니다.");
	        } else {
	            response.put("valid", true);  // 중복되지 않는 아이디일 경우
	            response.put("message", "✔ 아이디 사용 가능");
	        }
	        response.put("exists", exists);
	    }

	    return response;
	}
	
	@GetMapping("/users/idfind")
    public String idfind(@RequestParam String name, @RequestParam String email) {
        return service.idfind(name, email);
    }
	
}
