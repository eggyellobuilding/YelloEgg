package egg.yelloMovie.admin.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;

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
import java.util.*;
@Controller
public class AdminScheduleController {

	Calendar cal =  Calendar.getInstance();
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH) + 1;
	int day = cal.get(Calendar.DATE);
	
	String nowday = year+"-"+month+"-"+day;
	@Autowired
	private AdminScheduleDAO asdao;
	
	@Autowired
	private CinemaDAO cdao;
	//스캐줄 메인
	@RequestMapping(value="adminSchedule.do",method=RequestMethod.GET)
	public ModelAndView adminSchedule(@RequestParam(value="cinemaIdx",defaultValue="-1")int cinemaIdx) {
	
		CinemaDTO cdto = new CinemaDTO();
		List<CinemaDTO> theaterLists=null;
		//마스터 접속
		if(cinemaIdx == 0) {
			
		}else {
			cdto = asdao.adminScheduleMain(cinemaIdx);
			theaterLists = asdao.adminScheduleTheater(cinemaIdx);
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
		mav.addObject("lists",theaterLists);

		return mav;
	}
	
	//스캐줄 전체 목록 json
	@RequestMapping(value="/adminScheduleMainJquery.do",method=RequestMethod.POST)
	public ModelAndView adminScheduleMain(@RequestParam("cinemaIdx")int cinemaIdx,
			@RequestParam(value="date",defaultValue="now")String date) {

		CinemaDTO cdto = new CinemaDTO();
		List<CinemaDTO> theaterLists=null;
		Map<Integer ,List<AdminScheduleDTO>> map = new HashMap<Integer ,List<AdminScheduleDTO>>();
		
		cdto = asdao.adminScheduleMain(cinemaIdx);
		theaterLists = asdao.adminScheduleTheater(cinemaIdx);
		
		cdto = asdao.adminScheduleMain(cinemaIdx);
		theaterLists = asdao.adminScheduleTheater(cinemaIdx);
		java.sql.Date date2= java.sql.Date.valueOf(date);
		
		for(int i =0; i < theaterLists.size();i++) {
			AdminScheduleDTO asdto = new AdminScheduleDTO();
			asdto.setScheduleDate(date2);
			asdto.setScheduleTheaterIdx(theaterLists.get(i).getTheaterIdx());
			List<AdminScheduleDTO> asdtoList = asdao.adminScheduleList(asdto);
			map.put(theaterLists.get(i).getTheaterIdx(), asdtoList);
		}
		
		
		ModelAndView mav = new ModelAndView("yongJson");
		mav.addObject("scheduleMap",map);
		mav.addObject("theaterList",theaterLists);
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
	
	//스캐줄 등록
	@RequestMapping(value="adminScheduleAdd.do",method=RequestMethod.POST)
	public ModelAndView adminScheduleAdd(@RequestParam("scheduleInfo")List<String> lists) {
		ArrayList<AdminScheduleDTO> arr =new ArrayList<AdminScheduleDTO>();
		for(int i = 0 ; i < lists.size();i++) {
			AdminScheduleDTO dto = new AdminScheduleDTO();
			String schedule[]= lists.get(i).split(",",4);
			//startdate
			Date date=null;
			try {
				date = new SimpleDateFormat("yyyy-MM-dd").parse(schedule[0]);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			dto.setScheduleDate(date);
			
			//startTime
			dto.setScheduleStartTime(Integer.parseInt(schedule[1]));
			dto.setScheduleTheaterIdx(Integer.parseInt(schedule[2]));
			dto.setScheduleMovieIdx(Integer.parseInt(schedule[3]));
			arr.add(dto);
		}
		int result = asdao.adminScheduleAdd(arr);
		String msg=(result==arr.size())?"등록 성공":"등록 실패";
		ModelAndView mav = new ModelAndView("admin/schedule/adminScheduleMsg");
		mav.addObject("msg",msg);
		mav.addObject("gopage","adminSchedule.do");
		return mav;
	}
	//스캐줄등록  -- 사영관 선택 -- 스캐줄
	@RequestMapping(value="adminScheduleSelectJquery.do",method=RequestMethod.POST)
	public ModelAndView adminScheduleAdd(@RequestParam("theaterIdx")int theaterIdx,
			@RequestParam("scheduleDate")String scheduleDate){
		AdminScheduleDTO dto = new AdminScheduleDTO();
		
		java.sql.Date date= java.sql.Date.valueOf(scheduleDate);
		

		dto.setScheduleDate(date);
		dto.setScheduleTheaterIdx(theaterIdx);
		List<AdminScheduleDTO> asdtoList = asdao.adminScheduleList(dto);
		
		
		
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
		
		ModelAndView mav = new ModelAndView("yongJson");

		mav.addObject("asdtoList",asdtoList);
		mav.addObject("time",arr);
		return mav;
	}
}