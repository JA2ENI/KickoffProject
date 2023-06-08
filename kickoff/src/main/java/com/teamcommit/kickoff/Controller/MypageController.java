package com.teamcommit.kickoff.Controller;

import com.teamcommit.kickoff.Do.BoardDO;
import com.teamcommit.kickoff.Do.ReservationDO;
import com.teamcommit.kickoff.Do.UserDO;
import com.teamcommit.kickoff.Service.mypage.MypageService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.text.SimpleDateFormat;
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
    	
    	System.out.println("newPw: " + newPw);
    	System.out.println("newPw2: " + newPw2);
    	
    	if(newPw != "" && newPw2 != "") {
    		System.out.println("test");
    		
    		if(newPw == newPw2) {
    			System.out.println("==");
    		} else if(newPw != newPw2) {
    			System.out.println("!=");
    		}
    		
    		System.out.println();
    		
    		if(newPw.equals(newPw2)) {
    			System.out.println("equals : " + newPw.equals(newPw2));
    		}
    	}
    	
    	if(newPw == "" || newPw2 == "") {
    		if(newPw == "") {
    			System.out.println();
    			System.out.println("newPw == \"\" || newPw2 == \"\"");
    			System.out.println("newPw == \"\"" + newPw);
    			
    			mv.setViewName("/mypage/myInfoPw");
    			mv.addObject("msg", "새 비밀번호를 입력해주세요.");
    			return mv;
    		} else if(newPw2 == "") {
    			System.out.println();
    			System.out.println("newPw == \"\" || newPw2 == \"\"");
    			System.out.println("newPw2 == \"\"" + newPw2);
    			
    			mv.setViewName("/mypage/myInfoPw");
    			mv.addObject("msg2", "새 비밀번호 확인을 입력해주세요.");
    			return mv;
    		}
    	}
    	
    	
		System.out.println("newPw != newPw2 : " + (newPw != newPw2));
		System.out.println("newPw == newPw2 : " + (newPw == newPw2));
		System.out.println("newPw != \"\" && newPw2 != \"\" : " + (newPw != "" && newPw2 != ""));
		
    	if(newPw != "" && newPw2 != "") {
    		if(newPw != newPw2) {
    			System.out.println();
    		 	
    			mv.setViewName("/mypage/myInfoPw");
    			mv.addObject("msg2", "비밀번호가 일치하지 않습니다.");
    			return mv;
    		} else if(newPw == newPw2) {
    			String userId = (String)session.getAttribute("userId");
    			
    			UserDO userInfo = mypageService.userInfo(userId);
    			
    			String userPw = userInfo.getUserPw();

    			if(newPw == userPw) {
    				mv.setViewName("/mypage/myInfoPw");
        			mv.addObject("msg", "현재 비밀번호와 같습니다. 다시 입력해주세요.");
        			return mv;
    			} else if(newPw != userPw) {
	    			UserDO user = new UserDO();
	    			user.setUserId(userId);
	    			user.setUserPw(newPw);
	
	    			mypageService.updatePw(user);
	
	    			mv.setViewName("redirect:/loginAll");
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
        
        model.addAttribute("userInfo", userInfo);
        
        return view;
    }
    
    @RequestMapping(value = "/myInfoResult")
    public String myInfoResult(@ModelAttribute("userDO")UserDO userDO) throws Exception {
        String view = "redirect:/myInfo";
        
        mypageService.updateUserInfo(userDO);
        
        return view;
    }
    
    @RequestMapping(value = "/myTeam")
    public String myTeamList() throws Exception {
        String view = "/mypage/myTeam";

        return view;
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
}
