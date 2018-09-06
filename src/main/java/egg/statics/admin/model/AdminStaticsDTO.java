package egg.statics.admin.model;

import java.util.Date;

public class AdminStaticsDTO {

	//cinema
		private int cinemaIdx;
		private String cinemaCity;
		private String cinemaGu; 
		private String cinemaBungi;
		private String cinemaAddr;
		private String cinemaName;
		private int cinemaTheater;
		//theater
		private int theaterIdx;
		private String theaterName;
		private int theaterCinemaIdx;
		//seat
		private int seatX;
		private int seatY;
		private int seatTheaterIdx;
		
		//schedule
		private int scheduleIdx;
		private int scheduleMovieIdx;
		private int scheduleTheaterIdx;
		private Date scheduleDate;
		private int scheduleStartTime;
		
		//movie
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
		
		//Reservation
		private int reservationIdx;
		private int reservationMemberIdx;
		private int reservationTicketIdx;
		private int reservationScheduleIdx;
		private Date reservationDate;
		private String reservationStatus;
		private String reservationMonth;
		//ticketInfo
		private int ticketIdx;
		private int ticketAge;
		private int ticketPrice;
			
		//delReservation
		private int delReservationIdx;
		private Date delReservationDate;
		
		//storePayment
		private int storePayIdx;
		private Date storePayDate;
		private String storePayCard;
		private int storePayMileage;
		private int storePayCount;
		private String storePayState;
		private int storePayMemberIdx;
		private int storePayStoreIdx;
		
		public AdminStaticsDTO() {
			super();
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

		public int getSeatTheaterIdx() {
			return seatTheaterIdx;
		}

		public void setSeatTheaterIdx(int seatTheaterIdx) {
			this.seatTheaterIdx = seatTheaterIdx;
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

		public int getReservationIdx() {
			return reservationIdx;
		}

		public void setReservationIdx(int reservationIdx) {
			this.reservationIdx = reservationIdx;
		}

		public int getReservationMemberIdx() {
			return reservationMemberIdx;
		}

		public void setReservationMemberIdx(int reservationMemberIdx) {
			this.reservationMemberIdx = reservationMemberIdx;
		}

		public int getReservationTicketIdx() {
			return reservationTicketIdx;
		}

		public void setReservationTicketIdx(int reservationTicketIdx) {
			this.reservationTicketIdx = reservationTicketIdx;
		}

		public int getReservationScheduleIdx() {
			return reservationScheduleIdx;
		}

		public void setReservationScheduleIdx(int reservationScheduleIdx) {
			this.reservationScheduleIdx = reservationScheduleIdx;
		}

		public Date getReservationDate() {
			return reservationDate;
		}

		public void setReservationDate(Date reservationDate) {
			this.reservationDate = reservationDate;
		}

		public String getReservationStatus() {
			return reservationStatus;
		}

		public void setReservationStatus(String reservationStatus) {
			this.reservationStatus = reservationStatus;
		}

		public String getReservationMonth() {
			return reservationMonth;
		}

		public void setReservationMonth(String reservationMonth) {
			this.reservationMonth = reservationMonth;
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

}
