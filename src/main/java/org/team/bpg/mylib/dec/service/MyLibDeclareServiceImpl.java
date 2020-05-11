package org.team.bpg.mylib.dec.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team.bpg.com.act.vo.ArticleInfoVO;
import org.team.bpg.mylib.dec.dao.MyLibDeclareDao;
import org.team.bpg.mylib.dec.vo.DeclareInfoVO;
import org.team.bpg.utils.PageVO;

@Service
public class MyLibDeclareServiceImpl implements MyLibDeclareService {

	@Autowired
	private MyLibDeclareDao myLibDeclareDao;
	
	@Override
	public void declareRequest(DeclareInfoVO declareInfoVo) {
		
		Map<String, Object> declareInfo=new HashMap<String, Object>();
		
		try {
			declareInfo.put("declare_image_data", declareInfoVo.getDeclare_image_data().getBytes());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		declareInfo.put("do_user", declareInfoVo.getDo_user());
		declareInfo.put("declare_date", declareInfoVo.getDeclare_date());
		declareInfo.put("declare_category", declareInfoVo.getDeclare_category());
		declareInfo.put("be_done_user", declareInfoVo.getBe_done_user());
		declareInfo.put("declare_reason", declareInfoVo.getDeclare_reason());
		declareInfo.put("declare_status", declareInfoVo.getDeclare_status());
		myLibDeclareDao.declareRequest(declareInfo);
		
	}

	@Override
	public List<Map<String, Object>> myLibDeclareRequestList(HttpServletRequest request) {
		HttpSession session=request.getSession();
		String user_id=(String)session.getAttribute("user_id");
		String user_position=(String)session.getAttribute("user_position");
		
		Map<String, String> user_info=new HashMap<String, String>();
		user_info.put("user_id", user_id);
		user_info.put("user_position", user_position);
		
		List<Map<String, Object>> requestList=myLibDeclareDao.myLibDeclareRequestList(user_info);
		System.out.println("requestList에 들어있는 내용");
		System.out.println(requestList);
		
		return requestList;
	}

	@Override
	public List<Map<String, Object>> declareImage(HttpServletRequest request) {
		String declare_idd=(String)request.getParameter("declare_id");
		
		int declare_id=Integer.parseInt(declare_idd);
		
		List<Map<String, Object>> declareImageList=myLibDeclareDao.declareImage(declare_id);
		return declareImageList;
	}

	@Override
	public void declareAdmin(HttpServletRequest request) {
		String declare_id=(String)request.getParameter("declare_id");
		String admin_sts=(String)request.getParameter("admin_sts");
		String be_done_user=request.getParameter("be_done_user");
		String do_user=request.getParameter("do_user");
		
		System.out.println(be_done_user);
		System.out.println(do_user);
		System.out.println(admin_sts);
		System.out.println(declare_id);
		
		//신고 반영하기
		String user_id="";
		if (admin_sts.equals("do")) { //신고자 처벌
			user_id=do_user;
		} else if (admin_sts.equals("be_done")){ //피신고자 처벌 
			user_id=be_done_user;
		}
		
		myLibDeclareDao.doPenalty(user_id);
		
		Map<String, String> sts_info=new HashMap<String, String>();
		sts_info.put("declare_status", admin_sts);
		sts_info.put("declare_id", declare_id);
		
		myLibDeclareDao.declareAdmin(sts_info);
		
	}

	@Override
	public int countDeclare(HttpServletRequest request) {
		int declareCount=myLibDeclareDao.countDeclare();
		return declareCount;
	}

	@Override
	public List<DeclareInfoVO> declareList(PageVO pageVo, HttpServletRequest request) {
		Map<String, Object> info=new HashMap<String, Object>();
		info.put("start", pageVo.getStart());
		info.put("end", pageVo.getEnd());
		
		System.out.println(pageVo.getStart());
		System.out.println(pageVo.getEnd());
		
		List<DeclareInfoVO> declareList=myLibDeclareDao.declareList(info);
		return declareList;
	}
}
