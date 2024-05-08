package com.osk.project.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.osk.project.domain.ReviewVO;

@Mapper
public interface ReviewMapper {
	int insert(ReviewVO reviewVO);
	List<ReviewVO> selectListByLodging(String reviewLodgingType, int reviewLodgingNo);
	List<ReviewVO> selectListByUserId(String reviewUserId);
	int update(ReviewVO reviewVO);
	int delete(int reviewNo);
	
} // end ReviewMapper
