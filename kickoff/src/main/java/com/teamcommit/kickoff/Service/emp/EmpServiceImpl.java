package com.teamcommit.kickoff.Service.emp;

import com.teamcommit.kickoff.Dao.PlaceDAO;
import com.teamcommit.kickoff.Do.BoardDO;
import com.teamcommit.kickoff.Do.EmployerDO;
import com.teamcommit.kickoff.Do.PlaceDO;
import com.teamcommit.kickoff.Do.ReservationDO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Service("EmpService")
public class EmpServiceImpl implements EmpService {

    @Autowired
    private EmpMapper empMapper;

    public EmployerDO info_fix(EmployerDO employerDO) { return this.empMapper.info_fix(employerDO); }

    @Override
    public List<BoardDO> getList(BoardDO boardDO) throws Exception{
        return empMapper.getList(boardDO);
    }

    @Override
    public PlaceDO empFutsalInsert(PlaceDO placeDO) throws Exception {
        return empMapper.empFutsalInsert(placeDO);
    }

    @Override
    public void updateFutsal(PlaceDO placeDO) { empMapper.updateFutsal(placeDO);  }

    @Override
    public List<ReservationDO> selectReservation(ReservationDO reservationDO) throws Exception {
        return empMapper.selectReservation(reservationDO);
    }
    
    @Override
    public List<PlaceDO> placeList(PlaceDO placeDO) throws Exception{
        return empMapper.placeList(placeDO);
    }

}