package com.teamcommit.kickoff.Service.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamcommit.kickoff.Do.ReservationDO;

@Service("mypageService")
public class MypageServiceImpl implements MypageService {

    @Autowired
    private MypageMapper mypageMapper;
    
    @Override
    public List<ReservationDO> myReservationList(String userId) throws Exception {
        return mypageMapper.myReservationList(userId);
    }
}
