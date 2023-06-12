package com.teamcommit.kickoff.Controller;


import com.teamcommit.kickoff.Common.CommandMap;
import com.teamcommit.kickoff.Do.*;
import com.teamcommit.kickoff.Service.emp.EmpService;
import com.teamcommit.kickoff.Service.board.BoardService;

import com.teamcommit.kickoff.Service.reservation.ReservationService;
import com.teamcommit.kickoff.Service.login.LoginService;
import com.teamcommit.kickoff.Service.board.BoardService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
public class EmpController {

    @Qualifier("EmpService")
    @Autowired
    private EmpService empService;

    @Autowired
    private BoardService boardService;

    @Autowired
    private LoginService loginService;

    @Autowired
    private ReservationService reservationService;

    @GetMapping("/empReservation")
    public String empReservation(@ModelAttribute("reservationDO") ReservationDO reservationDO, Model model) {
        String view = "/emp/empReservation";

        try {
            List<ReservationDO> list = empService.selectReservation(reservationDO);
            model.addAttribute("table", list);            
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return view;
    }
    



    @RequestMapping( "/myBoard")
    public String boardList(HttpServletRequest request, Model model) throws Exception {

        String view = "/emp/myBoard";

        //로그인한 업체ID로 로그인 정보 가져오기
        String empId = (String) request.getSession().getAttribute("empId");

        List<BoardDO> boardList = empService.getList(empId);
        model.addAttribute("boardList", boardList);

        return view;
    }

    @RequestMapping("/fixInfo")
    public ModelAndView fixInfo(@ModelAttribute("empDO") EmployerDO employerDO, @RequestParam("empId") String empId, @RequestParam("empPw") String empPw, @RequestParam("empName") String empName, @RequestParam("empAddress") String empAddress, @RequestParam("empPhoneNumber") String empPhoneNumber, @RequestParam("empEmail") String empEmail, HttpSession session, Model model) throws Exception {

        // EmployerDO.setEmpId(empId);
        // EmployerDO.setEmpPw(empPw);

        EmployerDO result = this.empService.info_fix(employerDO);

        if (result != null) {
            ModelAndView mv = new ModelAndView("redirect:/fixInfo"); // 바뀐 회원정보 조회로 가고 싶음
            session.setAttribute("fixed_info", result);
            return mv;
        } else {
            ModelAndView mv = new ModelAndView("redirect:/fixInfo");
            session.removeAttribute("fixed_info");  // 로그인 실패 시 로그아웃 처리
            return mv;
        }
    }

    /* 풋살장 등록 */
    @RequestMapping(value = "/empFutsalForm")
    public String empFutsalForm(@ModelAttribute("placeDO") PlaceDO placeDO, Model model, HttpServletRequest request) throws Exception {
        String view = "/emp/empFutsal";

        String empId = (String) request.getSession().getAttribute("empId");

        PlaceDO placeInfo = reservationService.selectPlaceInfo(empId);
        model.addAttribute("placeInfo", placeInfo);

        return view;
    }

    /*
        reservation에 placeInfo를 가져와서 넘길려고 만들어 놓은게 있어서,
        그걸 이용해서 정보 가져오려고 reservationService를 사용했어요.
        사용하기 위해서, 위에 @Autowired로 reservationService 선언했구요.
        나중에 insert 쿼리에서 where로 placeId 하실 때 사용하시면 될 것 같아요
        insert쿼리에는 임시로 두개만 적어 놓았어요..
        그리고 emp의 5개 jsp마다 '풋살장 등록' 클릭 링크 주소 변경해 놓았어요.
    */

    @RequestMapping(value="/empFutsal")
    public ModelAndView empFutsal(@ModelAttribute("placeDO") PlaceDO placeDO, HttpServletRequest request, RedirectAttributes redirect) throws Exception {

        ModelAndView mv = new ModelAndView("redirect:/empFutsalFix");

        empService.empFutsalInsert(placeDO);

        return mv;
    }


    /* 풋살장 조희 */
    @RequestMapping( "/empFutsalFix")
    public ModelAndView empFutsalList(@ModelAttribute("placeDO") PlaceDO PlaceDO, HttpSession session) throws Exception {

        ModelAndView mv = new ModelAndView("/emp/empFutsalFix");
        
        List<PlaceDO> list = empService.empFutsalList((String)session.getAttribute("empId"));
        int listSize = list.size();
        
        for(int i = 0; i < listSize; i++) {
        	mv.addObject("list", list.get(i));
        	System.out.println("mv : " + mv);
        	
        }
        mv.addObject("empFutsalList", list);
        mv.addObject("listSize", listSize);
        
        System.out.println("listSize: " + listSize);

        return mv;
    }
    
    
    /* 풋살장 수정 */
    @RequestMapping(value = "/empFutsalFupdate")
    public String empFutsalFupdate(@ModelAttribute("placeDO") PlaceDO placeDO, @RequestParam(value = "placeId") int placeId, Model model) throws Exception {
        String view = "/emp/empFutsalF";
        
        PlaceDO empFutsalFix = empService.selectEmpFutsalFix(placeId);
        model.addAttribute("empFutsalFix", empFutsalFix);
        
        return view;
    }
    
    
    @RequestMapping(value = "/empFutsalF")
    public ModelAndView empFutsalF(@ModelAttribute("placeDO") PlaceDO placeDO, @RequestParam(value = "placeId") int placeId) throws Exception {

        ModelAndView mv = new ModelAndView("redirect:/empFutsalFix?placeId"+placeId);

        empService.updateEmpFutsalF(placeDO);

        return mv;
    }
    

    /* 회원 정보 수정 */
    @RequestMapping(value = "/fixInfo", method = RequestMethod.GET)
    public String updateEmpInfo() {

        String view = "/emp/fixInfo";

        return view;
    }

}
