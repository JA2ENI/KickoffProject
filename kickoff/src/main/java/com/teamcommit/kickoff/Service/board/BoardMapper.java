package com.teamcommit.kickoff.Service.board;

import com.teamcommit.kickoff.Do.BoardDO;
import com.teamcommit.kickoff.Do.ReplyDO;
import com.teamcommit.kickoff.Do.ReportDO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardMapper {

	//게시판 리스트 
    public List<BoardDO> getList(BoardDO boardDO);

    //게시판 삽입
    public  void insertBoard(BoardDO boardDO);

    //게시판 상세보기
    public BoardDO getBoardContents(int boardSeqno);

    //게시판 수정
    public void updateBoard(BoardDO boardDO);

    //게시판 삭제
    public void getBoardDelete(int boardSeqno);

    //게시판 신고
    public void reportBoard(ReportDO reportDO);

    //게시판 번호 제일 큰거 
    public Integer procGetMaxSeqno();

    //조회수 증가
    public void procAddViewCount(BoardDO boardDO);

}