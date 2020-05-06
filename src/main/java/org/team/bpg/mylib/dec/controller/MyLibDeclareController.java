package org.team.bpg.mylib.dec.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.team.bpg.mylib.dec.service.MyLibDeclareService;
import org.team.bpg.mylib.dec.vo.DeclareInfoVO;


@Controller
public class MyLibDeclareController {

	@Autowired
	private MyLibDeclareService myLibDeclareService;
	
	//신고 양식 보여주기
	@RequestMapping(value="mylib_declare_form", method=RequestMethod.GET)
	public String declareForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "mylib/declare/mylib_declare_form";
	}
	
	//신고 insert
	@RequestMapping(value="mylib_declare_request", method=RequestMethod.POST)
	public void declareRequest(@ModelAttribute DeclareInfoVO declareInfoVo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		myLibDeclareService.declareRequest(declareInfoVo);
	
	}
	
	//신고내역 select (사용자 + 운영자) -> ibsheet
	@ResponseBody
	@RequestMapping(value="mylib_declare_request_list", method=RequestMethod.POST)
	public Map<String, Object> declarelistShow(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<Map<String, Object>> decRequestList=myLibDeclareService.myLibDeclareRequestList(request);
		
//		ModelAndView mav=new ModelAndView();
//		
//		mav.addObject("requestList", requestList);
//		mav.addObject("requestListSize", requestList.size());
//		
//		System.out.println("사이즈:"+requestList.size());
		
		//mav.setViewName("mylib/declare/mylib_declare_request_list");
		
		Map<String, Object> ibsheetMap=new HashMap<String, Object>();
		ibsheetMap.put("data", decRequestList);
		return ibsheetMap;	
	}
	
	//신고 첨부파일 보기 새 윈도우창
	@RequestMapping(value="dec_image", method=RequestMethod.GET)
	public ModelAndView decImageShow (HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("declare_id", request.getParameter("declare_id"));
		mav.setViewName("mylib/declare/image_show");
		return mav;
	}
	
	//신고 내역 사진가져오기
	@RequestMapping(value="declareImage", method=RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<byte[]> declareImage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("넘어온 신고아이디:" + request.getParameter("declare_id"));
		
		List<Map<String, Object>> declareImageList=myLibDeclareService.declareImage(request);
		
		System.out.println("d:"+declareImageList);
		
		byte[] imageContent=(byte[])declareImageList.get(0).get("declare_image_data");
		System.out.println(imageContent);
		
		final HttpHeaders headers=new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_PNG);
		
		return new ResponseEntity<byte[]>(imageContent, headers, HttpStatus.OK);	
		
	}
	
	//신고 처리 양식 보여주기
	@RequestMapping(value="mylib_declare_admin_form", method=RequestMethod.GET)
	public String declareAdminForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "mylib/declare/mylib_declare_admin_form";
	}
	
	//신고 처리
	@ResponseBody
	@RequestMapping(value="mylib_declare_request_admin", method=RequestMethod.POST)
	public String declareAdmin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//db에 변경 내용 update하기
		myLibDeclareService.declareAdmin(request);
		
		return "ok";
	}
}
