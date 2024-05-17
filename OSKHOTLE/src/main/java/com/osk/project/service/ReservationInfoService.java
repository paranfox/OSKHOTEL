package com.osk.project.service;

import java.util.Date;
import java.util.List;

import com.osk.project.domain.ReservationInfoVO;
import com.osk.project.util.Pagination;

public interface ReservationInfoService {
	int createBoard(ReservationInfoVO reservationInfoVO);
	List<ReservationInfoVO> getAllBoards();
	List<ReservationInfoVO> getBoardsByDate(Date reservationCheckIn, Date reservationCheckOut);
	ReservationInfoVO getBoardByNo(int reservationNo);
	int updateBoard(ReservationInfoVO reservationInfoVO);
	int deleteBoard(int reservationNo);
	List<ReservationInfoVO> getPagingBoards(Pagination pagination);
	int getTotalCount();
}
