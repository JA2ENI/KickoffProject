package com.teamcommit.kickoff.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.teamcommit.kickoff.Do.EmployerDO;
import com.teamcommit.kickoff.Do.UserDO;
import com.teamcommit.kickoff.Service.admin.AdminService;

@Controller
public class AdminController {

    @Autowired
    @Qualifier("AdminService")
    private AdminService adminService;

    // 회원 목록
    @RequestMapping( "/userManagement")
    public String userManagement(@ModelAttribute("userDO") UserDO userDO, @ModelAttribute("empDO") EmployerDO empDO, HttpServletRequest request, HttpSession session) throws Exception {
    	
    	String view = "/admin/userManagement";

        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("userDO", userDO);
        paramMap.put("empDO", empDO);
        
        List<Map<String, Object>> userList = adminService.getList(paramMap);
        session.setAttribute("userList", userList);

        return view;
    }

    // 회원 탈퇴 기능
    @RequestMapping("/deleteUser")
    public String deleteUser(@RequestParam("id") String id,
            				 @RequestParam("userType") String userType) throws Exception {
		String view = "redirect:/userManagement";
		
		if (userType.equals("user")) {
			adminService.user_delete(id); // 일반 회원 탈퇴 처리
		} else if (userType.equals("emp")) {
			adminService.emp_delete(id); // 업체 회원 탈퇴 처리
		}
		
			return view;
		}

    // 신고 게시물 관리 페이지 이동
    @GetMapping("/boardManagement")
    public String boardList() {
        String view = "/admin/boardManagement";

        return view;
    }

}
