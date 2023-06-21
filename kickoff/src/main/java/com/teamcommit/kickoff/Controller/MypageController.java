package com.teamcommit.kickoff.Controller;

import com.teamcommit.kickoff.Do.BoardDO;
import com.teamcommit.kickoff.Do.ReservationDO;
import com.teamcommit.kickoff.Do.TeamDO;
import com.teamcommit.kickoff.Do.GameDO;
import com.teamcommit.kickoff.Do.UserDO;
import com.teamcommit.kickoff.Service.mypage.MypageService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class MypageController {

	@Autowired
    MypageService mypageService;
	
    @RequestMapping(value = "/myReservation")
    public ModelAndView myReservationList(HttpSession session) throws Exception {

    	ModelAndView mv = new ModelAndView("/mypage/myReservation");
    	
    	String userId = (String)session.getAttribute("userId");
    	
        List<ReservationDO> list = mypageService.myReservationList(userId);
        
        List<ReservationDO> emplist = mypageService.empReservationList(userId);
        	
        mv.addObject("myReservationList", list);
        mv.addObject("imgInfo", emplist);
        
        return mv;
    }
    
    @RequestMapping(value = "/cancle")
    public ModelAndView myReservationCancle(@RequestParam("reservationNo")int reservationNo) throws Exception {

    	ModelAndView mv = new ModelAndView("redirect:/myReservation");
    	
		mypageService.updateCancel(reservationNo);
    	
        return mv;
    }
    
    @RequestMapping(value = "/myBoardList")
    public ModelAndView myBoardList(HttpSession session) throws Exception {
    	
        ModelAndView mv = new ModelAndView("/mypage/myBoard");
        
        String userId = (String)session.getAttribute("userId");

        List<BoardDO> myBoardList = mypageService.myBoardList(userId);
        
        mv.addObject("myBoardList", myBoardList);
        
        return mv;
    }
    
    @RequestMapping(value = "/myInfoCheck")
    public String myInfoCheck(Model model, HttpSession session) throws Exception {
        String view = "/mypage/myInfoCheck";
    	
        String userId = (String)session.getAttribute("userId");
        
        model.addAttribute("userId", userId);
        
        return view;
    }

    @RequestMapping(value = "/myInfoCheckResult", method= RequestMethod.POST)
    public ModelAndView myInfoCheckResult(@RequestParam("userId")String userId, @RequestParam("userPw")String userPw) throws Exception {
       
    	ModelAndView mv = new ModelAndView("/mypage/myInfoCheck");
    	
        if(!userPw.isEmpty()) {
        	UserDO user = new UserDO();
        	user.setUserId(userId);
        	user.setUserPw(userPw);
        	
        	UserDO userInfo = mypageService.userInfoCheck(user);
        	
        	if(userInfo != null) {
        		mv.setViewName("redirect:/myInfoSelect");
        		return mv;
        	} else {
        		mv.setViewName("/mypage/myInfoCheck");
        		mv.addObject("msg", "입력하신 비밀번호가 올바르지 않습니다. 다시 확인해 주세요.");
        		return mv;
        	}
        }
        
        mv.addObject("msg", "비밀번호를 입력해주세요.");
        
        return mv;
        
    }
    
    @RequestMapping(value ="/myInfoSelect")
    public String myInfoSelect() throws Exception {
    	String view = "/mypage/myInfoSelect";
    	
    	return view;
    }
    
    @RequestMapping(value ="/myInfoPw")
    public String myInfoPw() throws Exception {
    	String view = "/mypage/myInfoPw";
    	
    	return view;
    }
    
    @RequestMapping(value ="/myInfoPwResult")
    public ModelAndView myInfoPw(HttpServletRequest request, HttpSession session) throws Exception {
    	ModelAndView mv = new ModelAndView("/mypage/myInfoPw");
    	
    	String newPw = request.getParameter("userPw");
    	String newPw2 = request.getParameter("userPw2");
    	
    	if(newPw == "" || newPw2 == "") {
    		if(newPw == "") {
    			mv.setViewName("/mypage/myInfoPw");
    			mv.addObject("msg", "새 비밀번호를 입력해주세요.");
    			return mv;
    		} else if(newPw2 == "") {
    			mv.setViewName("/mypage/myInfoPw");
    			mv.addObject("msg2", "새 비밀번호 확인을 입력해주세요.");
    			return mv;
    		}
    	}
		
    	if(newPw != "" && newPw2 != "") {
    		if(newPw.equals(newPw2) == false) {
    			mv.setViewName("/mypage/myInfoPw");
    			mv.addObject("msg2", "비밀번호가 일치하지 않습니다.");
    			return mv;
    		} else if(newPw.equals(newPw2) == true) {
    			String userId = (String)session.getAttribute("userId");
    			
    			UserDO userInfo = mypageService.userInfo(userId);
    			
    			String userPw = userInfo.getUserPw();

    			if(newPw.equals(userPw) == true) {
    				mv.setViewName("/mypage/myInfoPw");
        			mv.addObject("msg", "현재 비밀번호와 같습니다. 다시 입력해주세요.");
        			return mv;
    			} else if(newPw.equals(userPw) == false) {
	    			UserDO user = new UserDO();
	    			user.setUserId(userId);
	    			user.setUserPw(newPw);
	
	    			mypageService.updatePw(user);
	
	    			mv.setViewName("/mypage/myInfoPw");
	    			mv.addObject("success", "success");
	    			
	    			return mv;
    			}
    		}
    	}
    	
    	return mv;
    }
    
    @RequestMapping(value = "/myInfo")
    public String myInfo(Model model, HttpSession session) throws Exception {
        String view = "/mypage/myInfo";
        
        String userId = (String)session.getAttribute("userId");
        
        UserDO userInfo = mypageService.userInfo(userId);
        
        String userDay = userInfo.getUserBirthdate();
    	String year = userDay.substring(0, 4);
    	String month = userDay.substring(5, 7);
    	String day = userDay.substring(8, 10);
    	
    	String userEmail = userInfo.getUserEmail();
    	String[] arrayEmail = userEmail.split("@|\\."); 
    	String mail = arrayEmail[0];
    	String email = arrayEmail[1];
    	
    	HashMap<String, String> map = new HashMap<>();
    	
    	map.put("year", year);
    	map.put("month", month);
    	map.put("day", day);
    	map.put("mail", mail);
    	map.put("email", email);
    	
    	model.addAttribute("userInfo", userInfo);
    	model.addAttribute("map", map);
        
        return view;
    }
    
    @RequestMapping(value = "/myInfoResult")
    public String myInfoResult(@ModelAttribute("userDO")UserDO userDO, @RequestParam("year")String year, 
    						   @RequestParam("month")String month, @RequestParam("day")String day,
    						   @RequestParam("mail")String mail, @RequestParam(value="email", required=false)String email,
    						   HttpServletRequest request) throws Exception {
    	
        String view = "redirect:/myInfo";

        String userDay = year + month + day;
        
        String uEmail = mail + "@" + email;
        String[] arrayEmail = uEmail.split(",");
        String userEmail = arrayEmail[0];
        
        userDO.setUserBirthdate(userDay);
        userDO.setUserEmail(userEmail);
        
		mypageService.updateUserInfo(userDO); 
        
        return view;
    }
    
    @RequestMapping(value = "/myTeam")
    public ModelAndView myTeamList(HttpSession session) throws Exception {
    	ModelAndView mv = new ModelAndView("/mypage/myTeam");
    	/*
    	String userId = (String)session.getAttribute("userId");
    	
    	List<TeamDO> list = mypageService.myTeamList(userId);

    	mv.addObject("myTeamList", list);
    	*/
        return mv;
    }
    

    @RequestMapping(value = "/myMessage")
    public String myMessageList() throws Exception {
        String view = "/mypage/myMessage";

        return view;
    }

    @RequestMapping(value = "/myHelper")
    public String myHelperList() throws Exception {
        String view = "/mypage/myHelper";

        return view;
    }
    
    @RequestMapping(value = "/userDelete")
    public String userDelete(HttpSession session) throws Exception {
        String view = "/main";
        	
        String userId = (String)session.getAttribute("userId");
        
        mypageService.userDelete(userId);
        
        session.invalidate();
        
        return view;
    }
    
    
    @RequestMapping(value = "/myGameRecordList")
    public ModelAndView myGameRecordList(HttpSession session) throws Exception {
    	
        ModelAndView mv = new ModelAndView("/mypage/myGameRecord");
        
        String userId = (String)session.getAttribute("userId");

        List<GameDO> myGameRecordList = mypageService.myGameRecordList(userId);
        
        session.setAttribute("myGameRecordList", myGameRecordList);
       
        return mv;
    }
    
    @RequestMapping(value = "/myGameRecordList", method = RequestMethod.POST)
    public String myGameRecordList(Model model, @ModelAttribute("gameDO") GameDO gameDO) {
    	String view = "/mypage/myGameRecord";
    	
    	try {
    		mypageService.updateGameScore(gameDO);
    		model.addAttribute("sucess", "alert('기록에 성공했습니다');");
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    		model.addAttribute("sucess", "alert('기록에 실패했습니다');"); 
    	}
    	
    	return view;
    }
    
    @RequestMapping(value = "/myGameInsert")
    public String myGameInsert(@ModelAttribute("GameDO") GameDO gameDO, @RequestParam(value = "gameSeqno") int gameSeqno, HttpServletRequest request, Model model) throws Exception {
        String view = "/mypage/myGameInsert";
        
        String userId = (String) request.getSession().getAttribute("userId");
        
        GameDO gameRecord = mypageService.getGameRecord(gameSeqno);
        
        model.addAttribute("userId", userId);
        model.addAttribute("gameRecord", gameRecord);
        
        return view;
    }
    
//    /*게시판 상세보기(작성자)*/
//    @RequestMapping(value = "/myGameInsertForm")
//    public String  myGameScore(@RequestParam("gameSeqno")int gameSeqno, Model model) throws Exception {
//        String view = "/mypage/myGameInsert";
//        
//        GameDO gameScore = mypageService.updateGameScore(gameSeqno); 
//        model.addAttribute("gameScore", gameScore);
//        
//        return view;
//    }
}
