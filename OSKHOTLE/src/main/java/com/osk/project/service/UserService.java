package com.osk.project.service;

import java.util.List;

import com.osk.project.domain.UserVO;


public interface UserService {
   int signup(UserVO uservo);
   String login(String userId, String password);
   UserVO seleteOne(String userId);
   int update(UserVO userVO);
   int delete(String userId);
   
}
