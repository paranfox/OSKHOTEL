package com.osk.project.persistence;

import org.apache.ibatis.annotations.Mapper;

import com.osk.project.domain.UserVO;

@Mapper
public interface UserMapper {
   int insertUser(UserVO userVO); // 회원정보 등록
   UserVO getUserById(String userId); // 로그인 
   int updateUser(UserVO userVO); // 특정 회원정보 수정
   void deleteUser(String userId); // 특정 회원정보 삭제
   int useridCheck(String userId); // 아이디 중복
} // end ReplyMapper