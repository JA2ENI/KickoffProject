package com.teamcommit.kickoff.Controller;

import com.teamcommit.kickoff.Do.BoardDO;
import com.teamcommit.kickoff.Do.GameDO;
import com.teamcommit.kickoff.Do.ReservationDO;
import com.teamcommit.kickoff.Service.main.MainService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.List;

@Controller
public class MainController {

	@Autowired
	private MainService mainService;

	@GetMapping("/main")
	public String main(@ModelAttribute("boardDO") BoardDO boardDO, @ModelAttribute("reservationDO") ReservationDO reservationDO, @ModelAttribute("gameDO") GameDO gameDO, Model model) {
		String view = "/main";
		String resResult = "", gameResult = "", boardResult = "";

		try {
			List<ReservationDO> reservationList = mainService.selectReservationMain();
			model.addAttribute("resList", reservationList);

			List<GameDO> gameList = mainService.selectGameMain();
			model.addAttribute("gameList", gameList);

			List<BoardDO> boardList = mainService.selectBoardMain();
			model.addAttribute("boardList", boardList);
		}
		catch (Exception e) {
			e.printStackTrace();
		}

		return view;
	}
}
