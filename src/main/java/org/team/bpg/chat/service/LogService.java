package org.team.bpg.chat.service;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.ss.usermodel.Workbook;
import org.team.bpg.chat.vo.DialVO;
import org.team.bpg.chat.vo.EntityVO;
import org.team.bpg.chat.vo.IntentVO;
import org.team.bpg.chat.vo.RequestLogVO;

public interface LogService {
	public List<RequestLogVO> exportRequestLogs()  throws UnsupportedEncodingException ;
	public File createCSV(List<RequestLogVO> list);
	public String getRequestTime(String timeStamp);
	public int insertLogFile() throws UnsupportedEncodingException;
	byte[] makeXls(List<RequestLogVO> list) throws IOException;
	List<Map<String, Object>> getLogFile(HttpServletRequest request);
	
	public Map collectTotalIDs() throws ParseException;
	public int collectTodayIDs();
	
	public int insertLogDatas(Map originMap) throws ParseException ;
	public int insertLogCount(Map logDataMap);
	public int insertLogInt(Map logDataMap);
	public int insertLogEnt(Map logDataMap);
	public int insertLogDial(Map map);
	Map selectLogCount();
	List<IntentVO> selectLogInt();
	List<EntityVO> selectLogEnt();
	List<DialVO> selectLogDial();

}
