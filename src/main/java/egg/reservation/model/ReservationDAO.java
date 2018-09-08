package egg.reservation.model;

import java.util.List;
import java.util.Map;

public interface ReservationDAO {
	//영화 리스트
	public List<ReservationDTO> movieList();
	//예약 영화관 시
	public List<ReservationDTO> reservatonCinemaSiList();
	//예약 영화관 정보
	public List<ReservationDTO> reservatonCinemaList(String cinemaCity);
	//예약 날짜 리스트
	public Map<String,List<ReservationDTO>> reservationSchedule(ReservationDTO rdto);
	//예약 날짜 키
	public List<String> reservationKey(ReservationDTO rdto);

	
	//예약 스캐줄 리스트
	public Map<String,Map<Integer,List<Object>>> reservationScheduleList(Map<String,Object> map,int cinemaIdx);
	//상영관 Idx 키값
	public List<ReservationDTO> reservationScheduleTheaterNameKey(Map<String,Object> map,int cinemaIdx);
	//스캐줄 IDX 키값
	public List<Integer> reservationScheduleIdxkey(Map<String,Object> map,int cinemaIdx);
	
	
	
	
	
	/*//영화 기준 스캐줄
	public Map<String , List<ReservationDTO>> reservationScheduleSelectMovie(Map<String , Object>map);*/
}
