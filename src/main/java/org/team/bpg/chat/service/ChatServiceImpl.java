package org.team.bpg.chat.service;

import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.team.bpg.chat.dao.ChatDAO;
import org.team.bpg.member.vo.MemberVO;
import org.team.bpg.chat.vo.RequestLogVO;




@Service("ChatService")
@Transactional(propagation = Propagation.REQUIRED)
public class ChatServiceImpl implements ChatService {
	@Autowired
	private ChatDAO chatDAO;
	
	@Override
	public MemberVO searchMember(String id) {
		MemberVO vo = chatDAO.searchMember(id);
		return vo;
	}

	@Override
	public String borrowBook(String bookNumber) {
		return null;
	}

	@Override
	public void createCSV(List<RequestLogVO> list) {
		String filePath = "C:\\Users\\Administrator\\Desktop\\request_csv_list.csv";
		 // 현재 인코딩을 확인한다.
       String enc = new java.io.OutputStreamWriter(System.out).getEncoding(); 
       System.out.println( "현재 인코딩 : "  + enc);
        
       try {
            
           String strArray = "";
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
       } catch (IOException e) {
            
           e.printStackTrace();
       }
	}

}
