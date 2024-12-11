package com.smhrd.basic.controller;

import java.util.ArrayList;
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

import jakarta.servlet.http.HttpServletRequest;
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

	@GetMapping("/users/signup_success")
	public String signupSuccess() {
		return "signup_success"; // signup_success.jsp를 반환
	}

	@PostMapping("/users")
	public String signup(@ModelAttribute MavenMember member) {
		int res = service.signup(member);

		if (res == 0) {
			return "redirect:/users/signup"; // 회원가입 실패 시, 다시 회원가입 페이지로 이동
		} else {
			return "redirect:/users/signup_success"; // 회원가입 성공 시, signup_success.jsp로 포워딩
		}
	}

	@GetMapping("/users/{id}/delete")
	public String delete(@PathVariable String id, HttpSession session) {

		int res = service.delete(id);

		if (res > 0) {
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

		if (res == 0) {
			return "redirect:/users/" + member.getId() + "/edit";
		} else {
			session.setAttribute("member", member);
			return "redirect:/";
		}
	}

	@GetMapping("result_list")
	public String getResultPage(HttpSession session, Model model) {
	    MavenMember member = (MavenMember) session.getAttribute("member");

	    String userName = member.getName(); // 로그인한 사용자의 이름
	    List<MavenMember> users = service.findUsersByName(userName); // 같은 이름을 가진 사용자 조회

	    // users 리스트를 모델에 추가하여 JSP로 전달
	    model.addAttribute("users", users);
	    return "result_list"; // result_list.jsp로 이동
	}


	// 회원가입 아이디 확인
	@RequestMapping(value = "/users/check-id", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> checkId(@RequestParam String userId) {
		Map<String, Object> response = new HashMap<>();

		// 1. 아이디 길이가 4자리 이상인지 체크
		if (userId.length() < 4) {
			response.put("valid", false);
			response.put("message", "아이디는 4자리 이상이어야 합니다.");
			response.put("exists", false); // 중복 여부는 중요하지 않음
		} else {
			// 2. 아이디 중복 여부 체크
			boolean exists = service.checkIdExist(userId);

			if (exists) {
				response.put("valid", true); // 중복된 아이디일 경우
				response.put("message", "이미 존재하는 아이디입니다.");
			} else {
				response.put("valid", true); // 중복되지 않는 아이디일 경우
				response.put("message", "✔ 아이디 사용 가능");
			}
			response.put("exists", exists);
		}

		return response;
	}

	@GetMapping("/users/idfind")
	public String idfindForm() {
		return "idfind"; // idfind.jsp로 이동
	}

	@PostMapping("/users/idfind")
	public String findId(@RequestParam String name, @RequestParam String email, Model model) {
	    // 이름과 이메일로 먼저 검색
	    MavenMember result = service.idfind(name, email);

	    if (result == null) {
	        // 이름이나 이메일이 일치하는 회원 정보가 없으면
	        model.addAttribute("success", false);
	        model.addAttribute("message", "가입하신 회원정보가 없습니다.");
	    } else {
	        // 이름과 이메일이 모두 일치하는 경우 아이디 반환
	        String id = result.getId();
	        String maskedId = id.substring(0, 3) + "*".repeat(id.length() - 3);

	        model.addAttribute("success", true);
	        model.addAttribute("id", maskedId);
	        model.addAttribute("name", result.getName());
	    }

	    return "idfind"; // JSP 페이지 이름을 반환
	}
	
	@GetMapping("/users/pwfind")
	public String pwfindForm() {
		return "pwfind"; // pwfind.jsp로 이동
	}

	@PostMapping("/users/pwfind")
	public String findPw(@RequestParam String name, @RequestParam String email, @RequestParam String id, Model model) {
		// 이름과 이메일과 아이디로 패스워드를 찾기
		MavenMember result = service.pwfind(name, email, id);

	    if (result == null) {
	        // 이름이나 이메일이나 아이디가 일치하는 회원 정보가 없으면
	        model.addAttribute("success", false);
	        model.addAttribute("message", "가입하신 회원정보가 없습니다.");
	    } else {
	        // 이름과 이메일과 아이디가 모두 일치하는 경우 아이디 반환
	        String pw = result.getPw();

	        model.addAttribute("success", true);
	        model.addAttribute("pw", pw);
	        model.addAttribute("name", result.getName());
	    }

		return "pwfind"; // 결과를 pwfind.jsp로 전달하여 결과 표시
	}
	
	@GetMapping("/Interview_Select")
	public String Interview_Select() {
		return "Interview_Select";
	}
	
	@GetMapping("/AI_Interview")
	public String AI_InterviewForm() {
		return "AI_Interview";
	}
	
	@GetMapping("/AI_Interview_play")
	public String AI_Interview_playForm() {
		return "AI_Interview_play";
	}
	
	@GetMapping("/test")
	public String testForm() {
		return "test";
	}
	
	@GetMapping("/users/mypage")
    public String myPage(Model model, HttpSession session) {
        MavenMember member = (MavenMember) session.getAttribute("member");
        
        if (member == null) {
            return "redirect:/login";  // 로그인하지 않았다면 로그인 페이지로 리다이렉트
        }

        // 사용자의 이름을 가져와서 countByname 메소드를 호출하여 개수를 조회
        int nameCount = service.checkcount(member.getName());

        // nameCount 값을 JSP에 전달
        model.addAttribute("nameCount", nameCount);

        return "mypage";  // mypage.jsp 페이지로 이동
    }
	
	@GetMapping("/users/Job_List")
	public String Job_List() {
		return "Job_List";
	}
	
	@PostMapping("/users/Job_List")
	public String searchJobCodeAndGetAnswer(@RequestParam("jobCode") String jobCode, Model model) {
	    // jobCode를 받아서 q_text 값을 가져옵니다.
		List<String> qText = service.getQTextByJobCode(jobCode);
		String firstqText = qText.get(0);
		String secondqText = qText.get(1);
		String thirdqText = qText.get(2);
		
		// q_text에 해당하는 a_text를 가져옵니다.
		String firstaText = service.getATextByfirstqText(firstqText);
		String secondaText = service.getATextBysecondqText(secondqText);
		String thirdaText = service.getATextBythirdqText(thirdqText);

	    
		// qText 값이 정상적으로 가져와졌는지 확인
		System.out.println("검색된 q_text 값: " + qText);
		
		
	    System.out.println("검색된 q_text 값: " + firstqText);
	    System.out.println("검색된 a_text 값: " + firstaText);
	    System.out.println("검색된 q_text 값: " + secondqText);
	    System.out.println("검색된 a_text 값: " + secondaText);
	    System.out.println("검색된 q_text 값: " + thirdqText);
	    System.out.println("검색된 a_text 값: " + thirdaText);

	    // qText 값을 모델에 추가하여 JSP로 전달
	    model.addAttribute("firstqText", firstqText);
	    model.addAttribute("secondqText", secondqText);
	    model.addAttribute("thirdqText", thirdqText);
	    
	    model.addAttribute("firstaText", firstaText);
	    model.addAttribute("secondaText", secondaText);
	    model.addAttribute("thirdaText", thirdaText);

	    // 결과를 출력할 JSP 페이지로 이동
	    return "Job_List";  // Job_List.jsp
	}
	
	@GetMapping("/users/Real_Interview")
	public String Real_InterviewForm() {
		return "Real_Interview";
	}
	
	@GetMapping("/users/Real_Interview_Start")
	public String Real_Interview_StartForm() {
		return "Real_Interview_Start";
	}
	
	@GetMapping("/users/Loading")
	public String LodingForm() {
		return "Loading";
	}
	
	@GetMapping("/model")
	public String Model() {
		return "model";
	}
	
	@GetMapping("/model_test")
	public String ModelTest() {
		return "model_test";
	}
	

	@GetMapping("/users/result_list")
	public String result_listForm() {
		return "result_list";
	}

	@GetMapping("/result_test")
	public String ResultTest() {
		return "result_test";
	}
	

}


