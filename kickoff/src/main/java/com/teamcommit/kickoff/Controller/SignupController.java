package com.teamcommit.kickoff.Controller;

import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Conditional;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.teamcommit.kickoff.Do.UserDO;
import com.teamcommit.kickoff.Service.login.LoginService;
import com.teamcommit.kickoff.Service.signup.SignupService;

@Controller
public class SignupController {

	@Autowired
	@Qualifier("SignupService")
	private SignupService signupService;
	
	//사용자 약관동의
	@RequestMapping("/loginAgree")
	public String loginAgree() {
		String view = "/login/loginAgree";

		return view;
	}
	
	//업체 약관동의
	@RequestMapping("/loginAgreeEmp")
	public String loginAgreeEmp() {
		String view = "/login/loginAgreeEmp";

		return view;
	}
	
	//사용자 회원가입 페이지 이동
	@RequestMapping("/Signup")
	public String Signup() {
		String view = "/login/Signup";

		return view;
	}
	
	//사용자 회원가입(정보 등록)
	@RequestMapping("/signup_action")
	public ModelAndView signup_action(@ModelAttribute("userDO") UserDO userDO, @RequestParam("postcode")String postcode, @RequestParam("address")String address,
			@RequestParam("detailAddress")String detailAddress, @RequestParam("year")String year, @RequestParam("month")String month, @RequestParam("extraAddress")String extraAddress,
			@RequestParam("day")String day, ModelMap model, HttpServletRequest request, RedirectAttributes redirect)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		try {
			
			String userDay = year + month + day;
			String useraddress = postcode + " " + address + " " + detailAddress + " " + extraAddress;
			userDO.setUserBirthdate(userDay);
			userDO.setUserAddress(useraddress);
			
			signupService.insertUser(userDO);
			
			mv = new ModelAndView("redirect:/loginAll");
			
			redirect.addFlashAttribute("msg", "회원가입이 완료되었습니다. 로그인하여 이용해주세요.");
		} catch (Exception e) {
			redirect.addFlashAttribute("msg", "오류가 발생되었습니다. 다시 시도해주세요.");
		}
		
		return mv;
	}
	

	//업체 회원가입 페이지 이동
	@RequestMapping("/SignupEmp")
	public String SignupEmp() {
		String view = "/login/SignupEmp";

		return view;
	}

}
