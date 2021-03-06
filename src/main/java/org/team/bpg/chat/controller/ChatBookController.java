package org.team.bpg.chat.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface ChatBookController {
	public ModelAndView usersearchbook (HttpServletRequest request, HttpServletResponse response);
	public Map<String, Object> searchMember(String mem_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
