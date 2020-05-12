package org.team.bpg.chat.controller;

import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

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
import org.apache.poi.util.IOUtils;
import org.team.bpg.chat.vo.RequestLogVO;

public class Program {
	
	public byte[] MakeXls(List<RequestLogVO> list) throws IOException {
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

}
