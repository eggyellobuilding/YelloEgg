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
		List<MovieDTO> officedto = sqlMap.selectList("movieOfficeInfo");
		return officedto;
	}
	/** 영화 최신개봉순 정렬 */
	public List<MovieDTO> movieLatestInfo() {
		List<MovieDTO> latestdto = sqlMap.selectList("movieLatestInfo");
		return latestdto;
	}
	/** 영화 상영예정작 정렬 */
	public List<MovieDTO> movieExpectationInfo() {
		List<MovieDTO> expectationdto = sqlMap.selectList("movieExpectationInfo");
		return expectationdto;
	}
	/** 감상평 등록 전 가져오기 */
	public List<MovieDTO> movieRepleInfo(MovieDTO dto) {
		List<MovieDTO> dtos = sqlMap.selectList("");
		return dtos;
	}
	/** 감상평 등록 */
	public void movieRepleAdd(MovieDTO dto) {
		sqlMap.insert("movieRepleAdd",dto);
	}
	/** 감상평 등록 후 가져오기 */
	public List<MovieDTO> movieRepleList(MovieDTO dtos) {
		List<MovieDTO> dto = sqlMap.selectList("movieRepleList",dtos);
		for(int i = 0; i<dto.size(); i++) {
		}
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
