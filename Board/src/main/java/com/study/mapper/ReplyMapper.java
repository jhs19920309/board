package com.study.mapper;

import com.study.domain.Paging;
import com.study.domain.ReplyVO;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ReplyMapper {
  int insert(ReplyVO paramReplyVO);
  
  ReplyVO read(long paramLong);
  
  int delete(long paramLong);
  
  int update(ReplyVO paramReplyVO);
  
  List<ReplyVO> getListWithPaging(@Param("pg") Paging paramPaging, @Param("bno") long paramLong);
  
  int getCountByBno(long paramLong);
  
  void updateCommentCnt(@Param("rno") long paramLong, @Param("amount") int paramInt);
}
