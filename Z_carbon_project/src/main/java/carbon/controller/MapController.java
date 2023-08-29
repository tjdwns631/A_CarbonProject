package carbon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/map")
@Controller
public class MapController {
	
	@RequestMapping("/map_test.do")
	public String admin_data() {
		return "map/map_test";
	}
	
}
