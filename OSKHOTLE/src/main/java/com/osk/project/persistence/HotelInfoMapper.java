package com.osk.project.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.osk.project.domain.HotelInfoVO;
import com.osk.project.util.Pagination;

@Mapper
public interface HotelInfoMapper {
	// 메소드 이름은 HotelInfoMapper.xml에서 SQL 쿼리 정의 태그의 id 값과 동일
	// 매개변수는 HotelInfoMapper.xml에서 #{변수명}과 동일(클래스 타입은 각 멤버변수명과 매칭)
	int insert(HotelInfoVO hotelInfoVO); // 게시글 등록
	List<HotelInfoVO> selectList(); // 전체 게시글 조회
	HotelInfoVO selectOne(int hotelno); // 특정 게시글 조회
	int update(HotelInfoVO hotelInfoVO); // 특정 게시글 수정
	int delete(int boardId); // 특정 게시글 삭제
	// 전체 게시글 페이징 처리
	List<HotelInfoVO> selectListByPagination(Pagination pagination);
	int selectTotalCount();
	int updateReplyCount(@Param("hotelno") int hotelno, @Param("amount") int amount);
	// @Param : 자바 객체의 속성을 mapper에 매핑

} // end HotelRegisterMapper
