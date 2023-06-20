package com.teamcommit.kickoff.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ApplyController {

	@RequestMapping(value="/applyList")
	public String applyList(HttpServletRequest request, HttpSession session) throws Exception {
		String view = "/apply/applyList";
		
		String parameter = null;
		
		if(request.getParameter("page") != null) {
			parameter = request.getParameter("page");
		
			if(parameter.equals("helper")) {
				String page = parameter;
				session.setAttribute("page", page);
				view = applySelectList(request, session);
				return view;
			}
		}
		
		return view;
	}
	
	@RequestMapping(value="/applySelect")
	public String applySelectList(HttpServletRequest request, HttpSession session) throws Exception {
		String view = "/apply/applySelect"; 
		
		String page = null;
		
		if(session.getAttribute("page") != null) {
			page = (String)session.getAttribute("page");
			
			if(page.equals("helper")) {
				String num = request.getParameter("num");
				
				if(num != null) {
					if(num.equals("2")) {
						view = "redirect:/applyHelper";
						session.removeAttribute("page");
						return view;
					}
				}
			}
		}
		return view;
	}
	
	@RequestMapping(value="/applyTeam")
	public String applyTeam() throws Exception {
		String view = "/apply/applyTeam";
		
		return view;
	}
	
	@RequestMapping(value="/applyHelper")
	public String applyHelper() throws Exception {
		String view = "/apply/applyHelper";
		
		return view;
	}
	
}
