package com.study.service;

import com.study.domain.Paging;
import com.study.domain.ReplyPageDTO;
import com.study.domain.ReplyVO;
import com.study.mapper.BoardMapper;
import com.study.mapper.ReplyMapper;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;








@Service
public class ReplyServiceImpl
  implements ReplyService
{
  @Autowired
  private ReplyMapper mapper;
  @Autowired
  private BoardMapper boardMapper;
  
  @Transactional
  public int register(ReplyVO vo) {
    this.boardMapper.updateReplyCnt(vo.getBno(), 1);
    return this.mapper.insert(vo);
  }




  
  public ReplyVO get(long rno) { return this.mapper.read(rno); }




  
  public int modify(ReplyVO vo) { return this.mapper.update(vo); }



  
  @Transactional
  public int remove(long rno) {
    this.boardMapper.updateReplyCnt(this.mapper.read(rno).getBno(), -1);
    return this.mapper.delete(rno);
  }



  
  public List<ReplyVO> getList(Paging pg, long bno) { return this.mapper.getListWithPaging(pg, bno); }





  
  public ReplyPageDTO getListPage(Paging pg, long bno) { return new ReplyPageDTO(this.mapper.getCountByBno(bno), this.mapper.getListWithPaging(pg, bno)); }
}
