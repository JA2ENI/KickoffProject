package com.teamcommit.kickoff.Service.board;

import com.teamcommit.kickoff.Do.BoardDO;
import com.teamcommit.kickoff.Do.ReplyDO;
import com.teamcommit.kickoff.Do.ReportDO;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

public interface BoardService {

    List<BoardDO> getList(BoardDO boardDO) throws Exception;

    void insertBoard(BoardDO boardDO) throws Exception;

    BoardDO getBoardContents(int boardSeqno) throws Exception;

    void updateBoard(BoardDO boardDO) throws Exception;

    void getBoardDelete(int boardSeqno) throws Exception;

    void reportBoard(ReportDO reportDO) throws Exception;

    // 가장큰 시퀀스 값 가져오기
    Integer procGetMaxSeqno() throws Exception;

    // 가장큰 시퀀스 값 가져오기
    Integer procGetMaxNo() throws Exception;

    //조회수 증가
    void procAddViewCount(BoardDO boardDO);

    void insertReply(ReplyDO replyDO) throws Exception;

    List<ReplyDO> getreplyList(int boardSeqno) throws Exception;

    void getReplyDelete(int replyNo) throws Exception;

}
