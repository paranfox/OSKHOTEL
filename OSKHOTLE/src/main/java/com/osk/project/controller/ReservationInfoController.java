package com.osk.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.osk.project.domain.ReservationInfoVO;
import com.osk.project.service.ReservationInfoService;
import com.osk.project.util.PageMaker;
import com.osk.project.util.Pagination;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value="/reservationInfo")
@Log4j
public class ReservationInfoController  {
	
	@Autowired
	private ReservationInfoService reservationInfoService;
	
	// 모든 예약 정보를 reservationList.jsp 페이지로 전송
	@GetMapping("/reservationList")
	public void reservationList(Model model, Pagination pagination, HttpSession session) {
		log.info("reservationlist()");
		String userId = (String) session.getAttribute("userId");
		log.info("userId = " + userId);
		pagination.setUserId(userId);
		log.info("pagination = " + pagination);
		List<ReservationInfoVO> reservationlist = reservationInfoService.getPagingBoards(pagination);
		log.info("reservationList() = " + reservationlist);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setPagination(pagination);
		pageMaker.setTotalCount(reservationInfoService.getTotalCount(pagination));
		
		model.addAttribute("pagination", pagination);
		model.addAttribute("reservationList", reservationlist);
		model.addAttribute("pageMaker", pageMaker);
			
	}
	
	// reservationInsert.jsp 페이지 호출
	@GetMapping("/reservationInsert")
	public void reservationInsertGET() {
		log.info("reservationInsertGET()");
	}
	
	// reservationInsert.jsp에서 전송받은 예약 정보를 저장
	@PostMapping("/reservationInsert")
	public String reservationInsertPOST(ReservationInfoVO reservationInfoVO, RedirectAttributes reAttr) {
		log.info("reservationInsertPOST()");
		log.info("ReservationInfoVO = " + reservationInfoVO.toString());
		int result = reservationInfoService.createBoard(reservationInfoVO);
		log.info(result + "행 등록");
		return "redirect:/reservationInfo/reservationList";
	}
	
	// reservationList.jsp에서 선택된 예약 정보 번호를 저장
	// 전송된 데이터로 reservationInfo 데이터를 조회하고 reservationDetail.jsp 페이지로 전송
	@GetMapping("/reservationDetail")
	public void reservationDetail(Model model, Integer reservationNo) {
		log.info("reservationDetail()");
		log.info("reservationNo = " + reservationNo);
		ReservationInfoVO reservationInfoVO = reservationInfoService.getBoardByNo(reservationNo);
		log.info(reservationInfoVO);
		model.addAttribute("reservationInfoVO", reservationInfoVO);
	}
	
	// 예약 정보 번호를 전송받아 저장
	// 예약 정보 데이터를 reservationUpdate.jsp로 전송
	@GetMapping("/reservationUpdate")
	public void reservationUpdateGET(Model model, Integer reservationNo) {
		log.info("reservationUpdateGET()");
		ReservationInfoVO reservationInfoVO = reservationInfoService.getBoardByNo(reservationNo);
		model.addAttribute("ReservationInfoVO", reservationInfoVO);
	}
	
	// reservationUpdate.jsp에서 수정한 데이터를 전송하여 예약 정보 데이터 수정
	@PostMapping("/reservationUpdate")
	public String reservationUpdatePOST(ReservationInfoVO reservationInfoVO, RedirectAttributes reAttr) {
		log.info("reservationUpdatePOST()");
		int result = reservationInfoService.updateBoard(reservationInfoVO);
		log.info(result + "행 수정");
		return "redirect:/reservationInfo/reservationList";
	}
	
	// reservationDetail.jsp에서 예약 정보 번호를 전송 받아 예약 정보 삭제
	@PostMapping("/reservationDelete")
	public String reservationDelete(Integer reservationNo, RedirectAttributes reAttr) {
		log.info("reservationDelete()");
		int result = reservationInfoService.deleteBoard(reservationNo);
		log.info(result + "행 삭제");
		return "redirect:/reservationInfo/reservationList";
	}
	
	
	
	
	
}
