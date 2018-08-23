package egg.yelloMovie.admin.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sun.org.apache.xalan.internal.xsltc.compiler.Template;

import egg.cinema.admin.model.CinemaDAO;
import egg.cinema.admin.model.CinemaDTO;

@Controller
public class CinemaController {

	@Autowired
	CinemaDAO cdao; 
	
	//영화관 페이지
	@RequestMapping("/adminCinema.do")
	public ModelAndView adminCinemaList() {
		List<CinemaDTO> cinemaLists = cdao.cinemaList();
		ModelAndView mav = new ModelAndView("admin/cinema/cinemaMain","lists",cinemaLists);
		return mav;
	}
	
	//영화관 페이지 상영관 불러오기
	@RequestMapping("/adminCinemaTheaterFind.do")
	public ModelAndView adminCinemaTheaterList(@RequestParam(value="cinemaIdx",defaultValue="0")int cinemaIdx) {
		List<CinemaDTO> theaterLists = cdao.theaterList(cinemaIdx);
		ModelAndView mav = new ModelAndView("admin/cinema/json/findTheater");
		mav.addObject("theaterLists",theaterLists);
		return mav;
	}
	
	//영화관 등록 페이지
	@RequestMapping(value="/adminCinemaAdd.do",method=RequestMethod.GET)
	public String adminCinemaAddForm()	{
		return "admin/cinema/cinemaAdd";
	}
	
	//영화관 등록
	@RequestMapping(value="/adminCinemaAdd.do",method=RequestMethod.POST)
	public ModelAndView adminCinemaAdd(@RequestParam("addr")String addr,
			@RequestParam("cinemaAddr")String cinemaAddr,
			@RequestParam("cinemaName")String cinemaName,
			@RequestParam("cinemaTheater")int cinemaTheater){
		CinemaDTO cdto = new CinemaDTO();
		
		//주소 자르기
		String addr_a[] = addr.split(" ", 3);

		cdto.setCinemaCity(addr_a[0]);
		cdto.setCinemaGu(addr_a[1]);
		cdto.setCinemaBungi( addr_a[2]);
		cdto.setCinemaName(cinemaName);
		cdto.setCinemaAddr(cinemaAddr);
		cdto.setCinemaTheater(cinemaTheater);

		int result = cdao.cinemaAdd(cdto);
		
		String msg = result>0?"등록 성공":"등록 실패";
		
		ModelAndView mav = new ModelAndView("admin/cinema/adminCinemaMsg");
		mav.addObject("gopage","adminCinema.do");
		mav.addObject("msg",msg);
		return mav;
	}
	
	//상영관 등록 폼,영화관 선택후 상영관 보여주기
	@RequestMapping(value="/adminTheaterAdd.do",method=RequestMethod.GET)
	public ModelAndView adminTheaterAddForm(@RequestParam(value="cinemaIdx",defaultValue="0")int cinemaIdx) {
		List<CinemaDTO> lists = cdao.cinemaCount(cinemaIdx);
	
		int count = 0 ;
		int idx = 0 ; 
		if(lists.size()==0) {
			lists=null;	
		}else {
		count = lists.get(0).getCinemaTheater();
		idx = lists.get(0).getCinemaIdx();
		}
		ModelAndView mav = new ModelAndView("admin/cinema/theaterAdd");
		
		mav.addObject("idx",idx);
		mav.addObject("count",count);
		return mav;
	}
	
	//상영관 등록
	@RequestMapping(value="/adminTheaterAdd.do",method=RequestMethod.POST)
	public ModelAndView adminTheatereAdd(@RequestParam Map<String,String>map) {
		int result = cdao.theaterAdd(map);
		ModelAndView mav = new ModelAndView("admin/cinema/adminCinemaMsg");
		mav.addObject("msg","상영관이 등록되었습니다.");
		mav.addObject("gopage","adminCinema.do");
		return mav;
	}
	
	//상영관 등록--> 영화관 찾기
	@RequestMapping("/adminCinemaFind.do")
	public ModelAndView adminTheaterCinemaFind() {
		//영화관시 가져오기
		List<CinemaDTO> cityLists =  cdao.theaterCinemaCity();
		ModelAndView mav = new ModelAndView("admin/cinema/json/findCinema");
		mav.addObject("cityLists",cityLists);
		return mav;
	}
	//상영관 등록 --> 영화관 이름 찾기
	@RequestMapping("/adminCinemaFindName.do")
	public ModelAndView adminTheaterCinemaNameFind(@RequestParam(value="cinemaCity")String cinemaCity) {
		//영화관 이름 가져오기
		List<CinemaDTO> nameLists = cdao.theaterCinemaName(cinemaCity);
		
		ModelAndView mav = new ModelAndView("admin/cinema/json/findCinemaName");
		mav.addObject("nameLists",nameLists);
		return mav;
	}
	//좌석 등록 폼
	@RequestMapping(value="/adminSeatsAdd.do",method=RequestMethod.GET)
	public ModelAndView adminSeatsDetailAddForm(@RequestParam(value="theaterIdx",required=false)String theaterIdx) {
		ModelAndView mav = new ModelAndView("admin/cinema/seatsDetailsAdd");
		mav.addObject("theaterIdx",theaterIdx);
		return mav;
	}
	//좌석 등록 --> 영화관 이름 찾기
	@RequestMapping("adminSeatsFindName.do")
	public ModelAndView adminSeatsCinemaNameFind(@RequestParam(value="cinemaCity")String cinemaCity) {
		//영화관 이름 가져오기
		List<CinemaDTO> nameLists = cdao.theaterCinemaName(cinemaCity);
		ModelAndView mav = new ModelAndView("admin/cinema/json/seats/findCinemaName");
		mav.addObject("nameLists",nameLists);
		return mav;
	}
	
