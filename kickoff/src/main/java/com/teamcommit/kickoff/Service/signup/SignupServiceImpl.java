package com.teamcommit.kickoff.Service.signup;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamcommit.kickoff.Do.UserDO;

@Service("SignupService")
public class SignupServiceImpl implements SignupService{

	@Autowired
	private SignupMapper signupMapper;
	
	//사용자 회원가입(정보 등록)
	@Override
	public void insertUser(UserDO userDO) throws Exception{
		signupMapper.insertUser(userDO);
	}
	
	//아이디 중복확인
	
}
