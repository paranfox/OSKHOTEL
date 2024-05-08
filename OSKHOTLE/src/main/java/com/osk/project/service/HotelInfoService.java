package com.osk.project.service;

import java.util.List;

import com.osk.project.domain.HotelInfoVO;
import com.osk.project.util.Pagination;

public interface HotelInfoService {
	int createBoard(HotelInfoVO hotelInfoVO);
	  List<HotelInfoVO> getAllBoards();
	  HotelInfoVO getBoardById(int hotelno);
	  int updateBoard(HotelInfoVO hotelInfoVO);
	  int deleteBoard(int hotelno);
	  List<HotelInfoVO> getPagingBoards(Pagination pagination);
	  int getTotalCount();
	
}
