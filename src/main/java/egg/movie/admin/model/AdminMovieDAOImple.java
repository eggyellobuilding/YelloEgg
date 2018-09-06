package egg.movie.admin.model;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class AdminMovieDAOImple implements AdminMovieDAO {
	private SqlSessionTemplate sqlMap;

	public AdminMovieDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	/** 영화 정보 등록 */
	public int movieInfoAdd(AdminMovieDTO dto) {
		int count = sqlMap.insert("adminMovieAdd", dto);
		return count;
	}

	/** 영화 정보 인덱스 */
	public int movieMaxIdx() {
		int maxidx = sqlMap.selectOne("movidIdxInfo");
		return maxidx;
	}

	/** 스틸컷 파일 업로드 */
	public int steelCutAdd(AdminMovieDTO dto) {
		int count = sqlMap.insert("steelCutAdd", dto);
		return 0;
	}
	
	/** 스틸컷 리스트 */
	public List<AdminMovieDTO> steelCutList() {
		List<AdminMovieDTO> dto = sqlMap.selectList("steelCutList");
		return dto;
	}

	/** 어드민 영화 리스트 */
	public List<AdminMovieDTO> movieList(int cp, int ls) {
		Map data = new HashMap();
		int startnum = (cp - 1) * ls + 1;
		int endnum = cp * ls;
		data.put("startnum", startnum);
		data.put("endnum", endnum);

		List<AdminMovieDTO> dto = sqlMap.selectList("adminMovieList", data);
		return dto;
	}

	/** 영화 총 갯수 */
	public int movieTotalCut() {
		int totalCut = sqlMap.selectOne("movieTotalCut");
		return totalCut;
	}
	/** 영화검색 */
	public List<AdminMovieDTO> searchList(int cp, int ls, AdminMovieDTO dtos) {
		Map data = new HashMap();
		int startnum = (cp - 1) * ls + 1;
		int endnum = cp * ls;
		data.put("startnum", startnum);
		data.put("endnum", endnum);
		data.put("mName", dtos.getMovieName());
		data.put("mGenre", dtos.getMovieGenre());
		data.put("mDistributer", dtos.getMovieDistributer());
		
		List<AdminMovieDTO> dto = sqlMap.selectList("searchList", data);
		
		return dto;
	}
}
