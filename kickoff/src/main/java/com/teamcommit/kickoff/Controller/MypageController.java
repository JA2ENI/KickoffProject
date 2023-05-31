package com.teamcommit.kickoff.Controller;

import com.teamcommit.kickoff.Do.ReservationDO;
import com.teamcommit.kickoff.Service.ReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Controller
public class MypageController {

    @Autowired
    ReservationService reservationService;

    @RequestMapping(value = "/myReservation")
    public ModelAndView myReservationList(@ModelAttribute("reservationDO") ReservationDO reservationDO) throws Exception {

    	ModelAndView mv = new ModelAndView("/mypage/myReservation");
    	
        List<ReservationDO> list = reservationService.selectReservationList(reservationDO);
        
        List<String> address = list.stream()
        		.map(ReservationDO::getReservationPlaceAddress).collect(Collectors.toList());
        
        
		/* mv.addObject("address", list.get(0).getReservationPlaceAddress()); */
        mv.addObject("reservationList", list);
        mv.addObject("address", address);
      
        
        System.out.println("mv: " + mv);
        
        for(String add : address) {
        	System.out.println("address: " + add);
        }
        
        
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
