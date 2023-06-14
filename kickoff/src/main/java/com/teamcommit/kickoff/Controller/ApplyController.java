package com.teamcommit.kickoff.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ApplyController {

	@RequestMapping(value="/applyList")
	public String applyList() throws Exception {
		String view = "/apply/applyList";
		
		return view;
	}
	
}
