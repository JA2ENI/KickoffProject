package com.teamcommit.kickoff.Common;

import java.util.Random;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

public class CoolSmsController {

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
}
