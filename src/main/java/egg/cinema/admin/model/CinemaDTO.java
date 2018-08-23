package egg.cinema.admin.model;

public class CinemaDTO {

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
	//exit
	private int exitX;
	private int exitY;
	private int exitTheaterIdx;
	private String exitDirection;
	
	public CinemaDTO() {
		super();
	}

	public CinemaDTO(int cinemaIdx, String cinemaCity, String cinemaGu, String cinemaBungi, String cinemaAddr,
			String cinemaName, int cinemaTheater, int theaterIdx, String theaterName, int theaterCinemaIdx, int seatX,
			int seatY, int seatTheaterIdx, int exitX, int exitY, int exitTheaterIdx) {
		super();
		this.cinemaIdx = cinemaIdx;
		this.cinemaCity = cinemaCity;
		this.cinemaGu = cinemaGu;
		this.cinemaBungi = cinemaBungi;
		this.cinemaAddr = cinemaAddr;
		this.cinemaName = cinemaName;
		this.cinemaTheater = cinemaTheater;
		this.theaterIdx = theaterIdx;
		this.theaterName = theaterName;
		this.theaterCinemaIdx = theaterCinemaIdx;
		this.seatX = seatX;
		this.seatY = seatY;
		this.seatTheaterIdx = seatTheaterIdx;
		this.exitX = exitX;
		this.exitY = exitY;
		this.exitTheaterIdx = exitTheaterIdx;
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

	public int getExitTheaterIdx() {
		return exitTheaterIdx;
	}

	public void setExitTheaterIdx(int exitTheaterIdx) {
		this.exitTheaterIdx = exitTheaterIdx;
	}

	public String getExitDirection() {
		return exitDirection;
	}

	public void setExitDirection(String exitDirection) {
		this.exitDirection = exitDirection;
	}
	
	
}
