package com.teamcommit.kickoff.yeonu;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teamcommit.kickoff.Do.TeamApplyDO;

@Controller
public class TeamRecruiterController {

	@Autowired
    TeamRecruiterService teamRecruiterService;
	
	
    //지원자 리스트 & 상세보기
    @RequestMapping(value = "/applyTeamRecruiter")
    public String applyTeamRecruiter(Model model, HttpSession session) throws Exception {
        String view = "/apply/applyTeamRecruiter";
        
        String userId = (String)session.getAttribute("userId");

        List<TeamApplyDO> applyList = teamRecruiterService.teamApplyList(userId);
        model.addAttribute("applyList", applyList);
        
        System.out.println(userId);
        System.out.println(applyList);
   
        return view;
    }

}
