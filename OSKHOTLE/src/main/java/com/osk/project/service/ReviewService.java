package com.osk.project.service;

import java.util.List;

import com.osk.project.domain.ReviewVO;
import com.osk.project.util.Pagination;

public interface ReviewService {
	int createBoard(ReviewVO reviewVO);
	List<ReviewVO> getListByLodging(String reviewLodgingType, int reviewLodgingNo);
	List<ReviewVO> getListByUserId(String reviewUserId);
	ReviewVO getBoardByNo(int reviewNo);
	int updateBoard(ReviewVO reviewVO);
	int deleteBoard(int reviewNo);
	List<ReviewVO> getPagingBoards(Pagination pagination);
	int getTotalCount();
	
}
