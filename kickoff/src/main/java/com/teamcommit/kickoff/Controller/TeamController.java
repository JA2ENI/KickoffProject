package com.teamcommit.kickoff.Controller;

import com.teamcommit.kickoff.Do.PageDO;
import com.teamcommit.kickoff.Do.TeamApplyDO;
import com.teamcommit.kickoff.Do.TeamDO;
import com.teamcommit.kickoff.Do.TeamInfoDO;
import com.teamcommit.kickoff.Do.UserDO;
import com.teamcommit.kickoff.Service.team.TeamService;
import com.teamcommit.kickoff.Service.login.LoginService;

import org.springframework.asm.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

@Controller
public class TeamController {

    @Autowired
    @Qualifier("TeamService")
    private TeamService teamService;
    
    @Autowired
    private LoginService loginService;


    // 팀 목록 & 게시글 목록
    @RequestMapping(value = "/team")
    public String team(@ModelAttribute("teamInfoDO") TeamInfoDO teamInfoDO, @ModelAttribute("teamDO") TeamDO teamDO, 
    					@RequestParam(value = "teamId", required = false) Integer teamId,
    					@RequestParam(value="nowPage", required=false)String nowPage,
    					@RequestParam(value="cntPerPage", required=false)String cntPerPage,
    					PageDO pageDO, Model model, HttpSession session) throws Exception {
        String view = "/team/team";
        
        String userId = (String)session.getAttribute("userId");

        //teamList Paging
        int total = teamService.countTeam();
    	if (nowPage == null && cntPerPage == null) {
    		nowPage = "1";
    		cntPerPage = "8";
    	} else if (nowPage == null) {
    		nowPage = "1";
    	} else if (cntPerPage == null) { 
    		cntPerPage = "8";
    	}
    	pageDO = new PageDO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
    	model.addAttribute("paging", pageDO);
    	model.addAttribute("viewAll", teamService.selectTeamPaging(pageDO));
        
        //teamBoard List
        List<TeamDO> teamBoard = teamService.teamBoardList(teamDO);
        model.addAttribute("teamBoard", teamBoard);
        
        //teamRecruit List
        List<TeamDO> teamRecruit = teamService.teamRecruitList(teamId);
        model.addAttribute("teamRecruit", teamRecruit);
        
        //teamButtonManage
        TeamInfoDO teamInfo = teamService.teamInfo(userId);
        model.addAttribute("teamInfo", teamInfo);
   
        return view;
    }
    
    // 팀별 모집글 AJAX 처리
    @GetMapping(value = "/team-ajax")
    @ResponseBody
    public List<TeamDO> teamAjax(@RequestParam(value = "teamId", required = false) Integer teamId) throws Exception {
        
    	return teamService.teamRecruitList(teamId);
    }

    // 팀 모집글 등록 페이지 이동 & 데이터 불러오기
    @RequestMapping("/teamInsert")
    public String teamInsert(@ModelAttribute("teamDO") TeamDO teamDO, HttpSession session, Model model, HttpServletRequest request) throws Exception {
        String view = "";
        
        String userId = (String)session.getAttribute("userId");

        if(session.getAttribute("userId") == null) {
            model.addAttribute("script", "alert('로그인 후 이용하실 수 있습니다.');");
            view = "login/loginAll";
            
            return view;
        }
        else if (session.getAttribute("userId") != null) {
            view = "team/teamInsert";
            
            TeamInfoDO teamInfoDO = teamService.selectTeamInfo(userId);
            model.addAttribute("teamInfoDO", teamInfoDO);
        }
        

        return view;
    }
    
    // 팀 모집글 등록 요청
    @RequestMapping("/teamInsertAction")
    public String teamInsertAction(@ModelAttribute("teamDO") TeamDO teamDO, HttpServletRequest request, Model model) throws Exception {
    	String view = "redirect:/team";

    	teamService.insertTeam(teamDO);
    	return view;
    }
    
    // 팀 모집 게시글 상세보기
    @RequestMapping( "/teamDetail")
    public String teamDetail(@ModelAttribute("teamDO") TeamDO teamDO, @RequestParam("teamSeqNo") int teamSeqNo, HttpSession session, Model model) throws Exception {
        String view = "/team/teamDetail";
        
        String userId = (String)session.getAttribute("userId");

        TeamDO teamContents = teamService.teamRecruitDetail(teamSeqNo);
        model.addAttribute("teamContents", teamContents);
        
        TeamInfoDO teamInfoDO = teamService.teamInfo(userId);
        model.addAttribute("teamInfoDO", teamInfoDO);

        return view;
    }
    
