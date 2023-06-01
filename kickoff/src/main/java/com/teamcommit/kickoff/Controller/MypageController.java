package com.teamcommit.kickoff.Controller;

import com.teamcommit.kickoff.Do.ReservationDO;
import com.teamcommit.kickoff.Service.mypage.MypageService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

import java.util.List;
import java.util.stream.Collectors;

@Controller
public class MypageController {

	@Autowired
    MypageService mypageService;
    
    @RequestMapping(value = "/myReservation")
    public ModelAndView myReservationList(@ModelAttribute("reservationDO") ReservationDO reservationDO, HttpSession session) throws Exception {

    	ModelAndView mv = new ModelAndView("/mypage/myReservation");
    	
        List<ReservationDO> list = mypageService.myReservationList((String)session.getAttribute("userId"));
        
        List<ReservationDO> emplist = mypageService.empReservationList((String)session.getAttribute("userId"));
        	
        mv.addObject("myReservationList", list);
        mv.addObject("imginfo", emplist);
        
        System.out.println("list: " + list.size());
        System.out.println("empList: " + emplist.size());
        
        return mv;
    }
    
    @RequestMapping(value = "/myBoardList")
    public String myBoardList() throws Exception {
        String view = "/mypage/myBoard";

        return view;
    }

    @RequestMapping(value = "/myInfo")
    public String myInfoList() throws Exception {
        String view = "/mypage/myInfo";

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
