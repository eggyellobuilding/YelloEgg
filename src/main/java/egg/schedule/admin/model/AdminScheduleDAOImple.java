package egg.schedule.admin.model;

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
	
}
