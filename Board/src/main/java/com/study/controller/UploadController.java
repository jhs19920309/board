package com.study.controller;

import com.study.domain.BoardAttachVO;
import java.io.File;
import java.io.FileOutputStream;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import net.coobird.thumbnailator.Thumbnailator;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;








@Controller
public class UploadController
{
  private boolean checkImageType(File file) {
    try {
      String contentType = Files.probeContentType(file.toPath());
      
      return contentType.startsWith("image");
    }
    catch (Exception e) {
      
      e.printStackTrace();
      
      return false;
    } 
  }

  
  private String getFolder() {
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Date date = new Date();
    String str = sdf.format(date);
    
    return str.replace("-", File.separator);
  }










  
  @GetMapping(value = {"/download"}, produces = {"application/octet-stream"})
  @ResponseBody
  public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent, String fileName) {
    FileSystemResource fileSystemResource = new FileSystemResource("c:\\upload\\" + fileName);


    
    if (!fileSystemResource.exists())
    {
      return new ResponseEntity(HttpStatus.NOT_FOUND);
    }

    
    String resourceName = fileSystemResource.getFilename();
    
    String resourceOriginalName = resourceName.substring(resourceName.indexOf("_") + 1);


    
    HttpHeaders headers = new HttpHeaders();
    
    try {
      String downloadName = null;
      
      if (userAgent.contains("Trident")) {

        
        downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8").replaceAll("\\+", " ");
      }
      else if (userAgent.contains("Edge")) {

        
        downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8");
      
      }
      else {
        
        downloadName = new String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1");
      } 

      
      headers.add("Content-Disposition", "attachment; filename=" + downloadName);

    
    }
    catch (Exception e) {
      
      e.printStackTrace();
    } 
    
    return new ResponseEntity(fileSystemResource, headers, HttpStatus.OK);
  }










  
  @GetMapping({"/display"})
  @ResponseBody
  public ResponseEntity<byte[]> getFile(String fileName) {
    File file = new File("c:\\upload\\" + fileName);

    
    ResponseEntity<byte[]> result = null;
    
    try {
      HttpHeaders header = new HttpHeaders();
      
      header.add("Content-type", Files.probeContentType(file.toPath()));

      
      result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);

    
    }
    catch (Exception e) {
      
      e.printStackTrace();
    } 
    return result;
  }







  
  @PreAuthorize("isAuthenticated()")
  @PostMapping(value = {"/uploadAjaxAction"}, produces = {"application/json;charset=UTF-8"})
  @ResponseBody
  public ResponseEntity<List<BoardAttachVO>> uploadAjaxPost(MultipartFile[] uploadFile) {
    List<BoardAttachVO> list = new ArrayList<BoardAttachVO>();
    String uploadFolder = "C:\\upload";
    String uploadFolderPath = getFolder();
    
    File uploadPath = new File(uploadFolder, getFolder());
    if (!uploadPath.exists())
    {
      uploadPath.mkdirs();
    }
    
   
   
    for (MultipartFile multipartFile : uploadFile) 
    { 
    	 
      
      BoardAttachVO attachDTO = new BoardAttachVO();

      
      String uploadFileName = multipartFile.getOriginalFilename();
      
      uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
      
      attachDTO.setFileName(uploadFileName);

      
      UUID uuid = UUID.randomUUID();
      uploadFileName = String.valueOf(uuid.toString()) + "_" + uploadFileName;




      
      try {
        File saveFile = new File(uploadPath, uploadFileName);

        
        multipartFile.transferTo(saveFile);
        
        attachDTO.setUuid(uuid.toString());
        attachDTO.setUploadPath(uploadFolderPath);
        
        if (checkImageType(saveFile)) {
          
          attachDTO.setFileType(true);
          FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
          Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 500, 500);
          thumbnail.close();
        } 

        
        list.add(attachDTO);
      }
      catch (Exception e) {
        
        e.printStackTrace();
      } 
      
   
      
    }

    
    return new ResponseEntity(list, HttpStatus.OK);
  }





  
  @PreAuthorize("isAuthenticated()")
  @PostMapping({"/deleteFile"})
  @ResponseBody
  public ResponseEntity<String> deleteFile(String fileName, String type) {
    try {
      File file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
      file.delete();

      
      if (type.equals("image")) {
        String largeFileName = file.getAbsolutePath().replace("s_", "");
        file = new File(largeFileName);
        file.delete();
      }
    
    }
    catch (Exception e) {
      
      e.printStackTrace();
      return new ResponseEntity(HttpStatus.NOT_FOUND);
    } 
    
    return new ResponseEntity("delete", HttpStatus.OK);
  }
}
