package com.teamcommit.kickoff.Controller;


import com.teamcommit.kickoff.Do.*;
import com.teamcommit.kickoff.Service.emp.EmpService;
import com.teamcommit.kickoff.Service.board.BoardService;

import com.teamcommit.kickoff.Service.reservation.ReservationService;
import com.teamcommit.kickoff.Service.login.LoginService;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

@Controller
public class EmpController {

    @Qualifier("EmpService")
    @Autowired
    private EmpService empService;

    @Autowired
    private ReservationService reservationService;

    @GetMapping("/empReservation")
    public String empReservation(HttpSession session, Model model) {
        String view = "/emp/empReservation";

        try {
            List<ReservationDO> list = empService.selectReservation((String)session.getAttribute("empId"));
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
    
    @RequestMapping(value = "/fixInfoCheck")
    public String fixInfoCheck(Model model, HttpSession session) throws Exception {
        String view = "/emp/fixInfoCheck";
    	
        String empId = (String)session.getAttribute("empId");
        
        model.addAttribute("empId", empId);
        
        return view;
    }

    @RequestMapping(value = "/fixInfoCheckResult", method= RequestMethod.POST)
    public ModelAndView fixInfoCheckResult(@RequestParam("empId")String empId, @RequestParam("empPw")String empPw) throws Exception {
       
    	ModelAndView mv = new ModelAndView("/emp/fixInfoCheck");
    	
        if(!empPw.isEmpty()) {
        	EmployerDO emp = new EmployerDO();
        	emp.setEmpId(empId);
        	emp.setEmpPw(empPw);
        	
        	EmployerDO empInfo = empService.empInfoCheck(emp);
        	
        	if(empInfo != null) {
        		mv.setViewName("redirect:/fixInfoSelect");
        		return mv;
        	} else {
        		mv.setViewName("/emp/fixInfoCheck");
        		mv.addObject("msg", "입력하신 비밀번호가 올바르지 않습니다. 다시 확인해 주세요.");
        		return mv;
        	}
        }
        
        mv.addObject("msg", "비밀번호를 입력해주세요.");
        
        return mv;
        
    }
    @RequestMapping(value ="/fixInfoSelect")
    public String fixInfoSelect() throws Exception {
    	String view = "/emp/fixInfoSelect";
    	
    	return view;
    }
    
    @RequestMapping(value ="/fixInfoPw")
    public String fixInfoPw() throws Exception {
    	String view = "/emp/fixInfoPw";
    	
    	return view;
    }
    
    @RequestMapping(value ="/fixInfoPwResult")
    public ModelAndView fixInfoPw(HttpServletRequest request, HttpSession session) throws Exception {
    	ModelAndView mv = new ModelAndView("/emp/fixInfoPw");
    	
    	String newPw = request.getParameter("empPw");
    	String newPw2 = request.getParameter("empPw2");
    	
    	if(newPw == "" || newPw2 == "") {
    		if(newPw == "") {
    			mv.setViewName("/emp/fixInfoPw");
    			mv.addObject("msg", "새 비밀번호를 입력해주세요.");
    			return mv;
    		} else if(newPw2 == "") {
    			mv.setViewName("/emp/fixInfoPw");
    			mv.addObject("msg2", "새 비밀번호 확인을 입력해주세요.");
    			return mv;
    		}
    	}
		
    	if(newPw != "" && newPw2 != "") {
    		if(newPw.equals(newPw2) == false) {
    			mv.setViewName("/emp/fixInfoPw");
    			mv.addObject("msg2", "비밀번호가 일치하지 않습니다.");
    			return mv;
    		} else if(newPw.equals(newPw2) == true) {
    			String empId = (String)session.getAttribute("empId");
    			
    			EmployerDO empInfo = empService.empInfo(empId);
    			
    			String empPw = empInfo.getEmpPw();

    			if(newPw.equals(empPw) == true) {
    				mv.setViewName("/emp/fixInfoPw");
        			mv.addObject("msg", "현재 비밀번호와 같습니다. 다시 입력해주세요.");
        			return mv;
    			} else if(newPw.equals(empPw) == false) {
	    			EmployerDO emp = new EmployerDO();
	    			emp.setEmpId(empId);
	    			emp.setEmpPw(newPw);
	
	    			empService.updatePw(emp);
	
	    			mv.setViewName("/emp/fixInfoPw");
	    			mv.addObject("success", "success");
	    			
	    			System.out.println("success : " + mv.getModel());
	    			return mv;
    			}
    		}
    	}
    	
    	return mv;
    }
    
    @RequestMapping(value = "/fixInfo")
    public String fixInfo(Model model, HttpSession session) throws Exception {
        String view = "/emp/fixInfo";
        
        String empId = (String)session.getAttribute("empId");
        
        EmployerDO empInfo = empService.empInfo(empId);
        
        String empDay = empInfo.getEmpDate();
    	String year = empDay.substring(0, 4);
    	String month = empDay.substring(5, 7);
    	String day = empDay.substring(8, 10);
    	
    	String empEmail = empInfo.getEmpEmail();
    	String[] arrayEmail = empEmail.split("@|\\."); 
    	String mail = arrayEmail[0];
    	String email = arrayEmail[1];
    	
    	HashMap<String, String> map = new HashMap<>();
    	
    	map.put("year", year);
    	map.put("month", month);
    	map.put("day", day);
    	map.put("mail", mail);
    	map.put("email", email);
    	
    	model.addAttribute("empInfo", empInfo);
    	model.addAttribute("map", map);
        
        return view;
    }
    
    @RequestMapping(value = "/fixInfoResult")
    public String fixInfoResult(@ModelAttribute("employerDO")EmployerDO employerDO, @RequestParam("year")String year, @RequestParam("month")String month, @RequestParam("day")String day, @RequestParam("mail")String mail, @RequestParam("email")String email, HttpServletRequest request) throws Exception {
        String view = "redirect:/fixInfo";

        String empDay = year + month + day;
        String empEmail = mail + "@" + email;
        
        employerDO.setEmpDate(empDay);
        employerDO.setEmpEmail(empEmail);
        
		empService.updateEmpInfo(employerDO); 
        
        return view;
    }
    
    @RequestMapping("/empDelete")
	public String delete(EmployerDO employerDO, HttpSession session) throws Exception {
		String empId = (String) session.getAttribute("empId");
		empService.deleteEmp(empId);
		session.invalidate();
		return "redirect:/main";
	}


    /*
        reservation에 placeInfo를 가져와서 넘길려고 만들어 놓은게 있어서,
        그걸 이용해서 정보 가져오려고 reservationService를 사용했어요.
        사용하기 위해서, 위에 @Autowired로 reservationService 선언했구요.
        나중에 insert 쿼리에서 where로 placeId 하실 때 사용하시면 될 것 같아요
        insert쿼리에는 임시로 두개만 적어 놓았어요..
        그리고 emp의 5개 jsp마다 '풋살장 등록' 클릭 링크 주소 변경해 놓았어요.
    */

    /* 풋살장 등록페이지로 이동 */
    @RequestMapping(value = "/empFutsal")
    public String empFutsal(@ModelAttribute("placeDO") PlaceDO placeDO, Model model, HttpServletRequest request) throws Exception {
        String view = "/emp/empFutsal";

        return view;
	}

	/* 풋살장 등록 */
	@RequestMapping(value="/empFutsalForm")
    public ModelAndView empFutsalForm(@ModelAttribute("placeDO") PlaceDO placeDO, HttpServletRequest request, RedirectAttributes redirect, @RequestParam MultipartFile uploadFile) throws Exception {

       ModelAndView mv = new ModelAndView();
       
       try {
    	   // 이미지를 업로드할 디렉토리 경로
           String uploadDirectory = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\images"; 
           
           // 업로드된 파일의 원본 이름
           String originalFilename = uploadFile.getOriginalFilename();
           
           // 확장자 추출
           String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
           
           // 저장될 파일 이름 (UUID 사용)
           String fileName = UUID.randomUUID().toString() + extension;
           
           // 파일을 저장할 경로 생성
           String filePath = uploadDirectory + "\\" + fileName;
           Path targetPath = Path.of(filePath);
           
           // 파일 저장
           Files.copy(uploadFile.getInputStream(), targetPath, StandardCopyOption.REPLACE_EXISTING);
           
           // 이미지 파일 경로를 placeDO에 설정
           placeDO.setImgName(fileName);
           placeDO.setImgPath("/images/");
    	   
    	   empService.empFutsalInsert(placeDO);
           mv = new ModelAndView("redirect:/empFutsalFix?placeId=" + placeDO.getPlaceId());
           
           redirect.addFlashAttribute("msg", "등록 완료되었습니다.");
           
       } catch (Exception e) {
    	   redirect.addFlashAttribute("msg", "오류가 발생되었습니다. 다시 시도해주세요.");
    	   e.printStackTrace();
       }

       return mv;
    }

    /* 풋살장 조희 */
    @RequestMapping( "/empFutsalFix")
    public ModelAndView empFutsalList(HttpSession session) throws Exception {

    	ModelAndView mv = new ModelAndView("/emp/empFutsalFix");
    	
    	String empId = (String)session.getAttribute("empId");
    	
        List<PlaceDO> list = empService.empFutsalList(empId);
        
        for(PlaceDO placeDO : list) {
        	 mv.addObject("empFutsalList", placeDO);
        }
        
        return mv;
    }
    
    
    /* 풋살장 수정 폼*/
    @RequestMapping(value = "/empFutsalUpdateForm")
    public String empFutsalUpdateForm(@RequestParam(value = "placeId")int placeId, Model model) throws Exception {
        String view = "/emp/empFutsalF";
        
        PlaceDO empFutsalFix = empService.selectEmpFutsalFix(placeId);
        
        model.addAttribute("empFutsalFix", empFutsalFix);
        
        return view;
    }
    
    /* 풋살장 수정*/
    @RequestMapping(value = "/empFutsalF")
    public ModelAndView empFutsalUpdate(@ModelAttribute("placeDO")PlaceDO placeDO, @RequestParam MultipartFile uploadFile) throws Exception {

        ModelAndView mv = new ModelAndView("redirect:/empFutsalFix");
        
        // 업로드된 파일 처리
        if (!uploadFile.isEmpty()) {
            // 이미지를 업로드할 디렉토리 경로
            String uploadDirectory = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\images";

            // 업로드된 파일의 원본 이름
            String originalFilename = uploadFile.getOriginalFilename();

            // 확장자 추출
            String extension = originalFilename.substring(originalFilename.lastIndexOf("."));

            // 저장될 파일 이름 (UUID 사용)
            String fileName = UUID.randomUUID().toString() + extension;

            // 파일을 저장할 경로 생성
            String filePath = uploadDirectory + "\\" + fileName;
            Path targetPath = Path.of(filePath);

            String oldFilePath = uploadDirectory + "\\" + placeDO.getImgName();
            Path oldPath = Path.of(oldFilePath);

            if (Files.exists(oldPath)) {
                try {
                    Files.deleteIfExists(oldPath);
                } catch (IOException e) {
                    // 파일 삭제 실패 시 예외 처리
                    e.printStackTrace();
                }
            }

            // 파일 저장
            try (InputStream inputStream = uploadFile.getInputStream()) {
                Files.copy(inputStream, targetPath, StandardCopyOption.REPLACE_EXISTING);
            }
            
            // 이미지 파일 경로를 placeDO에 설정
            placeDO.setImgName(fileName);
            placeDO.setImgPath("/images/");
        }

        empService.updateEmpFutsalF(placeDO);

        return mv;
    }
    

}
