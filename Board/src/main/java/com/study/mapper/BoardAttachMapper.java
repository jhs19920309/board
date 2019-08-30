package com.study.mapper;

import com.study.domain.BoardAttachVO;
import java.util.List;

public interface BoardAttachMapper {
  void insert(BoardAttachVO paramBoardAttachVO);
  
  void delete(String paramString);
  
  List<BoardAttachVO> findByBno(Long paramLong);
  
  void deleteAll(long paramLong);
  
  List<BoardAttachVO> getOldFiles();
}
