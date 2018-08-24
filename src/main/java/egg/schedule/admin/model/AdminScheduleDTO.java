package egg.schedule.admin.model;

import java.util.Date;

public class AdminScheduleDTO {
	//schedule
	private int scheduleIdx;
	private Date scheduleDate;
	private int scheduleStartTime;
	private int scheduleTheaterIdx;
	private int scheduleMovieIdx;
	
	//movie
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
	
	public AdminScheduleDTO() {
		super();
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
	public int getScheduleStartTime() {
		return scheduleStartTime;
	}
	public void setScheduleStartTime(int scheduleStartTime) {
		this.scheduleStartTime = scheduleStartTime;
	}
	public int getScheduleTheaterIdx() {
		return scheduleTheaterIdx;
	}
	public void setScheduleTheaterIdx(int scheduleTheaterIdx) {
		this.scheduleTheaterIdx = scheduleTheaterIdx;
	}
	public int getScheduleMovieIdx() {
		return scheduleMovieIdx;
	}
	public void setScheduleMovieIdx(int scheduleMovieIdx) {
		this.scheduleMovieIdx = scheduleMovieIdx;
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
	
	
}
