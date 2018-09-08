package egg.movie.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import egg.movie.admin.model.AdminMovieDTO;

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
	public List<MovieDTO> movieReple() {
		List<MovieDTO> dtos = sqlMap.selectList("movieReple");
		return dtos;
	}
	/** 감상평 총 갯수 */
	public List<MovieDTO> repleTotalCut() {
		List<MovieDTO> dtos = sqlMap.selectList("repleTotalCut");
		return dtos;
	}
	/** 감상평 등록 */
	public void movieRepleAdd(MovieDTO dto) {
		System.out.println("등록전");
		sqlMap.insert("movieRepleAdd",dto);
		System.out.println("등록후");
	}
	/** 감상평 등록 후 가져오기 */
	public List<MovieDTO> movieRepleList(MovieDTO dtos) {
		System.out.println("가져오기전");
		List<MovieDTO> dto = sqlMap.selectList("movieRepleList",dtos);
		System.out.println("가져오기후");
		return dto;
	}
	/** 스틸컷 정보 */
	public List<MovieDTO> steelCutInfo() {
		List<MovieDTO> dto = sqlMap.selectList("steelCutList");
		return dto;
	}
	public List<MovieDTO> steelCut(){
		List<MovieDTO> dto = sqlMap.selectList("steelCut");
		return dto;
	}
	/** 스케쥴 영화정보  */
	public List<MovieDTO> schheduleList() {
		List<MovieDTO> dto = sqlMap.selectList("scheduleInfoList");
		return dto;
	}
	/** 영화예약 정보 */
	public List<MovieDTO> movieList() {
		List<MovieDTO> movieList = sqlMap.selectList("movieList");
		return movieList;
	}
	/** 영화관 특별시,도 등등 정보 */
	public List<MovieDTO> cinemaCityList() {
		List<MovieDTO> cinemaCityList = sqlMap.selectList("cinemaCityList");
		return cinemaCityList;
	}
	/** 영화관 시,구,군 등등 정보2 */
	public List<MovieDTO> cinemaGuList(String cinemaCity) {
		List<MovieDTO> cinemaGuList = sqlMap.selectList("cinemaGuList",cinemaCity);
		return cinemaGuList;
	}
	/** 티켓 정보 */
	public List<MovieDTO> ticketInfo() {
		List<MovieDTO> ticketInfo = sqlMap.selectList("movieTicketInfo");
		return ticketInfo;
	}
	/** 좌석 좌표X*/
	public List<MovieDTO> seatX() {
		List<MovieDTO> seatX = sqlMap.selectList("movieSeatX");
		return seatX;
	}
	/** 좌석 좌표 Y*/
	public List<MovieDTO> seatY() {
		List<MovieDTO> seatY = sqlMap.selectList("movieSeatY");
		return seatY;
	}
	/** 좌석 인덱스 */
	public List<MovieDTO> seatTheaterIdx() {
		List<MovieDTO> seatTheaterIdx = sqlMap.selectList("movieSeatTheaterIdx");
		return seatTheaterIdx;
	}
	/** 출구 좌표 */
	public List<MovieDTO> exitsList() {
		List<MovieDTO> exitsList = sqlMap.selectList("movieExits");
		return exitsList;
	}
	/** 메인 롤링 */
	public List<MovieDTO> mainMovieCarousel() {
		List<MovieDTO> lists = sqlMap.selectList("mainMovieCarousel");
		return lists;
	}
	/** 감상평 합계 및 평균 */
	public List<MovieDTO> repleSum(int movieIdx) {
		List<MovieDTO> lists = sqlMap.selectList("repleSum",movieIdx);
		return lists;
	}
	
}
