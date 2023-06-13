package com.teamcommit.kickoff.Common;

import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import org.json.JSONObject;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
public class SmsController {

	private final SmsService smsService;

	@PostMapping("/sms/send")
	@ResponseBody
    public String sendSms(@RequestBody MessageDto messageDto) throws UnsupportedEncodingException, URISyntaxException, NoSuchAlgorithmException, InvalidKeyException, JsonProcessingException {
        SmsResponseDto responseDto = smsService.sendSms(messageDto);
        
        String smsConfirmNum = responseDto.getSmsConfirmNum();
        
        JSONObject obj = new JSONObject();
        
        obj.put("smsConfirmNum", smsConfirmNum);
        
        return obj.toString();
    }
	
}
