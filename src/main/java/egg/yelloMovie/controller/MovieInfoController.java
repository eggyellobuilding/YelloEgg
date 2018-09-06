package egg.yelloMovie.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import egg.movie.model.MovieDAO;
import egg.movie.model.MovieDTO;

@Controller
public class MovieInfoController {
	
	@Autowired
	private MovieDAO movieDAO;
	
	/** 박스오피스 */
	@RequestMapping("/movieBoxOffice.do")
	public ModelAndView movieBoxOfficeForm() {
		
		ModelAndView mav = new ModelAndView();
		List<MovieDTO> officeList = movieDAO.movieOfficeInfo();
		List<MovieDTO> steelCutList = movieDAO.steelCutInfo();
		
		/** sql날짜 -> String 변환 */
		for(int i = 0; i<officeList.size(); i++) {	
			officeList.get(i).setReleaseDate(new SimpleDateFormat("yyyy-MM-dd").format(officeList.get(i).getMovieReleaseDate()));
			officeList.get(i).setEndDate(new SimpleDateFormat("yyyy-MM-dd").format(officeList.get(i).getMovieEndDate()));	
		}
		mav.addObject("officeList", officeList);
		mav.addObject("steelCutList", steelCutList);
	
		mav.setViewName("view/movie/movieBoxOfficeInfo");
	
		return mav;
	}
	/** 최신개봉작 */
	@RequestMapping("/movieLatest.do")
	public ModelAndView movieLatestForm() {
		
		ModelAndView mav = new ModelAndView();
		List<MovieDTO> LatestList = movieDAO.movieLatestInfo();
		List<MovieDTO> steelCutList = movieDAO.steelCutInfo();
		
		/** sql날짜 -> String 변환 */
		for(int i = 0; i<LatestList.size(); i++) {	
			LatestList.get(i).setReleaseDate(new SimpleDateFormat("yyyy-MM-dd").format(LatestList.get(i).getMovieReleaseDate()));
			LatestList.get(i).setEndDate(new SimpleDateFormat("yyyy-MM-dd").format(LatestList.get(i).getMovieEndDate()));	
		}
		mav.addObject("LatestList", LatestList);
		mav.addObject("steelCutList", steelCutList);
	
		mav.setViewName("view/movie/movieLatestInfo");
		
		return mav;
	}
	/** 상영예정작 */
	@RequestMapping("/movieExpectation.do")
	public ModelAndView movieExpectationForm() {
		
		ModelAndView mav = new ModelAndView();
		List<MovieDTO> ExpectationList = movieDAO.movieExpectationInfo();
		List<MovieDTO> steelCutList = movieDAO.steelCutInfo();
		
		/** sql날짜 -> String 변환 */
		for(int i = 0; i<ExpectationList.size(); i++) {	
			ExpectationList.get(i).setReleaseDate(new SimpleDateFormat("yyyy-MM-dd").format(ExpectationList.get(i).getMovieReleaseDate()));
			ExpectationList.get(i).setEndDate(new SimpleDateFormat("yyyy-MM-dd").format(ExpectationList.get(i).getMovieEndDate()));	
		}
		mav.addObject("ExpectationList", ExpectationList);
		mav.addObject("steelCutList", steelCutList);
	
		mav.setViewName("view/movie/movieExpectationInfo");
		
		return mav;
	}
	/** 감상평 등록 전 리스트 가져오기 */
	/*
	@RequestMapping(value="/movieReple.do",method=RequestMethod.GET)
	public ModelAndView movieRepleForm() {
	ModelAndView mav = new ModelAndView();
		
			
	return mav;
	}*/

	/** 감상평 등록 후 리스트 가져오기  */
	@RequestMapping("/movieReple.do")
	public ModelAndView movieRepleSubmit(MovieDTO dto) {	 
		
		dto.setRepleScore(Integer.parseInt(dto.getReScore()));
		dto.setRepleMemberIdx(Integer.parseInt(dto.getReMemberIdx()));
		dto.setRepleMovieIdx(Integer.parseInt(dto.getReMovieIdx()));
		
		movieDAO.movieRepleAdd(dto);
		List<MovieDTO> lists = movieDAO.movieRepleList(dto);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("yongJson");
		mav.addObject("repleLists",lists);
		return mav;
	}
}
