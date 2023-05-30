package com.teamcommit.kickoff.Service;

import com.teamcommit.kickoff.Do.HelperDO;
import com.teamcommit.kickoff.Do.MessageDO;
import com.teamcommit.kickoff.Do.ReservationDO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service("helperService")
public class HelperServiceImpl implements HelperService {

    @Autowired
    private HelperMapper helperMapper;

    @Override
    public List<HelperDO> selectHelper(HelperDO helperDO) throws Exception {
        return helperMapper.selectHelper(helperDO);
    }

    @Override
    public void insertHelper(HelperDO helperDO) {
        helperMapper.insertHelper(helperDO);
    }

    @Override
    public List<ReservationDO> selectReservation(String userId) {
        return helperMapper.selectReservation(userId);
    }

    @Override
    public HelperDO selectHelperDetail(int helperSeqno) {
        return helperMapper.selectHelperDetail(helperSeqno);
    }

    @Override
    public void insertMessage(MessageDO messageDO) {helperMapper.insertMessage(messageDO);}

    public void updateStatus() {helperMapper.updateStatus();}

    @Override
    public List<HelperDO> selectHelperTime(HelperDO helperDO) throws Exception {
    	return helperMapper.selectHelperTime(helperDO);
    }

}