    // 팀 모집글 수정 페이지 이동
    @RequestMapping( "/teamUpdate")
    public String teamUpdate(@ModelAttribute("teamDO") TeamDO teamDO, @RequestParam("teamSeqNo") int teamSeqNo, Model model) throws Exception {
        String view = "/team/teamUpdate";

        TeamDO teamContents = teamService.teamRecruitDetail(teamSeqNo);
        model.addAttribute("teamContents", teamContents);

        return view;
    }
    
    // 팀 모집글 수정 요청
    @RequestMapping( "/teamUpdateAction")
    public String teamUpdateAction(@ModelAttribute("teamDO") TeamDO teamDO) throws Exception {
        String view = "redirect:/teamDetail?teamSeqNo=" + teamDO.getTeamSeqNo();
       
        teamService.updateTeam(teamDO);
        return view;
    }
    
    // 팀 모집글 삭제 요청
    @RequestMapping( "/teamDeleteAction")
    public String teamDeleteAction(@ModelAttribute("teamDO") TeamDO teamDO, @RequestParam("teamSeqNo") int teamSeqNo) throws Exception {
        String view = "redirect:/team";
       
        teamService.deleteTeam(teamSeqNo);

        return view;
    }


    // 팀 랭킹
    @RequestMapping(value = "/teamRank", method = RequestMethod.GET)
    public String TeamRank(@ModelAttribute("teamDO") TeamDO teamDO, Model model) throws Exception {

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
    
    // 팀 생성 페이지 이동
    @RequestMapping(value = "/teamCreateForm")
    public String teamCreateForm(HttpSession session, Model model, HttpServletRequest request) {
        String view = "";

        if(session.getAttribute("userId") == null) {
            model.addAttribute("script", "alert('로그인 후 이용하실 수 있습니다.');");
            view = "login/loginAll";
        }
        else if (session.getAttribute("userId") != null) {
            view = "team/teamCreate";
        }
        return view;
    }
    
    // 아이디 중복 체크
    @ResponseBody
    @RequestMapping(value="/teamNameCheck")
    public int teamNameCheck(TeamInfoDO teamInfoDO) throws Exception {
    	int result = teamService.teamNameCheck(teamInfoDO);
    	
    	return result;
    }
    
    // 팀 생성
    @RequestMapping(value = "/teamCreate")
    public String teamCreate(@ModelAttribute("teamInfoDO") TeamInfoDO teamInfoDO) throws Exception {
        String view = "redirect:/teamManage";
        
        int result = teamService.teamNameCheck(teamInfoDO);
        
        if(result >= 1) {
			return "team/teamCreate";
		}else if(result == 0) {
			teamService.teamCreation(teamInfoDO);
		}
        
        return view;
    }

    // 팀 상세정보 & 팀원 리스트
    @RequestMapping( "/teamManage")
    public String teamMembersList(HttpServletRequest request, Model model, HttpSession session) throws Exception {
    	String view = "";
    	
    	//로그인한 이용자 ID로 로그인 정보 가져오기
    	String userId = (String)session.getAttribute("userId");
    	 
		if (userId == null) {
			model.addAttribute("script", "alert('로그인 후 이용하실 수 있습니다.');");
			view = "login/loginAll";
			
			return view;
		} else if (userId != null) {
			view = "team/teamManage";
		}
		
		List<TeamInfoDO> teamDetail = teamService.teamInfoDetail(userId);
		model.addAttribute("teamDetail", teamDetail);
    	
        TeamInfoDO teamInfoDO = teamService.teamInfo(userId);
        model.addAttribute("teamInfoDO", teamInfoDO);
        
        if (teamInfoDO == null) {
        	model.addAttribute("teamCreationMessage");
        	return "team/teamCreationMessage";
        }
        
        int teamId = teamInfoDO.getTeamId();
        
    	List<Map<String, Object>> memberList = teamService.teamMemberList(teamId);
        model.addAttribute("memberList", memberList);

        
        return view;
    }
    
    // 팀원 방출
    @RequestMapping("/memberDelete")
    public String memberDelete(@RequestParam("userId") String userId) throws Exception {
    	String view = "redirect:/teamManage";
    	
    	teamService.teamMemberDelete(userId);
    	
    	return view;
    }
}
