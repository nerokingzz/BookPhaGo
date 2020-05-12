package org.team.bpg.chat.service;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.ss.usermodel.Workbook;
import org.team.bpg.chat.vo.RequestLogVO;

public interface LogService {
	public List<RequestLogVO> exportRequestLogs()  throws UnsupportedEncodingException ;
	public File createCSV(List<RequestLogVO> list);
	public String getRequestTime(String timeStamp);
	public int insertLogFile() throws UnsupportedEncodingException;
	byte[] makeXls(List<RequestLogVO> list) throws IOException;
	List<Map<String, Object>> getLogFile(HttpServletRequest request);
}
