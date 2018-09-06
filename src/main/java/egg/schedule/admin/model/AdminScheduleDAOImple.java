package egg.schedule.admin.model;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	public int adminScheduleAdd(ArrayList<AdminScheduleDTO> arr) {
		int result=0;
		for(int i = 0 ; i<arr.size() ; i++) {
			 result += sqlMap.insert("adminScheduleAdd",arr.get(i));
		}
		return result;
	}
	
	public List<AdminScheduleDTO> adminScheduleList(AdminScheduleDTO asdto) {
		List<AdminScheduleDTO> scheduleList = sqlMap.selectList("adminScheduleList",asdto);
		return scheduleList;
	}
}
