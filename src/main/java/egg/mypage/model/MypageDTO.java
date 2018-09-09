package egg.mypage.model;

import java.sql.Date;

public class MypageDTO {

	/** member */
	private int memberIdx;
	private String id;
	private String pwd;
	private String name;
	private String gender;
	private String tel;
	private Date birthDate;
	private String email;
	private Date joinDate;
	private String state;
	private int memberGradeIdx;

	/** grade */
	private int gradeIdx;
	private String gradeName;
	
	/**mileage*/
	private int mileageIdx;
	private int mileagePrice;
	private String mileageReason;
	private int mileageMemberIdx;
	
	/** admin */
	private int adminIdx;
	private String adminId;
	private String adminPwd;
	private Date adminJoinDate;
	private String adminGrade;
	private int adminCinemaIdx;

	/** cinema */
	private int cinemaIdx;
	private String cinemaCity;
	private String cinemaGu;
	private String cinemaBungi;
	private String cinemaAddr;
	private String cinemaName;
	private int cinemaTheater;

	/** qaboard */
	private int qaIdx;
	private String qaTitle;
	private String qaContent;
	private Date qaWriteDate;
	private String qaCate;
	private String qaAnswer;
	private int qaMemberIdx;
	private int qaCinemaIdx;

	/** answer */
	private int answerIdx;
	private String answerAnswer;
	private int answerAdminIdx;
	private int answerQaIdx;
	private Date answerDate;

	/** store */
	private int storeIdx;
	private String storeName;
	private String storeImg;
	private int storeCount;
	private String storeCtg;
	private int storePrice;
	private Date storeDate;
	private String storeState;
	private String storeInfo;

	/** storePayment */
	private int storePayIdx;
	private Date storePayDate;
	private String storePayCard;
	private int storePayMileage;
	private int storePayCount;
	private int storePayPrice;
	private String storePayState;
	private int storePayMemberIdx;
	private int storePayStoreIdx;

	/** storeDelPayment */
	private int delPaymentStorePayIdx;
	private Date delPaymentDate;

	/** schedule */
	private int scheduleIdx;
	private int scheduleMovieIdx;
	private int scheduleTheaterIdx;
	private Date scheduleDate;
	private int scheduleStartTime;

	/** movie */
	private int movieIdx;
	private Date movieReleaseDate;
	private String movieName;
	private String movieDirector;
	private String movieActor;
	private String movieSummary;
	private int movieRunTime;
	private String movieTitleCut;
	private String movieDistributer;
	private int movieGrade;
	private String movieGenre;
	private Date movieEndDate;

	/** theater */
	private int theaterIdx;
	private String theaterName;
	private int theaterCinemaIdx;

	/** reservation */
	private int reservationIdx;
	private int reservationScheduleIdx;
	private int reservationTicketIdx;
	private Date reservationDate;
	private int reservationMemberIdx;
	private String reservationStatus;
	private int reservationMileage;
	private String reservationSeatInfo;

	/** ticketInfo */
	private int ticketIdx;
	private int ticketAge;
	private int ticketPrice;

	
	/**delReservation*/
	private int delReservationIdx;
	private Date delReservationDate;
	
	public MypageDTO() {
		super();
	}

