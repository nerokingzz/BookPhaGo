package org.team.bpg.chat.service;

import java.io.BufferedWriter;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
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
import java.util.Set;
import java.util.TimeZone;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.bind.annotation.RequestMapping;
import org.team.bpg.chat.dao.ChatDAO;
import org.team.bpg.chat.vo.DialVO;
import org.team.bpg.chat.vo.EntityVO;
import org.team.bpg.chat.vo.IntentVO;
import org.team.bpg.chat.vo.RequestLogVO;

import com.ibm.cloud.sdk.core.security.IamAuthenticator;
import com.ibm.watson.assistant.v1.Assistant;
import com.ibm.watson.assistant.v1.model.ListAllLogsOptions;
import com.ibm.watson.assistant.v1.model.Log;
import com.ibm.watson.assistant.v1.model.LogCollection;

@Service("logService")
@Transactional(propagation = Propagation.REQUIRED)
public class LogServiceImpl implements LogService {
	
	@Autowired
	ChatDAO chatDAO;
	
	@Autowired
	private PlatformTransactionManager transactionManager;

	DefaultTransactionDefinition def = null;
	TransactionStatus status = null;
	
	
	   public IamAuthenticator authenticator = new IamAuthenticator("h7PRZ0LHzr0sl-TdVUBSAeV_3ELopOoigC6A39csnqGf");
	   public Assistant assistant = new Assistant("2020-05-01", authenticator);
	   public String filter;
	   public long pageLimit = 2000;
	   public String cursor = "";


