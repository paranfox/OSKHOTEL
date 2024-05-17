package com.osk.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.osk.project.domain.HotelInfoVO;
import com.osk.project.service.HotelInfoService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = "/register")
@Log4j
public class HotelInfoController {

	@Autowired
	private HotelInfoService hotelInfoService;
	private HotelInfoVO hotelInfoVO;

	// 호텔 등록 기본 페이지 이동(GET)
	@GetMapping("/basics")
	private void hotelregisterbasics() {
		this.hotelInfoVO = new HotelInfoVO();
		log.info("hotelregisterbasics()");
	} /// end hotelregisterbasics()

	// 호텔 등록 주소 페이지 이동(GET)
	@GetMapping("/location")
	private void hotelregisterlocation() {
		log.info("hotelregisterlocation()");
	} /// end hotelregisterlocation()

	// 호텔 등록 상세내용 페이지 이동(GET)
	@GetMapping("/description")
	private void hotelregisterdescription() {
		log.info("hotelregisterdescription()");
	} /// end hotelregisterdescription()

	// 호텔 등록 편의시설 페이지 이동(GET)
	@GetMapping("/amenities")
	private void hotelregisteramenities() {
		log.info("hotelregisteramenities()");
	} /// end hotelregisterdamenities()

	// 호텔 등록 가격등록 페이지 이동(GET)
	@GetMapping("/pricing")
	private void hotelregisterpricing() {
		log.info("hotelregisterpricing()");
	} /// end hotelregisterpricing()

	// 호텔 등록 사진등록 페이지 이동(GET)
	@GetMapping("/photos")
	private void hotelregisterphotos() {
		log.info("hotelregisterphotos()");
	} /// end hotelregisterphotos()

	// 호텔 등록 페이지 이동(GET)
//	@GetMapping("/hotelregisterok")
//	private void hotelok(Model model, Pagination pagination) {
//		log.info("hotelregister()");
//		log.info("pagination = " + pagination);
//		List<HotelInfoVO> hotelList = hotelInfoService.getPagingHotels(pagination);

//		PageMaker pageMaker = new PageMaker();
//		pageMaker.setPagination(pagination);
//		pageMaker.setTotalCount(hotelInfoService.getTotalCount());

//		model.addAttribute("pageMaker", pageMaker);
//		model.addAttribute("hotelList", hotelList);
//
//	} /// end hotelok()

	@PostMapping("/basics")
	private String hotelbasics(HotelInfoVO hotelInfoVO, RedirectAttributes reAttr) {
		log.info("hotelinsertPOST()");
		this.hotelInfoVO.setHotelName(hotelInfoVO.getHotelName());
		log.info("hotelInfoVO = " + hotelInfoVO.toString());
		return "redirect:/register/location";
	} // end hotelinsertPOST()

	@PostMapping("/location")
	private String hotellocation(HotelInfoVO hotelInfoVO, RedirectAttributes reAttr) {
		log.info("hotelinsertPOST()");
		this.hotelInfoVO.setHotelAddress(hotelInfoVO.getHotelAddress());
		log.info("this.hotelInfoVO = " + this.hotelInfoVO.toString());
		return "redirect:/register/description";
	} // end hotelinsertPOST()

	@PostMapping("/description")
	private String hoteldescription(HotelInfoVO hotelInfoVO, RedirectAttributes reAttr) {
		log.info("hoteldescriptionPOST()");
		return "redirect:/register/amenities";
	} // end hoteldescriptionPOST()

	// TODO : 편의시설에서 선택됭 값들을 전부 저장
	@PostMapping("/amenities")
	private String hotelamenities(HotelInfoVO hotelInfoVO, RedirectAttributes reAttr) {
		log.info("hotelamenitiesPOST()");
		
		
		return "redirect:/register/pricing";
	} // end hotelamenitiesPOST()

	@PostMapping("/pricing")
	private String hotelpricing(HotelInfoVO hotelInfoVO, RedirectAttributes reAttr) {
		log.info("hotelpricingPOST()");
		return "redirect:/register/photos";
	} // end hotelpricingPOST()
	
	@PostMapping("/photos")
	private String hotelphotos(HotelInfoVO hotelInfoVO, RedirectAttributes reAttr) {
		log.info("hotelphotosPOST()");
		return "index";
	} // end hotelphotosPOST()
}