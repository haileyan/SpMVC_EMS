package com.biz.email.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.biz.email.mapper.EmailDao;
import com.biz.email.model.EmailVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class EmailService {

	@Autowired
	EmailDao eDao;

	@Autowired
	ServletContext sContext;

	@Autowired
	SendMailService sService;
	
	public List<EmailVO> selectAll() {
		return eDao.selectAll();
	}

	public int insert(EmailVO emailVO) {
		int ret = eDao.insert(emailVO);
		sService.sendMail(emailVO);
		return ret;
	}
	
	public String upload(MultipartFile file) {
					
		String realPath = sContext.getRealPath("/files/");
		File dir = new File(realPath);
		
		if(!dir.exists()) dir.mkdir();
		
		if(file.isEmpty() || file == null) return null;
		
		String realFile = file.getOriginalFilename();
		String saveFile = UUID.randomUUID().toString();
		saveFile += realFile;
		
		File upFile = new File(realPath, saveFile);
		try {
			file.transferTo(upFile);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return saveFile;
	}
	
	public List<String> uploads(MultipartHttpServletRequest files){
		List<MultipartFile> fileList = files.getFiles("files");
		List<String> fileNames = new ArrayList<String>();
		
		for(MultipartFile file: fileList) {
			fileNames.add(this.upload(file));
		}
		return fileNames;
	}

	public int update(EmailVO emailVO) {
		// TODO Auto-generated method stub
		int ret = eDao.update(emailVO);
		return ret;
	}

	public int delete(long id) {
		// TODO Auto-generated method stub
		int ret = eDao.delete(id);
		return ret;
	}

	public EmailVO findById(long id) {
		// TODO Auto-generated method stub
		EmailVO vo = eDao.findById(id);
		return vo;
	}
	
}










