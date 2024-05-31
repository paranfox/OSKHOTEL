package com.osk.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.osk.project.domain.ReservationInfoVO;
import com.osk.project.persistence.ReservationInfoMapper;
import com.osk.project.util.Pagination;

import lombok.extern.log4j.Log4j;


@Service
@Log4j
public class ReservationInfoServiceImple implements ReservationInfoService {
	
	@Autowired
	private ReservationInfoMapper reservationInfoMapper;
	
	@Override
	public int createBoard(ReservationInfoVO reservationInfoVO) {
		log.info("createBoard()");
		int result = reservationInfoMapper.insert(reservationInfoVO);
		return result;
	}

	@Override
	public List<ReservationInfoVO> getAllBoards() {
		log.info("getAllBoards()");
		return reservationInfoMapper.selectList();
	}

	@Override
	public List<ReservationInfoVO> getBoardsByDate(String reservationCheckIn, String reservationCheckOut) {
		log.info("getBoardsByDate()");
		return reservationInfoMapper.selectListByDate(reservationCheckIn, reservationCheckOut);
	}
	
	@Override
	public ReservationInfoVO getBoardByNo(int reservationNo) {
		log.info("getBoardByNo()");
		return reservationInfoMapper.selectOne(reservationNo);
	}
	
	@Override
	public int updateBoard(ReservationInfoVO reservationInfoVO) {
		log.info("updateBoard()");
		return reservationInfoMapper.update(reservationInfoVO);
	}

	@Override
	public int deleteBoard(int reservationNo) {
		log.info("deleteBorad()");
		return reservationInfoMapper.delete(reservationNo);
	}

	@Override
	public List<ReservationInfoVO> getPagingBoards(Pagination pagination) {
		log.info("getPagingBoards()");
//		log.info("userId = " + userId);
		return reservationInfoMapper.selectListByPagination(pagination);
	}

	@Override
	public int getTotalCount(Pagination pagination) {
		log.info("selectTotalCount()");
		return reservationInfoMapper.selectTotalCount(pagination);
	}


}
