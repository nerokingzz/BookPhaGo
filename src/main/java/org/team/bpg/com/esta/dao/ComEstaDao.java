package org.team.bpg.com.esta.dao;

import java.util.List;
import java.util.Map;

import org.team.bpg.com.esta.vo.ComInfoVO;

public interface ComEstaDao {
	
	public void comEstaRequest(ComInfoVO comInfoVo);
	public List<Map<String, Object>> comEstaRequestList(Map<String, String> user_info);
	public void comEstaAdmin(Map<String, String> sts_info);


}
