package com.osk.project.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.osk.project.domain.UserVO;
import com.osk.project.persistence.UserMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class UserServiceImple implements UserService {

	@Autowired
	private UserMapper userMapper;

	@Override
	public int signup(UserVO uservo) {
		log.info("createUser()");
		int result = userMapper.insertUser(uservo);
		return result;
	}

	@Override
	public UserVO seleteOne(String userId) {
		log.info("seleteOne()");
		return userMapper.getUserById(userId);
	}

	@Override
	public int update(UserVO userVO) {
		log.info("update()");
		return userMapper.updateUser(userVO);
	}

	@Override
	public void delete(String userId) {
		log.info("delete()");
	    userMapper.deleteUser(userId);
	}

	
	@Override
	public String login(String userId, String userPassword) {
		UserVO uservo = userMapper.getUserById(userId);
		if(uservo != null && uservo.getUserPassword().equals(userPassword)) {
			return uservo.getUserId();
		}
		System.out.println("아이디와 비밀번호가 맞지 않습니다");			
		return null; // TODO : 수정하기
	}
	
	

	@Override
	public void logout(HttpSession session) {
		session.invalidate(); // 세션 초기화
	}


}

