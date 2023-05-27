package com.teamcommit.kickoff.Service;

import com.teamcommit.kickoff.Do.EmployerDO;
import com.teamcommit.kickoff.Do.UserDO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;


@Service("loginService")
public class LoginServiceImpl implements LoginService {
    @Autowired
    private LoginMapper loginMapper;

    //개인 회원 로그인
    public UserDO member_login(UserDO userDO) {
        return this.loginMapper.member_login(userDO);
    }

    // 업체 회원 로그인
    public EmployerDO emp_login(EmployerDO empDO) {
        return this.loginMapper.emp_login(empDO);
    }

   // 개인 회원 아이디 찾기
    public UserDO findUser_id(UserDO userDO) {

        return this.loginMapper.findUser_id(userDO);
    }

    // 업체 회원 아이디 찾기
    public EmployerDO findEmp_id(EmployerDO empDO) {
        return this.loginMapper.findEmp_id(empDO);
    }

    // 로그인한 이용자 정보 가져오기
    @Override
    public UserDO procSetUserInfo(UserDO userDO) {
        return this.loginMapper.procSetUserInfo(userDO);
    }

    @Override
    public EmployerDO procSetEmployerInfo(EmployerDO employerDO) {
        return this.loginMapper.procSetEmployerInfo(employerDO);
    }
}
