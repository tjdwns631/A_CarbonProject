package carbon.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import carbon.dto.CbntrdataDto;
import carbon.dto.MemberDto;
import carbon.security.User;
import carbon.service.CarbondataService;
import carbon.service.MemberService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MainController {

	@Autowired
	MemberService memberservice;
	
	@Autowired
	CarbondataService carbondataservice;
	
	@RequestMapping("/dashboard.do")
	public String dashboard(Model model) {
		
		List<CbntrdataDto> year_list = carbondataservice.Selectyear();
		model.addAttribute("year_list",year_list); // 연도 선택 Select box 구성
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		User user = (User)authentication.getPrincipal();
		System.out.println("testet"+ user.getUsername());
		log.info("test={}",user);
		
		return "dashboard";
	}
	
	@RequestMapping("/cf_dispose.do")
	public String despose(Model model) {
		
		List<CbntrdataDto> year_list = carbondataservice.Selectyear();
		model.addAttribute("year_list",year_list); // 연도 선택 Select box 구성
		
		return "cf_dispose";
	}
	
	@RequestMapping("/cf_lowdispose_detail.do")
	public String despose_detail(Model model) {
		
		List<CbntrdataDto> year_list = carbondataservice.Selectyear();
		model.addAttribute("year_list",year_list); // 연도 선택 Select box 구성
		
		return "cf_lowdispose_detail";
	}

	@ResponseBody
	@RequestMapping("/memberAjax.do")
	public Map<String, Object> member_data() {

		List<MemberDto> memberdto = memberservice.select_member();
		System.out.println(memberdto);
		Map<String, Object> ajax = new HashMap<>();
		ajax.put("member", memberdto);
		System.out.println(ajax);

		return ajax;
	}
	
}
