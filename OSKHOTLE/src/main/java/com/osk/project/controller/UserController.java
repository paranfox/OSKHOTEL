package com.osk.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.osk.project.domain.UserVO;
import com.osk.project.service.BoardService;
import com.osk.project.service.UserService;
import com.osk.project.util.PageMaker;
import com.osk.project.util.Pagination;

import lombok.extern.log4j.Log4j;

@Controller // @Component
// - 클라이언트(JSP 페이지 등)와 service를 연결하는 역할
@RequestMapping(value="/user") // url : /ex02/board
@Log4j
public class UserController {

	@Autowired
	private UserService userService;
	
	@GetMapping("/signup")
    public String toSignupPage() {  //회원가입 페이지
        return "user/signup";
    }
	
	@PostMapping("/signup")
	public String signup(UserVO userVO) { // 회원가입
		try {
			userService.signup(userVO);
		} catch (DuplicateKeyException e) {
			return "redirect:/user/signup?error_code=-1";
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/user/signup?error_code=-99";
		}
		return "user/login";
	}
	
    @GetMapping("/login")
    public String toLoginPage(HttpSession session) { // 로그인 페이지
    	String username = (String) session.getAttribute("userName");
    	if (username != null) { // 로그인된 상태
    		return "redirect:/";
    	}
    	return "user/login";
    }
	
    @PostMapping("/login")
    public String login(String userId, String userPassword, HttpSession session) { // 로그인
    	String username = userService.login(userId, userPassword);
    	if (username == null) { // 로그인 실패
    		return "redirect:/user/login";
    	}
    	session.setAttribute("userName", username);
    	return "redirect:/user/";
    }
	
}
