package egg.movie.model;

import java.util.Date;

public class MovieDTO {
	
	/** 영화정보 DB*/ 
	private int movieIdx;
	private Date movieReleaseDate;
	private String movieName;
	private String movieDirector;
	private String movieActor;
	private String movieSummary;
	private int movieRunTime;
	private String movieTitleCut;
	private int movieGrade;
	private String movieGenre;
	private Date movieEndDate;
	private String movieDistributer;
	
	/** 스틸컷 DB*/
	private int steelCutIdx;
	private String steelCutFileName;
	private int steelCutMovieIdx;
	
	/** 영화 감상평*/
	private int repleIdx;
	private int repleScore;
	private String repleContent;
	private Date repleWriteDate;
	private int repleMemberIdx;
	private int repleMovieIdx;
	
	/** 상영관 */
	private int theaterIdx;
	private String theaterName;
	
	/** 영화관 */
	private int cinemaIdx;
	private String cinemaCity;
	private String cinemaGu;
	private String cinemaBungi;
	private String cinemaaddr;
	private String cinemaname;
	private int cinemaTheater;
	
	/** 영화 스케쥴 */
	private int scheduleIdx;
	private Date scheduleDate;
	private String scheduleStartTime;
	
	/** 티켓 정보 */
	private int ticketIdx;
	private int ticketAge;
	private int ticketPrice;
	
	/** 영화예약 좌석 */
	private int seatTheaterIdx;
	private int seatX;
	private int seatY;
	
	/** 영화예약 좌석 출구 */
	private int exitX;
	private int exitY;
	
	/** 사용자 ID */
	private String id;
	/** 재료 */
	private String runTime;
	private String grade;
	private String releaseDate;
	private String endDate;
	private String seatNumber;
	private String reScore;
	private String reMemberIdx;
	private String reMovieIdx;
	
	public MovieDTO() {
		super();
	}

	public MovieDTO(int movieIdx, Date movieReleaseDate, String movieName, String movieDirector, String movieActor,
			String movieSummary, int movieRunTime, String movieTitleCut, int movieGrade, String movieGenre,
			Date movieEndDate, String movieDistributer, int steelCutIdx, String steelCutFileName, int steelCutMovieIdx,
			int repleIdx, int repleScore, String repleContent, Date repleWriteDate, int repleMemberIdx,
			int repleMovieIdx, int theaterIdx, String theaterName, int cinemaIdx, String cinemaCity, String cinemaGu,
			String cinemaBungi, String cinemaaddr, String cinemaname, int cinemaTheater, int scheduleIdx,
			Date scheduleDate, String scheduleStartTime, int ticketIdx, int ticketAge, int ticketPrice,
			int seatTheaterIdx, int seatX, int seatY, int exitX, int exitY, String id, String runTime, String grade,
			String releaseDate, String endDate, String seatNumber, String reScore, String reMemberIdx,
			String reMovieIdx) {
		super();
		this.movieIdx = movieIdx;
		this.movieReleaseDate = movieReleaseDate;
		this.movieName = movieName;
		this.movieDirector = movieDirector;
		this.movieActor = movieActor;
		this.movieSummary = movieSummary;
		this.movieRunTime = movieRunTime;
		this.movieTitleCut = movieTitleCut;
		this.movieGrade = movieGrade;
		this.movieGenre = movieGenre;
		this.movieEndDate = movieEndDate;
		this.movieDistributer = movieDistributer;
		this.steelCutIdx = steelCutIdx;
		this.steelCutFileName = steelCutFileName;
		this.steelCutMovieIdx = steelCutMovieIdx;
		this.repleIdx = repleIdx;
		this.repleScore = repleScore;
		this.repleContent = repleContent;
		this.repleWriteDate = repleWriteDate;
		this.repleMemberIdx = repleMemberIdx;
		this.repleMovieIdx = repleMovieIdx;
		this.theaterIdx = theaterIdx;
		this.theaterName = theaterName;
		this.cinemaIdx = cinemaIdx;
		this.cinemaCity = cinemaCity;
		this.cinemaGu = cinemaGu;
		this.cinemaBungi = cinemaBungi;
		this.cinemaaddr = cinemaaddr;
		this.cinemaname = cinemaname;
		this.cinemaTheater = cinemaTheater;
		this.scheduleIdx = scheduleIdx;
		this.scheduleDate = scheduleDate;
		this.scheduleStartTime = scheduleStartTime;
		this.ticketIdx = ticketIdx;
		this.ticketAge = ticketAge;
		this.ticketPrice = ticketPrice;
		this.seatTheaterIdx = seatTheaterIdx;
		this.seatX = seatX;
		this.seatY = seatY;
		this.exitX = exitX;
		this.exitY = exitY;
		this.id = id;
		this.runTime = runTime;
		this.grade = grade;
		this.releaseDate = releaseDate;
		this.endDate = endDate;
		this.seatNumber = seatNumber;
		this.reScore = reScore;
		this.reMemberIdx = reMemberIdx;
		this.reMovieIdx = reMovieIdx;
	}

