package com.teamcommit.kickoff.Service.admin;

import java.util.List;
import java.util.Map;

import com.teamcommit.kickoff.Do.ReportDO;

public interface AdminService {

	List<Map<String, Object>> memberList(Map<String, Object> paramMap) throws Exception;
    
    void user_delete(String userId) throws Exception;
    
    void emp_delete(String empId) throws Exception;
    
    void user_disable(String userId) throws Exception;
    
    void emp_disable(String empId) throws Exception;
    
    void user_activate(String userId) throws Exception;
    
    void emp_activate(String empId) throws Exception;
    
    void user_cancel_disable(String userId) throws Exception;
    
    void emp_cancel_disable(String empId) throws Exception;
    
    List<ReportDO> reportBoardList(ReportDO reportDO) throws Exception;
    
    void deleteReport(int boardSeqno) throws Exception;
    
    void deleteBoard(int boardSeqno) throws Exception;
}
