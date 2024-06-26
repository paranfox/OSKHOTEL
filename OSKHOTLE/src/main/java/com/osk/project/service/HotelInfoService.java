package com.osk.project.service;

import java.util.List;

import com.osk.project.domain.CityVO;
import com.osk.project.domain.CountryVO;
import com.osk.project.domain.HotelInfoVO;
import com.osk.project.util.Pagination;

public interface HotelInfoService {
	int createHotel(HotelInfoVO hotelInfoVO);

	List<HotelInfoVO> getAllHotels();

	HotelInfoVO getHotelById(int hotelno);

	int updateHotel(HotelInfoVO hotelInfoVO);

	int deleteHotel(int hotelno);

	List<CountryVO> getAllCountry();

	List<CityVO> getAllCity(int countryNo);

	List<HotelInfoVO> getPagingHotels(Pagination pagination);

	int getTotalCount();

}
