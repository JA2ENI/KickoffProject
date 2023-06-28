package com.teamcommit.kickoff.Temporary;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String applyReservationRecruiter(HttpSession session, Model model) throws Exception {
		String view = "/apply/applyReservationRecruiter";
		String empId = (String)session.getAttribute("empId");
		
		if(empId != null) {
			PlaceDO placeInfo = tempService.placeInfo(empId);
			List<ReservationDO> reservation = tempService.reservationList(empId);
			//List<ReservationDO> reservation = tempService.reservationList(empId);
			
			List<HashMap<String, String>> listMap = new ArrayList<HashMap<String, String>>();
			
			for(int i=0; i<reservation.size(); i++) {
				HashMap<String, String> map = new HashMap<>();
				String getDate = reservation.get(i).getReservationDate();
				String year = getDate.substring(0, 4); 
				String month = getDate.substring(5, 7); 
				String day = getDate.substring(8, 10); 
				String date = year + "년 " + month + "월 " + day + "일";
				
				int year2 = (Integer.parseInt(year));
				int month2 = (Integer.parseInt(month));
				int day2 = (Integer.parseInt(day));
				
				LocalDate localDate = LocalDate.of(year2, month2, day2);
				
				DayOfWeek getDayOfWeek = localDate.getDayOfWeek();
				
				String dayOfWeek = getDayOfWeek.getDisplayName(TextStyle.FULL, Locale.KOREAN);
				
				
				map.put("rDate", date);
				map.put("rDayOfWeek", dayOfWeek);
				map.put("rStartTime", reservation.get(i).getReservationStartTime());
				map.put("rEndTime", reservation.get(i).getReservationEndTime());
				map.put("rPlaceName", reservation.get(i).getReservationPlaceName());
				map.put("rCourtName", reservation.get(i).getReservationCourtName());
				map.put("rPlaceGround", reservation.get(i).getReservationPlaceGround());
				map.put("rHeadcount", reservation.get(i).getReservationHeadcount());
				map.put("rPlaceSize", reservation.get(i).getReservationPlaceSize());
				
				
			/*	
				System.out.println("map : " + map);
				System.out.println("rDate : " + map.get("rDate"));
			*/
				listMap.add(map);
				
				System.out.println("=====================================================");
				System.out.println("listMap : " + listMap);
				System.out.println("listMap.get(" + i + ") : " + listMap.get(i));
				System.out.println("get(" + i + ").get(\"rDate\") : " + listMap.get(i).get("rDate"));
				System.out.println("get(" + i + ").get(\"rDayOfWeek\") : " + listMap.get(i).get("rDayOfWeek"));
				System.out.println("get(" + i + ").get(\"rStartTime\") : " + listMap.get(i).get("rStartTime"));
				System.out.println("get(" + i + ").get(\"rEndTime\") : " + listMap.get(i).get("rEndTime"));
				System.out.println("get(" + i + ").get(\"rPlaceName\") : " + listMap.get(i).get("rPlaceName"));
				System.out.println("get(" + i + ").get(\"rCourtName\") : " + listMap.get(i).get("rCourtName"));
				
			}
			
			System.out.println("listMap.size() : " + listMap.size());
			System.out.println("=========================  END  ============================");
			
			
			/*
			  for(int i=0; i<reservation.size(); i++) { 
				  String getDate = reservation.get(i).getReservationDate();
				  System.out.println(reservation.get(i).getReservationDate());
			  
				  String year = getDate.substring(0, 4); 
				  String month = getDate.substring(5, 7); 
				  String day = getDate.substring(8, 10); 
				  String reservationDate = year + "년 " + month + "월 " + day + "일";
			  
				  System.out.println("reservationDate : " + reservationDate);
			  }
			 */
			
			model.addAttribute("placeInfo", placeInfo);
			model.addAttribute("reservationList", listMap);
		}
		
		return view;
	}
	
}
