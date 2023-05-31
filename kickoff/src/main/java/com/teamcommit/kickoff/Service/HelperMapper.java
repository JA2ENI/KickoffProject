package com.teamcommit.kickoff.Service;

import com.teamcommit.kickoff.Do.HelperDO;
import com.teamcommit.kickoff.Do.MessageDO;
import com.teamcommit.kickoff.Do.ReservationDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface HelperMapper {
    List<HelperDO> selectHelper(HelperDO helperDO);

    public void insertHelper(HelperDO helperDO);

    public List<ReservationDO> selectReservation(String userId);

    public HelperDO selectHelperDetail(int helperSeqno);
    
    public void insertMessage(MessageDO messageDO);

    public void updateStatus();
    
    List<HelperDO> selectHelperTime(String helperTime);


}
