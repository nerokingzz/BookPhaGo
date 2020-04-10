package org.team.bpg.mylib.dec.dao;

import java.util.List;
import java.util.Map;

public interface MyLibDeclareDao {

	public void declareRequest(Map<String, Object> declareInfo);
	List<Map<String, Object>> myLibDeclareRequestList(Map<String, String> user_info);
	public List<Map<String, Object>> declareImage(int declare_id);
	public void declareAdmin(Map<String, String> sts_info);
	
}
