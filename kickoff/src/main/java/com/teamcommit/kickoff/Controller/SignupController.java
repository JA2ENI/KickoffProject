package com.teamcommit.kickoff.Controller;

import java.util.Random;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Conditional;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamcommit.kickoff.Service.login.CertificationService;
import com.teamcommit.kickoff.Service.login.LoginService;
import com.teamcommit.kickoff.Service.signup.SignupService;

@Controller
public class SignupController {

	/*@Autowired
	@Qualifier("SignupService")
	private SignupService signupService;

	//사용자 회원가입 페이지 이동
	@GetMapping("/Signup")
	public String Signup() {
		String view = "/login/Signup";

		return view;
	}

	//업체 회원가입 페이지 이동
	@GetMapping("/SignupEmp")
	public String SignupEmp() {
		String view = "/login/SignupEmp";

		return view;
	}*/
	
	/*// coolsms api
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
    }*/

}
