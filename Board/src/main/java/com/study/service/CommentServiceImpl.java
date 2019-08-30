package com.study.service;

import com.study.domain.CommentVO;
import com.study.mapper.CommentMapper;
import com.study.mapper.ReplyMapper;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;







@Service
public class CommentServiceImpl implements CommentService
{
  @Autowired
  private CommentMapper mapper;
  @Autowired
  private ReplyMapper reply;
  
  @Transactional
  public int register(CommentVO vo) {
    this.reply.updateCommentCnt(vo.getRno(), 1);
    return this.mapper.insert(vo);
  }




  
  public CommentVO get(long cno) { return this.mapper.read(cno); }





  
  public int modify(CommentVO vo) { return this.mapper.update(vo); }



  
  @Transactional
  public int remove(long cno) {
    CommentVO vo = this.mapper.read(cno);
    this.reply.updateCommentCnt(vo.getRno(), -1);
    return this.mapper.delete(cno);
  }



  
  public List<CommentVO> getList(Long rno) { return this.mapper.getList(rno.longValue()); }
}
