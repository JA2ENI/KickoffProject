package com.teamcommit.kickoff.Service.signup;

import org.apache.ibatis.annotations.Mapper;

import com.teamcommit.kickoff.Do.UserDO;

@Mapper
public interface SignupMapper {

	//사용자 회원가입(정보 등록)
	public void insertUser(UserDO userDO);
}
