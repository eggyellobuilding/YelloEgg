package egg.yelloMovie.admin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import egg.movie.admin.model.AdminMovieDAO;
import egg.movie.admin.model.AdminMovieDTO;

@Controller
public class MovieController {
	
	@Autowired
	private AdminMovieDAO adminMovieDAO;
	
	/** 타이틀 파일 복사관련 메서드*/
	private String titleCopyInto(MultipartFile titleUpload) {
		
		String genid= UUID.randomUUID().toString();
		System.out.println("업로드된 파일:"+genid+"_"+titleUpload.getOriginalFilename());
		
		try {
			
			byte bytes[]=titleUpload.getBytes();
			String path = "C:/Users/user/git/yelloEgg/src/main/webapp/img/movieTitle/"+genid+"_"+titleUpload.getOriginalFilename();
			String titleCutPath="img/movieTitle/"+genid+"_"+titleUpload.getOriginalFilename();
			File outFile = new File(path);
			FileOutputStream fos = new FileOutputStream(outFile);
			fos.write(bytes);
			fos.close();

			return titleCutPath;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/** 스틸컷 파일 복사관련 메서드*/
	private String steelCutCopyInto(MultipartFile steelCutUpload) {
		
		String genid= UUID.randomUUID().toString();
		System.out.println("업로드된 파일:"+steelCutUpload.getOriginalFilename());
		
		try {
			
			byte bytes[]=steelCutUpload.getBytes();	
			String path = "C:/Users/user/git/yelloEgg/src/main/webapp/img/movieSteelCut/"+genid+"_"+steelCutUpload.getOriginalFilename();
			String steelCutPath="img/movieSteelCut/"+genid+"_"+steelCutUpload.getOriginalFilename();
			File outFile = new File(path);
			FileOutputStream fos = new FileOutputStream(outFile);
			fos.write(bytes);
			fos.close();
			return steelCutPath;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/** 어드민 메인 페이지 */
	@RequestMapping("adminMain.do")
	public String main() {
		return "admin/adminTemplete";
	}
	 
	/** 관리자 영화 리스트 */
	@RequestMapping("/adminMovieList.do")
	public ModelAndView adminMovieListForm(@RequestParam(value="cp",defaultValue="1") int cp) {
			ModelAndView mav = new ModelAndView();
			AdminMovieDTO dto = new AdminMovieDTO();	
			
			int totalcnt=adminMovieDAO.movieTotalCut();
			int listsize=10;
			int pagesize=5;
			
			List<AdminMovieDTO> movieList = adminMovieDAO.movieList(cp, listsize);	
			List<AdminMovieDTO> steelCutList = adminMovieDAO.steelCutList();
			
			/** sql날짜 -> String 변환 */
			for(int i = 0; i<movieList.size(); i++) {	
				movieList.get(i).setReleaseDate(new SimpleDateFormat("yyyy-MM-dd").format(movieList.get(i).getMovieReleaseDate()));
				movieList.get(i).setEndDate(new SimpleDateFormat("yyyy-MM-dd").format(movieList.get(i).getMovieEndDate()));	
			}

			String pageStr=egg.commons.PageModule.makepage("adminMovieList.do", totalcnt, listsize, pagesize, cp);
			
			mav.addObject("pagestr", pageStr);
			mav.addObject("movieList", movieList);
			mav.addObject("steelCutList", steelCutList);
			mav.setViewName("admin/movie/movieList");

			return mav;
	}
	
	/** 영화 검색 */
	@RequestMapping("/searchMovie.do")
	public ModelAndView searchMovie(@RequestParam(value="cp",defaultValue="1") int cp, AdminMovieDTO dto) {
	
		ModelAndView mav = new ModelAndView();
		
		int totalcnt=adminMovieDAO.movieTotalCut();
		int listsize=10;
		int pagesize=5;
		
		if(dto.getSearchMovie().equals("movieName")) {
			dto.setMovieName(dto.getSearchContent());
			dto.setMovieGenre("");
			dto.setMovieDistributer("");
		}else if(dto.getSearchMovie().equals("movieGenre")) {
			dto.setMovieGenre(dto.getSearchContent());
			dto.setMovieName("");
			dto.setMovieDistributer("");
		}else if(dto.getSearchMovie().equals("movieDistributer")){
			dto.setMovieName("");
			dto.setMovieGenre("");
			dto.setMovieDistributer(dto.getSearchContent());
		}
		List<AdminMovieDTO> searchList = adminMovieDAO.searchList(cp, listsize, dto);	
		List<AdminMovieDTO> steelCutList = adminMovieDAO.steelCutList();
		
		/** sql날짜 -> String 변환 */
		
		for(int i = 0; i<searchList.size(); i++) {	
			searchList.get(i).setReleaseDate(new SimpleDateFormat("yyyy-MM-dd").format(searchList.get(i).getMovieReleaseDate()));
			searchList.get(i).setEndDate(new SimpleDateFormat("yyyy-MM-dd").format(searchList.get(i).getMovieEndDate()));	
		}

		String pageStr=egg.commons.PageModule.makepage("searchMovie.do", totalcnt, listsize, pagesize, cp);
		
		mav.addObject("pagestr", pageStr);
		mav.addObject("searchList", searchList);
		mav.addObject("steelCutList", steelCutList);
		mav.setViewName("admin/movie/movieList");

		return mav;
	}
	
	/** 감상평 보기 */
	@RequestMapping(value="/adminMovieRepleList.do",method=RequestMethod.GET)
	public String adminMovieRepleListForm() {
		
		return "admin/movie/movieReple";
	}

	/** 영화 등록 */
	@RequestMapping(value="/adminMovieAdd.do",method=RequestMethod.GET)
	public String adminMovieAddForm() {
		
		return "admin/movie/movieAdd";
	}
	 
	@RequestMapping(value="/adminMovieAdd.do",method=RequestMethod.POST)
	public ModelAndView adminMovieAddSubmit(AdminMovieDTO dto){		
		
		ModelAndView mav = new ModelAndView();
		String msg = "";
		//타이틀 이미지 복사 기능
		String movieTitleImgName=titleCopyInto(dto.getMovieTitleImg());
		
		//String -> sql Date 형변환
		Date movieReleaseDate = Date.valueOf(dto.getReleaseDate());
		Date movieEndDate = Date.valueOf(dto.getEndDate());
		
		//입력된 String을 형변환 후 DTO 입력 
		
		dto.setMovieTitleCut(movieTitleImgName);
		dto.setMovieReleaseDate(movieReleaseDate);
		dto.setMovieEndDate(movieEndDate);
		dto.setMovieGrade(Integer.parseInt(dto.getGrade()));
		dto.setMovieRunTime(Integer.parseInt(dto.getRunTime()));
		
		int result=adminMovieDAO.movieInfoAdd(dto);
		
		if(result>0) {
			int steelCutCount = 0; 
			
			int movieMaxidx = adminMovieDAO.movieMaxIdx();
			dto.setSteelCutMovieIdx(movieMaxidx);
			
			for(int i = 0; i<dto.getSteelCutFileImg().size(); i++) {
				String steelCutList = steelCutCopyInto(dto.getSteelCutFileImg().get(i));
				dto.setSteelCutFileName(steelCutList);
				steelCutCount = adminMovieDAO.steelCutAdd(dto);
			}	
			msg = "영화등록 완료!";
			mav.addObject("msg", msg);
		}else {
			msg = "영화등록 실패!";
			mav.addObject("msg", msg);
		}
		mav.setViewName("admin/movie/movieMsg");
		
		return mav;
	}
	
	/** 영화 수정 */
	
	/** 파일삭제 */
	@RequestMapping("fileDelete.do")
	public String fileDelete(AdminMovieDTO dto) {
		
		File f = new File("C:/Users/user/git/eggYello/src/main/webapp/"+dto);
		f.delete();
		
		return null;
	}
	
}