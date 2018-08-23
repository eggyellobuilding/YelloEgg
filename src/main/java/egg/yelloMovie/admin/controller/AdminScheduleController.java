package egg.yelloMovie.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminScheduleController {

	@RequestMapping(value="adminSchedule.do",method=RequestMethod.GET)
	public ModelAndView adminSchedule() {
		ModelAndView mav = new ModelAndView("admin/schedule/scheduleMain");
		return mav;
	}
}
