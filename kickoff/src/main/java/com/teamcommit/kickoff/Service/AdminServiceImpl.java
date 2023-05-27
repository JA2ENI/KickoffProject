package com.teamcommit.kickoff.Service;

import com.teamcommit.kickoff.Do.UserDO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("AdminService")
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public List<UserDO> getList(UserDO userDO) throws Exception {
        return adminMapper.getList(userDO);
    }
}
