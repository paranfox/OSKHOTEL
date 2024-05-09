package com.osk.project.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.osk.project.domain.UserVO;
import com.osk.project.service.UserService;

import lombok.extern.log4j.Log4j;

@Controller // @Component
// - 클라이언트(JSP 페이지 등)와 service를 연결하는 역할
@RequestMapping(value="/board") // url : /ex02/board
@Log4j
public class UserController {

	@Autowired
	private UserService userService;
	
	@GetMapping("/signup")
    public String toSignupPage() {  //회원가입 페이지
        return "board/signup";
    }
	
	@PostMapping("/signup")
	public String signup(UserVO userVO) { // 회원가입
		try {
			userService.signup(userVO);
		} catch (DuplicateKeyException e) {
			return "redirect:/board/signup?error_code=-1";
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/board/signup?error_code=-99";
		}
		return "board/login";
	}
	
    @GetMapping("/login")
    public String toLoginPage(HttpSession session) { // 로그인 페이지
    	String id = (String) session.getAttribute("userId");
    	if (id != null) { // 로그인된 상태
    		return "redirect:/board/";
    	}
    	return "board/login";
    }
	
    @PostMapping("/login")
    public String login(String userId, String userPassword, HttpSession session) { // 로그인
    	String id = userService.login(userId, userPassword);
    	if (id == null) { // 로그인 실패
    		return "redirect:/board/login";
    	}
    	session.setAttribute("userId", id);
    	return "redirect:/board/";
    }
	
}
