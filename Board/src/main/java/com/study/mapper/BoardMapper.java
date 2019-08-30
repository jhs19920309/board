package com.study.mapper;

import com.study.domain.BoardVO;
import com.study.domain.Paging;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BoardMapper {
  List<BoardVO> getList();
  
  void insert(BoardVO paramBoardVO);
  
  void insertSelectKey(BoardVO paramBoardVO);
  
  BoardVO read(long paramLong);
  
  int delete(Long paramLong);
  
  int update(BoardVO paramBoardVO);
  
  List<BoardVO> ListWithPaging(Paging paramPaging);
  
  int getTotalCount(Paging paramPaging);
  
  void updateReplyCnt(@Param("bno") long paramLong, @Param("amount") int paramInt);
}
