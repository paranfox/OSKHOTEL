package com.osk.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.osk.project.domain.ReviewVO;
import com.osk.project.service.ReviewService;
import com.osk.project.util.PageMaker;
import com.osk.project.util.Pagination;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value="/review")
@Log4j
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	// 모든 리뷰글을 reviewList.jsp 페이지로 전송
	@GetMapping("/reviewList")
	public void reviewList(Model model, Pagination pagination) {
		log.info("reviewList()");
		log.info("pagination = " + pagination);
		List<ReviewVO> reviewlist = reviewService.getPagingBoards(pagination);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setPagination(pagination);
		pageMaker.setTotalCount(reviewService.getTotalCount());
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("reviewList", reviewlist);
	}
	
	// reviewInsert.jsp 페이지 호출
	@GetMapping("reviewInsert")
	public void reviewInsertGET() {
		log.info("reviewInsertGET()");
	}
	
	// reviewInsert.jsp에서 전송받은 리뷰글 저장
	@PostMapping("reviewInsert")
	public String reviewInsertPOST(ReviewVO reviewVO, RedirectAttributes reAttr) {
		log.info("reviewInsertPOST()");
		log.info("ReviewVO = " + reviewVO.toString());
		int result = reviewService.createBoard(reviewVO);
		log.info(result + "행 등록");
		return "redirect:/review/reviewList";
	}
	
	// reviewList.jsp에서 선택된 리뷰글 정보를 저장
	// 전송된 데이터르 review 데이터를 조회하고 reviewDetail.jsp 페이지로 전송
	@GetMapping("/reviewDetail")
	public void reviewDetail(Model model, Integer reviewNo) {
		log.info("reviewDetail()");
		ReviewVO reviewVO = reviewService.getBoardByNo(reviewNo);
		model.addAttribute("ReviewVO", reviewVO);
	}
	
	// 리뷰글 번호를 전송받아 저장
	// 리뷰글 데이터를 reviewUpdate.jsp로 전송
	@GetMapping("/reviewUpdate")
	public void reviewUpdateGET(Model model, Integer reviewNo) {
		log.info("reviewUpdateGET()");
		ReviewVO reviewVO = reviewService.getBoardByNo(reviewNo);
		model.addAttribute("ReviewVO", reviewVO);
	}
	
	// reviewUpdate.jsp에서 수정된 데이터를 전송하여 리뷰글 데이터 수정
	@PostMapping("/reviewUpdate")
	public String reviewUpdatePOST(ReviewVO reviewVO, RedirectAttributes reAttr) {
		log.info("reviewUpdatePOST()");
		int result = reviewService.updateBoard(reviewVO);
		log.info(result + "행 수정");
		return "redirect:/review/reviewList";
	}
	
	// reviewDetail.jsp에서 리뷰글 번호를 전송 받아 리뷰글 삭제
	@PostMapping("/reviewDelete")
	public String reviewDelete(Integer reviewNo, RedirectAttributes reAttr) {
		log.info("reviewDelete()");
		int result = reviewService.deleteBoard(reviewNo);
		log.info(result + "행 삭제");
		return "redirect:/review/reviewList";
	}
	
	
	
}
