package com.osk.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.osk.project.domain.HotelInfoVO;
import com.osk.project.service.HotelInfoService;
import com.osk.project.util.PageMaker;
import com.osk.project.util.Pagination;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = "/register")
@Log4j
public class HotelInfoController {

	@Autowired
	private HotelInfoService hotelInfoService;

	// 호텔 등록 기본 페이지 이동(GET)
	@GetMapping("/basics")
	private void hotelregisterbasics() {
		log.info("hotelregisterbasics()");
	} /// end hotelregisterbasics()

	// 호텔 등록 주소 페이지 이동(GET)
	@GetMapping("/location")
	private void hotelregisterlocation() {
		log.info("hotelregisterlocation()");
	} /// end hotelregisterlocation()

	// 호텔 등록 페이지 이동(GET)
	@GetMapping("/hotelregisterok")
	private void hotelok(Model model, Pagination pagination) {
		log.info("hotelregister()");
		log.info("pagination = " + pagination);
		List<HotelInfoVO> hotelList = hotelInfoService.getPagingHotels(pagination);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setPagination(pagination);
		pageMaker.setTotalCount(hotelInfoService.getTotalCount());

		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("hotelList", hotelList);

	} /// end hotelok()

	@PostMapping("/basics")
	private String hotelinsert(HotelInfoVO hotelInfoVO, RedirectAttributes reAttr) {
		log.info("hotelinsertPOST()");
		log.info("hotelInfoVO = " + hotelInfoVO.toString());
		return "redirect:/register/location";
	} // end hotelinsert()

}