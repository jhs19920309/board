package com.study.mapper;

import com.study.domain.CommentVO;
import java.util.List;

public interface CommentMapper {
  int insert(CommentVO paramCommentVO);
  
  CommentVO read(long paramLong);
  
  int delete(long paramLong);
  
  int update(CommentVO paramCommentVO);
  
  List<CommentVO> getList(long paramLong);
}
