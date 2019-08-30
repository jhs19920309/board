package com.study.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.study.domain.Paging;
import com.study.domain.ReplyPageDTO;
import com.study.domain.ReplyVO;
import com.study.service.ReplyService;


 




@RequestMapping({"/replies/"})
@RestController
public class ReplyController
{
  @Autowired
  private ReplyService service;
  
  @GetMapping(value = {"/pages/{bno}/{page}"}, produces = {"application/json;charset=UTF-8"})
  public ResponseEntity<ReplyPageDTO> getList(@PathVariable("page") int page, @PathVariable("bno") long bno) {
    Paging pg = new Paging(page, 10);
    
    this.service.getListPage(pg, bno);
    return new ResponseEntity(this.service.getListPage(pg, bno), HttpStatus.OK);
  }







  
  @PreAuthorize("isAuthenticated()")
  @PostMapping(value = {"/new"}, consumes = {"application/json"}, produces = {"text/plain"})
  public ResponseEntity<String> create(@RequestBody ReplyVO vo) {
    int insertCount = this.service.register(vo);
    
    return (insertCount == 1) ? new ResponseEntity("success", HttpStatus.OK) : 
      new ResponseEntity(HttpStatus.INTERNAL_SERVER_ERROR);
  }




  
  @GetMapping(value = {"/{rno}"}, produces = {"application/json"})
  public ResponseEntity<ReplyVO> get(@PathVariable("rno") long rno) { return new ResponseEntity(this.service.get(rno), HttpStatus.OK); }






  
  @PreAuthorize("principal.username==#vo.replyer")
  @DeleteMapping(value = {"/{rno}"}, produces = {"text/plain"})
  public ResponseEntity<String> remove(@RequestBody ReplyVO vo, @PathVariable("rno") long rno) {
    return (this.service.remove(rno) == 1) ? new ResponseEntity("success", HttpStatus.OK) : 
      new ResponseEntity(HttpStatus.INTERNAL_SERVER_ERROR);
  }


  
  @PreAuthorize("principal.username==#vo.replyer")
  @RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, value = {"/{rno}"}, consumes = {"application/json"}, produces = {"text/plain"})
  public ResponseEntity<String> modify(@RequestBody ReplyVO vo, @PathVariable("rno") long rno) {
    vo.setRno(rno);
    
    return (this.service.modify(vo) == 1) ? new ResponseEntity("success", HttpStatus.OK) : 
      new ResponseEntity(HttpStatus.INTERNAL_SERVER_ERROR);
  }
}
