package com.teamcommit.kickoff.Temporary;

import java.util.List;

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
	TempService teampService;
	
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
			PlaceDO placeInfo = teampService.placeInfo(empId);
			List<ReservationDO> reservation = teampService.reservationList(empId);
			
			for(int i=0; i<reservation.size(); i++) {
				String getDate = reservation.get(i).getReservationDate();
				System.out.println(reservation.get(i).getReservationDate());
				
				String year = getDate.substring(0, 4);
				String month = getDate.substring(5, 7);
				String day = getDate.substring(8, 10);
			}
			
			model.addAttribute("placeInfo", placeInfo);
			model.addAttribute("reservationList", reservation);
		}
		
		return view;
	}
	
}
