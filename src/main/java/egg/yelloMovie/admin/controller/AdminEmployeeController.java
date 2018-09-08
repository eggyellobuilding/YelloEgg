package egg.yelloMovie.admin.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import egg.cinema.admin.model.CinemaDAO;
import egg.cinema.admin.model.CinemaDTO;
import egg.member.model.MemberDAO;
import egg.member.model.MemberDTO;

@Controller
public class AdminEmployeeController {

	@Autowired
	private MemberDAO memberdao;
	
	@Autowired
	private CinemaDAO cdao;
	
	/**비밀번호 암호화 메서드*/
  	public String testMD5(String str){
		String MD5 = "";		
		try{
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(str.getBytes()); 
			byte byteData[] = md.digest();
			StringBuffer sb = new StringBuffer(); 

			for(int i = 0 ; i < byteData.length ; i++){

				sb.append(Integer.toString((byteData[i]&0xff) + 0x100, 16).substring(1));
			}

			MD5 = sb.toString();

		}catch(NoSuchAlgorithmException e){
			e.printStackTrace(); 
			MD5 = null; 
		}
		return MD5;
	}
  	
	/**사원목록*/
	@RequestMapping("/adminEmployeeList.do")
	public ModelAndView adminEmployeeList(@RequestParam(value="cp",defaultValue="1")int cp) {
		int totalCnt=memberdao.adminTotalCnt();
		int listSize=10;
		int pageSize=5;
		List<MemberDTO> lists=memberdao.adminEmployeeList(listSize, cp);
		String pageStr=egg.commons.PageModule.makePage("adminEmployeeList.do", totalCnt, listSize, pageSize, cp);
		ModelAndView mav = new ModelAndView();
		mav.addObject("pageStr", pageStr);
		mav.addObject("lists", lists);
		mav.setViewName("admin/employee/adminEmployeeList");
		return mav;
		
	}
	
	
	/**관리자가 사원을 삭제*/
	@RequestMapping("/adminDeleteEmployee.do")
	public ModelAndView adminDeleteEmployeeSubmit(HttpServletRequest req) {
		String adminIdx_s=req.getParameter("adminIdx");
		int adminIdx=Integer.parseInt(adminIdx_s);
		int result = memberdao.adminDeleteEmployee(adminIdx);
		String msg=result>0?"사원을 삭제하였습니다.":"사원삭제를 실패하였습니다.";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("goUrl", "adminEmployeeList.do");
		mav.setViewName("admin/employee/adminEmployeeMsg");
		return mav;
				
	}
		
	/**사원 등록*/
	
	
	//영화관 시 목록  json
	@RequestMapping(value="/adminEmployeeCinemaFindJquery.do",method=RequestMethod.GET)
	public ModelAndView adminScheduleCinemaFind() {
		List<CinemaDTO> cityLists =  cdao.theaterCinemaCity();
		ModelAndView mav = new ModelAndView("yongJson");
		mav.addObject("cityLists", cityLists);
		return mav;
	}
	//영화관 이름 목록  json
	@RequestMapping(value="/adminEmployeeCinemaNameFindJquery.do",method=RequestMethod.GET)
	public ModelAndView adminScheduleCinemaNameFind(@RequestParam("cinemaCity")String cinemaCity) {
		List<CinemaDTO> nameLists = cdao.theaterCinemaName(cinemaCity);
		ModelAndView mav = new ModelAndView("yongJson");
		mav.addObject("nameLists",nameLists);
		return mav;
	}
	/**admin 등록*/
	@RequestMapping(value="/adminEmployeeCountJquery.do",method=RequestMethod.POST)
	public ModelAndView adminEmployeeCountJquery(@RequestParam("cinemaIdx")int cinemaIdx) {
		int count = memberdao.adminCount(cinemaIdx);
		ModelAndView mav = new ModelAndView("yongJson");
		mav.addObject("count",count);
		return mav;
	}
	
	/**admin 등록*/
	@RequestMapping(value="/adminRegisterEmployee.do",method=RequestMethod.POST)
	public ModelAndView adminRegisterEmployeeSubmit(@RequestParam("adminCinemaIdx")int adminCinemaIdx,
			@RequestParam("adminId")String adminId,
			@RequestParam("adminPwd")String adminPwd,
			@RequestParam("adminGrade")String adminGrade) {
		MemberDTO dto = new MemberDTO();
			dto.setAdminCinemaIdx(adminCinemaIdx);
			dto.setAdminId(adminId);
			dto.setAdminPwd(adminPwd);
			dto.setAdminGrade(adminGrade);
			
			
			int result = memberdao.adminRegisterEmployee(dto);
			String msg = (result>0)?"등록이 완료되었습니다.":"등록 실패";
		ModelAndView mav = new ModelAndView("admin/employee/adminEmployeeMsg");
		mav.addObject("msg",msg);
		mav.addObject("goUrl","adminEmployeeList.do");
		return mav;
	}
}
