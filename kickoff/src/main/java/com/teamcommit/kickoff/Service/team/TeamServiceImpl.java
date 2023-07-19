package com.teamcommit.kickoff.Service.team;

import com.teamcommit.kickoff.Do.PageDO;
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
        
        //팀 모집글 전체 리스트
        @Override
        public List<TeamDO> teamBoardList(TeamDO teamDO) throws Exception {
            return teamMapper.teamBoardList(teamDO);
        }
        
        //팀별 모집글 리스트
        @Override
        public List<TeamDO> teamRecruitList(Integer teamId) throws Exception {
            return teamMapper.teamRecruitList(teamId);
        }

        //팀 모집글 상세보기
        @Override
        public TeamDO teamRecruitDetail(int teamSeqNo) throws Exception {
            return teamMapper.teamRecruitDetail(teamSeqNo);
        }

        //팀 모집글 등록
        @Override
        public void insertTeam(TeamDO teamDO) throws Exception {
            teamMapper.insertTeam(teamDO);
        }
        
        //팀 모집글 수정
        @Override
        public void updateTeam(TeamDO teamDO) throws Exception {
            teamMapper.updateTeam(teamDO);
        }
        
        //팀 모집글 삭제
        @Override
        public void deleteTeam(int teamSeqNo) throws Exception {
            teamMapper.deleteTeam(teamSeqNo);
        }
        
        //팀 모집글 작성시 팀 정보 불러오기
        @Override
        public TeamInfoDO selectTeamInfo(String userId) throws Exception {
            return teamMapper.selectTeamInfo(userId);
        }
        
        //팀 페이징처리 팀 전체수
        @Override
        public int countTeam() {
        	return teamMapper.countTeam();
        }

        //팀 페이징처리 팀 리스트
        @Override
        public List<TeamInfoDO> selectTeamPaging(PageDO pageDO) {
        	return teamMapper.selectTeamPaging(pageDO);
        }
        
        //팀 생성시 팀 이름 중복확인
        @Override
        public int teamNameCheck(TeamInfoDO teamInfoDO) throws Exception {
             return teamMapper.teamNameCheck(teamInfoDO);
        }
        
        //팀 생성
        @Override
        public void teamCreation(TeamInfoDO teamInfoDO) throws Exception {
            teamMapper.teamCreation(teamInfoDO);
        }
        
        //팀 상세 정보
        @Override
        public List<TeamInfoDO> teamInfoDetail(String userId) throws Exception {
            return teamMapper.teamInfoDetail(userId);
        }
        
        //팀 정보 불러오기
        @Override
        public TeamInfoDO teamInfo(String userId) throws Exception {
            return teamMapper.teamInfo(userId);
        }
        
        //팀 멤버 리스트
        @Override
        public List<Map<String, Object>> teamMemberList(int teamId) throws Exception {
            return teamMapper.teamMemberList(teamId);
        }
        
        //팀원 방출하기
        @Override
        public void teamMemberDelete(String userId) throws Exception {
            teamMapper.teamMemberDelete(userId);
        }

        //팀 랭킹 리스트
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
