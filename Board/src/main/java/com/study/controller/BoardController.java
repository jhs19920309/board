package com.study.controller;
import com.study.domain.BoardAttachVO;
import com.study.domain.BoardVO;
import com.study.domain.PageDTO;
import com.study.domain.Paging;
import com.study.service.BoardService;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

 


@RequestMapping({"/board/*"})
@Controller
public class BoardController
{
  @Autowired
     private BoardService service;
  
  @GetMapping({"/SignUpForm"})
  public void SignUpForm() {}
  
  private void deleteFiles(List<BoardAttachVO> attachList) {
    if (attachList == null || attachList.size() == 0) {
      return;
    }

    
    attachList.forEach(attach -> {

          
          try {
            Path file = Paths.get("C:\\upload\\" + attach.getUploadPath() + "\\" + attach.getUuid() + "_" + attach.getFileName(), new String[0]);
            Files.deleteIfExists(file);
            
            if (Files.probeContentType(file).startsWith("image"))
            {
              Path thumbNail = Paths.get("C:\\upload\\" + attach.getUploadPath() + "\\s_" + attach.getUuid() + "_" + attach.getFileName(), new String[0]);
              Files.delete(thumbNail);
            }
          
          }
          catch (Exception e) {
            
            e.printStackTrace();
          } 
        });
  }
 

  
  @GetMapping({"/list"})
  public void list(Model model, Paging pg) {
    System.out.println(String.valueOf(pg.getType()) + "   :" + pg.getKeyword());
    int total = this.service.getTotal(pg);
    model.addAttribute("list", this.service.ListWithPaging(pg));
    model.addAttribute("page", new PageDTO(pg, total));
  }

 
  @GetMapping({"/get"})
  public void get(@RequestParam("bno") Long bno, Model model, @ModelAttribute("pg") Paging pg) {
    String secName = SecurityContextHolder.getContext().getAuthentication().getName();
    if (secName.equals("anonymousUser"))
    {
      secName = "";
    }
    
    model.addAttribute("board", this.service.get(bno));
    model.addAttribute("secName", secName);
  }
 
  
  @GetMapping({"/register"})
  @PreAuthorize("isAuthenticated()")
  public void register() {}

 
  
  @PostMapping({"/register"})
  @PreAuthorize("isAuthenticated()")
  public String register(BoardVO board, RedirectAttributes rttr) {
    this.service.register(board);
    
    System.out.println("����");
    if (board.getAttachList() != null) {
      
      System.out.println("������");
      ArrayList<BoardAttachVO> test = (ArrayList<BoardAttachVO>)board.getAttachList();
      
      for (int i = 0; i < test.size(); i++) {
        
        System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        System.out.println(((BoardAttachVO)test.get(i)).toString());
        System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
      } 
    } 
    
    rttr.addFlashAttribute("result", Long.valueOf(board.getBno()));
 
    return "redirect:/board/list";
  }

 
  @GetMapping({"/modify"})
  public void modify(@RequestParam("bno") Long bno, Model model, @ModelAttribute("pg") Paging pg) {
    System.out.println(String.valueOf(pg.getAmount()) + " " + pg.getPageNum());
    model.addAttribute("board", this.service.get(bno));
  }
 
  @PreAuthorize("principal.username==#board.writer")
  @PostMapping({"/modify"})
  public String modify(BoardVO board, RedirectAttributes rttr, @ModelAttribute("pg") Paging pg) {
    if (this.service.modify(board)) {
      rttr.addFlashAttribute("result", "success");
    }
    
    rttr.addAttribute("pageNum", Integer.valueOf(pg.getPageNum()));
    rttr.addAttribute("amount", Integer.valueOf(pg.getAmount()));
    
    rttr.addAttribute("type", pg.getType());
    rttr.addAttribute("keyword", pg.getKeyword());
    
    return "redirect:/board/list";
  }
 
  
  @PreAuthorize("principal.username==#writer")
  @PostMapping({"/remove"})
  public String remove(@RequestParam("bno") long bno, RedirectAttributes rttr, @ModelAttribute("pg") Paging pg, String writer) {
    List<BoardAttachVO> attachList = this.service.getAttachList(bno);
    
    if (this.service.remove(Long.valueOf(bno))) {
      
      deleteFiles(attachList);
      rttr.addFlashAttribute("result", "success");
    } 
    
    rttr.addAttribute("pageNum", Integer.valueOf(pg.getPageNum()));
    rttr.addAttribute("amount", Integer.valueOf(pg.getAmount()));
    rttr.addAttribute("type", pg.getType());
    rttr.addAttribute("keyword", pg.getKeyword());
    return "redirect:/board/list";
  }


  
  @GetMapping(value = {"/getAttachList"}, produces = {"application/json;charset=UTF-8"})
  @ResponseBody
  public ResponseEntity<List<BoardAttachVO>> getAttachList(long bno) { 
	  
	  return new ResponseEntity<List<BoardAttachVO>>(this.service.getAttachList(bno), HttpStatus.OK); 
	  
  }








}
