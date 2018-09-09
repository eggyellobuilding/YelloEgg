package egg.reservation.model;

import java.util.ArrayList;
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
	

	public Map<String, Map<Integer, List<Object>>> reservationScheduleList(Map<String, Object> map, int cinemaIdx) {
		Map<String, Map<Integer, List<Object>>> resultMap = new HashMap<String, Map<Integer,List<Object>>>();
		map.put("cinemaIdx", cinemaIdx);
		
		List<ReservationDTO> theaterList = sqlMap.selectList("reservationScheduleTheater",map);
		
		for(int i = 0 ; i<theaterList.size() ;i++) {
			map.put("theaterIdx", theaterList.get(i).getTheaterIdx());
			List<ReservationDTO> scheduleRdto = sqlMap.selectList("reservationScheduleList",map);
				
				Map<Integer,List<Object>> scheduleMap = new HashMap<Integer, List<Object>>();
				
				for(int j = 0 ; j<scheduleRdto.size();j++) {
					
					List<Object> schedule = new ArrayList<Object>();
					
					int h = scheduleRdto.get(j).getScheduleStartTime()/2;
					int m = scheduleRdto.get(j).getScheduleStartTime()%2;
					String m_s = "";
					String h_s = "";
					if(h==0) {
						h_s ="00";
					}else {
						h_s =h+"";
					}
					
					if(m==0) {
						m_s = "00";
					}else {
						m_s = "30";
					}
					String startTime = h_s+":"+m_s;
					
					int fullSeat = sqlMap.selectOne("reservationScheduleSeat",theaterList.get(i).getTheaterIdx());
					int reservedSeat = sqlMap.selectOne("reservationScheduleReservedSeat",scheduleRdto.get(i).getScheduleIdx());
					int leftSeat = fullSeat - reservedSeat;
					
					
					schedule.add(startTime);
					schedule.add(leftSeat);
					
					scheduleMap.put(scheduleRdto.get(j).getScheduleIdx(), schedule);
				}
				
				resultMap.put(theaterList.get(i).getTheaterName(), scheduleMap);
		}
		return resultMap;
	}
	
	public List<ReservationDTO> reservationScheduleTheaterNameKey(Map<String, Object> map ,int cinemaIdx) {
		map.put("cinemaIdx", cinemaIdx);
		List<ReservationDTO> lists = sqlMap.selectList("reservationScheduleTheater",map);
		
		return lists;
	}
	
	public List<Integer> reservationScheduleIdxkey(Map<String,Object> map,int cinemaIdx) {
		map.put("cinemaIdx", cinemaIdx);
		List<Integer> lists = sqlMap.selectList("reservationScheduleIdxKey",map);
		return lists;
	}

	public Integer reservationTheaterIdx(int scheduleIdx) {
		Integer theaterIdx = sqlMap.selectOne("reservationThetaerIdx",scheduleIdx);
		return theaterIdx;
	}
	
}