	public MypageDTO(int memberIdx, String id, String pwd, String name, String gender, String tel, Date birthDate,
			String email, Date joinDate, String state, int memberGradeIdx, int gradeIdx, String gradeName,
			int mileageIdx, int mileagePrice, String mileageReason, int mileageMemberIdx, int adminIdx, String adminId,
			String adminPwd, Date adminJoinDate, String adminGrade, int adminCinemaIdx, int cinemaIdx,
			String cinemaCity, String cinemaGu, String cinemaBungi, String cinemaAddr, String cinemaName,
			int cinemaTheater, int qaIdx, String qaTitle, String qaContent, Date qaWriteDate, String qaCate,
			String qaAnswer, int qaMemberIdx, int qaCinemaIdx, int answerIdx, String answerAnswer, int answerAdminIdx,
			int answerQaIdx, Date answerDate, int storeIdx, String storeName, String storeImg, int storeCount,
			String storeCtg, int storePrice, Date storeDate, String storeState, String storeInfo, int storePayIdx,
			Date storePayDate, String storePayCard, int storePayMileage, int storePayCount, int storePayPrice,
			String storePayState, int storePayMemberIdx, int storePayStoreIdx, int delPaymentStorePayIdx,
			Date delPaymentDate, int scheduleIdx, int scheduleMovieIdx, int scheduleTheaterIdx, Date scheduleDate,
			int scheduleStartTime, int movieIdx, Date movieReleaseDate, String movieName, String movieDirector,
			String movieActor, String movieSummary, int movieRunTime, String movieTitleCut, String movieDistributer,
			int movieGrade, String movieGenre, Date movieEndDate, int theaterIdx, String theaterName,
			int theaterCinemaIdx, int reservationIdx, int reservationScheduleIdx, int reservationTicketIdx,
			Date reservationDate, int reservationMemberIdx, String reservationStatus, int reservationMileage,
			String reservationSeatInfo, int ticketIdx, int ticketAge, int ticketPrice, int delReservationIdx,
			Date delReservationDate) {
		super();
		this.memberIdx = memberIdx;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.gender = gender;
		this.tel = tel;
		this.birthDate = birthDate;
		this.email = email;
		this.joinDate = joinDate;
		this.state = state;
		this.memberGradeIdx = memberGradeIdx;
		this.gradeIdx = gradeIdx;
		this.gradeName = gradeName;
		this.mileageIdx = mileageIdx;
		this.mileagePrice = mileagePrice;
		this.mileageReason = mileageReason;
		this.mileageMemberIdx = mileageMemberIdx;
		this.adminIdx = adminIdx;
		this.adminId = adminId;
		this.adminPwd = adminPwd;
		this.adminJoinDate = adminJoinDate;
		this.adminGrade = adminGrade;
		this.adminCinemaIdx = adminCinemaIdx;
		this.cinemaIdx = cinemaIdx;
		this.cinemaCity = cinemaCity;
		this.cinemaGu = cinemaGu;
		this.cinemaBungi = cinemaBungi;
		this.cinemaAddr = cinemaAddr;
		this.cinemaName = cinemaName;
		this.cinemaTheater = cinemaTheater;
		this.qaIdx = qaIdx;
		this.qaTitle = qaTitle;
		this.qaContent = qaContent;
		this.qaWriteDate = qaWriteDate;
		this.qaCate = qaCate;
		this.qaAnswer = qaAnswer;
		this.qaMemberIdx = qaMemberIdx;
		this.qaCinemaIdx = qaCinemaIdx;
		this.answerIdx = answerIdx;
		this.answerAnswer = answerAnswer;
		this.answerAdminIdx = answerAdminIdx;
		this.answerQaIdx = answerQaIdx;
		this.answerDate = answerDate;
		this.storeIdx = storeIdx;
		this.storeName = storeName;
		this.storeImg = storeImg;
		this.storeCount = storeCount;
		this.storeCtg = storeCtg;
		this.storePrice = storePrice;
		this.storeDate = storeDate;
		this.storeState = storeState;
		this.storeInfo = storeInfo;
		this.storePayIdx = storePayIdx;
		this.storePayDate = storePayDate;
		this.storePayCard = storePayCard;
		this.storePayMileage = storePayMileage;
		this.storePayCount = storePayCount;
		this.storePayPrice = storePayPrice;
		this.storePayState = storePayState;
		this.storePayMemberIdx = storePayMemberIdx;
		this.storePayStoreIdx = storePayStoreIdx;
		this.delPaymentStorePayIdx = delPaymentStorePayIdx;
		this.delPaymentDate = delPaymentDate;
		this.scheduleIdx = scheduleIdx;
		this.scheduleMovieIdx = scheduleMovieIdx;
		this.scheduleTheaterIdx = scheduleTheaterIdx;
		this.scheduleDate = scheduleDate;
		this.scheduleStartTime = scheduleStartTime;
		this.movieIdx = movieIdx;
		this.movieReleaseDate = movieReleaseDate;
		this.movieName = movieName;
		this.movieDirector = movieDirector;
		this.movieActor = movieActor;
		this.movieSummary = movieSummary;
		this.movieRunTime = movieRunTime;
		this.movieTitleCut = movieTitleCut;
		this.movieDistributer = movieDistributer;
		this.movieGrade = movieGrade;
		this.movieGenre = movieGenre;
		this.movieEndDate = movieEndDate;
		this.theaterIdx = theaterIdx;
		this.theaterName = theaterName;
		this.theaterCinemaIdx = theaterCinemaIdx;
		this.reservationIdx = reservationIdx;
		this.reservationScheduleIdx = reservationScheduleIdx;
		this.reservationTicketIdx = reservationTicketIdx;
		this.reservationDate = reservationDate;
		this.reservationMemberIdx = reservationMemberIdx;
		this.reservationStatus = reservationStatus;
		this.reservationMileage = reservationMileage;
		this.reservationSeatInfo = reservationSeatInfo;
		this.ticketIdx = ticketIdx;
		this.ticketAge = ticketAge;
		this.ticketPrice = ticketPrice;
		this.delReservationIdx = delReservationIdx;
		this.delReservationDate = delReservationDate;
	}

