package com.teamcommit.kickoff.Service;

import com.teamcommit.kickoff.Do.UserDO;

import java.util.List;

public interface AdminService {

    List<UserDO> getList(UserDO userDO) throws Exception;
}
