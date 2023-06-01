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

    /*
    @RequestMapping(value = "/myReservation")
    public ModelAndView myReservationList(@ModelAttribute("reservationDO") ReservationDO reservationDO) throws Exception {

    	ModelAndView mv = new ModelAndView("/mypage/myReservation");
    	
        List<ReservationDO> list = reservationService.selectReservationList(reservationDO);
        
        List<String> address = list.stream()
        		.map(ReservationDO::getReservationPlaceAddress).collect(Collectors.toList());
        
        */
    
		/* mv.addObject("address", list.get(0).getReservationPlaceAddress()); */
 
        /*
        mv.addObject("reservationList", list);
        mv.addObject("address", address);	
      
        
        System.out.println("mv: " + mv);
        
        for(String add : address) {
        	System.out.println("address: " + add);
        }
        
        
        return mv;
    }
  */  
    
    @RequestMapping(value = "/myReservation")
    public ModelAndView myReservationList(@ModelAttribute("reservationDO") ReservationDO reservationDO, HttpSession session) throws Exception {

    	ModelAndView mv = new ModelAndView("/mypage/myReservation");
    	
        List<ReservationDO> list = mypageService.myReservationList((String)session.getAttribute("userId"));
        
        int listSize = list.size();
        
		/*
		 * List<String> address = list.stream()
		 * .map(ReservationDO::getReservationPlaceAddress).collect(Collectors.toList());
		 */
        
        
        for(int i = 0; i < listSize; i++) {
        	mv.addObject("list", list.get(i));
        	System.out.println("mv : " + mv);
        }
        
        											
        
        /*
        for(String add : address) {
        	System.out.println("address: " + add);
        }
        */
        
		/* mv.addObject("add", list.get(0).getReservationPlaceAddress()); */
        
        
        mv.addObject("myReservationList", list);
        mv.addObject("listSize", listSize);
        
        
		/* mv.addObject("address", address); */
        
		/*
		 * System.out.println("mv: " + mv);
		 */
        System.out.println("listSize: " + listSize);
        
		/* System.out.println("address: " + address); */
        
        
        return mv;
    }
    
    
    @RequestMapping(value = "/test")
    public ModelAndView test(@ModelAttribute("reservationDO") ReservationDO reservationDO, HttpSession session) throws Exception {

    	ModelAndView mv = new ModelAndView("/mypage/test");
    	
        List<ReservationDO> list = mypageService.myReservationList((String)session.getAttribute("userId"));
        
        int listSize = list.size();
        
		
		List<String> address = list.stream()
				.map(ReservationDO::getReservationPlaceAddress).collect(Collectors.toList());
		 
        
        for(int i = 0; i < listSize; i++) {
        	mv.addObject("address", address.get(i));
        	System.out.println("address.get(" + i + ") : " + address.get(i));
        }
        
        for(int i=0; i< listSize; i++) {
        	System.out.println("add(" + i + ") : " + list.get(i));
        }
        											
        
        /*
        for(String add : address) {
        	System.out.println("address: " + add);
        }
        */
        
		/* mv.addObject("add", list.get(0).getReservationPlaceAddress()); */
        
        
		mv.addObject("testList", list); 
        mv.addObject("listSize", listSize);
        
        
		/* mv.addObject("address", address); */
        
		/*
		 * System.out.println("mv: " + mv);
		 */
        System.out.println("listSize: " + listSize);
        
		/* System.out.println("address: " + address); */
        
        
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