	public int getMemberIdx() {
		return memberIdx;
	}

	public void setMemberIdx(int memberIdx) {
		this.memberIdx = memberIdx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getMemberGradeIdx() {
		return memberGradeIdx;
	}

	public void setMemberGradeIdx(int memberGradeIdx) {
		this.memberGradeIdx = memberGradeIdx;
	}

	public int getGradeIdx() {
		return gradeIdx;
	}

	public void setGradeIdx(int gradeIdx) {
		this.gradeIdx = gradeIdx;
	}

	public String getGradeName() {
		return gradeName;
	}

	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}

	public int getMileageIdx() {
		return mileageIdx;
	}

	public void setMileageIdx(int mileageIdx) {
		this.mileageIdx = mileageIdx;
	}

	public int getMileagePrice() {
		return mileagePrice;
	}

	public void setMileagePrice(int mileagePrice) {
		this.mileagePrice = mileagePrice;
	}

	public String getMileageReason() {
		return mileageReason;
	}

	public void setMileageReason(String mileageReason) {
		this.mileageReason = mileageReason;
	}

	public int getMileageMemberIdx() {
		return mileageMemberIdx;
	}

	public void setMileageMemberIdx(int mileageMemberIdx) {
		this.mileageMemberIdx = mileageMemberIdx;
	}

	public int getAdminIdx() {
		return adminIdx;
	}

