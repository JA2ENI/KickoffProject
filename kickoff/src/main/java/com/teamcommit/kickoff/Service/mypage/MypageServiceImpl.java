package com.teamcommit.kickoff.Service.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamcommit.kickoff.Do.BoardDO;
import com.teamcommit.kickoff.Do.ReservationDO;

@Service("mypageService")
public class MypageServiceImpl implements MypageService {

    @Autowired
    private MypageMapper mypageMapper;
    
    @Override
    public List<ReservationDO> myReservationList(String userId) throws Exception {
        return mypageMapper.myReservationList(userId);
    }
    
    @Override
    public List<ReservationDO> empReservationList(String userId) throws Exception {
        return mypageMapper.empReservationList(userId);
    }
    
    @Override
    public void updateCancel(int reservationNo) throws Exception {
        mypageMapper.updateCancel(reservationNo);
    }
    
    @Override
    public List<BoardDO> myBoardList(String userId) throws Exception {
    	return mypageMapper.myBoardList(userId);
    }
}
