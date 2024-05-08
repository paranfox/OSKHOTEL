package com.osk.project.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.osk.project.domain.BoardVO;
import com.osk.project.domain.UserVO;
import com.osk.project.util.Pagination;

public interface BoardService {
  int createBoard(BoardVO boardVO);
  List<BoardVO> getAllBoards();
  BoardVO getBoardById(int boardId);
  int updateBoard(BoardVO boardVO);
  int deleteBoard(int boardId);
  List<BoardVO> getPagingBoards(Pagination pagination);
  int getTotalCount();
}
