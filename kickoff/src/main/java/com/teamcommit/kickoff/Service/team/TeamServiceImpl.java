package com.teamcommit.kickoff.Service.team;

import com.teamcommit.kickoff.Do.TeamApplyDO;
import com.teamcommit.kickoff.Do.TeamDO;
import com.teamcommit.kickoff.Do.TeamInfoDO;
import com.teamcommit.kickoff.Do.UserDO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

    @Service("TeamService")
    public class TeamServiceImpl implements TeamService{

        @Autowired
        private TeamMapper teamMapper;

        @Override
        public List<TeamInfoDO> teamInfoList(TeamInfoDO teamInfoDO) throws Exception {
            return teamMapper.teamInfoList(teamInfoDO);
        }
        
        @Override
        public List<TeamDO> teamBoardList(TeamDO teamDO) throws Exception {
            return teamMapper.teamBoardList(teamDO);
        }
        
        @Override
        public List<TeamDO> teamRecruitList(TeamDO teamDO) throws Exception {
            return teamMapper.teamRecruitList(teamDO);
        }

        @Override
        public TeamDO getTeamContents(int teamSeqNo) throws Exception {
            return teamMapper.getTeamContents(teamSeqNo);
        }

        @Override
        public void insertTeam(TeamDO teamDO) throws Exception {
            teamMapper.insertTeam(teamDO);
        }
        
        @Override
        public List<TeamInfoDO> teamInfoDetail(String userId) throws Exception {
            return teamMapper.teamInfoDetail(userId);
        }
        
        @Override
        public TeamInfoDO teamInfo(String userId) throws Exception {
            return teamMapper.teamInfo(userId);
        }
        
        @Override
        public List<Map<String, String>> teamMemberList(int teamId) throws Exception {
            return teamMapper.teamMemberList(teamId);
        }

        @Override
        public List<TeamDO> rankList(TeamDO teamDO) throws Exception
        {
            return teamMapper.rankList(teamDO);
        }
//
//        @Override
//        public void updateTeam(TeamDO teamDO) throws Exception {
//
//        }
        
        @Override
        public void insertTeamApply(TeamApplyDO teamApplyDO) throws Exception {
			teamMapper.insertTeamApply(teamApplyDO);
		}

    }
