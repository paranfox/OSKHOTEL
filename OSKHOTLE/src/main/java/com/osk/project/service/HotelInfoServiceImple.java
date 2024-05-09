package com.osk.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.osk.project.domain.HotelInfoVO;
import com.osk.project.persistence.HotelInfoMapper;
import com.osk.project.util.Pagination;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class HotelInfoServiceImple implements HotelInfoService {
	
	@Autowired
	private HotelInfoMapper hotelInfoMapper;
	
	@Override
	public int createHotel(HotelInfoVO hotelInfoVO) {
		log.info("createHotel()");
		int result = hotelInfoMapper.insert(hotelInfoVO);
		return result;
	}

	@Override
	public List<HotelInfoVO> getAllHotels() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HotelInfoVO getHotelById(int hotelno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateHotel(HotelInfoVO hotelInfoVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteHotel(int hotelno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<HotelInfoVO> getPagingHotels(Pagination pagination) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return 0;
	}

}
