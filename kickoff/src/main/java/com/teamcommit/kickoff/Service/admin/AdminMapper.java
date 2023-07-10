package com.teamcommit.kickoff.Service.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.teamcommit.kickoff.Do.ReportDO;

@Mapper
public interface AdminMapper {

	List<Map<String, Object>> memberList(Map<String, Object> paramMap);
    
    public void user_delete(String userId);
    
    public void emp_delete(String empId);
    
    public void user_disable(String userId);
    
    public void emp_disable(String empId);
    
    public void user_activate(String userId);
    
    public void emp_activate(String empId);
    
    public void user_cancel_disable(String userId);
    
    public void emp_cancel_disable(String empId);
    
    List<ReportDO> reportBoardList(ReportDO reportDO);
    
    public void deleteReportBoard(int boardSeqno);
}
