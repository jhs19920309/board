package com.study.service;

import com.study.domain.BoardAttachVO;
import com.study.domain.BoardVO;
import com.study.domain.Paging;
import java.util.List;

public interface BoardService {
  void register(BoardVO paramBoardVO);
  
  BoardVO get(Long paramLong);
  
  boolean modify(BoardVO paramBoardVO);
  
  boolean remove(Long paramLong);
  
  List<BoardVO> getList();
  
  List<BoardVO> ListWithPaging(Paging paramPaging);
  
  int getTotal(Paging paramPaging);
  
  List<BoardAttachVO> getAttachList(long paramLong);
}
