package com.teamcommit.kickoff.Service.team;

import com.teamcommit.kickoff.Do.PageDO;
import com.teamcommit.kickoff.Do.TeamApplyDO;
import com.teamcommit.kickoff.Do.TeamDO;
import com.teamcommit.kickoff.Do.TeamInfoDO;
import com.teamcommit.kickoff.Do.UserDO;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import java.util.Map;


@Mapper
public interface TeamMapper {
    
	//팀 모집글 전체 리스트
    public List<TeamDO> teamBoardList(TeamDO teamDO);
    
    //팀 별 모집글 리스트
    public List<TeamDO> teamRecruitList(Integer teamId);

    //팀 모집글 상세보기
    public TeamDO teamRecruitDetail(int teamSeqNo);

    //팀 모집글 등록
    public void insertTeam(TeamDO teamDO);
    
    //팀 모집글 수정
    public void updateTeam(TeamDO teamDO);
    
    //팀 모집글 삭제
    public void deleteTeam(int teamSeqNo);
    
    //팀 모집글 작성시 팀 정보 불러오기
    public TeamInfoDO selectTeamInfo(String userId);
    
    //팀 페이징처리 팀 전체수
    public int countTeam();
    
    //팀 페이징처리 팀 리스트
    public List<TeamInfoDO> selectTeamPaging(PageDO pageDO);
    
    //팀 생성시 팀 이름 중복확인
    public int teamNameCheck(TeamInfoDO teamInfoDO);
    
    //팀 생성
    public void teamCreation(TeamInfoDO teamInfoDO);
    
    //팀 상세 정보
    public List<TeamInfoDO> teamInfoDetail(String userId);
    
    //팀 정보 불러오기
    public TeamInfoDO teamInfo(String userId);
    
    //팀 멤버 리스트
    public List<Map<String, Object>> teamMemberList(int teamId);
    
    //팀원 방출하기
    public void teamMemberDelete(String userId);

    //팀 랭킹 리스트
    public List<TeamDO> rankList(TeamDO teamDO);
    
    
    public void insertTeamApply(TeamApplyDO teamApplyDO);
}
