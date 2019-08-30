package com.study.service;

import com.study.domain.BoardAttachVO;
import com.study.domain.BoardVO;
import com.study.domain.Paging;
import com.study.mapper.BoardAttachMapper;
import com.study.mapper.BoardMapper;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;







@Service
public class BoardServiceImpl
  implements BoardService
{
  @Autowired
  private BoardMapper mapper;
  @Autowired
  private BoardAttachMapper attachMapper;
  
  @Transactional
  public void register(BoardVO board) {
    this.mapper.insertSelectKey(board);
    
    if (board.getAttachList() == null || board.getAttachList().size() <= 0) {
      return;
    }

    
    board.getAttachList().forEach(attach -> {attach.setBno(Long.valueOf(board.getBno()));
          this.attachMapper.insert(attach);
        });
  }




  
  public List<BoardAttachVO> getAttachList(long bno) { return this.attachMapper.findByBno(Long.valueOf(bno)); }





  
  public BoardVO get(Long bno) { return this.mapper.read(bno.longValue()); }





  
  @Transactional
  public boolean modify(BoardVO board) {
    this.attachMapper.deleteAll(board.getBno());
    
    boolean modifyResult = (this.mapper.update(board) == 1);
    
    if (modifyResult && board.getAttachList() != null && board.getAttachList().size() > 0)
    {
      board.getAttachList().forEach(attach -> {
            
            attach.setBno(Long.valueOf(board.getBno()));
            this.attachMapper.insert(attach);
          });
    }


    
    return modifyResult;
  }





  
  @Transactional
  public boolean remove(Long bno) {
    this.attachMapper.deleteAll(bno.longValue());
    return (this.mapper.delete(bno) == 1);
  }



  
  public List<BoardVO> getList() { return this.mapper.getList(); }




  
  public List<BoardVO> ListWithPaging(Paging pg) { return this.mapper.ListWithPaging(pg); }




  
  public int getTotal(Paging pg) { return this.mapper.getTotalCount(pg); }
}
