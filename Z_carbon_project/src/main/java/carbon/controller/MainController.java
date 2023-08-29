package carbon.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import carbon.dto.MemberDto;
import carbon.service.MemberService;

@Controller
public class MainController {

	@Autowired
	MemberService memberservice;

	@RequestMapping("/")
	public String index() {
		return "main";
	}
	
	@RequestMapping("/dashboard.do")
	public String dashboard() {
		return "dashboard";
	}
	@RequestMapping("/despose.do")
	public String despose() {
		return "despose";
	}
	@RequestMapping("/despose_detail.do")
	public String despose_detail() {
		return "despose_detail";
	}
	
	/*
	 * @RequestMapping(value = "/test.do") public String TilesTest(HttpSession
	 * session) {
	 * 
	 * String name = (String) session.getAttribute("member_name");
	 * 
	 * ModelAndView mav = new ModelAndView();
	 * 
	 * mav.addObject("member_name", name);
	 * 
	 * return "test"; }
	 */

	@RequestMapping("/main.do")
	public ModelAndView main() {

		ModelAndView mav = new ModelAndView();

		mav.setViewName("main");
		mav.addObject("msg", "테스트 테스트");

		System.out.println(mav);
		
		return mav;
	}

	@RequestMapping("/dash_dertail.do")
	public String detail() {
		return "dash_detail";
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

	@ResponseBody
	@RequestMapping("/data.do")
	public String data() {

		String test = "ajax 테스트 성공";
		return test;
	}

}
