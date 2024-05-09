package com.osk.project.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.osk.project.domain.UserVO;


public interface UserService {
   int signup(UserVO uservo);
   String login(String userId, String userPassword);
   void logout(HttpSession session);
   UserVO seleteOne(String userId);
   int update(UserVO userVO);
   int delete(String userId);
   
}
