package org.team.bpg.mylib.dec.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.team.bpg.com.act.vo.ArticleInfoVO;
import org.team.bpg.mylib.dec.vo.DeclareInfoVO;

@Repository
public class MyLibDeclareDaoImpl implements MyLibDeclareDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void declareRequest(Map<String, Object> declareInfo) {
		sqlSession.insert("mylib_declare.mylib_declare_insert", declareInfo);
		
	}

	@Override
	public List<Map<String, Object>> myLibDeclareRequestList(Map<String, String> user_info) {
		System.out.println("user_id는" + user_info.get("user_id"));
		System.out.println("user_position는" + user_info.get("user_position"));
		
		List<Map<String, Object>> requestList=sqlSession.selectList("mylib_declare.mylib_declare_request_list", user_info);
		
		return requestList;
	}

	@Override
	public List<Map<String, Object>> declareImage(int declare_id) {
		System.out.println("dkdlel;" + declare_id);
		
		List<Map<String, Object>> declareImageList=sqlSession.selectList("mylib_declare.declare_image", declare_id);
		return declareImageList;
	}

	@Override
	public void declareAdmin(Map<String, String> sts_info) {
		sqlSession.update("mylib_declare.declare_admin", sts_info);
		
	}

	@Override
	public int countDeclare() {
		int declareCount=sqlSession.selectOne("mylib_declare.declare_count");
		return declareCount;
	}

	@Override
	public List<DeclareInfoVO> declareList(Map<String, Object> info) {
		List<DeclareInfoVO> declareList=sqlSession.selectList("mylib_declare.declare_list", info);
		System.out.println("신고목록"+declareList);
		return declareList;
	}

	@Override
	public void doPenalty(String user_id) {
		sqlSession.update("mylib_declare.user_penalty", user_id);
		
	}
}
