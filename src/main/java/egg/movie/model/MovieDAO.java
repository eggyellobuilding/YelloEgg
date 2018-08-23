package egg.movie.model;

import java.util.List;

public interface MovieDAO {
	public List<MovieDTO> movieOfficeInfo();
	public List<MovieDTO> steelCutInfo();
	public List<MovieDTO> schheduleList();
}
