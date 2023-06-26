package com.teamcommit.kickoff.Common;

import java.util.HashMap;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class CertificationService {
	
		public static void certifiedPhoneNumber(String phoneNumber, String cerNum) {
	
		    String api_key = "NCSRKDI2QI0XS6BJ";
		    String api_secret = "JPAKCDTW2LCJVQ3YKO7XOC5WLHIWPD5C";
		    Message coolsms = new Message(api_key, api_secret);
	
		    // 4 params(to, from, type, text) are mandatory. must be filled
		    HashMap<String, String> params = new HashMap<String, String>();
		    params.put("to", phoneNumber);    // 수신전화번호
		    params.put("from", "010-3709-3238");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
		    params.put("type", "SMS");
		    params.put("text", "Kick Off 휴대폰 인증 메시지 : " + "[" + cerNum +"]" + " ");
		    params.put("app_version", "test app 1.2"); // application name and version
	
		    try {
		        JSONObject obj = (JSONObject) coolsms.send(params);
		        System.out.println(obj.toString());
		    } catch (CoolsmsException e) {
		        System.out.println(e.getMessage());
		        System.out.println(e.getCode());
		    }
	
		}
}