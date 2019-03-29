package com.biz.email.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.biz.email.model.EmailVO;
import com.biz.email.service.EmailService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EmailController {

	@Autowired
	EmailService eService;

	@RequestMapping(value = "email_list", method = RequestMethod.GET)
	public String email_list(Model model) {
		List<EmailVO> eList = eService.selectAll();
		model.addAttribute("EMAIL", eList);
		model.addAttribute("BODY", "LIST");
		return "home";
	}
	
	@RequestMapping(value="detail", method=RequestMethod.GET)
	public String email_detail(@ModelAttribute EmailVO emailVO, Model model) {
		long id = emailVO.getId();
		eService.findById(id);
		log.debug("ID:" + id);
		model.addAttribute("EmailVO", eService.findById(id));
		model.addAttribute("BODY", "DETAIL");
		return "home";
	}

	// 작성 폼을 여는 메서드
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String write_email(Model model) {
		
		model.addAttribute("BODY", "WRITE");
		return "home";
	}

	// 폼 작성 후 인서트 실행하는 메서드
	@RequestMapping(value = "write", method = RequestMethod.POST, produces = "text/html;charset=utf8")
	public String insert_file(@ModelAttribute EmailVO emailVO, BindingResult result, @RequestParam("file1") MultipartFile file1,
								@RequestParam("file2") MultipartFile file2, Model model) {
		
		log.debug(emailVO.toString());
		
		if (!file1.isEmpty()) {
			String saveFile1 = eService.upload(file1);
			emailVO.setS_file1(saveFile1);
		}
		
		if (!file2.isEmpty()) {
			String saveFile2 = eService.upload(file2);
			emailVO.setS_file2(saveFile2);
		}

		LocalDateTime ld = LocalDateTime.now();
		DateTimeFormatter fd = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		DateTimeFormatter ft = DateTimeFormatter.ofPattern("HH:mm:ss");

		String today = ld.format(fd);
		String time = ld.format(ft);

		emailVO.setS_date(today);
		emailVO.setS_time(time);

		eService.insert(emailVO);
		
		model.addAttribute("EmailVO", emailVO);
		model.addAttribute("BODY", "LIST");
		return "redirect:/email_list";
	}

	@ResponseBody
	@RequestMapping(value="/files", method=RequestMethod.POST)
	public List<String> files(MultipartHttpServletRequest files) {
		List<String> fileNames = eService.uploads(files);
		for(String file : fileNames) {
			log.debug("파일들 : " + file);
		}
		return fileNames;
	}
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String email_update(@RequestParam long id, Model model) {
		model.addAttribute("BODY", "WRITE");
		model.addAttribute("EmailVO", eService.findById(id));
		return "home";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String email_update(@ModelAttribute EmailVO emailVO, Model model) {
		eService.update(emailVO);
		return "home";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String email_delete(@RequestParam long id, Model model) {
		eService.delete(id);
		return "home";
	}
	
}
