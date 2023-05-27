package com.teamcommit.kickoff.Service;

import com.teamcommit.kickoff.Do.HelperDO;
import com.teamcommit.kickoff.Do.MessageDO;
import com.teamcommit.kickoff.Do.ReservationDO;

import java.util.*;

public interface HelperService {

    List<HelperDO> selectHelper(HelperDO helperDO) throws Exception;

    void insertHelper(HelperDO helperDO) throws Exception;

    List<ReservationDO> selectReservation(String userId) throws Exception;

    HelperDO selectHelperDetail(int helperSeqno) throws Exception;

    public void insertMessage(MessageDO messageDO);

    public void updateStatus();


}
