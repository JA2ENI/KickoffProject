package com.teamcommit.kickoff.Controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.teamcommit.kickoff.Common.Pagination;
import com.teamcommit.kickoff.Do.HelperDO;
import com.teamcommit.kickoff.Do.PlaceDO;
import com.teamcommit.kickoff.Do.ReservationDO;
import com.teamcommit.kickoff.Do.UserDO;
import com.teamcommit.kickoff.Service.apply.ApplyService;
import org.json.*;

@Controller
public class ApplyController {

	@Autowired
	ApplyService applyService;
	
	@RequestMapping(value="/applyList")
	public ModelAndView applyList(HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/apply/applyList");
		
		try {
			String parameter = request.getParameter("page");
			if(parameter != null) {
				if(session.getAttribute("userId") != null || session.getAttribute("empId") != null) {
					if(!parameter.equals("reservation") && !parameter.equals("game") && !parameter.equals("team") && !parameter.equals("helper")) {
						mv.addObject("msg", "msg");
					}
					session.setAttribute("page", parameter);
					mv.setViewName("/apply/applySelect");
					return mv;
				} else {
					mv.addObject("msg", "login");
					mv.setViewName("/apply/applySelect");
					return mv;
				}
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	@RequestMapping(value="/applySelect")
	public String applySelectList(HttpServletRequest request, HttpSession session) throws Exception {
		String view = "/apply/applySelect"; 
		
		try {
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
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return view;
	}
	
	/* 예약 신청자&모집자 페이지 : 안재은 */
	@RequestMapping(value="/applyReservationApplicant")
	public ModelAndView applyReservationApplicant(@ModelAttribute("reservationDO")ReservationDO rDO, @RequestParam(defaultValue="1")int curPage, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/apply/applyReservationApplicant");
		
		try {
			if(session.getAttribute("userId") != null || session.getAttribute("empId") != null) {
				String userId = (String)session.getAttribute("userId");
				int aListCnt = applyService.myApplyListCount(userId);
				int pageSize = 5;
				Pagination pagination = new Pagination(aListCnt, curPage, pageSize);
				rDO.setStartIndex(pagination.getStartIndex());
				rDO.setEndIndex(pagination.getEndIndex());
				rDO.setUserId(userId);
				
				Map<String, String> selectUserInfo = applyService.selectUserInfo(userId);
				List<ReservationDO> myApplyList = applyService.myApplyList(rDO);
				
				mv.addObject("userInfo", selectUserInfo);
				mv.addObject("myApplyList", myApplyList);
				mv.addObject("pagination", pagination);
			} else {
				mv.addObject("msg", "login");
				mv.setViewName("/apply/applySelect");
				return mv;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	//예약 모집자 페이지 : 안재은
	@ResponseBody
	@RequestMapping(value="/applyReservationRecruiter")
	public ModelAndView applyReservationRecruiter(@ModelAttribute("reservationDO")ReservationDO rDO, @RequestParam(defaultValue="1")int curPage, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/apply/applyReservationRecruiter");
		
		try {
			if(session.getAttribute("userId") == null && session.getAttribute("empId") != null) {
				String empId = (String)session.getAttribute("empId");
				int rListCnt = applyService.empReservationListCount(empId);
				int pageSize = 5;
				Pagination pagination = new Pagination(rListCnt, curPage, pageSize);
				rDO.setStartIndex(pagination.getStartIndex());
				rDO.setEndIndex(pagination.getEndIndex());
				rDO.setEmpId(empId);
				
				PlaceDO placeInfo = applyService.placeInfo(empId);
				List<Map<String, String>> rList = applyService.empReservationList(rDO);
				List<Map<String, String>> aList = new ArrayList<>();
				
				for(Map<String, String> map : rList) {
					List<Map<String, String>> applyList = applyService.userReservationList(String.valueOf(map.get("RESERVATION_NO")));
					for(Map<String, String> map2 : applyList) {
						aList.add(map2);
					}
				}
			
				mv.addObject("placeInfo", placeInfo);
				mv.addObject("empRList", rList);
				mv.addObject("userRList", aList);
				mv.addObject("pagination", pagination);
			} else {
				mv.addObject("msg", "emp");
				mv.setViewName("/apply/applySelect");
				return mv;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mv;
	}
	
	/* Side Bar */
	@ResponseBody
	@RequestMapping(value="/aUserInfo", method=RequestMethod.POST)
	public Map<String, String> aUserInfo(@RequestBody Map<String, String> map) {
		Map<String, String> userInfo = applyService.userInfo(map);
		userInfo.put("rNum", map.get("rNum"));
		
		return userInfo;
	}
	
	/* 수락&거절, 신청취소 */
	@ResponseBody
	@RequestMapping(value="/updateApplyStatus", method=RequestMethod.POST)
	public Map<String, String> updateApplyStatus(@RequestBody Map<String, String> map) {
		applyService.updateApplyStatus(map);
		
		return map;
	}
	
	/* Status Mark */
	@ResponseBody
	@RequestMapping(value="/applyMarkList", method=RequestMethod.POST)
	public List<Map<String, Object>> applyMarkList(@RequestBody Map<String, String> map) {
		List<Map<String, Object>> applyMarkList = applyService.applyMarkList(map);
		
		return applyMarkList;
	}
	/* 예약 신청자&모집자 페이지 END */
	
	
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
	
//	//팀 모집자 페이지 
//	@RequestMapping(value="/applyTeamRecruiter")
//	public String applyTeamRecruiter(HttpSession session) throws Exception {
//		String view = "/apply/applyTeamRecruiter";
//		
//		return view;
//	}
	
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
			List<HelperDO> applySelect = applyService.helperUserSelect((String)session.getAttribute("userId")); // 모집 목록
			int accept = applyService.countAccept(); // 수락 인원 체크
			Map<String, String> recruiter = applyService.recruiterMap((String)session.getAttribute("userId"));
			List<ArrayList<UserDO>> userSelect = new ArrayList<ArrayList<UserDO>>();
			for(int i = 0; i < applySelect.size(); i++) {
				HelperDO helper = applySelect.get(i);
				userSelect.add(i, applyService.helperApplyUser(helper.getHelperSeqno())); // 신청자 목록
			}
			model.addAttribute("helperSelect", applySelect);
			model.addAttribute("applyAccept", accept);
			model.addAttribute("applyUser", userSelect);
			model.addAttribute("recruiterUser", recruiter);
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
