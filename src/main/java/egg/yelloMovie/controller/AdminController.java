package egg.yelloMovie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	@RequestMapping("main.do")
	public String main() {
		return "main";
	}
	
	@RequestMapping("admin.do")
	public String admin() {
		return "/admin/adminTemplete";
	}

}

