package org.team.bpg.com.esta.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.team.bpg.com.esta.service.ComEstaService;
import org.team.bpg.com.esta.vo.ComInfoVO;

@Controller
public class ComEstaController {
	
	@Autowired
	private ComEstaService comEstaService;
	
	//개설신청 양식 보여주기
	@RequestMapping(value="com_esta_form", method=RequestMethod.GET)
	public String comEstaForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "com/esta/com_esta_form";
	}
	
	//개설 신청 제출
	@RequestMapping(value="com_esta_request", method=RequestMethod.POST)
	public void comEstaRequest(@ModelAttribute ComInfoVO comInfoVo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		comEstaService.comEstaRequest(comInfoVo);
	}
	
	//개설 신청 내역 (시용자 + 관리자)
	@RequestMapping(value="com_esta_request_list", method=RequestMethod.GET)
	public ModelAndView comEstaRequestList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<Map<String, Object>> requestList=comEstaService.comEstaRequestList(request);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("requestList", requestList);
		mav.addObject("requestListSize", requestList.size());
		
		System.out.println("사이즈:"+requestList.size());
		
		mav.setViewName("com/esta/com_esta_request_list");
		return mav;	
	}
	
	//개설 신청 처리 양식 보여주기
	@RequestMapping(value="com_esta_admin_form", method=RequestMethod.GET)
	public String comEstaAdminForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "com/esta/com_esta_admin_form";
	}
	
	//개설 신청 처리
	@ResponseBody
	@RequestMapping(value="com_esta_request_admin", method=RequestMethod.POST)
	public String comEstaAdmin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//db에 변경 내용 update하기
		comEstaService.comEstaAdmin(request);
		
		return "ok";
	}
}
