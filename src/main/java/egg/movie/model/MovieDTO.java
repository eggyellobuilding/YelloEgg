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
	
	/** 재료 */
	private String runTime;
	private String grade;
	private String releaseDate;
	private String endDate;
	
	public MovieDTO() {
		super();
	}

	public MovieDTO(int movieIdx, Date movieReleaseDate, String movieName, String movieDirector, String movieActor,
			String movieSummary, int movieRunTime, String movieTitleCut, int movieGrade, String movieGenre,
			Date movieEndDate, String movieDistributer, int steelCutIdx, String steelCutFileName, int steelCutMovieIdx,
			int repleIdx, int repleScore, String repleContent, Date repleWriteDate, int repleMemberIdx,
			int repleMovieIdx, String runTime, String grade, String releaseDate, String endDate) {
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
		this.runTime = runTime;
		this.grade = grade;
		this.releaseDate = releaseDate;
		this.endDate = endDate;
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

	
	
}
