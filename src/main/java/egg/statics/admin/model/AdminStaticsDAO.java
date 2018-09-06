package egg.statics.admin.model;

import java.util.List;
import java.util.Map;

import egg.cinema.admin.model.CinemaDTO;

public interface AdminStaticsDAO {
	//지역가져오기
	public List<CinemaDTO> cinemaCity();
	//표 보여주기
	public Map<String,List<Integer>> cityStaticsCount(List<CinemaDTO> list,Map<String,Object> map);
	//json 매출액 그래프
	public Map<String,Integer> StaticsMovieRate(List<CinemaDTO> list,Map<String,Object> map,int num);
}
