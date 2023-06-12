package com.teamcommit.kickoff.Service.admin;

import com.teamcommit.kickoff.Do.UserDO;

import java.util.List;

public interface AdminService {

    List<UserDO> getList(UserDO userDO) throws Exception;
    
//    void user_delete(String userId) throws Exception;
}