	//좌석 등록 --> 상영관 리스트
	@RequestMapping("adminSeatsTheaterLists.do")
	public ModelAndView adminSeatsTheater(@RequestParam("cinemaIdx")int cinemaIdx) {
		List<CinemaDTO> lists=cdao.seatsTheaterList(cinemaIdx);
		ModelAndView mav = new ModelAndView("/admin/cinema/json/seats/findTheaterList");
		mav.addObject("theaterLists",lists);
		return mav;
	}
	
	//좌석 등록--> 영화관 상영관 좌석 조회
	@RequestMapping(value="/adminSeatsAdd.do",method=RequestMethod.POST)
	public ModelAndView adminSeatsInfo(@RequestParam("selectCinemaIdxInput")int cinemaIdx,
			@RequestParam("selectTheaterIdxInput")int theaterIdx) {
		String result = cdao.seatsAvailble(cinemaIdx, theaterIdx);
		String msg = null;
		String gopage =null;
		if(result.equals("1")) {
			//새등록
			msg = "등록된 좌석정보가 없습니다. 좌석 등록 페이지로 이동합니다.";
			gopage="adminSeatsAdd.do?theaterIdx="+theaterIdx;
		}else {
			//업데이트
			msg = "등록된 좌석정보가 있습니다. 좌석 수정 페이지로 이동합니다.";
		}
		ModelAndView mav = new ModelAndView("/admin/cinema/adminCinemaMsg");
		mav.addObject("msg",msg);
		mav.addObject("gopage",gopage);
		return mav;
	}
	//좌석 행열 받아 위치 정해주기
	@RequestMapping("/adminSeatsPositionSetting.do")
	public ModelAndView adminSeatsSettingPosition(@RequestParam("x")int x,
			@RequestParam("y")int y){
		String alt[] = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"};
		ModelAndView mav = new ModelAndView("/admin/cinema/json/seats/settingPosition");
		mav.addObject("x", x);
		mav.addObject("y", y);
		mav.addObject("alt",alt);
		return mav;
	}
	
	//좌석 상세 정보 등록
	@RequestMapping(value="/adminSeatsInfoAdd.do",method=RequestMethod.POST)
	public ModelAndView adminSeatsInfoAdd(@RequestParam Map<String,String>map) {
		int theaterIdx = 0;
		ArrayList<CinemaDTO> arr = new ArrayList<CinemaDTO>();
		Iterator<String> keys = map.keySet().iterator();
		while(keys.hasNext()) {
			
			CinemaDTO cdto = new CinemaDTO();
			String key = keys.next();
			String value = map.get(key);

			if(key.equals("theaterIdx")) {
				theaterIdx = Integer.parseInt(value);
				continue;
			}
			cdto.setSeatTheaterIdx(theaterIdx);
			String position[] = value.split(",");
			cdto.setSeatX(Integer.parseInt(position[0]));
			cdto.setSeatY(Integer.parseInt(position[1]));
		
			arr.add(cdto);
		}
		int result =cdao.seatsAdd(arr);
		String msg = result>0?"등록 성공":"등록실패";
		ModelAndView mav = new ModelAndView("/admin/cinema/adminCinemaMsg");
		mav.addObject("msg","msg");
		mav.addObject("gopage","adminExitsAdd.do?theaterIdx="+map.get("theaterIdx"));
		return mav;
	}
	
	//출구 폼
	@RequestMapping(value="/adminExitsAdd.do",method=RequestMethod.GET)
	public ModelAndView adminExitsForm(@RequestParam("theaterIdx")int theaterIdx) {
		
		Map<String,List<CinemaDTO>> map = cdao.exitsSeatsList(theaterIdx);
		List<CinemaDTO> xList = map.get("x");
		List<CinemaDTO> yList = map.get("y");
		List<CinemaDTO> seatsList = map.get("seatsList");
		ArrayList<String> alt = new ArrayList<String>();
		for(int i =0 ; i<yList.size();i++) {
			alt.add(String.valueOf((char)(i+'A')));
		}
		ModelAndView mav = new ModelAndView("admin/cinema/exitsDetailsAdd");
		mav.addObject("xSize",map.get("x").get(map.get("x").size()-1).getSeatX());
		mav.addObject("ySize",map.get("y").get(map.get("y").size()-1).getSeatY());
		mav.addObject("alt",alt);
		mav.addObject("theaterIdx",theaterIdx);
		mav.addObject("xList",xList);
		mav.addObject("yList",yList);
		mav.addObject("seatsList",seatsList);
		return mav;
	}
	
	//출구 등록
	@RequestMapping(value="adminExitsAdd.do",method=RequestMethod.POST)
	public ModelAndView adminExitsAdd(@RequestParam Map<String,String>map) {
		int exitTheaterIdx = Integer.parseInt(map.get("theaterIdx"));
		ArrayList<CinemaDTO> arr = new ArrayList<CinemaDTO>();
		Iterator<String> keys = map.keySet().iterator();
		while(keys.hasNext()) {
			CinemaDTO cdto = new CinemaDTO();
			String key = keys.next();
			String value = map.get(key);
			if(key.equals("theaterIdx")) {
				continue;
			}
			
			cdto.setExitTheaterIdx(exitTheaterIdx);
			String info[]=value.split(",",3);

				cdto.setExitX(Integer.parseInt(info[0]));
				cdto.setExitY(Integer.parseInt(info[1]));
				cdto.setExitDirection(info[2]);
			
			arr.add(cdto);
		}
		
		String msg = cdao.exitsAdd(arr);
		ModelAndView mav = new ModelAndView("/admin/cinema/adminCinemaMsg");
		mav.addObject("msg",msg);
		mav.addObject("gopage","adminCinema.do");
		return mav;
	}
}
