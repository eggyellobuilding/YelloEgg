package egg.yelloMovie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	/**메인 화면*/
	@RequestMapping("main.do")
	public String main() {
		return "view/main";
	}
	
	@RequestMapping("admin.do")
	public String admin() {
		return "/admin/adminTemplete";
	}

}

