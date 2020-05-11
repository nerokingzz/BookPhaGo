package org.team.bpg.chat.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.TimeZone;
import java.util.TreeMap;

import com.ibm.cloud.sdk.core.security.IamAuthenticator;
import com.ibm.watson.assistant.v1.Assistant;
import com.ibm.watson.assistant.v1.model.ListAllLogsOptions;
import com.ibm.watson.assistant.v1.model.Log;
import com.ibm.watson.assistant.v1.model.LogCollection;

public class LogTest {

	public static void main(String[] args) throws ParseException {

		IamAuthenticator authenticator = new IamAuthenticator("h7PRZ0LHzr0sl-TdVUBSAeV_3ELopOoigC6A39csnqGf");
		Assistant assistant = new Assistant("2020-04-23", authenticator);

		// service endpoint
		assistant.setServiceUrl("https://api.kr-seo.assistant.watson.cloud.ibm.com");
		// assistant id
		String workspaceId = "4b05d813-310b-4086-9bb5-db853f49f12e";

		String filter = "language::ko,request.context.system.assistant_id::4b05d813-310b-4086-9bb5-db853f49f12e";

		String cursor = "";

		int pageLimit = 500;

		// 날짜를 key로, 해당 날짜의 log 수를 value로 가지는 hashmap의 list를


		ListAllLogsOptions options = new ListAllLogsOptions.Builder(filter).pageLimit(pageLimit).cursor(cursor).build();

		LogCollection response = assistant.listAllLogs(options).execute().getResult();

		// String logResult = response.toString();
		List<Log> logList = response.getLogs();

		
		List<String> dateList = new ArrayList();
		
		for (Log log : logList) {
			String timeStamp = log.getRequestTimestamp();

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
			SimpleDateFormat output = new SimpleDateFormat("MM-dd");
			sdf.setTimeZone(TimeZone.getTimeZone("KST"));
			Date d;
			d = sdf.parse(timeStamp);
			// 변환된 timestamp 결과물
			String formattedTime = output.format(d);
			
			dateList.add(formattedTime);
		}
		
		
		HashMap<String, Integer> dateCount = new HashMap<String, Integer>();
        
	      for(int i = 0 ; i < dateList.size() ; i++){ // ArrayList 만큼 반복
	          if (dateCount.containsKey(dateList.get(i))) { // HashMap 내부에 이미 key 값이 존재하는지 확인
	        	  dateCount.put(dateList.get(i), dateCount.get(dateList.get(i))  + 1);  // key가 이미 있다면 value에 +1
	          } else { // key값이 존재하지 않으면
	        	  dateCount.put(dateList.get(i) , 1); // key 값을 생성후 value를 1로 초기화
	          }
	      }
	      
	     //<날짜, 로그 수> 형식으로 담긴 hashMap을 오름차순으로 정렬하기 위해 treemap사용
	      TreeMap<String,Integer> tm = new TreeMap<String,Integer>(dateCount);

	      
	}
	


	public static int getDistinctLogic(List<String> originList) {
		List<String> resultList = new ArrayList<String>();

		for (int i = 0; i < originList.size(); i++) {

			if (!resultList.contains(originList.get(i))) {
				resultList.add(originList.get(i));
			}
		}

		return resultList.size();
	}

}
