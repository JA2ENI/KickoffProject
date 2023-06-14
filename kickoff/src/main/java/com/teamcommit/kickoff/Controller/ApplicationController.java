package com.teamcommit.kickoff.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ApplicationController {

	@RequestMapping(value="/applicationList")
	public String applicationList() throws Exception {
		String view = "/application/applicationList";
		
		return view;
	}
	
}
