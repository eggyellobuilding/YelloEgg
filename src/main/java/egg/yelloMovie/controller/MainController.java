package egg.yelloMovie.controller;

import java.text.SimpleDateFormat;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egg.movie.model.MovieDAO;
import egg.movie.model.MovieDTO;

@Controller
public class MainController {

	@Autowired
	private MovieDAO movieDAO;

	@RequestMapping("/main.do")
	public ModelAndView mainForm() {

		ModelAndView mav = new ModelAndView();

		List<MovieDTO> mainList = movieDAO.movieOfficeInfo();
		List<MovieDTO> steelCutList = movieDAO.steelCut();
		List<MovieDTO> reple = movieDAO.movieReple();

		// 메인 화면 캐러셀
		ArrayList<Map> mainMovieCarousel = new ArrayList<Map>();
		// 영화 정보
		ArrayList<Map> mainMovie = new ArrayList<Map>();
		ArrayList<Map> steelCutName = new ArrayList<Map>();

		/** sql날짜 -> String 변환 오피스 */
		for (int i = 0; i < mainList.size(); i++) {
			mainList.get(i)
					.setReleaseDate(new SimpleDateFormat("yyyy-MM-dd").format(mainList.get(i).getMovieReleaseDate()));
			mainList.get(i).setEndDate(new SimpleDateFormat("yyyy-MM-dd").format(mainList.get(i).getMovieEndDate()));
		}

		for (int r = 0; r < reple.size(); r++) {
			reple.get(r).setRepleDate(new SimpleDateFormat("yyyy-MM-dd").format(reple.get(r).getRepleWriteDate()));
		}
		for (int j = 0; j < mainList.size(); j++) {
			if (j < 4) {

				Map<String, String> movie = new HashMap<String, String>();
				movie.put("movieTitleCut", mainList.get(j).getMovieTitleCut());
				mainMovieCarousel.add(movie);

				Map<String, String> movieList = new HashMap<String, String>();
				movieList.put("movieTitleCut", mainList.get(j).getMovieTitleCut());
				movieList.put("movieName", mainList.get(j).getMovieName());
				movieList.put("movieReleaseDate", mainList.get(j).getReleaseDate());
				movieList.put("movieDirector", mainList.get(j).getMovieDirector());
				movieList.put("movieActor", mainList.get(j).getMovieActor());
				movieList.put("movieGenre", mainList.get(j).getMovieGenre());
				movieList.put("movieDistributer", mainList.get(j).getMovieDistributer());
				String grade = String.valueOf(mainList.get(j).getMovieGrade());
				movieList.put("movieGrade", grade);
				movieList.put("movieSummary", mainList.get(j).getMovieSummary().replaceAll("\n", "<br>"));
				movieList.put("movieIdx", String.valueOf(mainList.get(j).getMovieIdx()));
				String rsa = String.valueOf(mainList.get(j).getReplescoreavg());
				movieList.put("moviereplescoreavg", rsa.substring(0, 3));

				mainMovie.add(movieList);
			}
		}

		mav.addObject("mainMovie", mainMovie);
		mav.addObject("mainMovieCarousel", mainMovieCarousel);
		mav.addObject("mainSteelCut", steelCutList);
		mav.addObject("movieReple", reple);
		mav.setViewName("view/main");

		return mav;
	}

	// 오피스 ajax
	@RequestMapping("/office.do")
	public ModelAndView officeForm() {
		ModelAndView mav = new ModelAndView();
		List<MovieDTO> movieInfo = movieDAO.movieOfficeInfo();
		ArrayList<Map> movie = new ArrayList<Map>();
		List<MovieDTO> steelCutList = movieDAO.steelCut();
		List<MovieDTO> reple = movieDAO.movieReple();

		/** sql날짜 -> String 변환 오피스 */
		for (int i = 0; i < movieInfo.size(); i++) {
			movieInfo.get(i)
					.setReleaseDate(new SimpleDateFormat("yyyy-MM-dd").format(movieInfo.get(i).getMovieReleaseDate()));
			movieInfo.get(i).setEndDate(new SimpleDateFormat("yyyy-MM-dd").format(movieInfo.get(i).getMovieEndDate()));
		}
		for (int r = 0; r < reple.size(); r++) {
			reple.get(r).setRepleDate(new SimpleDateFormat("yyyy-MM-dd").format(reple.get(r).getRepleWriteDate()));
		}
		for (int j = 0; j < movieInfo.size(); j++) {
			if (j < 4) {

				Map<String, String> movieList = new HashMap<String, String>();
				movieList.put("movieTitleCut", movieInfo.get(j).getMovieTitleCut());
				movieList.put("movieName", movieInfo.get(j).getMovieName());
				movieList.put("movieReleaseDate", movieInfo.get(j).getReleaseDate());
				movieList.put("movieDirector", movieInfo.get(j).getMovieDirector());
				movieList.put("movieActor", movieInfo.get(j).getMovieActor());
				movieList.put("movieGenre", movieInfo.get(j).getMovieGenre());
				movieList.put("movieDistributer", movieInfo.get(j).getMovieDistributer());
				String grade = String.valueOf(movieInfo.get(j).getMovieGrade());
				movieList.put("movieGrade", grade);
				movieList.put("movieSummary", movieInfo.get(j).getMovieSummary().replaceAll("\n", "<br>"));
				movieList.put("movieIdx", String.valueOf(movieInfo.get(j).getMovieIdx()));
				String rsa = String.valueOf(movieInfo.get(j).getReplescoreavg());
				movieList.put("moviereplescoreavg", rsa.substring(0, 3));

				movie.add(movieList);
			}
		}

		mav.setViewName("yongJson");
		mav.addObject("movie", movie);
		mav.addObject("movieSteelCut", steelCutList);
		mav.addObject("movieReple", reple);
		return mav;
	}

