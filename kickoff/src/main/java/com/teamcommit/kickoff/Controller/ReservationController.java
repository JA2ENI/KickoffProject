package com.teamcommit.kickoff.Controller;

import com.teamcommit.kickoff.Do.EmployerDO;
import com.teamcommit.kickoff.Do.PlaceDO;
import com.teamcommit.kickoff.Do.ReservationDO;
import com.teamcommit.kickoff.Do.UserDO;
import com.teamcommit.kickoff.Service.LoginService;
import com.teamcommit.kickoff.Service.reservation.ReservationService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ReservationController {

    @Autowired
    @Qualifier("reservationService")
    private ReservationService reservationService;

    @Autowired
    private LoginService loginService;

    @RequestMapping(value = "/reservation", method= RequestMethod.GET)
    public String reservationList(@ModelAttribute("reservationDO") ReservationDO reservationDO, Model model) throws Exception {

        String view = "/reservation/reservation";

        List<ReservationDO> list = reservationService.selectReservationList(reservationDO);

        model.addAttribute("reservationList", list);

        return view;
    }

    @RequestMapping(value = "/reservationInsertForm")
    public String reservationInsertForm(@ModelAttribute("reservationDO") ReservationDO reservationDO, HttpServletRequest request, Model model) throws Exception {
        String view = "/reservation/reservationInsert";

        String empId = (String) request.getSession().getAttribute("empId");
        EmployerDO employerDO = new EmployerDO();
        employerDO.setEmpId(empId);
        
        employerDO = loginService.procSetEmployerInfo(employerDO);

        PlaceDO placeInfo = reservationService.selectPlaceInfo(employerDO.getEmpId());
        model.addAttribute("placeInfo", placeInfo);

        return view;
    }

    @RequestMapping(value = "/reservationInsert")
    public ModelAndView reservationInsert(@ModelAttribute("reservationDO") ReservationDO reservationDO, HttpServletRequest request, Model model) throws Exception {

        ModelAndView mv = new ModelAndView("redirect:/reservation");

        reservationService.insertReservation(reservationDO);

        return mv;
    }

    @RequestMapping(value = "/reservationDetail")
    public String reservationDetail(@ModelAttribute("reservationDO") ReservationDO reservationDO, @RequestParam("reservationNo") int reservationNo, Model model, HttpServletRequest request) throws Exception {

        String view = "/reservation/reservationDetail";

        ReservationDO reservationDetail = reservationService.selectReservationDetail(reservationNo);
        model.addAttribute("reservationDetail", reservationDetail);

        return view;
    }

    @RequestMapping(value = "/reservationUpdateForm")
    public String reservationUpdateForm(@ModelAttribute("reservationDO") ReservationDO reservationDO, @RequestParam("reservationNo") int reservationNo, Model model) throws Exception {
        String view = "/reservation/reservationUpdate";

        ReservationDO reservationDetail = reservationService.selectReservationDetail(reservationNo);
        model.addAttribute("reservationDetail", reservationDetail);

        return view;
    }

    @RequestMapping(value="/reservationUpdate")
    public ModelAndView reservationUpdate(@ModelAttribute("reservationDO") ReservationDO reservationDO, @RequestParam("reservationNo") int reservationNo) throws Exception {
        ModelAndView mv = new ModelAndView("redirect:/reservationDetail?reservationNo="+reservationNo);

        reservationService.updateReservation(reservationDO);

        return mv;
    }
/*
    @RequestMapping(value = "/reservationRequestForm")
    public String reservationRequestForm(@ModelAttribute("reservationDO") ReservationDO reservationDO, @RequestParam("reservationNo") int reservationNo, HttpServletRequest request, HttpSession session) throws Exception {
        String view = "/reservation/reservationRequest";

        String userId = (String) request.getSession().getAttribute("userId");

        UserDO userInfo = reservationService.insertUserInfo(userId);
        session.setAttribute("userInfo", userInfo);

        ReservationDO reservationDetail = reservationService.selectReservationDetail(reservationNo);
        session.setAttribute("reservationDetail", reservationDetail);

        return view;
    }
*/
    @RequestMapping(value = "/reservationRequestForm")
    public String reservationRequestForm(@ModelAttribute("reservationDO") ReservationDO reservationDO, @RequestParam("reservationNo") int reservationNo, HttpServletRequest request, HttpSession session, Model model) throws Exception {
        String view = "/reservation/reservationRequest";

        String userId = (String) request.getSession().getAttribute("userId");

        UserDO userInfo = reservationService.insertUserInfo(userId);
        model.addAttribute("userInfo", userInfo);

        ReservationDO reservationDetail = reservationService.selectReservationDetail(reservationNo);
        model.addAttribute("reservationDetail", reservationDetail);

        return view;
    }
    
    
    @RequestMapping(value = "/reservationRequest")
    public ModelAndView reservationRequest(@ModelAttribute("reservationDO") ReservationDO reservationDO, Model model, HttpSession session) throws Exception {

        ModelAndView mv = new ModelAndView("redirect:/reservation");

        reservationService.insertReservationRequest(reservationDO);

        return mv;
    }
    
  /*  
    @RequestMapping(value = "/reservationRequest")
    public ModelAndView reservationRequest(@ModelAttribute("reservationDO") ReservationDO reservationDO, Model model, HttpSession session) throws Exception {

        ModelAndView mv = new ModelAndView("redirect:/reservation");

        ReservationDO resDO = (ReservationDO)session.getAttribute("reservationDetail");

        reservationDO.setReservationPlaceName(resDO.getReservationPlaceName());
        reservationDO.setReservationCourtName(resDO.getReservationCourtName());
        reservationDO.setReservationUserName(resDO.getReservationUserName());
        reservationDO.setReservationUserPhone(resDO.getReservationUserPhone());
        reservationDO.setReservationDate(resDO.getReservationDate());
        reservationDO.setReservationStartTime(resDO.getReservationStartTime());
        reservationDO.setReservationEndTime(resDO.getReservationEndTime());
        reservationDO.setReservationGameStyle(resDO.getReservationGameStyle());
        reservationDO.setReservationPrice(resDO.getReservationPrice());
        reservationDO.setUserId((String)session.getAttribute("userId"));
        reservationDO.setPlaceId(resDO.getPlaceId());
        reservationDO.setReservationPlaceAddress(resDO.getReservationPlaceAddress());

        reservationService.insertReservationRequest(reservationDO);

        return mv;
    }
*/
}






