package org.team.bpg.chat.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface ChatBookController {
	public ModelAndView usersearchbook (HttpServletRequest request, HttpServletResponse response);
}
