package com.teamcommit.kickoff.Service.reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamcommit.kickoff.Do.Criteria;
import com.teamcommit.kickoff.Do.ReplyDO;

import io.lettuce.core.dynamic.annotation.Param;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyMapper replyMapper;

	// 댓글 삽입
	@Override
	public int insertReply(ReplyDO replyDO) throws Exception {
		return replyMapper.insertReply(replyDO);
	}

	// 특정 댓글 읽기
	@Override
	public ReplyDO readReply(int replyNo) throws Exception {
		return replyMapper.readReply(replyNo);
	}

	// 댓글 삭제
	@Override
	public int deleteReply(int replyNo) throws Exception {
		return replyMapper.deleteReply(replyNo);
	}

	// 댓글 수정
	@Override
	public int updateReply(ReplyDO replyDO) throws Exception {
		return replyMapper.updateReply(replyDO);
	}

	// 댓글 목록
	@Override
	public List<ReplyDO> getList(Criteria cri, int boardSeqno) throws Exception {
		return replyMapper.getList(cri, boardSeqno);
	}
}
