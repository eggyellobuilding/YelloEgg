package egg.statics.admin.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import egg.cinema.admin.model.CinemaDTO;

public class AdminStaticsDAOImple implements AdminStaticsDAO {


	private SqlSessionTemplate sqlMap;

	public AdminStaticsDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List<CinemaDTO> cinemaCity() {
		List<CinemaDTO> citys = sqlMap.selectList("theaterCinemaCity");
		return citys;
	}
	
	public Map<String, List<Integer>> cityStaticsCount(List<CinemaDTO> list,Map<String,Object> map) {
		
		Map<String,List<Integer>> resultMap = new HashMap<String, List<Integer>>();
		
		for(int i = 0 ; i < list.size();i++) {
			List<Integer> resultList = new ArrayList<Integer>(); 
			map.put("city",list.get(i).getCinemaCity());
			
			String cityScheduleCount = sqlMap.selectOne("adminStaticsCityScheduleCount",map);
			if(cityScheduleCount==null) {
				resultList.add(0);
			}else {
				resultList.add(Integer.parseInt(cityScheduleCount));
			}
			
			
			int cityMovieRate = sqlMap.selectOne("adminStaticsMovieRate",map);
			resultList.add(cityMovieRate);
			
			String cityReservationCount = sqlMap.selectOne("adminStaticsReservationCount",map);
			if(cityReservationCount==null) {
				resultList.add(0);
			}else {
				resultList.add(Integer.parseInt(cityReservationCount));
			}
			
			String allReservationCount = sqlMap.selectOne("adminStaticsAllScheduleCount",map);
			if(allReservationCount==null) {
				resultList.add(0);
			}else {
				double reservePercent = (Integer.parseInt(cityScheduleCount)/(double)Integer.parseInt(allReservationCount))*100;
				resultList.add((int)reservePercent);
			}
			
			String allMovieRate = sqlMap.selectOne("adminStaticsAllMovieRate",map);
			if(allMovieRate==null) {
				resultList.add(0);
			}else {
				double moviePercent = ((double)Integer.parseInt(cityReservationCount)/(double)Integer.parseInt(allMovieRate))*100;
				resultList.add((int)moviePercent);
			}
			
			resultMap.put(list.get(i).getCinemaCity(),resultList);
		}
		return resultMap;
	} 
	public Map<String,Integer> StaticsMovieRate(List<CinemaDTO> list,Map<String,Object> map,int num) {
		Map<String,Integer> resultMap = new HashMap<String, Integer>();
		switch(num) {
		case 1:
			for(int i = 0 ; i < list.size() ; i++) {
				map.put("city", list.get(i).getCinemaCity());
				int cityMovieRate = sqlMap.selectOne("adminStaticsMovieRate",map);
				resultMap.put(list.get(i).getCinemaCity(),cityMovieRate);
			};break;
		case 2:
			for(int i = 0 ; i < list.size() ; i++) {
				map.put("city", list.get(i).getCinemaCity());
				String reservationRate = sqlMap.selectOne("adminStaticsReservationCount",map);
				if(reservationRate==null) {
					resultMap.put(list.get(i).getCinemaCity(),0);
				}else {
					resultMap.put(list.get(i).getCinemaCity(),Integer.parseInt(reservationRate));
				}
				
			};break;
		case 3:
			for(int i = 0 ; i < list.size() ; i++) {
				map.put("city", list.get(i).getCinemaCity());
				String allReservationCount = sqlMap.selectOne("adminStaticsAllScheduleCount",map);
				String cityScheduleCount = sqlMap.selectOne("adminStaticsCityScheduleCount",map);
				if(allReservationCount==null) {
					resultMap.put(list.get(i).getCinemaCity(),0);
				}else {
					double reservePercent = (Integer.parseInt(cityScheduleCount)/(double)Integer.parseInt(allReservationCount))*100;
					resultMap.put(list.get(i).getCinemaCity(),(int)reservePercent);
				}
			};break;
		case 4:
			for(int i = 0 ; i < list.size() ; i++) {
				map.put("city", list.get(i).getCinemaCity());
				String allMovieRate = sqlMap.selectOne("adminStaticsAllMovieRate",map);
				String cityReservationCount = sqlMap.selectOne("adminStaticsReservationCount",map);
				if(allMovieRate==null) {
					resultMap.put(list.get(i).getCinemaCity(),0);
				}else {
					double moviePercent = ((double)Integer.parseInt(cityReservationCount)/(double)Integer.parseInt(allMovieRate))*100;
					resultMap.put(list.get(i).getCinemaCity(),(int)moviePercent);
				}
			};break;
		}
		
		return resultMap;
}
	
}
