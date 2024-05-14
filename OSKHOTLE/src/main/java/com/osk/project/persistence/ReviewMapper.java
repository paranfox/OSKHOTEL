package com.osk.project.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.osk.project.domain.ReviewVO;
import com.osk.project.util.Pagination;

@Mapper
public interface ReviewMapper {
	int insert(ReviewVO reviewVO); // 리뷰글 등록
	List<ReviewVO> selectListByLodging(String reviewLodgingType, int reviewLodgingNo); // 숙소에 따른 리뷰글 조회
	List<ReviewVO> selectListByUserId(String reviewUserId); // 사용자에 따른 리뷰글 호출 
	ReviewVO selectOne(int reviewNo); // 특정 리뷰글 호출
	int update(ReviewVO reviewVO); // 리뷰글 수정
	int delete(int reviewNo); // 리뷰글 삭제
	// 리뷰글 페이징 처리
	List<ReviewVO> selectListByPagination(Pagination pagination);
	int selectTotalCount();
	
} // end ReviewMapper
