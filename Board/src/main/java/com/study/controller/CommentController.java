package com.study.controller;

import java.util.List;

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

import com.study.domain.CommentVO;
import com.study.service.CommentService;

 








@RestController
@RequestMapping({"/comments/"})
public class CommentController
{
  @Autowired
  CommentService service;
  
  @GetMapping(value = {"/list/{rno}"}, produces = {"application/json;charset=UTF-8"})
  public List<CommentVO> getList(@PathVariable("rno") long rno) { return this.service.getList(Long.valueOf(rno)); }



  
  @PreAuthorize("principal.username==#commenter")
  @DeleteMapping(value = {"/{cno}/{name}"}, produces = {"text/plain"})
  public ResponseEntity<String> remove(@PathVariable("cno") long cno, @PathVariable("name") String commenter) {
    return (this.service.remove(cno) == 1) ? new ResponseEntity("success", HttpStatus.OK) : 
      new ResponseEntity(HttpStatus.INTERNAL_SERVER_ERROR);
  }
 


  
  @PreAuthorize("principal.username==#vo.commenter")
  @RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, value = {"/{cno}"}, consumes = {"application/json"}, produces = {"text/plain"})
  public ResponseEntity<String> modify(@RequestBody CommentVO vo, @PathVariable("cno") long cno) {
    vo.setCno(cno);
    
    return (this.service.modify(vo) == 1) ? new ResponseEntity("success", HttpStatus.OK) : 
      new ResponseEntity(HttpStatus.INTERNAL_SERVER_ERROR);
  }


  
  @PreAuthorize("isAuthenticated()")
  @PostMapping(value = {"/new"}, consumes = {"application/json"}, produces = {"text/plain"})
  public ResponseEntity<String> create(@RequestBody CommentVO vo) {
    System.out.println("test" + vo.toString());
    int insertCount = this.service.register(vo);
    
    return (insertCount == 1) ? new ResponseEntity("success", HttpStatus.OK) : 
      new ResponseEntity(HttpStatus.INTERNAL_SERVER_ERROR);
  }
}
