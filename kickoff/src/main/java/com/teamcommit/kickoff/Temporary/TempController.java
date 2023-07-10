package com.teamcommit.kickoff.Temporary;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.teamcommit.kickoff.Do.PlaceDO;
import com.teamcommit.kickoff.Do.ReservationDO;

@Controller
public class TempController {

	@Autowired
	TempService tempService;
	
	//에약 신청자 페이지 
	@RequestMapping(value="/applyReservationApplicant")
	public String applyReservationApplicant(HttpSession session) throws Exception {
		String view = "/apply/applyReservationApplicant";
		
		return view;
	}
	
	//예약 모집자 페이지 
	@RequestMapping(value="/applyReservationRecruiter")
	public ModelAndView applyReservationRecruiter(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/apply/applyReservationRecruiter");
		String empId = (String)session.getAttribute("empId");
		
		PlaceDO placeInfo = tempService.placeInfo(empId);
		List<Map<String, String>> rList = tempService.reservationList(empId);
		List<Map<String, String>> aList = new ArrayList<>();
		
		for(Map<String, String> map : rList) {
			List<Map<String, String>> applyList = tempService.applyInfoList(String.valueOf(map.get("RESERVATION_NO")));
			
			for(Map<String, String> map2 : applyList) {
				aList.add(map2);
			}
			
		}
		
		mv.addObject("placeInfo", placeInfo);
		mv.addObject("reservationList", rList);
		mv.addObject("applyList", aList);
		
		return mv;
	}

	/* Side Bar */
	@ResponseBody
	@RequestMapping(value="/aUserInfo", method=RequestMethod.POST)
	public Map<String, String> aUserInfo(@RequestBody Map<String, String> map) throws Exception {
		Map<String, String> userInfo = new HashMap<>();
		userInfo = tempService.userInfo(map);
		userInfo.put("rNum", map.get("rNum"));

		return userInfo;
	}
	
	/* 수락 & 거절 */
	@ResponseBody
	@RequestMapping(value="/applyStatus", method=RequestMethod.POST)
	public Map<String, String> applyStatus(@RequestBody Map<String, String> map) throws Exception {
		Map<String, String> userInfo = new HashMap<>();
		userInfo = tempService.updateApplyStatus(map);
		userInfo.put("CHECK", map.get("check"));
		
		return userInfo;
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/applyMarkList", method=RequestMethod.POST)
	public List<Map<String, Object>> applyMarkList(@RequestBody Map<String, String> map) throws Exception {
		List<Map<String, Object>> userInfo = new ArrayList<>();
		userInfo = tempService.applyMarkList(map.get("empId"));
		
		for(int i=0; i<userInfo.size(); i++) {
			System.out.println("userInfo : " + userInfo.get(i));
		}
		
		return userInfo;
	}
	
}
