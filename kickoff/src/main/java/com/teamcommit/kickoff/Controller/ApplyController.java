package com.teamcommit.kickoff.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamcommit.kickoff.Do.HelperDO;
import com.teamcommit.kickoff.Do.PlaceDO;
import com.teamcommit.kickoff.Do.ReservationDO;
import com.teamcommit.kickoff.Do.UserDO;
import com.teamcommit.kickoff.Service.apply.ApplyService;
import org.json.*;

import edu.emory.mathcs.backport.java.util.Arrays;


@Controller
public class ApplyController {

	@Autowired
	ApplyService applyService;
	
	@RequestMapping(value="/applyList")
	public String applyList(HttpServletRequest request, HttpSession session) throws Exception {
		String view = "/apply/applyList";
		String parameter = request.getParameter("page");
		session.removeAttribute("msg");
		
		if(parameter != null) {
			if(!parameter.equals("reservation") && !parameter.equals("game") && !parameter.equals("team") && !parameter.equals("helper")) {
				session.setAttribute("msg", "alert('유효하지 않는 요청입니다.');");
				view = "redirect:/applySelect";
				return view;
			}
			session.setAttribute("page", parameter);
			view = "/apply/applySelect";
			return view;
		} 
		
		return view;
	}
	
	@RequestMapping(value="/applySelect")
	public String applySelectList(HttpServletRequest request, HttpSession session) throws Exception {
		String view = "/apply/applySelect"; 
		String page = (String)session.getAttribute("page");
		
		if(page != null) {
			String num = request.getParameter("num");
			if(num != null) {
				if(num.equals("1")) {
					if(page.equals("reservation")) {
						view = "redirect:/applyReservationApplicant";
						return view;
					} else if(page.equals("game")) {
						view = "redirect:/applyGameApplicant";
						return view;
					} else if(page.equals("team")) {
						view = "redirect:/applyTeamApplicant";
						return view;
					} else 	if(page.equals("helper")) {
						view = "redirect:/applyHelperApplicant";
						return view;
					}
				} else if(num.equals("2")) {
					if(page.equals("reservation")) {
						view = "redirect:/applyReservationRecruiter";
						return view;
					} else if(page.equals("game")) {
						view = "redirect:/applyGameRecruiter";
						return view;
					} else if(page.equals("team")) {
						view = "redirect:/applyTeamRecruiter";
						return view;
					} else 	if(page.equals("helper")) {
						view = "redirect:/applyHelperRecruiter";
						return view;
					}
				} 
			}
		}
		
		return view;
	}
	
	/* '예약 신청' 다른 파일에서 작업중 */
	
/*	
	//에약 신청자 페이지 
	@RequestMapping(value="")
	public String applyReservationApplicant(HttpSession session) throws Exception {
		String view = "/apply/applyReservationApplicant";
		
		return view;
	}
	
	//예약 모집자 페이지 
	@RequestMapping(value="")
	public String applyReservationRecruiter(HttpSession session, Model model) throws Exception {
		String view = "/apply/applyReservationRecruiter";
		String empId = (String)session.getAttribute("empId");
		
		if(empId != null) {
			PlaceDO placeInfo = applyService.placeInfo(empId);
			List<ReservationDO> reservation = applyService.reservationList(empId);
			
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
*/	
	
	//매칭 신청자 페이지 
	@RequestMapping(value="/applyGameApplicant")
	public String applyGameApplicant() throws Exception {
		String view = "/apply/applyGameApplicant";
		
		return view;
	}
	
	//매칭 모집자 페이지 
	@RequestMapping(value="/applyGameRecruiter")
	public String applyGameRecruiter(HttpSession session) throws Exception {
		String view = "/apply/applyGameRecruiter";
		
		return view;
	}
		
	//팀 신청자 페이지 
	@RequestMapping(value="/applyTeamApplicant")
	public String applyTeamApplicant() throws Exception {
		String view = "/apply/applyTeamApplicant";
		
		return view;
	}
	
	//팀 모집자 페이지 
	@RequestMapping(value="/applyTeamRecruiter")
	public String applyTeamRecruiter(HttpSession session) throws Exception {
		String view = "/apply/applyTeamRecruiter";
		
		return view;
	}
	
	//용병 신청자 페이지 
	@RequestMapping(value="/applyHelperApplicant")
	public String applyHelperApplicant() throws Exception {
		String view = "/apply/applyHelperApplicant";
		
		return view;
	}
	
	//용병 모집자 페이지 
	@RequestMapping(value="/applyHelperRecruiter", method = RequestMethod.GET)
	public String applyHelperRecruiter(HttpSession session, Model model) throws Exception {
		String view = "/apply/applyHelperRecruiter";
		
		try {
			List<HelperDO> applySelect = applyService.helperUserSelect((String)session.getAttribute("userId"));
			int accept = applyService.countAccept();
			for(int i = 0; i < applySelect.size(); i++) {
				HelperDO helper = applySelect.get(i);
				List<UserDO> userSelect = applyService.helperApplyUser(helper.getHelperSeqno());
				model.addAttribute("applyUser" + i, userSelect);
				System.out.println(model.getAttribute("applyUser" + i));
			}
			model.addAttribute("helperSelect", applySelect);
			model.addAttribute("applyAccept", accept);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return view;
	}
	
	//용병 모집자 페이지, 수락 거절 했을 때 결과 json 만들기(예정)
		@RequestMapping(value="/applyHelperRecruiter", method = RequestMethod.POST)
		@ResponseBody
		public String applyHelperRecruiter(HttpSession session, Model model, String helper) throws Exception {
			JSONArray array = new JSONArray();

			try {
				List<HelperDO> applySelect = applyService.helperUserSelect((String)session.getAttribute("userId"));
				int accept = applyService.countAccept();
				for(HelperDO helperDO : applySelect) {
					JSONObject obj = new JSONObject();
					obj.put("helperStatus", helperDO.getHelperStatus());
					obj.put("helperTime", helperDO.getHelperTime());
					obj.put("helperPlaceName", helperDO.getHelperPlaceName());
					obj.put("applyAccept", accept);
					obj.put("helperWant", helperDO.getHelperWant());
					obj.put("helperGender", helperDO.getHelperGender());
					obj.put("helperPosition", helperDO.getHelperPosition());
					array.put(obj);
				}
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			
			return array.toString();
		}
	
}
