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
			session.setAttribute("page", parameter);
			view = applySelectList(request, session);
			return view;
		}
		
		return view;
	}
	
	@RequestMapping(value="/applySelect")
	public String applySelectList(HttpServletRequest request, HttpSession session) throws Exception {
		String view = "/apply/applySelect"; 
		String page = null;
		
		if(session.getAttribute("page") != null) {
			page = (String)session.getAttribute("page");
			String num = request.getParameter("num");
			
			if(num != null) {
				if(num.equals("1")) {
					if(page.equals("reservation")) {
						view = "";
						return view;
					} else if(page.equals("game")) {
						view = "";
						return view;
					} else if(page.equals("team")) {
						view = "";
						return view;
					} else 	if(page.equals("helper")) {
						view = "redirect:/applyHelperApplicant";
						return view;
					}
				} else if(num.equals("2")) {
					if(page.equals("reservation")) {
						view = "";
						return view;
					} else if(page.equals("game")) {
						view = "";
						return view;
					} else if(page.equals("team")) {
						view = "";
						return view;
					} else 	if(page.equals("helper")) {
						view = "redirect:/applyHelperRecruiter";
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
	
	//용병 신청자 페이지 
	@RequestMapping(value="/applyHelperApplicant")
	public String applyHelperApplicant() throws Exception {
		String view = "/apply/applyHelperApplicant";
		
		return view;
	}
	
	//용병 모집자 페이지 
	@RequestMapping(value="/applyHelperRecruiter")
	public String applyHelperRecruiter(HttpSession session) throws Exception {
		String view = "/apply/applyHelperRecruiter";
		
		return view;
	}
	
}
