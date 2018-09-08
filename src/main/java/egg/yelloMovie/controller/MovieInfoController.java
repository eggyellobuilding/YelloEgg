package egg.yelloMovie.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import egg.movie.model.MovieDAO;
import egg.movie.model.MovieDTO;

@Controller
public class MovieInfoController {
	
	@Autowired
	private MovieDAO movieDAO;
	
	/** 박스오피스 */
	@RequestMapping("/movieBoxOffice.do")
	public ModelAndView movieBoxOfficeForm(@RequestParam(value="cp",defaultValue="1")int cp) {
		ModelAndView mav = new ModelAndView();

		List<MovieDTO> officeList = movieDAO.movieOfficeInfo();
		List<MovieDTO> steelCutList = movieDAO.steelCutInfo();
		List<MovieDTO> movieReple = movieDAO.movieReple(); 	
		
		/** sql날짜 -> String 변환 */
		for(int i = 0; i<officeList.size(); i++) {	
			officeList.get(i).setReleaseDate(new SimpleDateFormat("yyyy-MM-dd").format(officeList.get(i).getMovieReleaseDate()));
			officeList.get(i).setEndDate(new SimpleDateFormat("yyyy-MM-dd").format(officeList.get(i).getMovieEndDate()));	
		}
		
		for(int r = 0; r<movieReple.size(); r++) {
			movieReple.get(r).setRepleDate(new SimpleDateFormat("yyyy-MM-dd").format(movieReple.get(r).getRepleWriteDate()));			
		}
		
		for(int j = 0; j<officeList.size(); j++) {
			List<MovieDTO> repleSum = movieDAO.repleSum(officeList.get(j).getMovieIdx());
			officeList.get(j).setMovieSummary(officeList.get(j).getMovieSummary().replaceAll("\n", "<br>"));
			if(repleSum.size()==1) {
				String rsa = String.valueOf(repleSum.get(0).getReplescoreavg());
				//double repleavg = Double.parseDouble(rsa.substring(0, 3));
				officeList.get(j).setMovieRepleScoreAvg(rsa.substring(0, 3));
			
			}else if(repleSum.size()==0){
				String rsa = String.valueOf(officeList.get(j).getReplescoreavg());
				officeList.get(j).setMovieRepleScoreAvg(rsa.substring(0, 3));
			}
		}
		
		mav.addObject("officeList", officeList);
		mav.addObject("steelCutList", steelCutList);
		mav.addObject("movieReple", movieReple);

		mav.setViewName("view/movie/movieBoxOfficeInfo");
	
		return mav;
	}
	/** 최신개봉작 */
	@RequestMapping("/movieLatest.do")
	public ModelAndView movieLatestForm() {
		
		ModelAndView mav = new ModelAndView();
		List<MovieDTO> LatestList = movieDAO.movieLatestInfo();
		List<MovieDTO> steelCutList = movieDAO.steelCutInfo();
		List<MovieDTO> movieReple = movieDAO.movieReple(); 
		
		/** sql날짜 -> String 변환 */
		for(int i = 0; i<LatestList.size(); i++) {	
			LatestList.get(i).setReleaseDate(new SimpleDateFormat("yyyy-MM-dd").format(LatestList.get(i).getMovieReleaseDate()));
			LatestList.get(i).setEndDate(new SimpleDateFormat("yyyy-MM-dd").format(LatestList.get(i).getMovieEndDate()));	
		}
		
		for(int r = 0; r<movieReple.size(); r++) {
			movieReple.get(r).setRepleDate(new SimpleDateFormat("yyyy-MM-dd").format(movieReple.get(r).getRepleWriteDate()));			
		}
		
		for(int j = 0; j<LatestList.size(); j++) {
			List<MovieDTO> repleSum = movieDAO.repleSum(LatestList.get(j).getMovieIdx());
			LatestList.get(j).setMovieSummary(LatestList.get(j).getMovieSummary().replaceAll("\n", "<br>"));
			
			if(repleSum.size()==1) {
				String rsa = String.valueOf(repleSum.get(0).getReplescoreavg());
				//double repleavg = Double.parseDouble(rsa.substring(0, 3));
				LatestList.get(j).setMovieRepleScoreAvg(rsa.substring(0, 3));
				}else if(repleSum.size()==0){
					String rsa = String.valueOf(LatestList.get(j).getReplescoreavg());
					LatestList.get(j).setMovieRepleScoreAvg(rsa.substring(0, 3));
				}
		}
		
		mav.addObject("LatestList", LatestList);
		mav.addObject("steelCutList", steelCutList);
		mav.addObject("movieReple", movieReple);
		
		mav.setViewName("view/movie/movieLatestInfo");
		
		return mav;
	}
	/** 상영예정작 */
	@RequestMapping("/movieExpectation.do")
	public ModelAndView movieExpectationForm() {
		
		ModelAndView mav = new ModelAndView();
		List<MovieDTO> ExpectationList = movieDAO.movieExpectationInfo();
		List<MovieDTO> steelCutList = movieDAO.steelCutInfo();
		List<MovieDTO> movieReple = movieDAO.movieReple(); 
		
		/** sql날짜 -> String 변환 */
		for(int i = 0; i<ExpectationList.size(); i++) {	
			ExpectationList.get(i).setReleaseDate(new SimpleDateFormat("yyyy-MM-dd").format(ExpectationList.get(i).getMovieReleaseDate()));
			ExpectationList.get(i).setEndDate(new SimpleDateFormat("yyyy-MM-dd").format(ExpectationList.get(i).getMovieEndDate()));	
		}
		
		for(int r = 0; r<movieReple.size(); r++) {
			movieReple.get(r).setRepleDate(new SimpleDateFormat("yyyy-MM-dd").format(movieReple.get(r).getRepleWriteDate()));			
		}
		
		for(int j = 0; j<ExpectationList.size(); j++) {
			List<MovieDTO> repleSum = movieDAO.repleSum(ExpectationList.get(j).getMovieIdx());
			ExpectationList.get(j).setMovieSummary(ExpectationList.get(j).getMovieSummary().replaceAll("\n", "<br>"));
			
			if(repleSum.size()==1) {
				String rsa = String.valueOf(repleSum.get(0).getReplescoreavg());
				//double repleavg = Double.parseDouble(rsa.substring(0, 3));
				ExpectationList.get(j).setMovieRepleScoreAvg(rsa.substring(0, 3));
				}else if(repleSum.size()==0){
					String rsa = String.valueOf(ExpectationList.get(j).getReplescoreavg());
					ExpectationList.get(j).setMovieRepleScoreAvg(rsa.substring(0, 3));
				}
		}
		
		mav.addObject("ExpectationList", ExpectationList);
		mav.addObject("steelCutList", steelCutList);
		mav.addObject("movieReple", movieReple);
		
		mav.setViewName("view/movie/movieExpectationInfo");
		
		return mav;
	}
	/** 감상평 등록 후 리스트 가져오기  */
	@RequestMapping("/movieReple.do")
	public ModelAndView movieRepleSubmit(MovieDTO dto) {	 
		System.out.println("asd"+dto.getReMemberIdx());
		dto.setRepleScore(Integer.parseInt(dto.getReScore()));
		dto.setRepleMemberIdx(Integer.parseInt(dto.getReMemberIdx()));
		dto.setRepleMovieIdx(Integer.parseInt(dto.getReMovieIdx()));
		movieDAO.movieRepleAdd(dto);
		System.out.println("asd");
		List<MovieDTO> lists = movieDAO.movieRepleList(dto);
		for(int r = 0; r<lists.size(); r++) {
			
			lists.get(r).setRepleDate(new SimpleDateFormat("yyyy-MM-dd").format(lists.get(r).getRepleWriteDate()));			
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("yongJson");
		mav.addObject("repleLists",lists);
		System.out.println(lists.get(0).getRepleContent());
		System.out.println(lists.get(0).getRepleCount());
		System.out.println(lists.get(0).getRepleDate());
		System.out.println(lists.get(0).getRepleMemberIdx());
		System.out.println(lists.get(0).getRepleMovieIdx());
		return mav;
	}
}
