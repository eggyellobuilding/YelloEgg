package egg.schedule.admin.model;

import java.util.ArrayList;
import java.util.List;

import egg.cinema.admin.model.CinemaDTO;

public interface AdminScheduleDAO {

	//영화관 스캐줄 -- 영화관 가져오기
	public CinemaDTO adminScheduleMain(int cinemaIdx);
	//영화관 스캐줄 -- 상영관 가져오기
	public List<CinemaDTO> adminScheduleTheater(int cinemaIdx);
	//스캐줄 등록 -- 영호 이름 리스트 가져오기
	public List<AdminScheduleDTO> adminScheduleFindMovieInfo(String movieName);
	//스캐줄 등록 -- 영화 상세 정보
	public AdminScheduleDTO adminScheduleMovieDetail(int movieIdx);
	//스캐줄 등록
	public int adminScheduleAdd(ArrayList<AdminScheduleDTO> arr);
	//스캐줄 등록 -- 사영관 선택 -- 사영관 스캐줄 
	public List<AdminScheduleDTO> adminScheduleList(AdminScheduleDTO asdto);
}
