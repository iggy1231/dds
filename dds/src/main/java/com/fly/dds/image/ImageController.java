package com.fly.dds.image;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fly.dds.common.FileManager;

@Controller("image.imageController")
@RequestMapping("/image/*")
public class ImageController {
	@Autowired
	private FileManager fileManager;
	
	// HTML 5 upload
	@RequestMapping(value="html5Upload")
	public void html5Upload(HttpServletRequest req,
			HttpServletResponse resp,
			HttpSession session) throws Exception {
		
			String cp = req.getContextPath();
		
		    String root = session.getServletContext().getRealPath("/");
		    String pathname = root + "uploads" + File.separator + "image";
			File dir = new File(pathname);
			if(! dir.exists()) {
				dir.mkdirs();
			}
			
			try {
			    String strUrl = "";
			    if(!"OPTIONS".equals(req.getMethod().toUpperCase())) {
			    	String filename = req.getHeader("file-name");
			    	// String ext = filename.substring(filename.lastIndexOf("."));
			    	
			    	InputStream is = req.getInputStream();
			    	String saveFilename = fileManager.doFileUpload(is, filename, pathname);
			    	
					strUrl += "&bNewLine=true&sFileName="; 
	                strUrl += saveFilename;
	                // strUrl += "&sWidth=600";
	                strUrl += "&sFileURL=" + cp + "/uploads/image/" + saveFilename;
			    }
				
				PrintWriter out=resp.getWriter();
				out.print(strUrl);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
	}

	// HTML 5을 지원하지 않는 브라우저
	@RequestMapping(value="generalUpload")
	public String generalUpload(HttpServletRequest req,
			HttpSession session, Image image) throws Exception {
		
			String cp = req.getContextPath();
		
		    String root = session.getServletContext().getRealPath("/");
		    String pathname = root + "uploads" + File.separator + "image";
			File dir = new File(pathname);
			if(! dir.exists()) {
				dir.mkdirs();
			}
			
			String strUrl = image.getCallback() + "?callback_func=" + image.getCallback_func();
			boolean flag = false;
			
			try {
				
			    String saveFilename = fileManager.doFileUpload(image.getFiledata(), pathname);
			    
			    if(saveFilename != null) {
			    	strUrl += "&bNewLine=true&sFileName="; 
	                strUrl += saveFilename;
	                // strUrl += "&sWidth=600";
	                strUrl += "&sFileURL=" + cp + "/uploads/image/" + saveFilename;
	                
	                flag = true;
			    }
				
			} catch (IOException e) {
				e.printStackTrace();
			}

			if(! flag) {
				strUrl += "&errstr=error";
			}
			
			return "redirect:" + strUrl;
	}
}