	public int getMovieIdx() {
		return movieIdx;
	}

	public void setMovieIdx(int movieIdx) {
		this.movieIdx = movieIdx;
	}

	public Date getMovieReleaseDate() {
		return movieReleaseDate;
	}

	public void setMovieReleaseDate(Date movieReleaseDate) {
		this.movieReleaseDate = movieReleaseDate;
	}

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	public String getMovieDirector() {
		return movieDirector;
	}

	public void setMovieDirector(String movieDirector) {
		this.movieDirector = movieDirector;
	}

	public String getMovieActor() {
		return movieActor;
	}

	public void setMovieActor(String movieActor) {
		this.movieActor = movieActor;
	}

	public String getMovieSummary() {
		return movieSummary;
	}

	public void setMovieSummary(String movieSummary) {
		this.movieSummary = movieSummary;
	}

	public int getMovieRunTime() {
		return movieRunTime;
	}

	public void setMovieRunTime(int movieRunTime) {
		this.movieRunTime = movieRunTime;
	}

	public String getMovieTitleCut() {
		return movieTitleCut;
	}

	public void setMovieTitleCut(String movieTitleCut) {
		this.movieTitleCut = movieTitleCut;
	}

	public int getMovieGrade() {
		return movieGrade;
	}

	public void setMovieGrade(int movieGrade) {
		this.movieGrade = movieGrade;
	}

	public String getMovieGenre() {
		return movieGenre;
	}

	public void setMovieGenre(String movieGenre) {
		this.movieGenre = movieGenre;
	}

	public Date getMovieEndDate() {
		return movieEndDate;
	}

	public void setMovieEndDate(Date movieEndDate) {
		this.movieEndDate = movieEndDate;
	}

	public String getMovieDistributer() {
		return movieDistributer;
	}

	public void setMovieDistributer(String movieDistributer) {
		this.movieDistributer = movieDistributer;
	}

	public int getSteelCutIdx() {
		return steelCutIdx;
	}

	public void setSteelCutIdx(int steelCutIdx) {
		this.steelCutIdx = steelCutIdx;
	}

	public String getSteelCutFileName() {
		return steelCutFileName;
	}

	public void setSteelCutFileName(String steelCutFileName) {
		this.steelCutFileName = steelCutFileName;
	}

	public int getSteelCutMovieIdx() {
		return steelCutMovieIdx;
	}

	public void setSteelCutMovieIdx(int steelCutMovieIdx) {
		this.steelCutMovieIdx = steelCutMovieIdx;
	}

	public int getRepleIdx() {
		return repleIdx;
	}

	public void setRepleIdx(int repleIdx) {
		this.repleIdx = repleIdx;
	}

	public int getRepleScore() {
		return repleScore;
	}

	public void setRepleScore(int repleScore) {
		this.repleScore = repleScore;
	}

	public String getRepleContent() {
		return repleContent;
	}

	public void setRepleContent(String repleContent) {
		this.repleContent = repleContent;
	}

	public Date getRepleWriteDate() {
		return repleWriteDate;
	}

	public void setRepleWriteDate(Date repleWriteDate) {
		this.repleWriteDate = repleWriteDate;
	}

	public int getRepleMemberIdx() {
		return repleMemberIdx;
	}

	public void setRepleMemberIdx(int repleMemberIdx) {
		this.repleMemberIdx = repleMemberIdx;
	}

	public int getRepleMovieIdx() {
		return repleMovieIdx;
	}

