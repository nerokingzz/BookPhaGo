package org.team.bpg.chat.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




public interface ChatController {
	public Map<String, Object> searchMember(String mem_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
