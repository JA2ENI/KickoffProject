package com.teamcommit.kickoff.Service.team;

import com.teamcommit.kickoff.Do.PageDO;
import com.teamcommit.kickoff.Do.TeamApplyDO;
import com.teamcommit.kickoff.Do.TeamDO;
import com.teamcommit.kickoff.Do.TeamInfoDO;
import com.teamcommit.kickoff.Do.UserDO;

import java.util.List;
import java.util.Map;

public interface TeamService {
    
	//팀 모집글 전체 리스트
    List<TeamDO> teamBoardList(TeamDO teamDO) throws Exception;
    
    //팀별 모집글 리스트
    List<TeamDO> teamRecruitList(Integer teamId) throws Exception;

    //팀 모집글 상세보기
    TeamDO teamRecruitDetail(int teamSeqNo) throws Exception;
    
    //팀 모집글 등록
    void insertTeam(TeamDO teamDO) throws Exception;
    
    //팀 모집글 수정
    void updateTeam(TeamDO teamDO) throws Exception;
    
    //팀 모집글 삭제
    void deleteTeam(int teamSeqNo) throws Exception;
    
    //팀 모집글 작성시 팀 정보 불러오기
    TeamInfoDO selectTeamInfo(String userId) throws Exception;
    
    //팀 페이징처리 팀 전체수
    int countTeam() throws Exception;
    
    //팀 페이징처리 팀 리스트
    List<TeamInfoDO> selectTeamPaging(PageDO pageDO) throws Exception;
    
    //팀 생성시 팀 이름 중복확인
    int teamNameCheck(TeamInfoDO teamInfoDO) throws Exception;
    
    //팀 생성
    void teamCreation(TeamInfoDO teamInfoDO) throws Exception;
    
    //팀 상세 정보
    List<TeamInfoDO> teamInfoDetail(String userId) throws Exception;
    
    //팀 정보 불러오기
    TeamInfoDO teamInfo(String userId) throws Exception;
    
    //팀 멤버 리스트
    List<Map<String, Object>> teamMemberList(int teamId) throws Exception;
    
    //팀원 방출하기
    void teamMemberDelete(String userId) throws Exception;

    //팀 랭킹 리스트
    List<TeamDO> rankList(TeamDO teamDO) throws Exception;
    
    void insertTeamApply(TeamApplyDO teamApplyDO) throws Exception;

}
