package carbon.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import carbon.cmmn.LoggingService;
import carbon.dto.MemberDto;
import carbon.service.MemberService;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(LoggingService.class);
	
	@Autowired
	MemberService memberservice;
	
	@RequestMapping("/login.do") // 로그인페이지
	public String login() {
		
		return "login";
	}
	
	@ResponseBody
	@RequestMapping("/login_action/member.do") // 로그인기능
	public boolean action_login(@RequestParam("member_id") String member_id, @RequestParam("member_pwd") String member_pwd, HttpSession session) throws Exception {
		
		System.out.println("member_id : "+member_id);
		System.out.println("member_pwd : "+member_pwd);
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		boolean result = false;
		List<MemberDto> member_info  = memberservice.select_id(member_id); // id 조회
		logger.info("info_list ={}",member_info);
		
		if(member_info.isEmpty()) { // 조회된 회원정보 없을 시 
			
			System.out.println("아이디 또는 비밀번호가 틀립니다");
			result = false;
			
		}else{
			String encode_pwd = member_pwd;
			System.out.println("encode : " + encode_pwd);
			String encode_pwd2 = member_info.get(0).getMember_pwd();
			System.out.println("encode2 : " + encode_pwd2);
			
			boolean stat = passwordEncoder.matches(encode_pwd, encode_pwd2);  // 첫번쨰에 비밀번호  두번쨰에 db값
			System.out.println(stat);
			
			if(stat == true) {
				session.setAttribute("member_name", member_info.get(0).getMember_name());
				System.out.println("로그인 성공");
				result = true;
			}else{
				System.out.println("아이디 또는 비밀번호가 틀립니다");
				result = false;
			}
		}
		
		return result;
		
	}
	
	
	@RequestMapping("/login/action/member.do") // 로그인페이지
	public ModelAndView action_action_login(@RequestParam("member_id") String member_id, @RequestParam("member_pwd") String member_pwd, RedirectAttributes redirect) throws Exception {
		
		System.out.println("member_id : "+member_id);
		System.out.println("member_pwd : "+member_pwd);
		ModelAndView mav = new ModelAndView();
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		List<MemberDto> member_info  = memberservice.select_id(member_id); // id 조회
		logger.info("info_list ={}",member_info);
		
		if(member_info.isEmpty()) { // 조회된 회원정보 없을 시 
			
			System.out.println("아이디 또는 비밀번호가 틀립니다");
//			redirect.addFlashAttribute("msg", "아이디 또는 비밀번호가 틀립니다");
			mav.addObject("msg", "아이디 또는 비밀번호가 틀립니다");
			mav.setViewName("forward:/login.do");
			
		}else{
			String encode_pwd = member_pwd;
			System.out.println("encode : " + encode_pwd);
			String encode_pwd2 = member_info.get(0).getMember_pwd();
			System.out.println("encode2 : " + encode_pwd2);
			
			boolean stat = passwordEncoder.matches(encode_pwd, encode_pwd2);  // 첫번쨰에 비밀번호  두번쨰에 db값
			System.out.println(stat);
			
			if(stat == true) {
				System.out.println("로그인 성공");
//				redirect.addFlashAttribute("msg", "로그인 성공");
				mav.setViewName("forward:/test.do");
				mav.addObject("msg", "로그인 성공");
			}else{
				System.out.println("아이디 또는 비밀번호가 틀립니다");
//				redirect.addFlashAttribute("msg", "아이디 또는 비밀번호가 틀립니다");
				mav.setViewName("forward:/login.do");
				mav.addObject("msg", "아이디 또는 비밀번호가 틀립니다");
			}
			
		}
		
		System.out.println(mav);
		
		return mav;
		
	}
	
	// 로그아웃 
    @RequestMapping("/logout_action/logout.do") 
    public String logout(HttpSession session) throws Exception{
        
        session.invalidate();
        
        return "redirect:/login.do";        
        
    }
	
}

