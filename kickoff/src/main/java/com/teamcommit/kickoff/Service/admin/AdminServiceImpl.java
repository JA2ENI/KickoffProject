package com.teamcommit.kickoff.Service.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamcommit.kickoff.Do.ReportDO;

@Service("AdminService")
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public List<Map<String, Object>> memberList(Map<String, Object> paramMap) throws Exception {
        return adminMapper.memberList(paramMap);
    }
    
    @Override
    public void user_delete(String userId) throws Exception {
    	adminMapper.user_delete(userId);
    }
    
    @Override
    public void emp_delete(String empId) throws Exception {
    	adminMapper.emp_delete(empId);
    }
    
    @Override
    public void user_disable(String userId) throws Exception {
    	adminMapper.user_disable(userId);
    }
    
    @Override
    public void emp_disable(String empId) throws Exception {
    	adminMapper.emp_disable(empId);
    }
    
    @Override
    public void user_activate(String userId) throws Exception {
    	adminMapper.user_activate(userId);
    }
    
    @Override
    public void emp_activate(String empId) throws Exception {
    	adminMapper.emp_activate(empId);
    }
    
    @Override
    public void user_cancel_disable(String userId) throws Exception {
    	adminMapper.user_cancel_disable(userId);
    }
    
    @Override
    public void emp_cancel_disable(String empId) throws Exception {
    	adminMapper.emp_cancel_disable(empId);
    }
    
    @Override
    public List<ReportDO> reportBoardList(ReportDO reportDO) throws Exception {
    	return adminMapper.reportBoardList(reportDO);
    }
    
    @Override
    public void deleteReportBoard(int boardSeqno) throws Exception {
    	adminMapper.deleteReportBoard(boardSeqno);
    }
}
