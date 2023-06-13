package com.teamcommit.kickoff.Service.emp;


import com.teamcommit.kickoff.Do.BoardDO;
import com.teamcommit.kickoff.Do.EmployerDO;
import com.teamcommit.kickoff.Do.PlaceDO;
import com.teamcommit.kickoff.Do.ReservationDO;
import com.teamcommit.kickoff.Do.UserDO;

import java.util.List;

public interface EmpService {

    EmployerDO info_fix(EmployerDO employerDO);

    List<BoardDO> getList(String empId) throws Exception;

    List<ReservationDO> selectReservation(ReservationDO reservationDO) throws Exception;

    PlaceDO empFutsalInsert(PlaceDO placeDO) throws Exception;

    void updateFutsal(PlaceDO placeDO) throws Exception;
    
    List<PlaceDO> empFutsalList(String empId) throws Exception;
    
    PlaceDO selectEmpFutsalFix(int placeId) throws Exception;
    
    void updateEmpFutsalF(PlaceDO placeDO) throws Exception;
    
	EmployerDO empInfoCheck(EmployerDO employerDO) throws Exception;

	EmployerDO empInfo(String empId) throws Exception;
	
	void updatePw(EmployerDO employerDO) throws Exception;
	
	void updateEmpInfo(EmployerDO employerDO) throws Exception;

	public void deleteEmp(EmployerDO employerDO) throws Exception;

}