package com.teamcommit.kickoff.yeonu;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamcommit.kickoff.Do.TeamApplyDO;
import com.teamcommit.kickoff.Do.TeamDO;
import com.teamcommit.kickoff.Do.TeamInfoDO;
import com.teamcommit.kickoff.Do.UserDO;

@Controller
public class TeamRecruiterController {

	@Autowired
    TeamRecruiterService teamRecruiterService;
	
	
    //지원자 리스트 & 상세보기
    @RequestMapping(value = "/applyTeamRecruiter")
    public String applyTeamRecruiter(Model model, HttpSession session) throws Exception {
        String view = "/apply/applyTeamRecruiter";
        
        String userId = (String)session.getAttribute("userId");

        TeamInfoDO teamInfoDO = teamRecruiterService.teamInfo(userId);
        model.addAttribute("teamInfoDO", teamInfoDO);
        
//        TeamApplyDO count = teamRecruiterService.applyCount(applyCount);
//        model.addAttribute("count", count);
        
        List<Map<String, String>> rList = teamRecruiterService.recruitInfoList(userId);
		List<Map<String, String>> aList = new ArrayList<>();
        
        for(Map<String, String> map : rList) {
			List<Map<String, String>> applyList = teamRecruiterService.teamApplyList(String.valueOf(map.get("TEAM_SEQNO")));
			for(Map<String, String> map2 : applyList) {
				aList.add(map2);
			}
		}
        
        model.addAttribute("recruitInfo", rList);
        model.addAttribute("applyInfo", aList);

        return view;
    }
    
    /* Side Bar */
	@RequestMapping(value="/apply-ajax", method=RequestMethod.GET)
	@ResponseBody
	public List<UserDO> applyAjax(@RequestParam(value = "userId") String userId) throws Exception {
		
		return teamRecruiterService.applyInfo(userId);
	}
}
