package com.teamcommit.kickoff.Controller;

import com.teamcommit.kickoff.Do.BoardDO;
import com.teamcommit.kickoff.Do.GameApplyDO;
import com.teamcommit.kickoff.Do.GameDO;
import com.teamcommit.kickoff.Do.TeamInfoDO;
import com.teamcommit.kickoff.Do.TeamDO;
import com.teamcommit.kickoff.Do.PlaceDO;
import com.teamcommit.kickoff.Do.ReservationDO;
import com.teamcommit.kickoff.Do.UserDO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import com.teamcommit.kickoff.Service.game.GameService;
import com.teamcommit.kickoff.Service.login.LoginService;
import com.teamcommit.kickoff.Service.reservation.ReservationService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.List;

@Controller
public class GameController {

    @Autowired
    private GameService gameService;
    
    @Autowired
    private ReservationService reservationService;
    
    @Autowired
    private LoginService loginService;

    @GetMapping("/game")
    public String gameDetail(Model model) throws Exception {
        String view = "/game/game";

        try {
            List<GameDO> list = gameService.gameDetail();
            model.addAttribute("table", list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return view;
    }

    @RequestMapping( "/gameDetail")
    public String gameDetail(@ModelAttribute("gameDO") GameDO gameDO, @RequestParam("gameSeqno") int gameSeqno, 
    						@ModelAttribute("reservationDO") ReservationDO reservationDO, @RequestParam("placeId") int placeId,
    						HttpServletRequest request, Model model) throws Exception {
        String view = "/game/gameDetail";
        
        String userId = (String) request.getSession().getAttribute("userId");
        
        GameDO gameScoreDetail = gameService.getGameScoreDetail(gameSeqno);
        model.addAttribute("gameScoreDetail", gameScoreDetail);
        
        ReservationDO reservationDetail = reservationService.selectReservationDetail(placeId);
        model.addAttribute("reservationDetail", reservationDetail);
        
        model.addAttribute("userId", userId);
        
        return view;
    }
    
    //매칭 신청
    @RequestMapping("/apply")
    public ModelAndView apply(@ModelAttribute("gameDO") GameDO gameDO,
    		@ModelAttribute("gameApplyDO") GameApplyDO gameApplyDO, @RequestParam("applyTeam") String applyTeam,
    		@RequestParam("team2Name") String team2Name, RedirectAttributes redirect, Model model) throws Exception {
        
        ModelAndView mv = new ModelAndView("redirect:/game");

        try {
            gameService.getGameApply(team2Name);
            gameService.insertGameApply(applyTeam);
            redirect.addFlashAttribute("msg", "신청이 완료되었습니다!");
        } catch (Exception e) {
            redirect.addFlashAttribute("msg", "오류가 발생되었습니다. 다시 시도해주세요.");
        }
        

        return mv;
    }


    @RequestMapping("/gameUpdate")
    public String gameUpdate(HttpServletRequest request, Model model, HttpSession session) throws Exception {
        String view = "/game/gameUpdate";
        
        String userId = (String)session.getAttribute("userId");
        
        List<ReservationDO> placeInfo = gameService.selectPlaceInfo(userId);
        
        model.addAttribute("placeInfo", placeInfo);
        
        if(model.getAttribute("placeInfo") == null) {
        	model.addAttribute("script", "alert('풋살장 선택을 먼저 해주세요.');");
        }
        else if(model.getAttribute("placeInfo") !=  null) {
        	List<ReservationDO> dateInfo = gameService.selectDateInfo(userId);
	        model.addAttribute("dateInfo", dateInfo);
        } 
        
        TeamInfoDO teamInfoName = gameService.selectTeamInfoName(userId);    
        model.addAttribute("teamInfoName", teamInfoName);
        
        return view;
    }
    
    /* 매칭 수정 */
    @RequestMapping("/gameFix")
    public String gameFixForm(@RequestParam("gameSeqno") int gameSeqno, Model model, HttpSession session) throws Exception {
    	String view = "/game/gameFix";
    	String userId = (String)session.getAttribute("userId");
    	
    	List<ReservationDO> placeInfo = gameService.updatePlaceInfo(gameSeqno);
    	model.addAttribute("placeInfo", placeInfo);
    	
    	TeamInfoDO teamInfoName = gameService.updateTeamInfoName(userId);
    	model.addAttribute("teamInfoName", teamInfoName);
    	
    	return view;
    }
    
    @RequestMapping("")
    public String gameFixUpdate() throws Exception {
    	String view = "";
    	
		/*
		  GameDO gameFixForm = gameService.selectGameFixForm(gameSeqno);
		  model.addAttribute("gameFixForm", gameFixForm);
		 */
    	
    	return view;
    }
}

