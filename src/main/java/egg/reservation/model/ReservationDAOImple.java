package egg.reservation.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import egg.commons.GetCalendar;


public class ReservationDAOImple implements ReservationDAO {

	private SqlSessionTemplate sqlMap;

	public ReservationDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	

	public List<ReservationDTO> movieList() {
		List<ReservationDTO> movieList = sqlMap.selectList("movieList");
		return movieList;
	}
	
	public List<ReservationDTO> reservatonCinemaSiList() {
		List<ReservationDTO> cinemaCitySiList = sqlMap.selectList("reservationCinemaCity");
		return cinemaCitySiList;
	}
	
	public List<ReservationDTO> reservatonCinemaList(String cinemaCity) {
		List<ReservationDTO> cinemaCityList = sqlMap.selectList("reservationCinema",cinemaCity);
		return cinemaCityList;
	}
	
	public Map<String,List<ReservationDTO>> reservationSchedule(ReservationDTO rdto) {
		 GetCalendar  cal = new GetCalendar();
		 
		Map<String ,List<ReservationDTO>> map = new HashMap<String, List<ReservationDTO>>();
		List<String> scheduleList = sqlMap.selectList("reservationYear",rdto);
		for(int i = 0 ; i<scheduleList.size() ; i++) {
			ReservationDTO rdto2 = new ReservationDTO();
			if(i==0) {
				java.sql.Date now2= java.sql.Date.valueOf(cal.getDay());
				rdto2.setScheduleDate(now2);
				rdto2.setReservationMonth(scheduleList.get(i));
				List<ReservationDTO> scheduleFirstList = sqlMap.selectList("reservationFirstSchedule",rdto2);
				map.put(scheduleList.get(i),scheduleFirstList);
				continue;
			}
			List<ReservationDTO> sList = sqlMap.selectList("reservationSchedule",scheduleList.get(i));
			map.put(scheduleList.get(i), sList);
			
		}
		return map;
	}
	
	public List<String> reservationKey(ReservationDTO rdto) {
		List<String> List = sqlMap.selectList("reservationYear",rdto);
		return List;
	}
}
