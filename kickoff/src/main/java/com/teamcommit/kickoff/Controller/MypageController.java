package com.teamcommit.kickoff.Controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.teamcommit.kickoff.Common.Pagination;
import com.teamcommit.kickoff.Do.BoardDO;
import com.teamcommit.kickoff.Do.ReservationDO;
import com.teamcommit.kickoff.Do.GameDO;
import com.teamcommit.kickoff.Do.UserDO;
import com.teamcommit.kickoff.Service.apply.ApplyService;
import com.teamcommit.kickoff.Service.mypage.MypageService;
import com.teamcommit.kickoff.Service.reservation.ReservationService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class MypageController {

	@Autowired
    MypageService mypageService;
	
	@Autowired
	ReservationService reservationService;
	
	@Autowired
	ApplyService applyService;
	
    @RequestMapping(value = "/myReservation")
    public ModelAndView myReservationList(HttpSession session, @ModelAttribute("reservationDO")ReservationDO rDO, @RequestParam(defaultValue="1") int curPage) throws Exception {
    	ModelAndView mv = new ModelAndView("/mypage/myReservation");
    	
    	try {
	    	String userId = (String)session.getAttribute("userId");
	    	
		    reservationService.reservationValidationDate();
		    int listCnt = mypageService.reservationListCount(userId);
		    int pageSize = 3;
	    	Pagination pagination = new Pagination(listCnt, curPage, pageSize);
	    	rDO.setStartIndex(pagination.getStartIndex());
	        rDO.setEndIndex(pagination.getEndIndex());
	        rDO.setUserId(userId);
		    
	        List<Map<String, String>> list = mypageService.myReservationList(rDO);
	        	
	        mv.addObject("listCnt", listCnt);
	        mv.addObject("myReservationList", list);
	        mv.addObject("pagination", pagination);
    	} catch (Exception e) {
        	e.printStackTrace();
		}
        
        return mv;
    }
    
	/* 여기 하는 중 */
    @RequestMapping(value = "/applyCancel")
    public ModelAndView myReservationCancle(HttpSession session, @RequestParam("reservationNo")String rNum) throws Exception {
    	ModelAndView mv = new ModelAndView("redirect:/myReservation");
    	
    	try {
	    	Map<String, String> map = new HashMap<>();
	    	map.put("rNum", rNum);
	    	map.put("aUserId", (String)session.getAttribute("userId"));
	    	map.put("check", "cancel");
	    	
	    	applyService.updateApplyStatus(map);
    	} catch (Exception e) {
        	e.printStackTrace();
		}
    	
        return mv;
    }
    
    @RequestMapping(value = "/myBoardList")
    public ModelAndView myBoardList(HttpSession session) throws Exception {
        ModelAndView mv = new ModelAndView("/mypage/myBoard");
        
        try {
	        String userId = (String)session.getAttribute("userId");
	        List<BoardDO> myBoardList = mypageService.myBoardList(userId);
	        mv.addObject("myBoardList", myBoardList);
        } catch (Exception e) {
        	e.printStackTrace();
		}
        
        return mv;
    }
    
    @RequestMapping(value = "/myInfoCheck")
    public String myInfoCheck(Model model, HttpSession session) throws Exception {
        String view = "/mypage/myInfoCheck";
        
        try {
	        String userId = (String)session.getAttribute("userId");
	        model.addAttribute("userId", userId);
        } catch (Exception e) {
        	e.printStackTrace();
		}
        
        return view;
    }

    @RequestMapping(value = "/myInfoCheckResult", method= RequestMethod.POST)
    public ModelAndView myInfoCheckResult(@RequestParam("userId")String userId, @RequestParam("userPw")String userPw) throws Exception {
    	ModelAndView mv = new ModelAndView("/mypage/myInfoCheck");
    	
    	try {
	        if(!userPw.isEmpty()) {
	        	UserDO userInfo = mypageService.userInfo(userId);
	        	if(userInfo.getUserPw().equals(userPw)) {
	        		mv.setViewName("redirect:/myInfoSelect");
	        		return mv;
	        	} else {
	        		mv.setViewName("/mypage/myInfoCheck");
	        		mv.addObject("msg", "입력하신 비밀번호가 올바르지 않습니다. 다시 확인해 주세요.");
	        		return mv;
	        	}
	        }
	        mv.addObject("msg", "비밀번호를 입력해주세요.");
    	} catch (Exception e) {
        	e.printStackTrace();
		}
        
        return mv;
    }
    
    @RequestMapping(value ="/myInfoSelect")
    public String myInfoSelect(HttpServletRequest request) throws Exception {
    	String view = "/mypage/myInfoSelect";
    	
    	try {
	    	String page = (String)request.getParameter("page");
	    	if(page != null) {
	    		if(page.equals("password")) {
	    			view = "redirect:/myInfoPw";
	    			return view;
	    		} else if(page.equals("myInfo")) {
	    			view = "redirect:/updateInfo";
	    			return view;
	    		}
	    	}
    	} catch (Exception e) {
        	e.printStackTrace();
		}
    	
    	return view;
    }
    
    @RequestMapping(value ="/myInfoPw")
    public String myInfoPw(HttpSession session, Model model) throws Exception {
    	String view = "/mypage/myInfoPw";
    	
    	try {
	    	String userId = (String)session.getAttribute("userId");
	    	if(userId == null) {
	    		model.addAttribute("loginAll", "loginAll");
	    	}
    	} catch (Exception e) {
        	e.printStackTrace();
		}
    	
    	return view;
    }
    
    @RequestMapping(value ="/myInfoPwResult")
    public ModelAndView myInfoPwResult(HttpServletRequest request, HttpSession session) throws Exception {
    	ModelAndView mv = new ModelAndView("/mypage/myInfoPw");
    	
    	try {
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
    	} catch (Exception e) {
        	e.printStackTrace();
		}
    	return mv;
    }
    
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/updateInfo")
    public ModelAndView updateInfo(HttpSession session) throws Exception {
    	ModelAndView mv = new ModelAndView("/mypage/myInfo");
    	
    	try {
	        String userId = (String)session.getAttribute("userId");
	        
	        ObjectMapper om = new ObjectMapper();
	        Map<String, String> map = om.convertValue(mypageService.userInfo(userId), Map.class);
	        
	        String userDay = map.get("userBirthdate");
	        map.put("year", userDay.substring(0, 4));
	        map.put("month", userDay.substring(4, 6));
	        map.put("day", userDay.substring(6, 8));
	        
	        String[] arrayEmail = map.get("userEmail").split("@");
	        map.put("mail", arrayEmail[0]);
	        map.put("email", arrayEmail[1]);
	    	
	    	mv.addObject("userInfo", map);
    	} catch (Exception e) {
        	e.printStackTrace();
		}
        return mv;
    }
    
    @RequestMapping(value = "/updateInfoResult")
    public String updateInfoResult(@ModelAttribute("userDO")UserDO userDO, HttpServletRequest request) throws Exception {
        String view = "redirect:/updateInfo";
        
        try {
	        userDO.setUserBirthdate(request.getParameter("year") + request.getParameter("month") + request.getParameter("day"));
	        userDO.setUserEmail(request.getParameter("mail") + "@" + request.getParameter("email"));
			mypageService.updateUserInfo(userDO); 
        } catch (Exception e) {
        	e.printStackTrace();
		}
        
        return view;
    }
    
    @RequestMapping(value = "/myMessage")
    public String myMessageList() throws Exception {
        String view = "/mypage/myMessage";

        return view;
    }

    @RequestMapping(value = "/userDelete")
    public String userDelete(HttpSession session) throws Exception {
        String view = "/main";
        
        try {
	        String userId = (String)session.getAttribute("userId");
	        mypageService.userDelete(userId);
	        session.invalidate();
	        } catch (Exception e) {
	        	e.printStackTrace();
		}
        
        return view;
    }

	/* Game - 박채린 */
    @RequestMapping(value = "/myGameRecordList")
    public ModelAndView myGameRecordList(HttpSession session) throws Exception {
        ModelAndView mv = new ModelAndView("/mypage/myGameRecord");
        
        try {
	        String userId = (String)session.getAttribute("userId");
	        List<GameDO> myGameRecordList = mypageService.myGameRecordList(userId);
	        session.setAttribute("myGameRecordList", myGameRecordList);
        } catch (Exception e) {
        	e.printStackTrace();
		}
        
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
    
}
