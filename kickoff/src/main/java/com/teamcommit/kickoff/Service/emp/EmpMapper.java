package com.teamcommit.kickoff.Service.emp;


import com.teamcommit.kickoff.Do.BoardDO;
import com.teamcommit.kickoff.Do.EmployerDO;
import com.teamcommit.kickoff.Do.PlaceDO;
import com.teamcommit.kickoff.Do.ReservationDO;
import com.teamcommit.kickoff.Do.UserDO;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface EmpMapper {
    public List<EmployerDO> getList(EmployerDO employerDO);

    EmployerDO info_fix(EmployerDO employerDO);

    List<BoardDO> getList(String empId);

    List<ReservationDO> selectReservation(ReservationDO reservationDO);

    public PlaceDO empFutsalInsert(PlaceDO placeDO);

    public void updateFutsal(PlaceDO placeDO);
    
    public List<PlaceDO> empFutsalList(String empId);
    
    public PlaceDO selectEmpFutsalFix(int placeId);
    
    public void updateEmpFutsalF(PlaceDO placeDO);
    
    public EmployerDO empInfoCheck(EmployerDO employer);
	 
	public EmployerDO empInfo(String empId);
	 
	public void updatePw(EmployerDO employer);
	 
	public void updateEmpInfo(EmployerDO employerDO);
	
	public void deleteEmp(String empId);
  
}
