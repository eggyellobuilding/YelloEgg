package egg.schedule.admin.model;

import egg.cinema.admin.model.CinemaDTO;

public interface AdminScheduleDAO {

	//영화관 스캐줄 -- 영화관 가져오기
	public CinemaDTO adminScheduleMain(int cinemaIdx);
}
