package org.team.bpg.chat.service;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.List;

import org.team.bpg.chat.vo.RequestLogVO;

public interface LogService {
	public List<RequestLogVO> exportRequestLogs()  throws UnsupportedEncodingException ;
	public File createCSV(List<RequestLogVO> list);
	public String getRequestTime(String timeStamp);
}
