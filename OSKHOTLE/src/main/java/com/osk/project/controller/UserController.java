package com.osk.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.osk.project.domain.UserVO;
import com.osk.project.persistence.UserMapper;
import com.osk.project.service.UserService;

import lombok.extern.log4j.Log4j;

@Controller // @Component
// - 클라이언트(JSP 페이지 등)와 service를 연결하는 역할
@RequestMapping(value = "/user") // url : /ex02/board
@Log4j
public class UserController {

	@Autowired
	private UserService userService;

	@GetMapping("/signup")
	public String toSignupPage() { // 회원가입 페이지
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
			return "redirect:/user/signup?error_code=-2";
		}
		return "user/login";
	}
	

	@GetMapping("/login")
	public String toLoginPage(HttpSession session) { // 로그인 페이지
		String userid = (String) session.getAttribute("userId");
		if (userid != null) { // 로그인된 상태
			return "redirect:../index";
		}
		return "user/login";
	}

	@PostMapping("/login")
	public String login(String userId, String userPassword, HttpSession session) { // 로그인
		String userid = userService.login(userId, userPassword);
		if (userid == null) { // 로그인 실패
			return "redirect:/user/login";
		}
		session.setAttribute("userId", userid);
		session.setMaxInactiveInterval(10 * 360);
		return "index";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) { // 로그아웃
		session.invalidate();
		return "index";
	}

	@GetMapping("/mypage")
	public String userinformation(HttpSession session, Model model) {
		String userid = (String) session.getAttribute("userId");
		UserVO uservo = userService.seleteOne(userid);
		model.addAttribute("UserVO", uservo);
		return "user/mypage";

	}

	@GetMapping("/update")
	public String toUpdatePage(HttpSession session, Model model) { // 회원 정보 수정 페이지
		String userid = (String) session.getAttribute("userId");
		UserVO uservo = userService.seleteOne(userid);
		model.addAttribute("UserVO", uservo);
		return "user/update";
	}

	@PostMapping("/update")
	public String UpdatePOST(HttpSession session, UserVO userVo) { // 회원 정보 수정
		log.info("UpdatePOST()");
		int result = userService.update(userVo);
		log.info(result + "행 수정");		
		return "redirect:/user/mypage";
	}
	
	@PostMapping("/delete")
	public String DeletePOST(HttpSession session) { // 탈퇴
		String userid = (String) session.getAttribute("userId");
		log.info("userid");
		if (userid != null) {
			userService.delete(userid);
		}
		session.invalidate();
		return "index";
	}
	

}
