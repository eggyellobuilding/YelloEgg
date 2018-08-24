package egg.yelloMovie.admin.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import egg.cinema.admin.model.CinemaDAO;
import egg.cinema.admin.model.CinemaDTO;
import egg.schedule.admin.model.AdminScheduleDAO;

@Controller
public class AdminScheduleController {

	@Autowired
	private AdminScheduleDAO asdao;
	
	@Autowired
	private CinemaDAO cdao;
	
	@RequestMapping(value="adminSchedule.do",method=RequestMethod.GET)
	public ModelAndView adminSchedule(@RequestParam(value="cinemaIdx",defaultValue="-1")int cinemaIdx) {
		
		CinemaDTO cdto = new CinemaDTO();
		//마스터 접속
		if(cinemaIdx == 0) {
			
		}else {
			cdto = asdao.adminScheduleMain(cinemaIdx);
		}
		//시간 계산
		ArrayList<String> arr = new ArrayList<String>();
		int h1 = 0;
		String h ="0";
		
		for(int i=1;i<=48;i++) {
			h ="0";
			String m = "30";
			
			if(i%2==0) {
				m="00";
				h1++;
			}
			h=h1+"";
			if(h1<10) {
				h = "0"+h1;
			}
			
			arr.add(h+":"+m);
		}
		
		ModelAndView mav = new ModelAndView("admin/schedule/adminScheduleMain");
		mav.addObject("arr",arr);
		mav.addObject("cdto",cdto);
		return mav;
	}
	
	@RequestMapping(value="/adminCinemaFindJquery.do",method=RequestMethod.GET)
	public ModelAndView adminScheduleCinemaFind() {
		List<CinemaDTO> cityLists =  cdao.theaterCinemaCity();
		ModelAndView mav = new ModelAndView("yongJson");
		mav.addObject("cityLists", cityLists);
		return mav;
	}
	
	@RequestMapping(value="/adminCinemaNameFindJquery.do",method=RequestMethod.GET)
	public ModelAndView adminScheduleCinemaNameFind(@RequestParam("cinemaCity")String cinemaCity) {
		List<CinemaDTO> nameLists = cdao.theaterCinemaName(cinemaCity);
		ModelAndView mav = new ModelAndView("yongJson");
		mav.addObject("nameLists",nameLists);
		return mav;
	}
}
