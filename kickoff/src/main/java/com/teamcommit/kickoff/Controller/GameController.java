package com.teamcommit.kickoff.Controller;

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

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.List;

@Controller
public class GameController {

    @Autowired
    private GameService gameService;
    
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
    public String gameDetail(@ModelAttribute("gameDO") GameDO gameDO, @RequestParam("gameSeqno") int gameSeqno, HttpServletRequest request, Model model) throws Exception {
        String view = "/game/gameDetail";
        
        String userId = (String) request.getSession().getAttribute("userId");
        
        GameDO gameScoreDetail = gameService.getGameScoreDetail(gameSeqno);
        model.addAttribute("gameScoreDetail", gameScoreDetail);
        
        model.addAttribute("userId", userId);
        
        return view;
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
        System.out.println("출력" + gameSeqno);
        String userId = (String)session.getAttribute("userId");
        
        List<ReservationDO> placeInfo = gameService.updatePlaceInfo(gameSeqno);
        
        model.addAttribute("placeInfo", placeInfo);
        
        if(model.getAttribute("placeInfo") == null) {
        	model.addAttribute("script", "alert('풋살장 선택을 먼저 해주세요.');");
        }
        else if(model.getAttribute("placeInfo") !=  null) {
        	List<ReservationDO> dateInfo = gameService.updateDateInfo(gameSeqno);
	        model.addAttribute("dateInfo", dateInfo);
        } 
        
        TeamInfoDO teamInfoName = gameService.updateTeamInfoName(userId);    
        model.addAttribute("teamInfoName", teamInfoName);
        
        GameDO gameFixForm = gameService.selectGameFixForm(gameSeqno);
        model.addAttribute("gameFixForm", gameFixForm);
        
        
        return view;
    }
    
    
    
}

