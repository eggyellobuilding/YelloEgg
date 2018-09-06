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
}
