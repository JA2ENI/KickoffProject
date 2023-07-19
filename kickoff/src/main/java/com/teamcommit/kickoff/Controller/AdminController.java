package com.teamcommit.kickoff.Controller;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.teamcommit.kickoff.Do.EmployerDO;
import com.teamcommit.kickoff.Do.ReportDO;
import com.teamcommit.kickoff.Do.UserDO;
import com.teamcommit.kickoff.Service.admin.AdminService;

@Controller
public class AdminController {

    @Autowired
    @Qualifier("AdminService")
    private AdminService adminService;

    // 회원 목록
    @RequestMapping( "/userManagement")
    public String userManagement(@ModelAttribute("userDO") UserDO userDO,
    							 @ModelAttribute("empDO") EmployerDO empDO, HttpSession session) throws Exception {
    	
    	String view = "/admin/userManagement";

        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("userDO", userDO);
        paramMap.put("empDO", empDO);
        
        List<Map<String, Object>> userList = adminService.memberList(paramMap);
        session.setAttribute("userList", userList);

        return view;
    }

    // 회원 정지, 탈퇴 기능
	@RequestMapping("/manageMember")
    public String manageMember(@RequestParam("id") String id,
            				   @RequestParam("userType") String userType,
            				   @RequestParam(value = "action", required = false) String action,
            				   @RequestParam(value = "userStopDate", required = false) String userStopDate,
            				   @RequestParam(value = "empStopDate", required = false) String empStopDate) throws Exception {
    	
		String view = "redirect:/userManagement";
		
		if (userType.equals("user")) {
			if(action != null && action.equals("disable")) {
				// 개인 회원 정지 처리
				adminService.user_disable(id);
				
				if(userStopDate != null && LocalDate.parse(userStopDate).equals(LocalDate.now().plusDays(1))) {
					// 개인 회원 정지 취소 처리
					adminService.user_activate(id);
				}
			} else {
				// 개인 회원 탈퇴 처리
				adminService.user_delete(id);
			}

			
		} else if (userType.equals("emp")) {
			if(action != null && action.equals("disable")) {
				// 업체 회원 정지 처리
				adminService.emp_disable(id);
				
				if(empStopDate != null && LocalDate.parse(empStopDate).equals(LocalDate.now().plusDays(1))) {
					// 업체 회원 정지 취소 처리
					adminService.emp_activate(id);
				}
			} else {
				// 업체 회원 탈퇴 처리
				adminService.emp_delete(id);
			}

		}
		
			return view;
	}
    
    // 회원 정지 취소
    @RequestMapping("/cancelDisable")
    public String cancelDisable(@RequestParam(value = "userId", required = false) String userId,
            					@RequestParam(value = "empId", required = false) String empId) throws Exception {
    	String view = "redirect:/userManagement";
    	
    	if(userId != null) {    		
    		adminService.user_cancel_disable(userId);
    	} else if(empId != null) {
    		adminService.emp_cancel_disable(empId);
    	}
    	
    	return view;
    }
    
    // 신고 게시물 관리 페이지 이동 & 리스트
    @RequestMapping("/boardManagement")
    public String boardList(Model model, ReportDO reportDO) throws Exception {
        String view = "/admin/boardManagement";
        
        List<ReportDO> reportList = adminService.reportBoardList(reportDO);
        model.addAttribute("reportList", reportList);
        
        return view;
    }

    // 신고된 게시물 삭제
    @RequestMapping("/deleteReport")
    public String deleteReport(@RequestParam("boardSeqno") int boardSeqno) throws Exception {
    	String view = "redirect:/boardManagement";
    	
    	adminService.deleteReport(boardSeqno);
    	adminService.deleteBoard(boardSeqno);
    	
    	return view;
    }
}
