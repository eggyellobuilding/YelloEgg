package egg.movie.model;

import java.util.List;

public interface MovieDAO {
	public List<MovieDTO> movieOfficeInfo();
	public List<MovieDTO> movieLatestInfo();
	public List<MovieDTO> movieExpectationInfo();
	public List<MovieDTO> steelCutInfo();
	public List<MovieDTO> schheduleList();
	public List<MovieDTO> movieRepleInfo(MovieDTO dto);
	public void movieRepleAdd(MovieDTO dto);
	public List<MovieDTO> movieRepleList(MovieDTO dto);
}
