package carbon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@RequestMapping("/admin")
@Controller
public class AdminController { //admin 관련 페이지

	@RequestMapping("/admin_data.do")
	public String admin_data() {
		return "admin/admin_data";
	}
	
}
