package org.team.bpg.chat.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.AbstractView;
import org.team.bpg.chat.service.LogService;
import org.team.bpg.chat.vo.RequestLogVO;

@Component(value = "fileDownloadView")
public class FileDownloadView extends AbstractView {
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		/////////////////////////////////////////////////////////////
		//List<RequestLogVO> vo = service.exportRequestLogs();
		//File file = service.createCSV(vo);
		/////////////////////////////////////////////////////////////
		
		

		File file = (File) model.get("fileDownload");
		response.setContentType("application/download; utf-8");
		response.setContentLength((int) file.length());
		String userAgent = request.getHeader("User-Agent");
		String rename = (String) request.getAttribute("fileName");
		String fileName = rename == null ? file.getName() : rename;
		if (userAgent.indexOf("MSIE") > -1 || userAgent.indexOf("Trident") > -1) { // IE
			fileName = URLEncoder.encode(fileName, "utf-8");
			response.setHeader("Content-Disposition",
					"attachment; filename=" + fileName.replaceAll("\\+", "\\ ") + ";");
		} else {
			try { // 다른 브라우저
				byte[] fileNameBytes = fileName.getBytes("UTF-8");
				String dispositionFileName = "";
				for (byte b : fileNameBytes)
					dispositionFileName += (char) (b & 0xff);
				String disposition = "attachment; filename=\"" + dispositionFileName + "\"";
				response.setHeader("Content-disposition", disposition);
			} catch (UnsupportedEncodingException ence) {
				System.out.println("다른 브라우저 try-catch ence");
				ence.printStackTrace();
			}

		}

		response.setHeader("Content-Transfer-Encoding", "binary");
		OutputStream out = response.getOutputStream();
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(file);
			FileCopyUtils.copy(fis, out);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (fis != null) {
				try {
					fis.close();
				} catch (Exception e) {
				}
			}
		}
		out.flush();

	}

}