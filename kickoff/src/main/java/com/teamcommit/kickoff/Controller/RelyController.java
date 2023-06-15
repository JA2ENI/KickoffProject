package com.teamcommit.kickoff.Controller;

import java.util.List;

import org.apache.struts.taglib.nested.NestedWriteNestingTag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyEmitterReturnValueHandler;

import com.teamcommit.kickoff.Do.Criteria;
import com.teamcommit.kickoff.Do.ReplyDO;
import com.teamcommit.kickoff.Service.reply.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/replies")
@Controller
@Log4j
@AllArgsConstructor
public class RelyController {

	@Autowired
	@Qualifier("RelyService")
	private ReplyService replyService;

	// 댓글 입력
	@PostMapping(value = "/new", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> creat(@RequestBody ReplyDO replyDO) throws Exception {

		int insertCount = replyService.insertReply(replyDO);

		return insertCount == 1 ? new ResponseEntity<>("succes", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 특정 게시물 댓글 목록
	@SuppressWarnings("deprecation")
	@GetMapping(value = "/pages/{boardSeqno}/{page}", produces = { MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<List<ReplyDO>> getList(@PathVariable("page") int page,
			@PathVariable("boardSeqno") int boardSeqno) throws Exception {

		Criteria cri = new Criteria(page, 10);

		return new ResponseEntity<>(replyService.getList(cri, boardSeqno), HttpStatus.OK);
	}

	// 댓글 조회
	@GetMapping(value = "/{replyNo}", produces = { MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<ReplyDO> get(@PathVariable("replyNo") int replyNo) throws Exception {

		return new ResponseEntity<>(replyService.readReply(replyNo), HttpStatus.OK);
	}

	// 댓글 삭제
	@DeleteMapping(value = "{replyNo}", produces = { MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<String> remove(@PathVariable("replyNo") int replyNo) throws Exception {

		return replyService.deleteReply(replyNo) == 1 
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 댓글 수정
	@RequestMapping(method = { RequestMethod.PUT,RequestMethod.PATCH }, value = "/{replyNo}", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modify(@RequestBody ReplyDO replyDO, @PathVariable("replyNo") int replyNo) throws Exception {

		replyDO.setReplyNo(replyNo);

		return replyService.updateReply(replyDO) == 1 
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
