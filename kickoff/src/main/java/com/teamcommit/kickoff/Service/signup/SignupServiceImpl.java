package com.teamcommit.kickoff.Service.signup;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("signupService")
public class SignupServiceImpl implements SignupService{

	@Autowired
	private SignupMapper signupMapper;
}
