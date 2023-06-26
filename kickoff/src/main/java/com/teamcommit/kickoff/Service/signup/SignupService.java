package com.teamcommit.kickoff.Service.signup;

import com.teamcommit.kickoff.Do.UserDO;

public interface SignupService {

	//사용자 회원가입(정보 등록)
	void insertUser(UserDO userDO) throws Exception;
	
	//아이디 중복확인
	
}
