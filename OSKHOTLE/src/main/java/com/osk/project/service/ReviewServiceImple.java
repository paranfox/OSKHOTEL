package com.osk.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.osk.project.domain.ReviewVO;
import com.osk.project.persistence.ReviewMapper;
import com.osk.project.util.Pagination;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReviewServiceImple implements ReviewService {
	
	@Autowired
	private ReviewMapper reviewMapper;
	
	@Override
	public int createBoard(ReviewVO reviewVO) {
		log.info("createBoard()");
		int result = reviewMapper.insert(reviewVO);
		return result;
	}

	@Override
	public List<ReviewVO> getListByLodging(String reviewLodgingType, int reviewLodgingNo) {
		log.info("getListByLodging()");
		return reviewMapper.selectListByLodging(reviewLodgingType, reviewLodgingNo);
	}

	@Override
	public List<ReviewVO> getListByUserId(String reviewUserId) {
		log.info("getListByUserId()");
		return reviewMapper.selectListByUserId(reviewUserId);
	}
	
	@Override
	public ReviewVO getBoardByNo(int reviewNo) {
		log.info("getBoradByNo()");
		return reviewMapper.selectOne(reviewNo);
	}
	
	@Override
	public int updateBoard(ReviewVO reviewVO) {
		log.info("updateBoard()");
		return reviewMapper.update(reviewVO);
	}

	@Override
	public int deleteBoard(int reviewNo) {
		log.info("deleteBoard()");
		return reviewMapper.delete(reviewNo);
	}

	@Override
	public List<ReviewVO> getPagingBoards(Pagination pagination) {
		log.info("getPagingBoards()");
		return reviewMapper.selectListByPagination(pagination);
	}

	@Override
	public int getTotalCount() {
		log.info("selectTotalCount()");
		return reviewMapper.selectTotalCount();
	}

	
}
