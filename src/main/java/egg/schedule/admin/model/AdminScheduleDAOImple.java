package egg.schedule.admin.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import egg.cinema.admin.model.CinemaDTO;

public class AdminScheduleDAOImple implements AdminScheduleDAO {

	private SqlSessionTemplate sqlMap;

	public AdminScheduleDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public CinemaDTO adminScheduleMain(int cinemaIdx) {
		CinemaDTO cdto = sqlMap.selectOne("adminScheduleCinema",cinemaIdx);
		return cdto;
	}
	
	public List<CinemaDTO> adminScheduleTheater(int cinemaIdx) {
		List<CinemaDTO> lists = sqlMap.selectList("adminScheduleTheater",cinemaIdx);
		return lists;
	}
	
	public List<AdminScheduleDTO> adminScheduleFindMovieInfo(String movieName) {
		List<AdminScheduleDTO> lists = sqlMap.selectList("adminScheduleMovieInfo",movieName);
		return lists;
	}
	
	public AdminScheduleDTO adminScheduleMovieDetail(int movieIdx) {
		AdminScheduleDTO asdto = sqlMap.selectOne("adminScheduleMovieDetail",movieIdx);
		return asdto;
	}
}
