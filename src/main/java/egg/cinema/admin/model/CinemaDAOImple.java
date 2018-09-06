package egg.cinema.admin.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import egg.cinema.admin.model.CinemaDTO;
public class CinemaDAOImple implements CinemaDAO {

	private SqlSessionTemplate sqlMap;
	
	public CinemaDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public int cinemaAdd(CinemaDTO cdto) {
		int result = sqlMap.insert("cinemaAdd",cdto);
		int cinemaIdx = sqlMap.selectOne("recentCinemaIdx");
		return cinemaIdx;
	}
	
	public List<CinemaDTO> cinemaList() {
		List<CinemaDTO> list = sqlMap.selectList("cinemaList");
		for(int i = 0  ;i < list.size() ;i++) {
			String addr= list.get(i).getCinemaCity()+" "+ list.get(i).getCinemaGu()+" "+list.get(i).getCinemaBungi() +" "+ list.get(i).getCinemaAddr();
			list.get(i).setCinemaAddr(addr);
		}
		return list;
	}
	
	public List<CinemaDTO> theaterList(int cinemaIdx) {
		List<CinemaDTO> list = sqlMap.selectList("theaterList",cinemaIdx);
		return list;
	}
	
	public List<CinemaDTO> cinemaCount(int cinemaIdx) {
			List<CinemaDTO> lists= sqlMap.selectList("theaterCount",cinemaIdx);
			return lists;
		}
		
	
	
	public List<CinemaDTO> theaterNames(int cinemaIdx) {
		List<CinemaDTO> lists =  sqlMap.selectList("theaterNames",cinemaIdx);
		return lists;
	}
	 
	public List<CinemaDTO> theaterCinemaCity() {
		List<CinemaDTO> lists = sqlMap.selectList("theaterCinemaCity");
		return lists;
	}
	
	public List<CinemaDTO> theaterCinemaName(String cinemaCity){
		List<CinemaDTO> lists = sqlMap.selectList("theaterCinemaName",cinemaCity);
		return lists;
	}
	public int theaterAdd(ArrayList<CinemaDTO> arr) {
		int result = 0;
		for(int i = 0 ; i <arr.size();i++) {
			result += sqlMap.insert("theaterAdd",arr.get(i));
		}
		return result;
	}
	public List<CinemaDTO> seatsTheaterList(int cinemaIdx) {
		List<CinemaDTO> lists =sqlMap.selectList("seatsTheaterLists",cinemaIdx);
		return lists;
	}
	
	public String seatsAvailble(int cinemaIdx, int theaterIdx) {
		CinemaDTO cdto = new CinemaDTO();
		cdto.setCinemaIdx(cinemaIdx);
		cdto.setTheaterIdx(theaterIdx);
		String result =sqlMap.selectOne("availibleSeats",cdto);
		if(result==null) {
			return "1";
			
		}else {
			return "2";
		}
	}

	public int seatsAdd(ArrayList<CinemaDTO> arr) {
		int result = 0 ; 
		for(int i=0;i<arr.size();i++) {
			result += sqlMap.insert("seatsAdd",arr.get(i));
		}
		System.out.println(result);
		
		return result;
	}
	
	public Map<String,List<CinemaDTO>> exitsSeatsList(int seatTheaterIdx) {
		Map<String,List<CinemaDTO>> map = new HashMap<String,List<CinemaDTO>>();
		
		List<CinemaDTO> xList = sqlMap.selectList("seatsX",seatTheaterIdx);
		map.put("x", xList);
		
		List<CinemaDTO> yList = sqlMap.selectList("seatsY",seatTheaterIdx);
		map.put("y", yList);
		
		List<CinemaDTO> seatsList = sqlMap.selectList("seatsPosition",seatTheaterIdx);
		map.put("seatsList", seatsList);
		return map;
	}
	
	public String exitsAdd(ArrayList<CinemaDTO> arr) {
		int count=0;
		for(int i = 0 ; i<arr.size();i++) {
			int result = sqlMap.insert("exitsAdd",arr.get(i));
			count +=result;
		}
		String msg = "";
		if(count !=arr.size()) {
			msg = "등록에 실패 했습니다.";
		}else {
			msg =count+"개의 출입구가 등록 되었습니다.";
		}
		return msg;
	}
	
	public List<HashMap<String, String>> getCinemaNameList(int cinemaIdx) {
		return sqlMap.selectList("getCinemaNameList", cinemaIdx);
	}

	public int updateTheaterName(HashMap<String, String> theaterDto) {
		return sqlMap.update("updateTheaterName", theaterDto);
	}
}
