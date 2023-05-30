package com.teamcommit.kickoff.Controller;

import com.teamcommit.kickoff.Do.EmployerDO;
import com.teamcommit.kickoff.Do.UserDO;
import com.teamcommit.kickoff.Service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
public class LoginController {

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

    @Resource(name="loginService")
    private LoginService loginService;


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

    // 아이디 찾기
    @RequestMapping(value = {"/findUser", "/findEmp"})
    public ModelAndView find_id(HttpServletRequest request, Model model,
                                @RequestParam(required = true, value = "userName") String userName,
                                @RequestParam(required = true, value = "userPhoneNumber") String userPhoneNumber,
                                @RequestParam(required = true, value = "empName") String empName,
                                @RequestParam(required = true, value = "empNo") String empNo,
                                UserDO userDO, EmployerDO empDO) {

        if (userDO.getUserName() != null && userDO.getUserPhoneNumber() != null) {
            userDO.setUserName(userName);
            userDO.setUserPhoneNumber(userPhoneNumber);

            UserDO userResult = this.loginService.findUser_id(userDO);
            model.addAttribute("useDO", userResult);
        } else if(empDO.getEmpName() != null && empDO.getEmpNo() != null) {
            empDO.setEmpName(empName);
            empDO.setEmpNo(empNo);

            EmployerDO empResult = this.loginService.findEmp_id(empDO);
            model.addAttribute("empDO", empResult);
        }

        // 아이디 보여주는 페이지로 이동
        ModelAndView mv = new ModelAndView("/login/findId");
        return mv;
    }

    // 아이디 찾기 페이지 이동
    @RequestMapping("/findId")
    public String findId() {
        String view = "/login/findId";

        return view;
    }

    // 비밀번호 찾기 페이지 이동
    @RequestMapping("/findPw")
    public String findPw() {
        String view = "/login/findPw";

        return view;
    }
}
