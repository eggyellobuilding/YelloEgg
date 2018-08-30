package egg.yelloMovie.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import egg.cinema.admin.model.CinemaDAO;
import egg.cinema.admin.model.CinemaDTO;
import egg.qaboard.model.QaBoardDAO;

@Controller
public class QaController {

	@Autowired
	private QaBoardDAO qadao;
	
	@Autowired
	private CinemaDAO cdao;
	
	@RequestMapping("/adminQaCinemaFindJquery.do")
	public ModelAndView adminQaCinemaFindJquery() {
		List<CinemaDTO> cityLists =  cdao.theaterCinemaCity();
		ModelAndView mav = new ModelAndView("yongJson");
		mav.addObject("cityLists", cityLists);
		return mav;
	}
	
	//영화관 이름 목록  json
	@RequestMapping(value="/adminQaCinemaNameFindJquery.do",method=RequestMethod.GET)
	public ModelAndView adminScheduleCinemaNameFind(@RequestParam("cinemaCity")String cinemaCity) {
		List<CinemaDTO> nameLists = cdao.theaterCinemaName(cinemaCity);
		ModelAndView mav = new ModelAndView("yongJson");
		mav.addObject("nameLists",nameLists);
		return mav;
	}
}
