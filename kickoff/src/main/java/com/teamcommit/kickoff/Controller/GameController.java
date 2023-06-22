package com.teamcommit.kickoff.Controller;

import com.teamcommit.kickoff.Do.GameDO;
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

        GameDO gameScoreDetail = gameService.getGameScoreDetail(gameSeqno);
        model.addAttribute("gameScoreDetail", gameScoreDetail);

        return view;
    }

    @GetMapping("/gameScore")
    public String gameScore() {
        String view = "/game/gameScore";
        return view;
    }

    @PostMapping("/gameScore")
    public ModelAndView gameScore(@ModelAttribute("gameDO") GameDO gameDO, @RequestParam("gameSeqno") int gameSeqno, Model model) throws Exception {
        ModelAndView mv = new ModelAndView("/game/gameScore");

        try {
            GameDO gameScoreDetail = gameService.getGameScoreDetail(gameSeqno);
            model.addAttribute("gameScoreDetail", gameScoreDetail);
        }
        catch (Exception e) {
            e.printStackTrace();
        }

        return mv;
    }

    /*
    @GetMapping("/gameUpdate")
    public String insert(@ModelAttribute("gameDO") GameDO gameDO, HttpServletRequest request, Model model) throws Exception {
        String view = "/game/gameUpdate";
        String teamName = (String) request.getSession().getAttribute("teamName");
        TeamDO teamDO = new TeamDO();
        teamDO.setTeamName(teamName);

        return view;
    }*/

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
        
        TeamInfoDO teamInfo = gameService.selectTeamInfo(userId);
        
        model.addAttribute("teamInfo", teamInfo);

        return view;
        /*
        try{
            gameService.insertGame(gameDO);
            session.setAttribute("script", "alert('매칭 경기를 등록했습니다! 메시지를 기다려주세요 :)');");
        }
        catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("script", "alert('문제가 발생했습니다. 다시 시도해주세요.');");
        }
        */

    }
}





    /*
    @RequestMapping("/gameDetail")
    public ModelAndView gameDetail(CommandMap commandMap, HttpSession session) throws Exception {

        ModelAndView mv = new ModelAndView();

        Map<String, Object> map = new HashMap<String, Object>();

        if (session.getAttribute("user_id") != null) {
            String id = (String) session.getAttribute("user_id");
            map.put("id", id);
        } else if (session.getAttribute("emp_id") != null) {
            String id = (String) session.getAttribute("emp_id");
            map.put("id", id);
        }

        Map<String, Object> mem = gameService.selectMemInfo(map);

        mv.addObject("mem", mem);
        mv.setViewName("/game/gameDeatail");

        return mv;
    }

    @RequestMapping(value = "/gameUpdate")
    public ModelAndView gameUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception {

        ModelAndView mv = new ModelAndView("redirect:/game");

        gameService.gameDetail(commandMap.getMap(), request);

        return mv;
    }
     */
