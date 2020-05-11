package org.team.bpg.com.esta.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.team.bpg.com.esta.vo.ComInfoVO;

public interface ComEstaService {
	
	public void comEstaRequest(ComInfoVO comInfoVo);
	public List<Map<String, Object>> comEstaRequestList(HttpServletRequest request);
	public void comEstaAdmin(HttpServletRequest request);
	public List<Map<String, Object>> estaList(String user_id);

}

