package com.teamcommit.kickoff.Service;

import com.teamcommit.kickoff.Do.EmployerDO;
import com.teamcommit.kickoff.Do.UserDO;

import java.util.HashMap;

public interface LoginService {

    // 개인 회원 로그인
    UserDO member_login(UserDO userDO);

    // 업체 회원 로그인
    EmployerDO emp_login(EmployerDO empDO);

    // 개인 회원 아이디 찾기
    UserDO findUser_id(UserDO userDO);

    // 업체 회원 아이디 찾기
    EmployerDO findEmp_id(EmployerDO empDO);

    // 로그인한 이용자 정보 가져오기
    UserDO procSetUserInfo(UserDO userDO);

    EmployerDO procSetEmployerInfo(EmployerDO employerDO);
}