	// 최신개봉 ajax
	@RequestMapping("/latest.do")
	public ModelAndView latestForm() {
		ModelAndView mav = new ModelAndView();
		List<MovieDTO> movieInfo = movieDAO.movieLatestInfo();
		ArrayList<Map> movie = new ArrayList<Map>();
		List<MovieDTO> steelCutList = movieDAO.steelCut();
		List<MovieDTO> reple = movieDAO.movieReple();

		/** sql날짜 -> String 변환 오피스 */
		for (int i = 0; i < movieInfo.size(); i++) {
			movieInfo.get(i)
					.setReleaseDate(new SimpleDateFormat("yyyy-MM-dd").format(movieInfo.get(i).getMovieReleaseDate()));
			movieInfo.get(i).setEndDate(new SimpleDateFormat("yyyy-MM-dd").format(movieInfo.get(i).getMovieEndDate()));
		}
		for (int r = 0; r < reple.size(); r++) {
			reple.get(r).setRepleDate(new SimpleDateFormat("yyyy-MM-dd").format(reple.get(r).getRepleWriteDate()));
		}
		for (int j = 0; j < movieInfo.size(); j++) {
			if (j < 4) {

				Map<String, String> movieList = new HashMap<String, String>();
				movieList.put("movieTitleCut", movieInfo.get(j).getMovieTitleCut());
				movieList.put("movieName", movieInfo.get(j).getMovieName());
				movieList.put("movieReleaseDate", movieInfo.get(j).getReleaseDate());
				movieList.put("movieDirector", movieInfo.get(j).getMovieDirector());
				movieList.put("movieActor", movieInfo.get(j).getMovieActor());
				movieList.put("movieGenre", movieInfo.get(j).getMovieGenre());
				movieList.put("movieDistributer", movieInfo.get(j).getMovieDistributer());
				String grade = String.valueOf(movieInfo.get(j).getMovieGrade());
				movieList.put("movieGrade", grade);
				movieList.put("movieSummary", movieInfo.get(j).getMovieSummary().replaceAll("\n", "<br>"));
				movieList.put("movieIdx", String.valueOf(movieInfo.get(j).getMovieIdx()));
				String rsa = String.valueOf(movieInfo.get(j).getReplescoreavg());
				movieList.put("moviereplescoreavg", rsa.substring(0, 3));

				movie.add(movieList);
			}
		}

		mav.setViewName("yongJson");
		mav.addObject("movie", movie);
		mav.addObject("movieSteelCut", steelCutList);
		mav.addObject("movieReple", reple);
		return mav;
	}

	// 상영예정 ajax
	@RequestMapping("/expectation.do")
	public ModelAndView expectationForm() {
		ModelAndView mav = new ModelAndView();
		List<MovieDTO> movieInfo = movieDAO.movieExpectationInfo();
		ArrayList<Map> movie = new ArrayList<Map>();
		List<MovieDTO> steelCutList = movieDAO.steelCut();
		List<MovieDTO> reple = movieDAO.movieReple();

		/** sql날짜 -> String 변환 오피스 */
		for (int i = 0; i < movieInfo.size(); i++) {
			movieInfo.get(i)
					.setReleaseDate(new SimpleDateFormat("yyyy-MM-dd").format(movieInfo.get(i).getMovieReleaseDate()));
			movieInfo.get(i).setEndDate(new SimpleDateFormat("yyyy-MM-dd").format(movieInfo.get(i).getMovieEndDate()));
		}
		for (int r = 0; r < reple.size(); r++) {
			reple.get(r).setRepleDate(new SimpleDateFormat("yyyy-MM-dd").format(reple.get(r).getRepleWriteDate()));
		}
		for (int j = 0; j < movieInfo.size(); j++) {
			if (j < 4) {

				Map<String, String> movieList = new HashMap<String, String>();
				movieList.put("movieTitleCut", movieInfo.get(j).getMovieTitleCut());
				movieList.put("movieName", movieInfo.get(j).getMovieName());
				movieList.put("movieReleaseDate", movieInfo.get(j).getReleaseDate());
				movieList.put("movieDirector", movieInfo.get(j).getMovieDirector());
				movieList.put("movieActor", movieInfo.get(j).getMovieActor());
				movieList.put("movieGenre", movieInfo.get(j).getMovieGenre());
				movieList.put("movieDistributer", movieInfo.get(j).getMovieDistributer());
				String grade = String.valueOf(movieInfo.get(j).getMovieGrade());
				movieList.put("movieGrade", grade);
				movieList.put("movieSummary", movieInfo.get(j).getMovieSummary().replaceAll("\n", "<br>"));
				movieList.put("movieIdx", String.valueOf(movieInfo.get(j).getMovieIdx()));
				String rsa = String.valueOf(movieInfo.get(j).getReplescoreavg());
				movieList.put("moviereplescoreavg", rsa.substring(0, 3));

				movie.add(movieList);
			}
		}

		mav.setViewName("yongJson");
		mav.addObject("movie", movie);
		mav.addObject("movieSteelCut", steelCutList);
		mav.addObject("movieReple", reple);
		return mav;
	}
}
