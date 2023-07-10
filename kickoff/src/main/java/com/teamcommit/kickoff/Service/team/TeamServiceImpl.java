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
        public List<TeamDO> teamRecruitList(Integer teamId) throws Exception {
            return teamMapper.teamRecruitList(teamId);
        }

        @Override
        public TeamDO teamRecruitDetail(int teamSeqNo) throws Exception {
            return teamMapper.teamRecruitDetail(teamSeqNo);
        }

        @Override
        public void insertTeam(TeamDO teamDO) throws Exception {
            teamMapper.insertTeam(teamDO);
        }
        
        @Override
        public void updateTeam(TeamDO teamDO) throws Exception {
            teamMapper.updateTeam(teamDO);
        }
        
        @Override
        public void deleteTeam(int teamSeqNo) throws Exception {
            teamMapper.deleteTeam(teamSeqNo);
        }
        
        @Override
        public TeamInfoDO selectTeamInfo(String userId) throws Exception {
            return teamMapper.selectTeamInfo(userId);
        }
        
//        @Override
//        public int teamNameCheck(TeamInfoDO teamInfoDO) throws Exception {
//             return teamMapper.teamNameCheck(teamInfoDO);
//        }
        
        @Override
        public void teamCreation(TeamInfoDO teamInfoDO) throws Exception {
            teamMapper.teamCreation(teamInfoDO);
        }
        
        @Override
        public List<TeamInfoDO> teamInfoDetail(String userId) throws Exception {
            return teamMapper.teamInfoDetail(userId);
        }
        
        @Override
        public TeamInfoDO teamManageButton(String userId) throws Exception {
            return teamMapper.teamManageButton(userId);
        }
        
        @Override
        public TeamInfoDO teamInfo(String userId) throws Exception {
            return teamMapper.teamInfo(userId);
        }
        
        @Override
        public List<Map<String, Object>> teamMemberList(int teamId) throws Exception {
            return teamMapper.teamMemberList(teamId);
        }
        
        @Override
        public void teamMemberDelete(String userId) throws Exception {
            teamMapper.teamMemberDelete(userId);
        }

        @Override
        public List<TeamDO> rankList(TeamDO teamDO) throws Exception
        {
            return teamMapper.rankList(teamDO);
        }
        
        @Override
        public void insertTeamApply(TeamApplyDO teamApplyDO) throws Exception {
			teamMapper.insertTeamApply(teamApplyDO);
		}

    }
