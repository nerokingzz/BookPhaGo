package org.team.bpg.com.esta.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.team.bpg.com.act.vo.ComMemberVO;
import org.team.bpg.com.esta.dao.ComEstaDao;
import org.team.bpg.com.esta.vo.ComInfoVO;

@Service
public class ComEstaServiceImpl implements ComEstaService {

	@Autowired
	private ComEstaDao comEstaDao;

	@Override
	public void comEstaRequest(ComInfoVO comInfoVo) {
		comEstaDao.comEstaRequest(comInfoVo);
	}

	@Override
	public List<Map<String, Object>> comEstaRequestList(HttpServletRequest request) {
		HttpSession session=request.getSession();
		String user_id=(String)session.getAttribute("user_id");
		String user_position=(String)session.getAttribute("user_position");
		
		Map<String, String> user_info=new HashMap<String, String>();
		user_info.put("user_id", user_id);
		user_info.put("user_position", user_position);
		
		List<Map<String, Object>> requestList=comEstaDao.comEstaRequestList(user_info);
		System.out.println("requestList에 들어있는 내용");
		System.out.println(requestList);
		
		return requestList;
	}

	@Override
	public void comEstaAdmin(HttpServletRequest request) {
		String community_id=(String)request.getParameter("community_id");
		String admin_sts=(String)request.getParameter("admin_sts");
		String community_captain=request.getParameter("community_captain");
		String member_join_date=request.getParameter("community_establish_date");
		
		if (admin_sts.equals("dgree")) {
			admin_sts="거절";
			Map<String, String> sts_info=new HashMap<String, String>();
			sts_info.put("community_establish_status", admin_sts);
			sts_info.put("community_id", community_id);
			comEstaDao.comEstaAdmin(sts_info);
			
		} else if (admin_sts.equals("agree")) {
			admin_sts="수락";
			Map<String, String> sts_info=new HashMap<String, String>();
			sts_info.put("community_establish_status", admin_sts);
			sts_info.put("community_id", community_id);
			sts_info.put("community_captain", community_captain);
			sts_info.put("member_join_date", member_join_date);
			
			comEstaDao.comEstaAdmin(sts_info);
			comEstaDao.capAddMem(sts_info);
			
		}
		
		System.out.println(admin_sts);
		System.out.println(community_id);
		

	}

	@Override
	public List<Map<String, Object>> estaList(String user_id) {
		List<Map<String, Object>> estaList=comEstaDao.estaList(user_id);
		return estaList;
	}

}
