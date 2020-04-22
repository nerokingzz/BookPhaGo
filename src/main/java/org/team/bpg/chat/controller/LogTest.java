package org.team.bpg.chat.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.team.bpg.chat.vo.EntityVO;
import org.team.bpg.chat.vo.IntentVO;
import org.team.bpg.chat.vo.RequestLogVO;

import com.ibm.cloud.sdk.core.security.IamAuthenticator;
import com.ibm.watson.assistant.v1.Assistant;
import com.ibm.watson.assistant.v1.model.ListAllLogsOptions;
import com.ibm.watson.assistant.v1.model.Log;
import com.ibm.watson.assistant.v1.model.LogCollection;
import com.ibm.watson.assistant.v1.model.RuntimeEntity;
import com.ibm.watson.assistant.v1.model.RuntimeIntent;

@RestController
public class LogTest {
	

	
	
	@RequestMapping("/ranks.do")
	public List<HashMap> Ranks() {

		List<String> intentList = new ArrayList<String>();
		List<String> entityList = new ArrayList<String>();
		
		IamAuthenticator authenticator = new IamAuthenticator("ANyIMEYJfIaxhSkiW7A4BOUWpzjXvESa-ODxVh4GPd24");
		Assistant assistant = new Assistant("2020-04-14", authenticator);

		// service endpoint
		assistant.setServiceUrl("https://api.kr-seo.assistant.watson.cloud.ibm.com");
		// assistant id
		String workspaceId = "f9343fcd-8c38-425c-ae72-28dcfd5ade16";


		String filter = "language::ko,request.context.system.assistant_id::f9343fcd-8c38-425c-ae72-28dcfd5ade16";

		String cursor = "";
		
		int pageLimit = 2000;
		long start = System.currentTimeMillis();
		while (true) {
			
			ListAllLogsOptions options = new ListAllLogsOptions.Builder(filter).pageLimit(pageLimit).cursor(cursor).build();

			LogCollection response = assistant.listAllLogs(options).execute().getResult();

			// String logResult = response.toString();
			List<Log> logList = response.getLogs();

			for (Log log : logList) {

				if (log.getResponse().getIntents().size() != 0) {
					String intent = log.getResponse().getIntents().get(0).intent();
					intentList.add(intent);
				}
				
				if (log.getResponse().getEntities().size() != 0) {
					String entity = log.getResponse().getEntities().get(0).entity();
					entityList.add(entity);
				}
				
			}
			if (response.getPagination().getNextCursor() == null) {
				break;
			} else {
				cursor = response.getPagination().getNextCursor();
			}
		}
		long end = System.currentTimeMillis();

		System.out.println( "api 실행 소요시간 : " + ( end - start )/1000.0 );


		//ArrayList 안의 중복된 키워드의 개수를 세 주는 부분
		HashMap<String, Integer> intentCount = new HashMap<String, Integer>();
        
		for(int i = 0 ; i < intentList.size() ; i++){ // ArrayList 만큼 반복
		    if (intentCount.containsKey(intentList.get(i))) { // HashMap 내부에 이미 key 값이 존재하는지 확인
		        intentCount.put(intentList.get(i), intentCount.get(intentList.get(i))  + 1);  // key가 이미 있다면 value에 +1
		    } else { // key값이 존재하지 않으면
		        intentCount.put(intentList.get(i) , 1); // key 값을 생성후 value를 1로 초기화
		    }
		}
		
		
		
		
		HashMap<String, Integer> entityCount = new HashMap<String, Integer>();
        
		for(int i = 0 ; i < entityList.size() ; i++){ // ArrayList 만큼 반복
		    if (entityCount.containsKey(entityList.get(i))) { // HashMap 내부에 이미 key 값이 존재하는지 확인
		        entityCount.put(entityList.get(i), entityCount.get(entityList.get(i))  + 1);  // key가 이미 있다면 value에 +1
		    } else { // key값이 존재하지 않으면
		        entityCount.put(entityList.get(i) , 1); // key 값을 생성후 value를 1로 초기화
		    }
		}
		
		System.out.println("intent count......" + intentCount);
		
		System.out.println("entity count......" + entityCount);
		List<HashMap> resultList = new ArrayList();
		//resultList.add(intentCount);
		//resultList.add(entityCount);
		
		HashMap IntentSortedMap = (HashMap) sortByValue(intentCount);
		HashMap EntitySortedMap = (HashMap) sortByValue(entityCount);
		
		resultList.add(IntentSortedMap);
		resultList.add(EntitySortedMap);

		return resultList;
	
	}
	
	
	public static Map<String, Integer> sortByValue(Map<String,Integer> map){
		 List<Map.Entry<String, Integer>> list = new LinkedList<>(map.entrySet());
		
		Collections.sort(list, new Comparator<Map.Entry<String, Integer>>() {
            @Override
            public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2) {
                int comparision = (o1.getValue() - o2.getValue()) * -1;
                return comparision == 0 ? o1.getKey().compareTo(o2.getKey()) : comparision;
            }
        });
        
        // 순서유지를 위해 LinkedHashMap을 사용
        Map<String, Integer> sortedMap = new LinkedHashMap<>(); 
        for(Iterator<Map.Entry<String, Integer>> iter = list.iterator(); iter.hasNext();){
            Map.Entry<String, Integer> entry = iter.next();
            sortedMap.put(entry.getKey(), entry.getValue());
        }
        
        return sortedMap;
		
	}

	/*
	public static <K, V extends Comparable<? super V>> Map<K, V> sortByValue(Map<K, V> map) {
        List<Entry<K, V>> list = new ArrayList<>(map.entrySet());

       //list.sort(Entry.comparingByValue());

        Map<K, V> result = new LinkedHashMap<>();
        for (Entry<K, V> entry : list) {
            result.put(entry.getKey(), entry.getValue());
        }

        return result;
    }*/

		
}
