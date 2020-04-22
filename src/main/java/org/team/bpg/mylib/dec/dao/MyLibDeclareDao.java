package org.team.bpg.mylib.dec.dao;

import java.util.List;
import java.util.Map;

import org.team.bpg.com.act.vo.ArticleInfoVO;
import org.team.bpg.mylib.dec.vo.DeclareInfoVO;

public interface MyLibDeclareDao {

	public void declareRequest(Map<String, Object> declareInfo);
	List<Map<String, Object>> myLibDeclareRequestList(Map<String, String> user_info);
	public List<Map<String, Object>> declareImage(int declare_id);
	public void declareAdmin(Map<String, String> sts_info);
	
	public int countDeclare();
	public List<DeclareInfoVO> declareList(Map<String, Object> info);
	
}
