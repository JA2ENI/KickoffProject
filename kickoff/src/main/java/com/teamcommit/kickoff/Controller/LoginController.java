package com.teamcommit.kickoff.Controller;


import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.teamcommit.kickoff.Do.EmployerDO;
import com.teamcommit.kickoff.Do.UserDO;
import com.teamcommit.kickoff.Service.login.LoginService;
import com.teamcommit.kickoff.Service.login.CertificationService;



@Controller
public class LoginController {
	
	@Resource(name="loginService")
    private LoginService loginService;

//    @Autowired
//    private AccountService accountService;
//
//    @RequestMapping(value = "/account/register", method = RequestMethod.GET)
//    public String register() {
//
//        return "/account/register";
//    }
//
//    @RequestMapping(value = "/account/login", method = RequestMethod.GET)
//    public String login() {
//
//        return "/account/login";
//    }

    
    @GetMapping("/loginAgree")
    public String loginAgree() {
        String view = "/login/loginAgree";

        return view;
    }

    @GetMapping("/loginAgreeEmp")
    public String loginAgreeEmp() {
        String view = "/login/loginAgreeEmp";

        return view;
    }

    @GetMapping("/Signup")
    public String Signup() {
        String view = "/login/Signup";

        return view;
    }

    @GetMapping("/SignupEmp")
    public String SignupEmp() {
        String view = "/login/SignupEmp";

        return view;
    }
    
    // 로그인 페이지 이동
    @GetMapping("/loginAll")
    public String loginAll() {
        String view = "/login/loginAll";

        return view;
    }

    // 로그인 요청
    @RequestMapping("/loginAll")
    public ModelAndView login(@RequestParam(value = "userId", required = false) String userId,
                              @RequestParam(value = "userPw", required = false) String userPw,
                              @RequestParam(value = "empId", required = false) String empId,
                              @RequestParam(value = "empPw", required = false) String empPw,
                              HttpSession session, Model model, HttpServletRequest request) throws Exception {
        if (userId != null && userPw != null) {
            // 회원 로그인 처리
            UserDO userDO = new UserDO();
            userDO.setUserId(userId);
            userDO.setUserPw(userPw);
            UserDO result = this.loginService.member_login(userDO);

            if (result != null) {
                ModelAndView mv = new ModelAndView("redirect:/main");
                session.setAttribute("userId", result.getUserId());
                session.removeAttribute("empId");
                return mv;
            }
        } else if (empId != null && empPw != null) {
            // 업체 로그인 처리
            EmployerDO empDO = new EmployerDO();
            empDO.setEmpId(empId);
            empDO.setEmpPw(empPw);
            EmployerDO result = this.loginService.emp_login(empDO);
            
            if (result != null) {
                ModelAndView mv = new ModelAndView("redirect:/main");
                session.setAttribute("empId", result.getEmpId());
                session.removeAttribute("userId");
                return mv;
            }
        }

        // 로그인 실패 시 로그아웃 처리
        ModelAndView mv = new ModelAndView("redirect:/loginAll");
        session.removeAttribute("userId");
        session.removeAttribute("empId");
        return mv;
    }


    // 로그아웃
    @GetMapping("/logout")
    public ModelAndView logout(HttpSession session) {
        session.removeAttribute("userId");
        session.removeAttribute("empId");
        ModelAndView mv = new ModelAndView("redirect:/main");
        return mv;
    }


    // 개인 회원 아이디,비밀번호 찾기 페이지 이동
    @GetMapping("/findUser")
    public String findUser() {
        String view = "/login/findUser";

        return view;
    }

    // 업체 회원 아이디,비밀번호 찾기 페이지 이동
    @GetMapping("/findEmp")
    public String findEmp() {
        String view = "/login/findEmp";

        return view;
    }
    
    // coolsms api
    @GetMapping("/check/sendSMS")
    public @ResponseBody String sendSMS(String phoneNumber) {

    	// 4자리 난수 생성
        Random rand  = new Random();
        String numStr = "";
        for(int i=0; i<4; i++) {
            String ran = Integer.toString(rand.nextInt(10));
            numStr+=ran;
        }
        // CertificationService를 사용하여 SMS 전송
        CertificationService.certifiedPhoneNumber(phoneNumber,numStr);
        
        // 생성된 4자리 난수 반환
        return numStr;
    }
    
    
    // 개인 회원 아이디 찾기
    @RequestMapping("/findUserId")
    public ModelAndView findUserId(HttpServletRequest request, Model model,
                                @RequestParam(required = true, value = "userName") String userName,
                                UserDO userDO) {

        if (userDO.getUserName() != null) {
        	userDO.setUserName(userName);

            UserDO userIdResult = this.loginService.findUser_id(userDO);
            model.addAttribute("userDO", userIdResult);
        }

        // 아이디 찾기 결과 페이지로 이동
        ModelAndView mv = new ModelAndView("/login/findUserId");
        return mv;
    }
    
    // 업체 회원 아이디 찾기
    @RequestMapping("/findEmpId")
    public ModelAndView findEmpId(HttpServletRequest request, Model model,
                                @RequestParam(required = true, value = "empName") String empName,
                                @RequestParam(required = true, value = "empNo") String empNo,
                                EmployerDO empDO) {

        if (empDO.getEmpName() != null && empDO.getEmpNo() != null) {
        	 empDO.setEmpName(empName);
             empDO.setEmpNo(empNo);

             EmployerDO empIdResult = this.loginService.findEmp_id(empDO);
             model.addAttribute("empDO", empIdResult);
        }
        
        // 아이디 찾기 결과 페이지로 이동
        ModelAndView mv = new ModelAndView("/login/findEmpId");
        return mv;
    }
    
    // 개인 회원 비밀번호 찾기
    @RequestMapping("/findUserPw")
    public ModelAndView findUserPw(HttpServletRequest request, Model model,
                                @RequestParam(required = true, value = "userId") String userId,
                                UserDO userDO) {

        if (userDO.getUserId() != null) {
        	userDO.setUserId(userId);

            UserDO userPwResult = this.loginService.findUser_pw(userDO);
            model.addAttribute("userDO", userPwResult);
        }

        // 비밀번호 찾기 결과 페이지로 이동
        ModelAndView mv = new ModelAndView("/login/findUserPw");
        return mv;
    }
    
    // 업체 회원 비밀번호 찾기
    @RequestMapping("/findEmpPw")
    public ModelAndView findEmpPw(HttpServletRequest request, Model model,
                                @RequestParam(required = true, value = "empId") String empId,
                                @RequestParam(required = true, value = "empNo") String empNo,
                                EmployerDO empDO) {

        if (empDO.getEmpId() != null && empDO.getEmpNo() != null) {
        	 empDO.setEmpId(empId);
             empDO.setEmpNo(empNo);

             EmployerDO empPwResult = this.loginService.findEmp_pw(empDO);
             model.addAttribute("empDO", empPwResult);
        }
        
        // 비밀번호 찾기 결과 페이지로 이동
        ModelAndView mv = new ModelAndView("/login/findEmpPw");
        return mv;
    }
    

}
