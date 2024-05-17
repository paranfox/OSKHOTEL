package com.osk.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.osk.project.domain.HotelCityVO;
import com.osk.project.domain.HotelCountryVO;
import com.osk.project.service.HotelInfoService;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping(value = "/hotel")
@Log4j
public class HotelInfoDetailController {
	@Autowired
	private HotelInfoService hotelInfoService;

	// 호텔 등록 주소 페이지 이동(GET)
	@GetMapping("/location")
	private ResponseEntity<List<HotelCountryVO>> hotelgetlocation() {
		List<HotelCountryVO> list = hotelInfoService.getAllCountry();

		log.info("hotelgetlocation()");
		return new ResponseEntity<List<HotelCountryVO>>(list, HttpStatus.OK);
	} /// end hotelregisterlocation()

	// 호텔 등록 주소 페이지 이동(GET)
	@PostMapping("/location/{countryNo}")
	private ResponseEntity<List<HotelCityVO>> hotelpostlocation(@PathVariable("countryNo") int countryNo) {
		List<HotelCityVO> list = hotelInfoService.getAllCity(countryNo);

		log.info("hotelpostlocation()");
		return new ResponseEntity<List<HotelCityVO>>(list, HttpStatus.OK);
	} /// end hotelregisterlocation()
}
