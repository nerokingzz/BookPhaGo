package org.team.bpg.com.esta.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.team.bpg.com.esta.vo.ComInfoVO;

@Repository
public class ComEstaDaoImpl implements ComEstaDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void comEstaRequest(ComInfoVO comInfoVo) {
		sqlSession.insert("com_esta.com_esta_insert", comInfoVo);
		
	}

	@Override
	public List<Map<String, Object>> comEstaRequestList(Map<String, String> user_info) {
		
		System.out.println("user_id는" + user_info.get("user_id"));
		System.out.println("user_position는" + user_info.get("user_position"));
		
		List<Map<String, Object>> requestList=sqlSession.selectList("com_esta.com_esta_request_list", user_info);
		return requestList;
	}

	@Override
	public void comEstaAdmin(Map<String, String> sts_info) {
		sqlSession.update("com_esta.com_esta_admin", sts_info);
		
	}
	@Override
	
	public void capAddMem(Map<String, String> sts_info) {
		sqlSession.insert("com_esta.cap_add_mem", sts_info);
		sqlSession.update("com_esta.add_mem_db", sts_info);
		
	}

	@Override
	public List<Map<String, Object>> estaList(String user_id) {
		List<Map<String, Object>> estaList=sqlSession.selectList("com_esta.esta_list", user_id);
		return estaList;
	}

}