	public void setAdminIdx(int adminIdx) {
		this.adminIdx = adminIdx;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getAdminPwd() {
		return adminPwd;
	}

	public void setAdminPwd(String adminPwd) {
		this.adminPwd = adminPwd;
	}

	public Date getAdminJoinDate() {
		return adminJoinDate;
	}

	public void setAdminJoinDate(Date adminJoinDate) {
		this.adminJoinDate = adminJoinDate;
	}

	public String getAdminGrade() {
		return adminGrade;
	}

	public void setAdminGrade(String adminGrade) {
		this.adminGrade = adminGrade;
	}

	public int getAdminCinemaIdx() {
		return adminCinemaIdx;
	}

	public void setAdminCinemaIdx(int adminCinemaIdx) {
		this.adminCinemaIdx = adminCinemaIdx;
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

	public String getCinemaAddr() {
		return cinemaAddr;
	}

	public void setCinemaAddr(String cinemaAddr) {
		this.cinemaAddr = cinemaAddr;
	}

	public String getCinemaName() {
		return cinemaName;
	}

	public void setCinemaName(String cinemaName) {
		this.cinemaName = cinemaName;
	}

	public int getCinemaTheater() {
		return cinemaTheater;
	}

	public void setCinemaTheater(int cinemaTheater) {
		this.cinemaTheater = cinemaTheater;
	}

	public int getQaIdx() {
		return qaIdx;
	}

	public void setQaIdx(int qaIdx) {
		this.qaIdx = qaIdx;
	}

	public String getQaTitle() {
		return qaTitle;
	}

	public void setQaTitle(String qaTitle) {
		this.qaTitle = qaTitle;
	}

	public String getQaContent() {
		return qaContent;
	}

	public void setQaContent(String qaContent) {
		this.qaContent = qaContent;
	}

	public Date getQaWriteDate() {
		return qaWriteDate;
	}

	public void setQaWriteDate(Date qaWriteDate) {
		this.qaWriteDate = qaWriteDate;
	}

	public String getQaCate() {
		return qaCate;
	}

	public void setQaCate(String qaCate) {
		this.qaCate = qaCate;
	}

	public String getQaAnswer() {
		return qaAnswer;
	}

	public void setQaAnswer(String qaAnswer) {
		this.qaAnswer = qaAnswer;
	}

	public int getQaMemberIdx() {
		return qaMemberIdx;
	}

	public void setQaMemberIdx(int qaMemberIdx) {
		this.qaMemberIdx = qaMemberIdx;
	}

	public int getQaCinemaIdx() {
		return qaCinemaIdx;
	}

	public void setQaCinemaIdx(int qaCinemaIdx) {
		this.qaCinemaIdx = qaCinemaIdx;
	}

	public int getAnswerIdx() {
		return answerIdx;
	}

	public void setAnswerIdx(int answerIdx) {
		this.answerIdx = answerIdx;
	}

	public String getAnswerAnswer() {
		return answerAnswer;
	}

	public void setAnswerAnswer(String answerAnswer) {
		this.answerAnswer = answerAnswer;
	}

	public int getAnswerAdminIdx() {
		return answerAdminIdx;
	}

	public void setAnswerAdminIdx(int answerAdminIdx) {
		this.answerAdminIdx = answerAdminIdx;
	}

	public int getAnswerQaIdx() {
		return answerQaIdx;
	}

	public void setAnswerQaIdx(int answerQaIdx) {
		this.answerQaIdx = answerQaIdx;
	}

	public Date getAnswerDate() {
		return answerDate;
	}

	public void setAnswerDate(Date answerDate) {
		this.answerDate = answerDate;
	}

	public int getStoreIdx() {
		return storeIdx;
	}

	public void setStoreIdx(int storeIdx) {
		this.storeIdx = storeIdx;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getStoreImg() {
		return storeImg;
	}

	public void setStoreImg(String storeImg) {
		this.storeImg = storeImg;
	}

	public int getStoreCount() {
		return storeCount;
	}

	public void setStoreCount(int storeCount) {
		this.storeCount = storeCount;
	}

	public String getStoreCtg() {
		return storeCtg;
	}

	public void setStoreCtg(String storeCtg) {
		this.storeCtg = storeCtg;
	}

	public int getStorePrice() {
		return storePrice;
	}

	public void setStorePrice(int storePrice) {
		this.storePrice = storePrice;
	}

	public Date getStoreDate() {
		return storeDate;
	}

	public void setStoreDate(Date storeDate) {
		this.storeDate = storeDate;
	}

	public String getStoreState() {
		return storeState;
	}

	public void setStoreState(String storeState) {
		this.storeState = storeState;
	}

	public String getStoreInfo() {
		return storeInfo;
	}

	public void setStoreInfo(String storeInfo) {
		this.storeInfo = storeInfo;
	}

	public int getStorePayIdx() {
		return storePayIdx;
	}

	public void setStorePayIdx(int storePayIdx) {
		this.storePayIdx = storePayIdx;
	}

	public Date getStorePayDate() {
		return storePayDate;
	}

	public void setStorePayDate(Date storePayDate) {
		this.storePayDate = storePayDate;
	}

	public String getStorePayCard() {
		return storePayCard;
	}

	public void setStorePayCard(String storePayCard) {
		this.storePayCard = storePayCard;
	}

	public int getStorePayMileage() {
		return storePayMileage;
	}

	public void setStorePayMileage(int storePayMileage) {
		this.storePayMileage = storePayMileage;
	}

	public int getStorePayCount() {
		return storePayCount;
	}

	public void setStorePayCount(int storePayCount) {
		this.storePayCount = storePayCount;
	}

	public int getStorePayPrice() {
		return storePayPrice;
	}

	public void setStorePayPrice(int storePayPrice) {
		this.storePayPrice = storePayPrice;
	}

	public String getStorePayState() {
		return storePayState;
	}

	public void setStorePayState(String storePayState) {
		this.storePayState = storePayState;
	}

	public int getStorePayMemberIdx() {
		return storePayMemberIdx;
	}

	public void setStorePayMemberIdx(int storePayMemberIdx) {
		this.storePayMemberIdx = storePayMemberIdx;
	}

	public int getStorePayStoreIdx() {
		return storePayStoreIdx;
	}

	public void setStorePayStoreIdx(int storePayStoreIdx) {
		this.storePayStoreIdx = storePayStoreIdx;
	}

	public int getDelPaymentStorePayIdx() {
		return delPaymentStorePayIdx;
	}

	public void setDelPaymentStorePayIdx(int delPaymentStorePayIdx) {
		this.delPaymentStorePayIdx = delPaymentStorePayIdx;
	}

	public Date getDelPaymentDate() {
		return delPaymentDate;
	}

	public void setDelPaymentDate(Date delPaymentDate) {
		this.delPaymentDate = delPaymentDate;
	}

	public int getScheduleIdx() {
		return scheduleIdx;
	}

	public void setScheduleIdx(int scheduleIdx) {
		this.scheduleIdx = scheduleIdx;
	}

	public int getScheduleMovieIdx() {
		return scheduleMovieIdx;
	}

	public void setScheduleMovieIdx(int scheduleMovieIdx) {
		this.scheduleMovieIdx = scheduleMovieIdx;
	}

	public int getScheduleTheaterIdx() {
		return scheduleTheaterIdx;
	}

	public void setScheduleTheaterIdx(int scheduleTheaterIdx) {
		this.scheduleTheaterIdx = scheduleTheaterIdx;
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

	public String getMovieDistributer() {
		return movieDistributer;
	}

	public void setMovieDistributer(String movieDistributer) {
		this.movieDistributer = movieDistributer;
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

	public int getTheaterCinemaIdx() {
		return theaterCinemaIdx;
	}

	public void setTheaterCinemaIdx(int theaterCinemaIdx) {
		this.theaterCinemaIdx = theaterCinemaIdx;
	}

	public int getReservationIdx() {
		return reservationIdx;
	}

	public void setReservationIdx(int reservationIdx) {
		this.reservationIdx = reservationIdx;
	}

	public int getReservationScheduleIdx() {
		return reservationScheduleIdx;
	}

	public void setReservationScheduleIdx(int reservationScheduleIdx) {
		this.reservationScheduleIdx = reservationScheduleIdx;
	}

	public int getReservationTicketIdx() {
		return reservationTicketIdx;
	}

	public void setReservationTicketIdx(int reservationTicketIdx) {
		this.reservationTicketIdx = reservationTicketIdx;
	}

	public Date getReservationDate() {
		return reservationDate;
	}

	public void setReservationDate(Date reservationDate) {
		this.reservationDate = reservationDate;
	}

	public int getReservationMemberIdx() {
		return reservationMemberIdx;
	}

	public void setReservationMemberIdx(int reservationMemberIdx) {
		this.reservationMemberIdx = reservationMemberIdx;
	}

	public String getReservationStatus() {
		return reservationStatus;
	}

	public void setReservationStatus(String reservationStatus) {
		this.reservationStatus = reservationStatus;
	}

	public int getReservationMileage() {
		return reservationMileage;
	}

	public void setReservationMileage(int reservationMileage) {
		this.reservationMileage = reservationMileage;
	}

	public String getReservationSeatInfo() {
		return reservationSeatInfo;
	}

	public void setReservationSeatInfo(String reservationSeatInfo) {
		this.reservationSeatInfo = reservationSeatInfo;
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

	public int getDelReservationIdx() {
		return delReservationIdx;
	}

	public void setDelReservationIdx(int delReservationIdx) {
		this.delReservationIdx = delReservationIdx;
	}

	public Date getDelReservationDate() {
		return delReservationDate;
	}

	public void setDelReservationDate(Date delReservationDate) {
		this.delReservationDate = delReservationDate;
	}

	
}
