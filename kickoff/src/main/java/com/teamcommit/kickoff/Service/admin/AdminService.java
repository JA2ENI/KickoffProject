package com.teamcommit.kickoff.Service.admin;

import java.util.List;
import java.util.Map;

public interface AdminService {

	List<Map<String, Object>> getList(Map<String, Object> paramMap) throws Exception;
    
    void user_delete(String userId) throws Exception;
    
    void emp_delete(String empId) throws Exception;
}
