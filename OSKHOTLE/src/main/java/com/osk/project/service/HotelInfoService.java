package com.osk.project.service;

import java.util.List;

import com.osk.project.domain.HotelCityVO;
import com.osk.project.domain.HotelCountryVO;
import com.osk.project.domain.HotelInfoVO;
import com.osk.project.util.Pagination;

public interface HotelInfoService {
	int createHotel(HotelInfoVO hotelInfoVO);

	List<HotelInfoVO> getAllHotels();

	HotelInfoVO getHotelById(int hotelno);

	int updateHotel(HotelInfoVO hotelInfoVO);

	int deleteHotel(int hotelno);

	List<HotelCountryVO> getAllCountry();

	List<HotelCityVO> getAllCity(int countryNo);

	List<HotelInfoVO> getPagingHotels(Pagination pagination);

	int getTotalCount();

}
