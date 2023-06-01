package com.teamcommit.kickoff.Controller;

import com.teamcommit.kickoff.Do.TeamApplyDO;
import com.teamcommit.kickoff.Do.TeamDO;
import com.teamcommit.kickoff.Do.UserDO;
import com.teamcommit.kickoff.Service.team.TeamService;
import com.teamcommit.kickoff.Service.login.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

@Controller
public class TeamController {

    @Autowired
    @Qualifier("TeamService")
    private TeamService teamService;
    
    @Autowired
    private LoginService loginService;


    // 팀 목록
    @RequestMapping(value = "/team", method = RequestMethod.GET)
    public String TeamList(@ModelAttribute("teamDO") TeamDO teamDO, HttpServletRequest request, Model model) throws Exception {

        String view = "/team/team";

        List<TeamDO> teamList = teamService.getList(teamDO);
        model.addAttribute("teamList", teamList);

        return view;
    }

    // 팀 게시글 상세보기
    @RequestMapping( "/teamDetail")
    public String teamDetail(@ModelAttribute("teamDO") TeamDO teamDO, @RequestParam("teamSeqNo") int teamSeqNo, HttpServletRequest request, Model model) throws Exception {
        String view = "/team/teamDetail";

        TeamDO teamContents = teamService.getTeamContents(teamSeqNo);
        model.addAttribute("teamContents", teamContents);

        return view;
    }

    // 팀 등록 페이지 이동
    @GetMapping("/teamInsert")
    public String teamInsert(HttpSession session, Model model, HttpServletRequest request) {
        String view = "";

        if(session.getAttribute("userId") == null) {
            model.addAttribute("script", "alert('로그인 후 이용하실 수 있습니다.');");
            view = "login/loginAll";
        }
        else if (session.getAttribute("userId") != null) {
            view = "team/teamInsert";
        }
        return view;
    }

    // 팀 등록 요청
    @RequestMapping("/teamInsertAction")
    public ModelAndView teamInsertAction(@ModelAttribute("teamDO") TeamDO teamDO, Model model, HttpSession session) throws Exception {
        ModelAndView mv = new ModelAndView();

        try {
            teamService.insertTeam(teamDO);
            mv = new ModelAndView("redirect:/team");

            model.addAttribute("script", "alert('팀 등록을 완료하였습니다.');");

        } catch (Exception e) {
            model.addAttribute("script", "alert('잘못된 요청입니다. 다시 시도해 주세요.');");
        }

        return mv;
    }

    // 팀 랭킹
    @RequestMapping(value = "/teamRank", method = RequestMethod.GET)
    public String TeamRank(@ModelAttribute("teamDO") TeamDO teamDO, HttpServletRequest request, Model model) throws Exception {

        String view = "/team/teamRank";

        List<TeamDO> teamRankList = teamService.rankList(teamDO);
        model.addAttribute("teamRankList", teamRankList);

        return view;
    }

    // 팀 지원 페이지 이동
    @GetMapping("/teamApply")
    public String teamInsert(HttpSession session, Model model) {
        String view = "";

        if(session.getAttribute("userId") == null) {
            model.addAttribute("script", "alert('로그인 후 이용하실 수 있습니다.');");
            view = "login/loginAll";
        }
        else if (session.getAttribute("userId") != null) {
            view = "team/teamApply";
        }
        return view;
    }
    
    //팀 지원 DB 저장
    @RequestMapping("/apply_action")
    public ModelAndView apply_action(@ModelAttribute("teamApplyDO") TeamApplyDO teamApplyDO, ModelMap model, HttpServletRequest request, RedirectAttributes redirect) throws Exception {
    	
    	ModelAndView mv = new ModelAndView();
    	
    	try {
    		
    		//로그인한 이용자 ID로 로그인 정보 가져오기
            String userId = (String) request.getSession().getAttribute("userId");
            UserDO userDO =new UserDO();
            userDO.setUserId(userId);
            userDO = loginService.procSetUserInfo(userDO);
            
            String userName = (String) request.getSession().getAttribute("userName");
            String userGender = (String) request.getSession().getAttribute("userGender");
            String userPhoneNumber = (String) request.getSession().getAttribute("userPhoneNumber");
    		
			teamService.insertTeamApply(teamApplyDO);
			
			mv = new ModelAndView("redirect:/team");
			redirect.addFlashAttribute("msg", "팀 지원 완료되었습니다.");
			
		} catch (Exception e) {
			redirect.addFlashAttribute("msg", "오류가 발생되었습니다. 다시 시도해주세요.");
		}
    	
    	return mv;
    }

}
