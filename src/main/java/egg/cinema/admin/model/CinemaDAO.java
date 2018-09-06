package egg.cinema.admin.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface CinemaDAO {
	//영화관 등록
	public int cinemaAdd(CinemaDTO cdto);
	//영화관 리스트
	public List<CinemaDTO> cinemaList();
	//상영관 리스트
	public List<CinemaDTO> theaterList(int cinemaIdx);
	//영화관 수,idx
	public List<CinemaDTO> cinemaCount(int cinemaIdx);
	//상영관 이름 등록 
	public List<CinemaDTO> theaterNames(int cinemaIdx);
	//상영관 등록 --영화관 시 가져오기
	public List<CinemaDTO> theaterCinemaCity();
	//상영관 등록 -- 영화관 이름 가져오기
	public List<CinemaDTO> theaterCinemaName(String cinemaCity);
	//상영관 등록
	public int theaterAdd(ArrayList<CinemaDTO> arr);
	//좌석 상영관리스트
	public List<CinemaDTO> seatsTheaterList(int cinemaIdx);
	//상영관 좌석 등록 여부
	public String seatsAvailble(int cinemaIdx,int theaterIdx);
	//상영관 좌석 등록
	public int seatsAdd(ArrayList<CinemaDTO>arr);
	//상영관 출입구 -- 좌석 가져오기
	public Map<String,List<CinemaDTO>> exitsSeatsList(int seatTheaterIdx);
	//출입구 등록
	public String exitsAdd(ArrayList<CinemaDTO> arr);
	//theater 리스트
	public List<HashMap<String, String>> getCinemaNameList(int cinemaIdx);
	//theater이름업데이트
	public int updateTheaterName(HashMap<String, String>theaterDto);
}
