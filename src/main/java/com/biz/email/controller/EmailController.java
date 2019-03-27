package com.biz.email.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.biz.email.model.EmailVO;
import com.biz.email.service.EmailService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EmailController {

	@Autowired
	EmailService eService;
	
	@RequestMapping(value="email_list", method=RequestMethod.GET)
	public String email_list(Model model) {
		List<EmailVO> eList = eService.selectAll();
		model.addAttribute("LISTS", eList);
		return "email_list";
	}
	
	@RequestMapping(value="write", method=RequestMethod.GET)
	public String write_email(Model model) {
		EmailVO emailVO = new EmailVO();
		model.addAttribute("EMAIL", emailVO);
		return "email_write";
	}
	
	@RequestMapping(value="insert", method=RequestMethod.POST, produces="text/html;charset=utf8")
	public String insert_email(@ModelAttribute EmailVO emailVO, Model model, MultipartHttpServletRequest req) {
		
		log.debug(emailVO.toString());
		eService.insert(emailVO, req);
		
		return "redirect:/";
	}
	
}















