package egg.yelloMovie.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import egg.cinema.admin.model.CinemaDAO;
import egg.cinema.admin.model.CinemaDTO;
import egg.commons.GetCalendar;
import egg.reservation.model.ReservationDAO;
import egg.reservation.model.ReservationDTO;

@Controller
public class MovieReservationController {

	@Autowired
	private ReservationDAO rdao;
	
	@Autowired
	private CinemaDAO cdao;
	
	/** 영화 예약 */
	@RequestMapping("/movieReservation.do")
	public ModelAndView movieReservationForm() {
		ModelAndView mav = new ModelAndView();
		
		//영화 리스트
		List<ReservationDTO> movieList = rdao.movieList();
		//영화관 시 리스트
		List<ReservationDTO> cinemaSiList = rdao.reservatonCinemaSiList();
		//스캐줄 리스트
		ReservationDTO rdto = new ReservationDTO();
		GetCalendar  cal = new GetCalendar();
		String now = cal.getDay();
		java.sql.Date now2= java.sql.Date.valueOf(now);
		rdto.setScheduleDate(now2);
		String stage = "1";
		mav.addObject("movieList", movieList);
		mav.addObject("cinemaSiList",cinemaSiList);
		mav.addObject("stage",stage);
		mav.setViewName("view/reservation/reservationMovie");
		return mav;
	}
	
	/**영화과 이름*/
	@RequestMapping("/reservationCinemaNameJquery.do")
	public ModelAndView reservationCinemaNameJquery(@RequestParam("cinemaCity")String cinemaCity) {
		//영화관 이름 가져오기
		List<ReservationDTO> cinemaName = rdao.reservatonCinemaList(cinemaCity);
		ModelAndView mav = new ModelAndView("yongJson");
		mav.addObject("cinemaName",cinemaName);
		return mav;
	}
	
	/**스캐줄 날짜*/
	@RequestMapping("/reservationScheduleDateJquery.do")
	public ModelAndView reservationScheduleDateJquery() {
		ReservationDTO rdto = new ReservationDTO();
		GetCalendar  cal = new GetCalendar();
		String now = cal.getDay();
		java.sql.Date now2= java.sql.Date.valueOf(now);
		rdto.setScheduleDate(now2);
		
		DateFormat dateFormat = new SimpleDateFormat("YYYY-MM-dd");
		 
		
		//스캐줄
		Map<String,List<ReservationDTO>> map = rdao.reservationSchedule(rdto);
		List<String> mapkey = rdao.reservationKey(rdto);
		
		ModelAndView mav = new ModelAndView("yongJson");
		mav.addObject("scheduleList",map);
		mav.addObject("key",mapkey);
		return mav;
	}
	/**스케줄 가져오기*/
	@RequestMapping("/reservationScheduleListJquery.do")
	public ModelAndView reservationScheduleListJquery(@RequestParam("cinemaIdx")int cinemaIdx,
			@RequestParam("date")String date,
			@RequestParam("movieIdx")int movieIdx) {
		java.sql.Date now= java.sql.Date.valueOf(date);
		
		GetCalendar cal = new GetCalendar();
		int startTime = cal.getStartTime();
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("date", now);
		map.put("startTime", startTime);
		map.put("movieIdx", movieIdx);
		//map value값
		Map<String, Map<Integer, List<Object>>> resultMap =rdao.reservationScheduleList(map, cinemaIdx);
		//상영관 IDX 키값
		List<ReservationDTO> theaterIdxKey = rdao.reservationScheduleTheaterNameKey(map,cinemaIdx);
		List<String> list = new ArrayList<String>();
		for(int i = 0 ; i <theaterIdxKey.size(); i++) {
			list.add(theaterIdxKey.get(i).getTheaterName()); 
		}
		//스캐줄 IDX 키 값
		List<Integer> scheduleIdxKey = rdao.reservationScheduleIdxkey(map,cinemaIdx);
		ModelAndView mav = new ModelAndView("yongJson");
		mav.addObject("map",resultMap);
		mav.addObject("theaterIdxKey",list);
		mav.addObject("scheduleIdxKey",scheduleIdxKey);
		return mav;
	}
	
	/**좌석 가져오기*/
	@RequestMapping("/reservationScheduleSeatListJquery.do")
	public ModelAndView reservationScheduleSeatListJquery(@RequestParam("theaterIdx")int theaterIdx,
			@RequestParam("scheduleIdx")int scheduleIdx) {
		ModelAndView mav = new ModelAndView("yongJson");
		//좌석 뿌려주기
			try {
				Map<String,List<CinemaDTO>> map = cdao.exitsSeatsList(theaterIdx);
				List<CinemaDTO> xList = map.get("x");
				List<CinemaDTO> yList = map.get("y");
				List<CinemaDTO> seatsList = map.get("seatsList");
				ArrayList<String> alt = new ArrayList<String>();
				for(int i =0 ; i<yList.size();i++) {
					alt.add(String.valueOf((char)(i+'A')));
				}
				
				mav.addObject("xSize",map.get("x").get(map.get("x").size()-1).getSeatX());
				mav.addObject("ySize",map.get("y").get(map.get("y").size()-1).getSeatY());
				mav.addObject("alt",alt);
				mav.addObject("theaterIdx",theaterIdx);
				mav.addObject("xList",xList);
				mav.addObject("yList",yList);
				mav.addObject("seatsList",seatsList);
			} catch (Exception e) {
				e.printStackTrace();
			} 
			
			
		return mav;
	}
}
