package egg.movie.admin.model;

import java.util.List;

public interface AdminMovieDAO {
	public int movieInfoAdd(AdminMovieDTO dto);
	public int movieMaxIdx();
	public int steelCutAdd(AdminMovieDTO dto);
	public List<AdminMovieDTO> steelCutList();
	public List<AdminMovieDTO> movieList(int cp, int ls);
	public List<AdminMovieDTO> searchList(int cp, int ls, AdminMovieDTO dto);
	public int movieTotalCut();
	public List<AdminMovieDTO> repleList();
	public int repleDel(int repleIdx);

}
