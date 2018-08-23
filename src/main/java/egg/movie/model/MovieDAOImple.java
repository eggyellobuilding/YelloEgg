package egg.movie.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class MovieDAOImple implements MovieDAO {
	private SqlSessionTemplate sqlMap;
		
	public MovieDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	/** 영화 오피스 정렬 */
	public List<MovieDTO> movieOfficeInfo() {
		List<MovieDTO> dto = sqlMap.selectList("movieOfficeInfo");
		return dto;
	}
	/** 스틸컷 정보 */
	public List<MovieDTO> steelCutInfo() {
		List<MovieDTO> dto = sqlMap.selectList("steelCutList");
		return dto;
	}
	/** 스케쥴 영화정보  */
	public List<MovieDTO> schheduleList() {
		List<MovieDTO> dto = sqlMap.selectList("scheduleInfoList");
		return dto;
	}
}
