package com.osk.project.service;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.osk.project.domain.ReplyVO;
import com.osk.project.persistence.BoardMapper;
import com.osk.project.persistence.ReplyMapper;

import lombok.extern.log4j.Log4j;

@Service  // controller와 mapper를 이어주는 것
@Log4j
public class ReplyServiceImple implements ReplyService{

   @Autowired
   private ReplyMapper replyMapper;
	
   @Autowired
   private BoardMapper boardMapper;
   
   @Transactional(value = "transactionManager") // transactionManager가 관리
   @Override
   public int createReply(ReplyVO replyVO) {
      log.info("createReply()");
      int insertResult = replyMapper.insert(replyVO);
      log.info(insertResult + "행 댓글 추가");
      
      int updateResult = boardMapper.updateReplyCount(replyVO.getBoardId(), 1); // 1씩 증가하니까 1을 넣어줌
      log.info(updateResult + "행 게시판 수정");
      return 1; // 성공
   }

   @Override
   public List<ReplyVO> getAllReply(int boardId) {
      log.info("getAllReply()");
      return replyMapper.selectListByBoardId(boardId);
   }

   @Override
   public int updateReply(int replyId, String replyContent) {
      log.info("updateReply()");
      ReplyVO replyVO = new ReplyVO();
      replyVO.setReplyId(replyId);
      replyVO.setReplyContent(replyContent);
      return replyMapper.update(replyVO);
   }

   @Transactional(value = "transactionManager") // transactionManager가 관리
   @Override
   public int deleteReply(int replyId, int boardId) {
      log.info("deleteReply()");
      int deleteResult = replyMapper.delete(replyId);
      log.info(deleteResult + "행 댓글 삭제");
      int updateResult = boardMapper.updateReplyCount(boardId, -1);
      log.info(updateResult + "행 게시판 수정");
      return 1;
   }

}
