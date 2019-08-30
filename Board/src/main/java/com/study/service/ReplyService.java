package com.study.service;

import com.study.domain.Paging;
import com.study.domain.ReplyPageDTO;
import com.study.domain.ReplyVO;
import java.util.List;

public interface ReplyService {
  int register(ReplyVO paramReplyVO);
  
  ReplyVO get(long paramLong);
  
  int modify(ReplyVO paramReplyVO);
  
  int remove(long paramLong);
  
  List<ReplyVO> getList(Paging paramPaging, long paramLong);
  
  ReplyPageDTO getListPage(Paging paramPaging, long paramLong);
}
