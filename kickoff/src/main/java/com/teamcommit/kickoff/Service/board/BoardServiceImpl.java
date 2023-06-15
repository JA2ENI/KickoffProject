package com.teamcommit.kickoff.Service.board;

import com.teamcommit.kickoff.Do.BoardDO;
import com.teamcommit.kickoff.Do.ReplyDO;
import com.teamcommit.kickoff.Do.ReportDO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("BoardService")
public class BoardServiceImpl implements BoardService{

    @Autowired
    private BoardMapper boardMapper;

    //게시판 리스트
    @Override
    public List<BoardDO> getList(BoardDO boardDO) throws Exception {
        return boardMapper.getList(boardDO);
    }
    //게시판 삽입
    @Override
    public void insertBoard(BoardDO boardDO) throws Exception { 
        boardMapper.insertBoard(boardDO);
    }
    //게시판 상세보기
    @Override
    public BoardDO getBoardContents(int boardSeqno) throws Exception {
        return boardMapper.getBoardContents(boardSeqno);
    }
    //게시판 수정
    @Override
    public void updateBoard(BoardDO boardDO) throws Exception {
        boardMapper.updateBoard(boardDO);
    }
    //게시판 삭제
    @Override
    public void getBoardDelete(int boardSeqno) throws Exception {
        boardMapper.getBoardDelete(boardSeqno);
    }
    //게시판 신고
    @Override
    public void reportBoard(ReportDO reportDO) throws Exception {
        boardMapper.reportBoard(reportDO);
    }
    //가장 큰 시퀀스 값 가져오기
    @Override
    public Integer procGetMaxSeqno() throws Exception {
        return boardMapper.procGetMaxSeqno();
    }
    //조회수 증가
    @Override
    public void procAddViewCount(BoardDO boardDO) {
        boardMapper.procAddViewCount(boardDO);
    }

}
