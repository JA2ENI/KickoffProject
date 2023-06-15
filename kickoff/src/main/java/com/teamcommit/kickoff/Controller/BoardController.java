package com.teamcommit.kickoff.Controller;

import com.teamcommit.kickoff.Do.*;
import com.teamcommit.kickoff.Service.board.BoardService;
import com.teamcommit.kickoff.Service.login.LoginService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class BoardController {

    @Autowired
    @Qualifier("BoardService")
    private BoardService boardService;

    @Autowired
    private LoginService loginService;
    
    // 게시판 목록
    @RequestMapping( "/board")
    public String Boardlist(@ModelAttribute("boardDO") BoardDO boardDO, HttpServletRequest request, Model model) throws Exception {

        String view = "/board/board";

        List<BoardDO> boardList = boardService.getList(boardDO);
        model.addAttribute("boardList", boardList);

        return view;
    }

    //게시판 등록페이지 이동
    @RequestMapping( "/boardInsert")
    public String insert(@ModelAttribute("boardDO") BoardDO boardDO, HttpServletRequest request, Model model) throws Exception {
        String view = "";

        //로그인한 이용자 ID로 로그인 정보 가져오기
        String userId = (String) request.getSession().getAttribute("userId");
        UserDO userDO =new UserDO();
        userDO.setUserId(userId);
        userDO = loginService.procSetUserInfo(userDO);
        //로그인한 업체ID로 로그인 정보 가져오기
        String empId = (String) request.getSession().getAttribute("empId");
        EmployerDO employerDO = new EmployerDO();
        employerDO.setEmpId(empId);
        employerDO = loginService.procSetEmployerInfo(employerDO);

        if(userId == null && empId == null) {
            model.addAttribute("msg", "alert('로그인 후 이용해주세요');");
            view = "forward:/board";
        }
        else if(userId != null || empId != null) {
            view = "/board/boardInsert";
        }

        return view;
    }

    //게시판 등록
    @RequestMapping( "/insert_action")
    public ModelAndView insert_action(@ModelAttribute("boardDO") BoardDO boardDO, ModelMap model, HttpServletRequest request, RedirectAttributes redirect) throws Exception {
        int boardSeq = 0;
        ModelAndView mv = new ModelAndView();

        try{
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

            Date time = new Date();

            String time1 = format.format(time);
            boardDO.setWriteRegDate(time1);

            boardService.insertBoard(boardDO);
            boardSeq = boardService.procGetMaxSeqno();

            mv = new ModelAndView("redirect:/boardDetail?boardSeqno=" + boardSeq);

            redirect.addFlashAttribute("redirect", boardSeq);
            redirect.addFlashAttribute("msg", "등록 완료되었습니다.");
        } catch (Exception e) {
            redirect.addFlashAttribute("msg", "오류가 발생되었습니다. 다시 시도해주세요.");
        }

        return mv;
    }

    /*게시판 상세보기(작성자)
    @RequestMapping( "/boardDetailWritter")
    public String boardDetailWritter(@ModelAttribute("boardDO") BoardDO boardDO, HttpServletRequest request, Model model) throws Exception {

        String view = "/board/boardDetail";

        Map<String, ?> inputFlashMap = RequestContextUtils.getInputFlashMap(request);
        if (null != inputFlashMap){
            model.addAttribute("msg", (String) inputFlashMap.get("msg"));
        }

        return view;
    }*/

    //게시판 상세보기
    @GetMapping("/boardDetail")
    public String boardDetail(@ModelAttribute("boardDO") BoardDO boardDO, @RequestParam("boardSeqno") int boardSeqno, HttpServletRequest request, Model model) throws Exception {
        String view = "/board/boardDetail";

        //로그인한 이용자 ID로 로그인 정보 가져오기
        String userId = (String) request.getSession().getAttribute("userId");
        //로그인한 업체 ID로 로그인 정보 가져오기
        String empId = (String) request.getSession().getAttribute("empId");

        BoardDO boardContents = boardService.getBoardContents(boardSeqno);

        boardService.procAddViewCount(boardContents);
        model.addAttribute("boardContents", boardContents);
        model.addAttribute("userId", userId);
        model.addAttribute("empId", empId);

        return view;
    }

    //게시판 수정 페이지 이동
    @RequestMapping( "/boardUpdate")
    public String boardUpdate(@ModelAttribute("boardDO") BoardDO boardDO, @RequestParam("boardSeqno") int boardSeqno, Model model) throws Exception {
        String view = "/board/boardUpdate";

        BoardDO boardContents = boardService.getBoardContents(boardSeqno);
        model.addAttribute("boardContents", boardContents);

        return view;
    }

    //게시판 수정
    @RequestMapping( "/update_action")
    public ModelAndView update_acttion(@ModelAttribute("boardDO") BoardDO boardDO, HttpServletRequest request, RedirectAttributes redirect, Model model) throws Exception {

        ModelAndView mv = new ModelAndView("redirect:/boardDetail?boardSeqno=" + boardDO.getBoardSeqno());

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date time = new Date();

        String time1 = format.format(time);
        boardDO.setWriteEditDate(time1);
        boardService.updateBoard(boardDO);
        redirect.addFlashAttribute("redirect", boardDO.getBoardSeqno());

        redirect.addFlashAttribute("msg", "수정 완료되었습니다.");


        return mv;
    }

    //게시판 삭제
    @RequestMapping("/delete")
    public ModelAndView delete(@ModelAttribute("boardDO") BoardDO boardDO, @RequestParam("boardSeqno") int boardSeqno, RedirectAttributes redirect, Model model) throws Exception {
        
        ModelAndView mv = new ModelAndView("redirect:/board");

        try {
            boardService.getBoardDelete(boardSeqno);
            redirect.addFlashAttribute("msg", "삭제 완료되었습니다.");
        } catch (Exception e) {
            redirect.addFlashAttribute("msg", "오류가 발생되었습니다. 다시 시도해주세요.");
        }

        return mv;
    }

    //게시판 신고
    @RequestMapping( "/boardReport")
    public String boardReport(@ModelAttribute("boardDO") BoardDO boardDO, @RequestParam("boardSeqno") int boardSeqno, HttpServletRequest request, Model model) throws Exception {
        String view = "";

        //로그인한 이용자 ID로 로그인 정보 가져오기
        String userId = (String) request.getSession().getAttribute("userId");
        //로그인한 이용자 ID로 로그인 정보 가져오기
        String empId = (String) request.getSession().getAttribute("empId");
        model.addAttribute("boardSeqno",boardSeqno);

        if(userId == null && empId == null) {
            model.addAttribute("msg", "alert('로그인 후 이용해주세요');");
            view = "forward:/board";
        }
        else if(userId != null || empId != null) {
            view = "/board/boardReport";
        }

        return view;
    }

    //게시글 신고 사유
    @RequestMapping( "/report_action")

    public ModelAndView report_action(@ModelAttribute("reportDO") ReportDO reportDO, @RequestParam("boardSeqno") int boardSeqno, HttpServletRequest request, RedirectAttributes redirect, Model model) throws Exception {

        ModelAndView mv = new ModelAndView("redirect:/board");

        try {
            reportDO.setBoardSeqno(boardSeqno);
            boardService.reportBoard(reportDO);
            redirect.addFlashAttribute("redirect", reportDO.getBoardSeqno());

            redirect.addFlashAttribute("msg", "신고 완료되었습니다.");
        } catch (Exception e) {
            redirect.addFlashAttribute("msg", "오류가 발생되었습니다. 다시 시도해주세요.");
        }

        return mv;
    }
}