	   public LogServiceImpl() {
	      // service endpoint
	      assistant.setServiceUrl("https://api.kr-seo.assistant.watson.cloud.ibm.com");
	      // assistant id
	      String workspaceId = "4b05d813-310b-4086-9bb5-db853f49f12e";
	      filter = "language::ko,request.context.system.assistant_id::4b05d813-310b-4086-9bb5-db853f49f12e";
	      this.cursor = "";

	   }
	
	
	public int insertLogDatas(Map originMap) throws ParseException {
		try {
			
			def = new DefaultTransactionDefinition();
			def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);

			status = transactionManager.getTransaction(def);	
			
			//테스트코드 완수 시 바꾸기
			//Map originMap = this.collectTotalIDs();
			//originMap.put("todayID", this.collectTodayIDs());
			
			
			//chat_logCount
			Map paramMap1 = new HashMap<>();
			paramMap1.put("totalUserCount",originMap.get("totalID"));
			paramMap1.put("todayUserCount",originMap.get("todayID"));
			paramMap1.put("todayDialCount",originMap.get("logCount"));
			paramMap1.put("failDialCount",originMap.get("failCount"));
			int countResult = this.insertLogCount(paramMap1);
			
			
			
			
			//chat_logInt
			Map intentList = (LinkedHashMap)originMap.get("intentList");
			List<Map> paramMap2 = new ArrayList<Map>();
			//5위까지만 담을 수 있도록
			Set<String> set = intentList.keySet();
	        Iterator<String> iter = set.iterator();
	        int iterCount = 1;
	        while (iter.hasNext()) {
	        	if(iterCount > 5) {
	        		break;
	        	}else {
		            String key = ((String)iter.next());
		            String value = String.valueOf(intentList.get(key));
					
					Map tempMap = new HashMap<String,Object>();
					
					tempMap.put("intRank",iterCount);
					tempMap.put("intName",key);
					tempMap.put("intCount",value);
					
					paramMap2.add(tempMap);
		            
		            iterCount++;
	        	}
	        }
	        
	       int intResultTotal = 0;
	       for(int i = 0; i < paramMap2.size(); i++) {
	    	   int intResult = this.insertLogInt(paramMap2.get(i));
	    	   intResultTotal = intResultTotal + intResult;
	       }
	       
	       
	       
	       
			//chat_logEnt
			Map entityList = (LinkedHashMap)originMap.get("entityList");
			List<Map> paramMap3 = new ArrayList<Map>();
			//5위까지만 담을 수 있도록
			Set<String> set1 = entityList.keySet();
	       Iterator<String> iter1 = set1.iterator();
	       int iterCount1 = 1;
	       while (iter1.hasNext()) {
	       	if(iterCount1 > 5) {
	       		break;
	       	}else {
		            String key = ((String)iter1.next());
		            String value =  String.valueOf(entityList.get(key));
					
					Map tempMap = new HashMap<String,Object>();
					
					tempMap.put("entRank",iterCount1);
					tempMap.put("entName",key);
					tempMap.put("entCount",value);
					
					paramMap3.add(tempMap);
		            
					iterCount1++;
	       	}
	       }
	       
	       
	       int entResultTotal = 0;
	       for(int i = 0; i < paramMap3.size(); i++) {
	    	   int entResult = this.insertLogEnt(paramMap3.get(i));
	    	   entResultTotal = entResultTotal + entResult;
	       }
	       
			
		        
	      	//chat_logDial
	      	Map lineChart = (HashMap)originMap.get("linechart");
	      	//"0515","25"
	      	List<Map> paramMap4 = new ArrayList<Map>();
			Set<String> set2 = lineChart.keySet();
			Iterator<String> iter2 = set2.iterator();

			while (iter2.hasNext()) {

				String key = ((String) iter2.next());
				String value =  String.valueOf(lineChart.get(key));
				
				Map tempMap = new HashMap<String,Object>();
				tempMap.put("dialDate",key);
				tempMap.put("dialCount",value);
				
				paramMap4.add(tempMap);
				
			}
			
		  int dialResultTotal = 0;		
		  for(int i = 0; i < paramMap4.size(); i++) {
			  int dialResult = this.insertLogDial(paramMap4.get(i));
			  dialResultTotal = dialResultTotal + dialResult;
		  }
			 
			
			
			System.out.println("log count의 insert 결과 수 : " + countResult);
			System.out.println("log int의 insert 결과 수 : " + intResultTotal);
			System.out.println("log ent의 insert 결과 수 : " + entResultTotal);
			System.out.println("log dial의 insert 결과 수 : " + dialResultTotal);
			
			transactionManager.commit(status);
			return countResult + intResultTotal + entResultTotal + dialResultTotal;
		
		}catch(Exception e){
			e.printStackTrace();
			transactionManager.rollback(status);
			return 0;
		}
		
		
	}
	
	
	//select chat_logCount
		@Override
		public Map selectLogCount() {
			Map result = chatDAO.selectLogCount();
			return result;
		}
		
		
		//select chat_logInt
		@Override
		public List<IntentVO> selectLogInt() {
			List<IntentVO> result = chatDAO.selectLogInt();
			return result;
		}
		
		
		//select chat_logEnt
		@Override
		public List<EntityVO> selectLogEnt() {
			List<EntityVO> result = chatDAO.selectLogEnt();
			return result;
		}
		
		
		//select chat_logDial
		@Override
		public List<DialVO> selectLogDial() {
			List<DialVO> result = chatDAO.selectLogDial();
			return result;
		}
	
	
	
	//chat_logCount
	@Override
	public int insertLogCount(Map logDataMap) {
		int result = chatDAO.insertLogCount(logDataMap);
		return result;
	}
	
	
	//chat_logInt
	@Override
	public int insertLogInt(Map logDataMap) {
		int result = chatDAO.insertLogInt(logDataMap);
		return result;
	}
	
	
	//chat_logEnt
	@Override
	public int insertLogEnt(Map logDataMap) {
		int result = chatDAO.insertLogEnt(logDataMap);
		return result;
	}
	
	
	//chat_logDial
	public int insertLogDial(Map logDataMap) {
		int result = chatDAO.insertLogDial(logDataMap);
		return result;
	}
	


	
	@Override
	public List<Map<String, Object>> getLogFile(HttpServletRequest request) {
		List<Map<String, Object>> logFileList=chatDAO.getLogFile();
		return logFileList;
	}
	



	@Override
	public int insertLogFile() throws UnsupportedEncodingException {
		int result = 0;
		
		List<RequestLogVO> list = exportRequestLogs();
		byte[] logFileByteArray = null;
		try {
			logFileByteArray = makeXls(list);
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("makeXls에서 오류 발생");
			return 0;
		}
		Map paramMap = new HashMap<String, Object>();
		paramMap.put("logFile", logFileByteArray);
		result = chatDAO.insertLogFile(paramMap);
		
		return result;
	}

	
	@Override
	public byte[] makeXls(List<RequestLogVO> list) throws IOException {
		String version = "xls";
		//String version = "xlsx";
		// Workbook 생성.
		Workbook workbook = createWorkbook(version);
		// Workbook안에 시트 생성.
		Sheet sheet = workbook.createSheet("Bookphago Log");
		// Sheet에서 셀 취득2
		Cell cell = getCell(sheet, 0, 0);
		// 셀에 데이터 작성
		cell.setCellValue("유저 ID");
		cell = getCell(sheet, 0, 1);
		cell.setCellValue("채팅 내역");
		cell = getCell(sheet, 0, 2);
		cell.setCellValue("채팅 일시");
		// 셀에 데이터 포멧 지정
		CellStyle style = workbook.createCellStyle();
		// 날짜 포멧
		style.setDataFormat(HSSFDataFormat.getBuiltinFormat("m/d/yy h:mm"));
		// 정렬 포멧
		style.setAlignment(HorizontalAlignment.CENTER);
		style.setVerticalAlignment(VerticalAlignment.TOP);
		// 셀 색지정
		style.setFillBackgroundColor(IndexedColors.GOLD.index);
		// 폰트 설정
		Font font = workbook.createFont();
		font.setColor(IndexedColors.RED.index);
		cell.setCellStyle(style);
		//셀 너비 자동 지정
		sheet.autoSizeColumn(0);
		sheet.autoSizeColumn(1);
		sheet.autoSizeColumn(2);
		
		
		for(int i = 0; i < list.size(); i++) {
			for(int j = 0; j<3; j++) {
				cell = getCell(sheet, i+1, j);
				
				if(j == 0) cell.setCellValue(list.get(i).getUserId());
				if(j == 1) cell.setCellValue(list.get(i).getInputText());
				if(j == 2) cell.setCellValue(list.get(i).getRequestTime());
			}

		}
		
		
		/*
		cell = getCell(sheet, 1, 0);
		cell.setCellValue(1);
		cell = getCell(sheet, 1, 1);
		cell.setCellValue(2);
		cell = getCell(sheet, 1, 2);
		//함수식
		cell.setCellFormula("SUM(A2:B2)");
		*/
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		Date nowdate = new Date();
		String dateString = formatter.format(nowdate);
		
		//writeExcel(workbook, "C:\\Users\\Administrator\\Desktop\\Bookphago_Log_"+dateString+"." + version);
		
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		
		try {
			
		    workbook.write(bos);
		    
		} catch (IOException e) {
			
			// TODO Auto-generated catch block
			
			e.printStackTrace();
			
		} finally {
			
		    bos.close();
		    
		}
		
		byte[] bytes = bos.toByteArray();
		
		return bytes;
		
		}

	// Workbook 생성
	public Workbook createWorkbook(String version) {
		// 표준 xls 버젼
		if ("xls".equals(version)) {
			return new HSSFWorkbook();
			// 확장 xlsx 버젼
		} else if ("xlsx".equals(version)) {
			return new HSSFWorkbook();
		}
		throw new NoClassDefFoundError();
	}

	// Sheet로 부터 Row를 취득, 생성하기
	public Row getRow(Sheet sheet, int rownum) {
		Row row = sheet.getRow(rownum);
		if (row == null) {
			row = sheet.createRow(rownum);
		}
		return row;
	}

	// Row로 부터 Cell를 취득, 생성하기
	public Cell getCell(Row row, int cellnum) {
		Cell cell = row.getCell(cellnum);
		if (cell == null) {
			cell = row.createCell(cellnum);
		}
		return cell;
	}

	public Cell getCell(Sheet sheet, int rownum, int cellnum) {
		Row row = getRow(sheet, rownum);
		return getCell(row, cellnum);
	}

	public void writeExcel(Workbook workbook, String filepath) {
		try (FileOutputStream stream = new FileOutputStream(filepath)) {
			workbook.write(stream);
		} catch (Throwable e) {
			e.printStackTrace();
		}
	}

	// 기간에 관계 없이 전체 기간에 걸쳐 누적된 User ID 개수를 구한다.
	public Map collectTotalIDs() throws ParseException {

		System.out.println("I am in totalID.do");
		List<String> originList = new ArrayList<String>();

		////////////////////////// rank를 위한 list/////////////////////////
		List<String> intentList = new ArrayList<String>();
		List<String> entityList = new ArrayList<String>();
		////////////////////////// rank를 위한 list/////////////////////////

		///////////////////////// line chart를 위한 list////////////////////
		List<String> dateList = new ArrayList();
		///////////////////////// line chart를 위한 list////////////////////

		long start = System.currentTimeMillis();

		int logCount = 0; // 누적 로그 수
		int failCount = 0; // 누적 실패 대화 수

		while (true) {

			ListAllLogsOptions options = new ListAllLogsOptions.Builder(filter).pageLimit(pageLimit).cursor(cursor)
					.build();

			LogCollection response = assistant.listAllLogs(options).execute().getResult();

			// String logResult = response.toString();
			List<Log> logList = response.getLogs();

			for (Log log : logList) {

				if (log.getResponse().getEntities().size() == 0 && log.getResponse().getIntents().size() == 0
						&& log.getRequest().input().getText().isEmpty() == false) {
					failCount++;
				}

				String userID = "";
				userID = log.getRequest().context().getMetadata().userId();
				originList.add(userID);
				logCount++;

				////////////////////////// rank를 위한 if/////////////////////////
				if (log.getResponse().getIntents().size() != 0) {
					String intent = log.getResponse().getIntents().get(0).intent();
					intentList.add(intent);
				}

				if (log.getResponse().getEntities().size() != 0) {
					String entity = log.getResponse().getEntities().get(0).entity();
					entityList.add(entity);
				}

				////////////////////////// rank를 위한 if/////////////////////////

				//////////////////// line chart 시작///////////////////////////////

				String timeStamp = log.getRequestTimestamp();

				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
				SimpleDateFormat output = new SimpleDateFormat("MM-dd");
				sdf.setTimeZone(TimeZone.getTimeZone("KST"));
				Date d;
				d = sdf.parse(timeStamp);
				// 변환된 timestamp 결과물
				String formattedTime = output.format(d);

				dateList.add(formattedTime);

				////////////////// line chart 끝///////////////////////////////

			}
			if (response.getPagination().getNextCursor() == null) {
				break;
			} else {
				cursor = response.getPagination().getNextCursor();
			}
		}
		int result = getDistinct(originList);

		//////////////////////////////////// rank를 위한 sort///////////////////////////

		long end = System.currentTimeMillis();

		System.out.println("api 실행 소요시간 : " + (end - start) / 1000.0);

		// ArrayList 안의 중복된 키워드의 개수를 세 주는 부분
		HashMap<String, Integer> intentCount = new HashMap<String, Integer>();

		for (int i = 0; i < intentList.size(); i++) { // ArrayList 만큼 반복
			if (intentCount.containsKey(intentList.get(i))) { // HashMap 내부에 이미 key 값이 존재하는지 확인
				intentCount.put(intentList.get(i), intentCount.get(intentList.get(i)) + 1); // key가 이미 있다면 value에 +1
			} else { // key값이 존재하지 않으면
				intentCount.put(intentList.get(i), 1); // key 값을 생성후 value를 1로 초기화
			}
		}

		HashMap<String, Integer> entityCount = new HashMap<String, Integer>();

		for (int i = 0; i < entityList.size(); i++) { // ArrayList 만큼 반복
			if (entityCount.containsKey(entityList.get(i))) { // HashMap 내부에 이미 key 값이 존재하는지 확인
				entityCount.put(entityList.get(i), entityCount.get(entityList.get(i)) + 1); // key가 이미 있다면 value에 +1
			} else { // key값이 존재하지 않으면
				entityCount.put(entityList.get(i), 1); // key 값을 생성후 value를 1로 초기화
			}
		}

		Map<String, HashMap> resultList = new HashMap<String, HashMap>();
		// resultList.add(intentCount);
		// resultList.add(entityCount);

		LinkedHashMap IntentSortedMap = (LinkedHashMap) sortByValue(intentCount);
		LinkedHashMap EntitySortedMap = (LinkedHashMap) sortByValue(entityCount);

		resultList.put("intentList", IntentSortedMap);
		resultList.put("entityList", EntitySortedMap);

		////////////////////////////////// rank를 위한 sort///////////////////////////

		///////////////////////////////// line chart를 위한 sort 시작////////////////////
		HashMap<String, Integer> dateCount = new HashMap<String, Integer>();

		for (int i = 0; i < dateList.size(); i++) { // ArrayList 만큼 반복
			if (dateCount.containsKey(dateList.get(i))) { // HashMap 내부에 이미 key 값이 존재하는지 확인
				dateCount.put(dateList.get(i), dateCount.get(dateList.get(i)) + 1); // key가 이미 있다면 value에 +1
			} else { // key값이 존재하지 않으면
				dateCount.put(dateList.get(i), 1); // key 값을 생성후 value를 1로 초기화
			}
		}

		// <날짜, 로그 수> 형식으로 담긴 hashMap을 key 기준 오름차순으로 정렬하기 위해 treemap사용
		/*
		 * TreeMap<String, Integer> tm = new TreeMap<String, Integer>(dateCount);
		 * LinkedHashMap<String, Integer> lm = new (LinkedHashMap)tm;
		 */
		///////////////////////////////// line chart를 위한 sort 끝////////////////////

		Map resultMap = new HashMap<>();

		resultMap.put("totalID", result);
		resultMap.put("logCount", logCount);
		resultMap.put("failCount", failCount);
		resultMap.put("intentList", IntentSortedMap);
		resultMap.put("entityList", EntitySortedMap);
		// resultMap.put("ranks", resultList);
		resultMap.put("linechart", dateCount);

		return resultMap;
	}

	@RequestMapping("todayID.do")
	// 오늘의 userID 개수 수집해 중복을 제거합니다.
	public int collectTodayIDs() {

		List<String> originList = new ArrayList<String>();
		String filter = this.filter;

		// startDate와 endDate를 yyyy-MM-dd 형식으로 바꿔주는 구문
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String dateStr = format1.format(date);

		String todayFilter = this.filter + ",response_timestamp>=" + dateStr + ",response_timestamp<=" + dateStr;

		while (true) {

			ListAllLogsOptions options = new ListAllLogsOptions.Builder(todayFilter).pageLimit(pageLimit).cursor(cursor)
					.build();

			LogCollection response = assistant.listAllLogs(options).execute().getResult();

			// String logResult = response.toString();
			List<Log> logList = response.getLogs();

			for (Log log : logList) {
				String userID = "";
				userID = log.getRequest().context().getMetadata().userId();
				originList.add(userID);
			}
			if (response.getPagination().getNextCursor() == null) {
				break;
			} else {
				cursor = response.getPagination().getNextCursor();
			}
		}

		int todayResult = getDistinct(originList);

		return todayResult;

	}

	// 내부의 중복된 값을 제거하고 남은 고유 개수를 리턴한다. List<String>을 파라미터로 받는다.
	public int getDistinct(List<String> originList) {
		List<String> resultList = new ArrayList<String>();

		for (int i = 0; i < originList.size(); i++) {

			if (!resultList.contains(originList.get(i))) {
				resultList.add(originList.get(i));
			}
		}
		return resultList.size();
	}

	// Value를 기준으로 맵을 내림차순 정렬해준다. Map<String, Integer>를 파라미터로 받는다.
	public static Map<String, Integer> sortByValue(Map<String, Integer> map) {
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
		for (Iterator<Map.Entry<String, Integer>> iter = list.iterator(); iter.hasNext();) {
			Map.Entry<String, Integer> entry = iter.next();
			sortedMap.put(entry.getKey(), entry.getValue());
		}
		return sortedMap;

	}
	
	
	//////////////////////////////////////////////////////////////////////
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

	
	//timestamp를 yyyy-MM-dd HH:mm 형식으로 변환하는 메소드
	public String getRequestTime(String timeStamp) {

		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
			SimpleDateFormat output = new SimpleDateFormat("yyyy-MM-dd HH:mm");
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
