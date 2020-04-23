package org.team.bpg.chat.service;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.team.bpg.chat.vo.RequestLogVO;

import com.ibm.cloud.sdk.core.security.IamAuthenticator;
import com.ibm.watson.assistant.v1.Assistant;
import com.ibm.watson.assistant.v1.model.ListAllLogsOptions;
import com.ibm.watson.assistant.v1.model.Log;
import com.ibm.watson.assistant.v1.model.LogCollection;

@Service("logService")
@Transactional(propagation = Propagation.REQUIRED)
public class LogServiceImpl implements LogService {
	
	private IamAuthenticator authenticator = new IamAuthenticator("h7PRZ0LHzr0sl-TdVUBSAeV_3ELopOoigC6A39csnqGf");
	private Assistant assistant = new Assistant("2020-04-23", authenticator);

	public LogServiceImpl() {
		// service endpoint
		assistant.setServiceUrl("https://api.kr-seo.assistant.watson.cloud.ibm.com");
		// assistant id
		String workspaceId = "4b05d813-310b-4086-9bb5-db853f49f12e";
	}
	

	@Override
	public List<RequestLogVO> exportRequestLogs() throws UnsupportedEncodingException {
		Assistant assistant = this.assistant;
		String cursor = "";

		String filter = "language::ko,request.context.system.assistant_id::4b05d813-310b-4086-9bb5-db853f49f12e";
		
		List<RequestLogVO> logObjectList = new ArrayList<RequestLogVO>();

		while (true) {

			ListAllLogsOptions options = new ListAllLogsOptions.Builder(filter).pageLimit(500).cursor(cursor).build();

			LogCollection response = assistant.listAllLogs(options).execute().getResult();

			// String logResult = response.toString();
			List<Log> logList = response.getLogs();

			for (Log log : logList) {

				RequestLogVO vo = new RequestLogVO();
				String userID = "";
				String requestText = "";
				String requestTime = log.getRequestTimestamp().toString();
				requestTime = getRequestTime(requestTime);
				userID = log.getRequest().context().getMetadata().userId();

				if (userID != null) {
					if (userID.contains("anonymous_IBMuid"))
						userID = "비회원";
					userID = URLDecoder.decode(userID, "UTF-8");
				}

				requestText = log.getRequest().input().getText();
				vo.setUserId(userID);
				vo.setInputText(requestText);
				vo.setRequestTime(requestTime);
				logObjectList.add(vo);
			}

			if (response.getPagination().getNextCursor() == null) {
				break;
			} else {
				cursor = response.getPagination().getNextCursor();
			}
		}		
		return logObjectList;
	}
	
	
	public File createCSV(List<RequestLogVO> list) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		Date nowdate = new Date();
		String dateString = formatter.format(nowdate);
		String filePath = "C:\\Users\\Administrator\\Desktop\\Bookphago_Log_"+dateString+".csv";
		
       String enc = new java.io.OutputStreamWriter(System.out).getEncoding(); 
       System.out.println( "현재 인코딩 : "  + enc);
        
       try {
            
           String strArray = "";
           strArray += "유저ID";
           strArray += ",";
           strArray += "채팅 내역";
           strArray += ",";
           strArray += "일시";
           strArray += "\r\n";
          for(int i = 0; i < list.size(); i++) {
       	   strArray += list.get(i).getUserId();
       	   strArray += ",";
       	   strArray += list.get(i).getInputText();
       	   strArray += ",";
       	   strArray += list.get(i).getRequestTime();
       	   strArray += "\r\n";
          }
           
           BufferedWriter writer = new BufferedWriter(
                   new OutputStreamWriter(new FileOutputStream(filePath), "MS949")
                   );
           
           writer.write(strArray);
           writer.close();
           
           return new File(filePath);
       } catch (IOException e) {
            
           e.printStackTrace();
           return null;
       }
	}

	
	public String getRequestTime(String timeStamp) {

		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
			SimpleDateFormat output = new SimpleDateFormat("MM-dd HH:mm");
			sdf.setTimeZone(TimeZone.getTimeZone("KST"));
			Date d;
			d = sdf.parse(timeStamp);
			String formattedTime = output.format(d);
			return formattedTime;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		
	}
	

}
