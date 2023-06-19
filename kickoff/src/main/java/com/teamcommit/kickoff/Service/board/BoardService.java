package com.teamcommit.kickoff.Service.board;

import com.teamcommit.kickoff.Do.BoardDO;
import com.teamcommit.kickoff.Do.ReplyDO;
import com.teamcommit.kickoff.Do.ReportDO;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

public interface BoardService {

	//게시판 리스트
    List<BoardDO> getList(BoardDO boardDO) throws Exception;

    //게시판 삽입
    void insertBoard(BoardDO boardDO) throws Exception;

    //게시판 상세보기
    BoardDO getBoardContents(int boardSeqno) throws Exception;

    //게시판 수정
    void updateBoard(BoardDO boardDO) throws Exception;

    //게시판 삭제
    void getBoardDelete(int boardSeqno) throws Exception;

    //게시판 신고
    void reportBoard(ReportDO reportDO) throws Exception;

    // 가장큰 시퀀스 값 가져오기
    Integer procGetMaxSeqno() throws Exception;

    //조회수 증가
    void procAddViewCount(BoardDO boardDO);
    
    //댓글 등록
	void replyInsert(ReplyDO replyDO) throws Exception;
	
	//댓글 가져오기
	List<ReplyDO> procGetReplyInfo(ReplyDO replyDO) throws Exception;
	
	//댓글 삭제하기
	void procReplyDelete(ReplyDO replyDO) throws Exception;

}
