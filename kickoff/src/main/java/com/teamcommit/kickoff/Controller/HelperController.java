package com.teamcommit.kickoff.Controller;

import com.teamcommit.kickoff.Do.HelperDO;
import com.teamcommit.kickoff.Do.MessageDO;
import com.teamcommit.kickoff.Do.ReservationDO;
import com.teamcommit.kickoff.Service.helper.HelperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import org.json.*;

import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class HelperController {

    @Autowired
    private HelperService helperService;

    @GetMapping("/helperList")
    public String helperList(@ModelAttribute("helperDO") HelperDO helperDO, Model model) {
        String view = "/helper/helperList";

        try {
            //helperService.updateStatus();
            List<HelperDO> list = helperService.selectHelper(helperDO);
            model.addAttribute("table", list);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return view;
    }
    
    @PostMapping("/helperList")
    @ResponseBody
    public String HelperList(@RequestParam(value = "helperTime") String helperTime, Model model) {
    	JSONArray array = new JSONArray();
    	try {
    		List<HelperDO> list = helperService.selectHelperTime(helperTime);
    		for(HelperDO helperDO : list) {
    			JSONObject obj = new JSONObject();
    			 obj.put("helperSeqNo", helperDO.getHelperSeqno());
    			 obj.put("helperMatch", helperDO.getHelperMatch());	// obj.put("key","value")
    			 obj.put("helperPosition", helperDO.getHelperPosition());
    			 obj.put("helperTeamLevel", helperDO.getHelperTeamLevel());
    			 obj.put("helperGender", helperDO.getHelperGender());
    			 obj.put("helperPlaceName", helperDO.getHelperPlaceName());
    			 obj.put("helperTime", helperDO.getHelperTime());
    			 obj.put("helperUserId", helperDO.getUserId());
    			 obj.put("helperStatus", helperDO.getHelperStatus());
    		     array.put(obj);	//작성한 JSON 객체를 배열에 추가
    		     
    		}
    	}
    	catch (Exception e) {
    		e.printStackTrace();
    	}
    	
    	return array.toString();
    }

    @GetMapping("/helperInsert")
    public String helperInsert(Model model, HttpSession session) {
        String view = "/helper/helperInsert";

            if(session.getAttribute("userId") == null) {
                model.addAttribute("script", "alert('일반 회원 로그인 후 이용이 가능합니다.');");
                view = "login/loginAll";
            }
            else if(session.getAttribute("userId") != null) {
                try {
                    List<ReservationDO> list = helperService.selectReservation((String) session.getAttribute("userId"));
                    String userId = (String) session.getAttribute("userId");
                    
                    if(list == null) {
                    	model.addAttribute("msg", "예약 내역이 존재하지 않습니다.");
                    }
                    else if(list != null) {
                    	model.addAttribute("reservation", list);
                        model.addAttribute("userId", userId);
                    }
                }
                catch (Exception e) {
                    e.printStackTrace();
                   
                }
            }
        return view;
    }

    @PostMapping("/helperInsert")
    public String helperInsertNot(Model model, HttpSession session) {
        String view = "/helper/helperInsert";

        if(model.getAttribute("placeName") == null || model.getAttribute("address") == null || model.getAttribute("date") == null || model.getAttribute("helperId") == null) {
            session.setAttribute("resScript", "alert('예약을 먼저 진행하여 내역을 등록해주세요 :)');");
        }
        return view;
    }

    @GetMapping("/helperReservation")
    public String helperInsert(@RequestParam(value = "helperPlaceName") String helperPlaceName, @RequestParam(value = "helperAddress") String helperAddress,
                               @RequestParam(value = "helperTime") String helperTime, @RequestParam(value = "userId") String userId, Model model) {
        String view = "forward:/helperInsert";
        model.addAttribute("placeName", helperPlaceName);
        model.addAttribute("address", helperAddress);
        model.addAttribute("date", helperTime);
        model.addAttribute("helperId", userId);
        return view;
    }

    @PostMapping("/helperReservation")
    public String helperInsert(@ModelAttribute("helperDO") HelperDO helperDO, HttpSession session, Model model) {
        String view = "/helper/helperInsert";

            try {
                helperService.insertHelper(helperDO);
                model.addAttribute("script", "alert('용병 모집을 등록했습니다!');");
            }
            catch (Exception e) {
                e.printStackTrace();
                model.addAttribute("script", "alert('양식을 제대로 입력해주세요 :)');");
            }


        return view;
    }

    @RequestMapping(value = "/helperDetail", method = RequestMethod.GET)
    public String helperDetail(@ModelAttribute("helperDO") HelperDO helperDO, @RequestParam(value = "helperSeqno") int helperSeqno, HttpSession session) {
        String view = "/helper/helperDetail";

        try {
            HelperDO detail = helperService.selectHelperDetail(helperSeqno);
            session.setAttribute("content", detail);
            session.setAttribute("helperSeqNo", helperSeqno);
        }
        catch (Exception e) {
            e.printStackTrace();
        }

        return view;
    }

    @GetMapping("/helperMessage")
    public ModelAndView helperMessage(Model model, HttpSession session) {
        ModelAndView mv = new ModelAndView("/message/helperMessageInsert");

        if(session.getAttribute("userId") == null) {
            model.addAttribute("userScript", "alert('일반 회원 로그인 후 이용해주세요');");
            mv.setViewName("forward:/helperDetail?helperSeqno=" + (Integer)session.getAttribute("helperSeqNo"));
        }
        else if(session.getAttribute("userId") != null) {
            try{
                HelperDO message = helperService.selectHelperDetail((Integer)session.getAttribute("helperSeqNo"));
                String userId = (String)session.getAttribute("userId");

                if(message.getUserId().equals(userId)) {
                    model.addAttribute("userScript", "alert('본인 게시글에는 신청을 할 수 없습니다!');");
                    mv.setViewName("forward:/helperDetail?helperSeqno=" + (Integer)session.getAttribute("helperSeqNo"));
                }
                else {
                    session.setAttribute("message", message);
                    session.setAttribute("messageUserId", userId);
                }
            }
            catch (Exception e) {
                e.printStackTrace();
            }
        }

        return mv;
    }

   @PostMapping("/helperMessage")
    public String helperMessage(@ModelAttribute("messageDO") MessageDO messageDO, Model model, HttpSession session) {
        String view = "/message/helperMessageInsert";

        HelperDO receive = (HelperDO) session.getAttribute("message");
        messageDO.setMessageReceiveId(receive.getUserId());
        messageDO.setMessageSendId((String) session.getAttribute("messageUserId"));

            try {
                helperService.insertMessage(messageDO);
                model.addAttribute("msgScript", "alert('메시지를 보냈습니다!');");
            }
            catch (Exception e) {
                e.printStackTrace();
                model.addAttribute("msgScript", "alert('양식이 올바르지 않습니다.');");
            }

        return view;
    }

}
