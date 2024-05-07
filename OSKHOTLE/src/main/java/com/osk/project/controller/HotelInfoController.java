package com.osk.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = "/hotelinfo")
@Log4j
public class HotelInfoController {

	// 호텔 등록 페이지 이동(GET)
	@GetMapping("/hotelregister")
	private void hotelmove() {
		log.info("hotelregister()");
	} /// end hotelmove()

	// 호텔 등록 페이지 이동(GET)
	@GetMapping("/hotelregisterok")
	private void hotelok() {
		log.info("hotelregister()");
	} /// end hotelmove()

	@PostMapping("/hotelregister")
	private String hotelregister() {
		return "redirect:/hotelregister/hotelregisterok";
	}

}