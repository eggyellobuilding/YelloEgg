package egg.movie.model;

import java.util.List;

import egg.movie.admin.model.AdminMovieDTO;

public interface MovieDAO {
	public List<MovieDTO> movieOfficeInfo();
	public List<MovieDTO> movieLatestInfo();
	public List<MovieDTO> movieExpectationInfo();
	public List<MovieDTO> steelCutInfo();
	public List<MovieDTO> schheduleList();
	public List<MovieDTO> seatX();
	public List<MovieDTO> seatY();
	public List<MovieDTO> seatTheaterIdx();
	public List<MovieDTO> exitsList();
	public List<MovieDTO> ticketInfo();
	public List<MovieDTO> movieList();
	public List<MovieDTO> cinemaCityList();
	public List<MovieDTO> cinemaGuList(String cinemaCity);
	public List<MovieDTO> movieReple();
	public void movieRepleAdd(MovieDTO dto);
	public List<MovieDTO> movieRepleList(MovieDTO dto);
	public List<MovieDTO> repleTotalCut();
	public List<MovieDTO> mainMovieCarousel();
	public List<MovieDTO> steelCut();
	public List<MovieDTO> repleSum(int movieIdx);
	
}
