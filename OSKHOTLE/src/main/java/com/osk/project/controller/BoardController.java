package com.osk.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.osk.project.domain.BoardVO;
import com.osk.project.service.BoardService;
import com.osk.project.util.PageMaker;
import com.osk.project.util.Pagination;

import lombok.extern.log4j.Log4j;

@Controller // @Component
// - 클라이언트(JSP 페이지 등)와 service를 연결하는 역할
@RequestMapping(value="/board") // url : /ex02/board
@Log4j
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	// 전체 게시글 데이터를 list.jsp 페이지로 전송
	   @GetMapping("/list")
	   public void list(Model model, Pagination pagination) {
	      log.info("list()");
	      log.info("pagination = " + pagination);
	      List<BoardVO> boardList = boardService.getPagingBoards(pagination);
	      
	      PageMaker pageMaker = new PageMaker();
	      pageMaker.setPagination(pagination);
	      pageMaker.setTotalCount(boardService.getTotalCount());
	      
	      model.addAttribute("pageMaker", pageMaker);
	      model.addAttribute("boardList", boardList);
	   }
	
	// register.jsp 페이지 호출
	@GetMapping("/register")
	public void registerGET() {
		log.info("registerGET()");
	}
	
	// register.jsp에서 전송받은 게시글 데이터를 저장
	@PostMapping("/register")
	public String registerPOST(BoardVO boardVO, RedirectAttributes reAttr) {
		log.info("registerPOST()");
		log.info("boardVO = " + boardVO.toString());
		int result = boardService.createBoard(boardVO);
		log.info(result + "행 등록");
		return "redirect:/board/list";
	}
	
	// list.jsp에서 선택된 게시글 번호를 저장
	// 전송된 데이터로 board 데이터를 조회하고 detail.jsp 페이지로 전송
	@GetMapping("/detail")
	public void detail(Model model, Integer boardId) {
		log.info("detail()");
		BoardVO boardVO = boardService.getBoardById(boardId);
		model.addAttribute("boardVO", boardVO);
	}
	
	// 게시글 번호를 전송 받아 저장
	// 게시글 데이터를 modify.jsp로 전송
	@GetMapping("/modify")
	public void modifyGET(Model model, Integer boardId) {
		log.info("modifyGET()");
		BoardVO boardVO = boardService.getBoardById(boardId);
		model.addAttribute("boardVO", boardVO);
	}
	
	
	// modify.jsp에서 수정할 데이터를 전송하여 게시글 데이터 수정
	@PostMapping("/modify")
	public String modifyPOST(BoardVO boardVO, RedirectAttributes reAttr) {
		log.info("modifyPOST()");
		int result = boardService.updateBoard(boardVO);
		log.info(result + "행 수정");
		return "redirect:/board/list";
	}
	
	// detail.jsp에서 boardId를 전송받아 게시글 데이터 삭제
	@PostMapping("/delete")
	public String delete(Integer boardId, RedirectAttributes reAttr) {
		log.info("delete()");
		int result = boardService.deleteBoard(boardId);
		log.info(result + "행 삭제");
		return "redirect:/board/list";
	}
	
}
