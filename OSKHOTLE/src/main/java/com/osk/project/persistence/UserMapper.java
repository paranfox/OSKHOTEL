package com.osk.project.persistence;

import org.apache.ibatis.annotations.Mapper;

import com.osk.project.domain.UserVO;

@Mapper
public interface UserMapper {
   int insertUser(UserVO userVO); // 회원정보 등록
   UserVO getUserByEmail(String userEmail); // 특정 회원정보 조회
   UserVO getUserById(String userId); 
   int updateUser(UserVO userVO); // 특정 회원정보 수정
   int deleteUser(String userId); // 특정 회원정보 삭제
} // end ReplyMapper