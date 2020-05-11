package org.team.bpg.mylib.dec.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.team.bpg.mylib.dec.vo.DeclareInfoVO;
import org.team.bpg.utils.PageVO;

public interface MyLibDeclareService {

	public void declareRequest(DeclareInfoVO declareInfoVo);
	public List<Map<String, Object>> myLibDeclareRequestList(HttpServletRequest request);
	public List<Map<String, Object>> declareImage(HttpServletRequest request);
	public void declareAdmin(HttpServletRequest request);
	
	public int countDeclare(HttpServletRequest request);
	public List<DeclareInfoVO> declareList(PageVO pageVo, HttpServletRequest request);
	
}
