package egg.yelloMovie.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import egg.cinema.admin.model.CinemaDTO;
import egg.statics.admin.model.AdminStaticsDAO;

@Controller
public class AdminStaticsController {

	@Autowired
	private AdminStaticsDAO tdao;
	
	@RequestMapping(value="/adminStatics.do",method=RequestMethod.GET)
	public ModelAndView adminStatics() {
		ModelAndView mav = new ModelAndView("/admin/statics/adminStatics");
		return mav;
	}
	

	@RequestMapping(value="/adminStatics.do",method=RequestMethod.POST)
	public ModelAndView adminStaticDate(@RequestParam("date")String date[]){
		//조회 날짜
		String date1_s = date[0];
		String date2_s = date[1];
		
		//지역
		List<CinemaDTO> citys =tdao.cinemaCity();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startDay", date1_s);
		map.put("endDay", date2_s);
		
		Map<String,List<Integer>> resultMap = tdao.cityStaticsCount(citys, map);
		ModelAndView mav = new ModelAndView("/admin/statics/adminStatics");
		mav.addObject("resultMap",resultMap);
		mav.addObject("date",date);
		
		return mav;
	}
	@RequestMapping("movieRate.do")
	public ModelAndView movieRate(@RequestParam("date1")String date1,
			@RequestParam("date2")String date2,
			@RequestParam(value="num",defaultValue="1")int num){
		
		List<CinemaDTO> citys =tdao.cinemaCity();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startDay", date1);
		map.put("endDay", date2);
		
		Map<String,Integer> resultMap = tdao.StaticsMovieRate(citys, map, num);
		ModelAndView mav = new ModelAndView("yongJson");
		mav.addObject("resultMap",resultMap);
		mav.addObject("citys",citys);
		return mav;
	}
}
