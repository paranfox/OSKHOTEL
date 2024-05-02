package com.osk.project.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.osk.project.domain.ReplyVO;

@Mapper
public interface ReplyMapper {
   int insert(ReplyVO replyVO);
   List<ReplyVO> selectListByBoardId(int boardId);
   int update(ReplyVO replyVO);
   int delete(int replyId);
} // end ReplyMapper