	public void setRepleMovieIdx(int repleMovieIdx) {
		this.repleMovieIdx = repleMovieIdx;
	}

	public int getTheaterIdx() {
		return theaterIdx;
	}

	public void setTheaterIdx(int theaterIdx) {
		this.theaterIdx = theaterIdx;
	}

	public String getTheaterName() {
		return theaterName;
	}

	public void setTheaterName(String theaterName) {
		this.theaterName = theaterName;
	}

	public int getCinemaIdx() {
		return cinemaIdx;
	}

	public void setCinemaIdx(int cinemaIdx) {
		this.cinemaIdx = cinemaIdx;
	}

	public String getCinemaCity() {
		return cinemaCity;
	}

	public void setCinemaCity(String cinemaCity) {
		this.cinemaCity = cinemaCity;
	}

	public String getCinemaGu() {
		return cinemaGu;
	}

	public void setCinemaGu(String cinemaGu) {
		this.cinemaGu = cinemaGu;
	}

	public String getCinemaBungi() {
		return cinemaBungi;
	}

	public void setCinemaBungi(String cinemaBungi) {
		this.cinemaBungi = cinemaBungi;
	}

	public String getCinemaaddr() {
		return cinemaaddr;
	}

	public void setCinemaaddr(String cinemaaddr) {
		this.cinemaaddr = cinemaaddr;
	}

	public String getCinemaname() {
		return cinemaname;
	}

	public void setCinemaname(String cinemaname) {
		this.cinemaname = cinemaname;
	}

	public int getCinemaTheater() {
		return cinemaTheater;
	}

	public void setCinemaTheater(int cinemaTheater) {
		this.cinemaTheater = cinemaTheater;
	}

	public int getScheduleIdx() {
		return scheduleIdx;
	}

	public void setScheduleIdx(int scheduleIdx) {
		this.scheduleIdx = scheduleIdx;
	}

	public Date getScheduleDate() {
		return scheduleDate;
	}

	public void setScheduleDate(Date scheduleDate) {
		this.scheduleDate = scheduleDate;
	}

	public String getScheduleStartTime() {
		return scheduleStartTime;
	}

	public void setScheduleStartTime(String scheduleStartTime) {
		this.scheduleStartTime = scheduleStartTime;
	}

	public int getTicketIdx() {
		return ticketIdx;
	}

	public void setTicketIdx(int ticketIdx) {
		this.ticketIdx = ticketIdx;
	}

	public int getTicketAge() {
		return ticketAge;
	}

	public void setTicketAge(int ticketAge) {
		this.ticketAge = ticketAge;
	}

	public int getTicketPrice() {
		return ticketPrice;
	}

	public void setTicketPrice(int ticketPrice) {
		this.ticketPrice = ticketPrice;
	}

	public int getSeatTheaterIdx() {
		return seatTheaterIdx;
	}

	public void setSeatTheaterIdx(int seatTheaterIdx) {
		this.seatTheaterIdx = seatTheaterIdx;
	}

	public int getSeatX() {
		return seatX;
	}

	public void setSeatX(int seatX) {
		this.seatX = seatX;
	}

	public int getSeatY() {
		return seatY;
	}

	public void setSeatY(int seatY) {
		this.seatY = seatY;
	}

	public int getExitX() {
		return exitX;
	}

	public void setExitX(int exitX) {
		this.exitX = exitX;
	}

	public int getExitY() {
		return exitY;
	}

	public void setExitY(int exitY) {
		this.exitY = exitY;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRunTime() {
		return runTime;
	}

	public void setRunTime(String runTime) {
		this.runTime = runTime;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getSeatNumber() {
		return seatNumber;
	}

	public void setSeatNumber(String seatNumber) {
		this.seatNumber = seatNumber;
	}

	public String getReScore() {
		return reScore;
	}

	public void setReScore(String reScore) {
		this.reScore = reScore;
	}

	public String getReMemberIdx() {
		return reMemberIdx;
	}

	public void setReMemberIdx(String reMemberIdx) {
		this.reMemberIdx = reMemberIdx;
	}

	public String getReMovieIdx() {
		return reMovieIdx;
	}

	public void setReMovieIdx(String reMovieIdx) {
		this.reMovieIdx = reMovieIdx;
	}
	
}
