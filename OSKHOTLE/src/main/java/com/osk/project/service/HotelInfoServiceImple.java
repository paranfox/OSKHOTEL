package com.osk.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.osk.project.domain.HotelInfoVO;
import com.osk.project.util.Pagination;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class HotelInfoServiceImple implements HotelInfoService {

	@Override
	public int createBoard(HotelInfoVO hotelInfoVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<HotelInfoVO> getAllBoards() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HotelInfoVO getBoardById(int hotelno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateBoard(HotelInfoVO hotelInfoVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard(int hotelno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<HotelInfoVO> getPagingBoards(Pagination pagination) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return 0;
	}

}
