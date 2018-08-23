package egg.yelloMovie.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public String movieLatestForm() {
		
		return "view/movie/movieLatestInfo";
	}
	/** 상영예정작 */
	@RequestMapping("/movieExpectation.do")
	public String movieExpectationForm() {
		
		return "view/movie/movieExpectationInfo";
	}

}
