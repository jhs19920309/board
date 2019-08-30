package com.study.service;

import com.study.domain.CommentVO;
import java.util.List;

public interface CommentService {
  int register(CommentVO paramCommentVO);
  
  CommentVO get(long paramLong);
  
  int modify(CommentVO paramCommentVO);
  
  int remove(long paramLong);
  
  List<CommentVO> getList(Long paramLong);
}
