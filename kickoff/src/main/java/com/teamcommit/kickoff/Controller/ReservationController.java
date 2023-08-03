package com.teamcommit.kickoff.Controller;

import com.teamcommit.kickoff.Common.Pagination;
import com.teamcommit.kickoff.Do.PlaceDO;
import com.teamcommit.kickoff.Do.ReservationDO;

import com.teamcommit.kickoff.Service.reservation.ReservationService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ReservationController {

    @Autowired
    private ReservationService reservationService;

    @RequestMapping(value = "/reservation")
    public String reservationList(Model model, @ModelAttribute("reservationDO")ReservationDO rDO, @RequestParam(defaultValue="1") int curPage) throws Exception {
        String view = "/reservation/reservation";
        
        try {
	        reservationValidationDate();
	        int listCnt = reservationService.reservationListCount();
	        int pageSize = 12;
	        Pagination pagination = new Pagination(listCnt, curPage, pageSize);
	        rDO.setStartIndex(pagination.getStartIndex());
	        rDO.setEndIndex(pagination.getEndIndex());
	        
	        List<Map<String, String>> list = reservationService.selectReservationList(rDO);
	        
	        model.addAttribute("listCnt", listCnt);
	        model.addAttribute("reservationList", list);
	        model.addAttribute("pagination", pagination);
        } catch (Exception e) {
        	e.printStackTrace();
		}

        return view;
    }

    @RequestMapping(value = "/reservationInsertForm")
    public String reservationInsertForm(HttpSession session, Model model) throws Exception {
        String view = "/reservation/reservationInsert";
        
        try {
	        String empId = (String)session.getAttribute("empId");
	        PlaceDO placeInfo = reservationService.selectPlaceInfo(empId);
	        model.addAttribute("placeInfo", placeInfo);
        } catch (Exception e) {
        	e.printStackTrace();
		}
        
        return view;
    }

    @RequestMapping(value = "/reservationInsert")
    public ModelAndView reservationInsert(@ModelAttribute("reservationDO")ReservationDO rDO) throws Exception {
        ModelAndView mv = new ModelAndView("redirect:/reservation");
        
        try {
        	reservationService.insertReservation(rDO);
        } catch (Exception e) {
        	e.printStackTrace();
		}
        
        return mv;
    }

    @RequestMapping(value = "/reservationDetail")
    public String reservationDetail(@RequestParam("reservationNo") int rNum, Model model) throws Exception {
        String view = "/reservation/reservationDetail";
        
        try {
	        Map<String, String> reservationDetail = reservationService.selectReservationDetail(rNum);
	        
	        String date = reservationDetail.get("RESERVATION_DATE");
	        String year = date.substring(0, 4) + "년 ";
	        String month = date.substring(5, 7) + "월 ";
	        String day = date.substring(8, 10) + "일";
	        date = year + month + day;
	        reservationDetail.put("RESERVATION_DATE", date);
	        
	        model.addAttribute("rDetail", reservationDetail);
        } catch (Exception e) {
        	e.printStackTrace();
		}
        
        return view;
    }

    @RequestMapping(value = "/reservationUpdateForm")
    public String reservationUpdateForm(@RequestParam("reservationNo") int rNum, Model model) throws Exception {
        String view = "/reservation/reservationUpdate";
        
        try {
	        Map<String, String> reservationDetail = reservationService.selectReservationDetail(rNum);
	        model.addAttribute("rUpdate", reservationDetail);
        } catch (Exception e) {
        	e.printStackTrace();
		}
        
        return view;
    }

    @RequestMapping(value="/reservationUpdate")
    public ModelAndView reservationUpdate(@ModelAttribute("reservationDO")ReservationDO rDO, @RequestParam("reservationNo") int rNum) throws Exception {
        ModelAndView mv = new ModelAndView("redirect:/reservationDetail?reservationNo="+rNum);
    	
        try {
        	reservationService.updateReservation(rDO);
        } catch (Exception e) {
        	e.printStackTrace();
		}

        return mv;
    }

    @RequestMapping(value = "/reservationRequestForm")
    public String reservationRequestForm(@RequestParam("reservationNo")String rNum, HttpSession session, Model model) throws Exception {
        String view = "/reservation/reservationRequest";
        
        try {
	        Map<String, String> map = new HashMap<>();
	        map.put("rNum", rNum);
	        map.put("userId", (String)session.getAttribute("userId"));
	
	        Map<String, String> reservationRequest = reservationService.selectReservationRequest(map);
	        model.addAttribute("rRequest", reservationRequest);
        } catch (Exception e) {
        	e.printStackTrace();
		}
        
        return view;
    }
    
    @RequestMapping(value = "/reservationRequest")
    public ModelAndView reservationRequest(@ModelAttribute("reservationDO")ReservationDO rDO) throws Exception {
        ModelAndView mv = new ModelAndView("redirect:/reservation");
        
        try {
        	reservationService.insertReservationRequest(rDO);
        } catch (Exception e) {
        	e.printStackTrace();
		}
        
        return mv;
    }
    
	/* 예약 시간 3시간 전까지 '예약 완료'가 아닌 경우 -> 모집글 & 해당 글 신청자 모두 예약 취소 상태로 변경 */
    @RequestMapping(value = "/reservationValidationDate")
    public void reservationValidationDate() throws Exception {
    	try {
    		reservationService.reservationValidationDate();
    	} catch (Exception e) {
        	e.printStackTrace();
		}
    }
    
}






