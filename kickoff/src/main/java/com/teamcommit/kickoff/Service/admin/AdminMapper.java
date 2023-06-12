package com.teamcommit.kickoff.Service.admin;

import com.teamcommit.kickoff.Do.UserDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AdminMapper {

    public List<UserDO> getList(UserDO userDO);
    
//    public void user_delete(String userId);
}
