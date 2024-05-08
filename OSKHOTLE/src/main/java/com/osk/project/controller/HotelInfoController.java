package com.osk.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.osk.project.domain.HotelInfoVO;
import com.osk.project.service.HotelInfoService;
import com.osk.project.util.PageMaker;
import com.osk.project.util.Pagination;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = "/hotelinfo")
@Log4j
public class HotelInfoController {
	
	@Autowired
	private HotelInfoService hotelInfoService;
	
	// 호텔 등록 페이지 이동(GET)
	@GetMapping("/hotelregister")
	private void hotelmove() {
		log.info("hotelregister()");
	} /// end hotelmove()

	// 호텔 등록 페이지 이동(GET)
	@GetMapping("/hotelregisterok")
	private void hotelok(Model model, Pagination pagination) {
		log.info("hotelregister()");
		log.info("pagination = " + pagination);
	      List<HotelInfoVO> hotelList = hotelInfoService.getPagingBoards(pagination);
	      
	      PageMaker pageMaker = new PageMaker();
	      pageMaker.setPagination(pagination);
	      pageMaker.setTotalCount(hotelInfoService.getTotalCount());
	      
	      model.addAttribute("pageMaker", pageMaker);
	      model.addAttribute("hotelList", hotelList);
		
	} /// end hotelok()

	@PostMapping("/hotelregister")
	private String hotelregister() {
		return "redirect:/hotelregister/hotelregisterok";
	} // end hotelregister()

}