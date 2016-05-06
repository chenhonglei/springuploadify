package com.bai.upload;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Component
@RequestMapping("/upload")
public class UploadifyUtil {
	@ResponseBody
	@RequestMapping(value="/uploadImage",method=RequestMethod.POST)
	public String uploadImage(String uploadLocation,HttpServletRequest request ,HttpServletResponse response,@RequestParam(value="file", required=false) MultipartFile file) {
		
		//文件分隔符号
		String sep = System.getProperty("file.separator");  
		try {
			byte[] bytes = file.getBytes(); 
			String uploadDir = request.getSession().getServletContext().getRealPath(sep)+"upload";  
			//用户的图片
			if(StringUtils.equals("user",uploadLocation)){
				uploadDir += (sep+"userimg");
			}else{
				uploadDir+= (sep+ new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
			}
			File dirPath = new File(uploadDir);  
			if (!dirPath.exists()) {  
			    dirPath.mkdirs();  
			}
			
			File uploadedFile = new File(uploadDir + sep  
	                + file.getOriginalFilename());  
	        FileCopyUtils.copy(bytes, uploadedFile);  
		} catch (IOException e) {
			e.printStackTrace();
		}  
	    
	    
        return "true";
	       
	}
}
