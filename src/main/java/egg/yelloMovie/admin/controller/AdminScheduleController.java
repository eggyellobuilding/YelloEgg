package egg.yelloMovie.admin.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import egg.cinema.admin.model.CinemaDAO;
import egg.cinema.admin.model.CinemaDTO;
import egg.schedule.admin.model.AdminScheduleDAO;
import egg.schedule.admin.model.AdminScheduleDTO;

@Controller
public class AdminScheduleController {

	@Autowired
	private AdminScheduleDAO asdao;
	
	@Autowired
	private CinemaDAO cdao;
	//스캐줄 메인
	@RequestMapping(value="adminSchedule.do",method=RequestMethod.GET)
	public ModelAndView adminSchedule(@RequestParam(value="cinemaIdx",defaultValue="-1")int cinemaIdx) {
		
		CinemaDTO cdto = new CinemaDTO();
		List<CinemaDTO> lists=null;
		//마스터 접속
		if(cinemaIdx == 0) {
			
		}else {
			cdto = asdao.adminScheduleMain(cinemaIdx);
			lists = asdao.adminScheduleTheater(cinemaIdx);
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
		mav.addObject("lists",lists);
		return mav;
	}
	//영화관 시 목록  json
	@RequestMapping(value="/adminCinemaFindJquery.do",method=RequestMethod.GET)
	public ModelAndView adminScheduleCinemaFind() {
		List<CinemaDTO> cityLists =  cdao.theaterCinemaCity();
		ModelAndView mav = new ModelAndView("yongJson");
		mav.addObject("cityLists", cityLists);
		return mav;
	}
	//영화관 이름 목록  json
	@RequestMapping(value="/adminCinemaNameFindJquery.do",method=RequestMethod.GET)
	public ModelAndView adminScheduleCinemaNameFind(@RequestParam("cinemaCity")String cinemaCity) {
		List<CinemaDTO> nameLists = cdao.theaterCinemaName(cinemaCity);
		ModelAndView mav = new ModelAndView("yongJson");
		mav.addObject("nameLists",nameLists);
		return mav;
	}
	
	//스캐줄 등록 모달-- 영화 목록
	@RequestMapping(value="adminScheduleMovieFindJquery.do",method=RequestMethod.POST)
	public ModelAndView adminScheduleMovieFind(@RequestParam("movieName")String movieName) {
		List<AdminScheduleDTO> movieNameList = asdao.adminScheduleFindMovieInfo(movieName);
		ModelAndView mav = new ModelAndView("yongJson");
		mav.addObject("movieNameList",movieNameList);
		return mav;
	}
	
	//스캐줄 등록 모달 -- 영화 상세 정보
	@RequestMapping(value="adminScheduleMovieDetailJquery.do",method=RequestMethod.GET)
	public ModelAndView adminScheduleMovieDetail(@RequestParam("movieIdx")int movieIdx) {
		AdminScheduleDTO movieDetail = asdao.adminScheduleMovieDetail(movieIdx);
		ModelAndView mav = new ModelAndView("yongJson");
		mav.addObject("movieDetail",movieDetail);
		return mav;
	}
	
}
