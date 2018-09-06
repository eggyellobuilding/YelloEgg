package egg.yelloMovie.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import egg.cinema.admin.model.CinemaDAO;
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
	/*	//년
		List<String> year = new ArrayList<String>();
		int countY = 0 ;
		//월
		List<String> month =new ArrayList<String>();
		int countM = 0 ;
		//일
		List<String> date =new ArrayList<String>();
		//요일
		List<String> day = new ArrayList<String>();
		for(int i = 0 ; i < dateList.size() ;i++) {
			 DateFormat dateFormat = new SimpleDateFormat("YYYY-MM-dd");
			 String strDate = dateFormat.format(dateList.get(i).getScheduleDate());
			 String day2 ="";
				//요일
				try {
					day2 = cal.getDateDay(strDate, "YYYY-MM-dd");
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			 String scheduleDate[] =strDate.split("-",3);
			 if(countY==0) {
				 
				 year.add(scheduleDate[0]);
				 countY++;
			 }else if(!year.get(countY).equals(scheduleDate[0])) {
				 year.add(scheduleDate[0]);
			 	 countY++;
			 }else {
				 break;
			 }
			 	
			 if(countM==0) {
				month.add(scheduleDate[1]);
				countM++;
			 }else if(month.get(countM).equals(scheduleDate[1])) {
				month.add(scheduleDate[1]);
			 	countM++;
			 }else {
				 break;
			 }
				 date.add(scheduleDate[2]);
				 day.add(day2);
		}*/
		mav.addObject("movieList", movieList);
		mav.addObject("cinemaSiList",cinemaSiList);
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
}
