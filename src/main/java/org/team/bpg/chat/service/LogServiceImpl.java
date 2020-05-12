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
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

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
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.team.bpg.chat.dao.ChatDAO;
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
	
	private IamAuthenticator authenticator = new IamAuthenticator("h7PRZ0LHzr0sl-TdVUBSAeV_3ELopOoigC6A39csnqGf");
	private Assistant assistant = new Assistant("2020-04-23", authenticator);

	public LogServiceImpl() {
		// service endpoint
		assistant.setServiceUrl("https://api.kr-seo.assistant.watson.cloud.ibm.com");
		// assistant id
		String workspaceId = "4b05d813-310b-4086-9bb5-db853f49f12e";
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
