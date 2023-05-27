package com.teamcommit.kickoff.Service;

import com.teamcommit.kickoff.Do.EmployerDO;
import com.teamcommit.kickoff.Do.UserDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;

@Mapper
public interface LoginMapper {

    // 개인 회원 로그인
    public UserDO member_login(UserDO userDO);

    // 업체 회원 로그인
    public EmployerDO emp_login(EmployerDO empDO);

    // 개인 회원 아이디 찾기
    public UserDO findUser_id(UserDO userDO);

    // 업체 회원 아이디 찾기
    public EmployerDO findEmp_id(EmployerDO empDO);

    // 로그인한 이용자 정보 가져오기
    public UserDO procSetUserInfo(UserDO userDO);

    // 로그인한 이용자 정보 가져오기
    public EmployerDO procSetEmployerInfo(EmployerDO employerDO);
}