package egg.yelloMovie.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import egg.movie.model.MovieDAO;
import egg.movie.model.MovieDTO;

@Controller
public class ScheduleController {

	@Autowired
	private MovieDAO movieDAO;

	@RequestMapping(value = "/scheduleInfo.do", method = RequestMethod.GET)
	public ModelAndView scheduleInfoForm() {
		ModelAndView mav = new ModelAndView();
		List<MovieDTO> scheduleMovieImg = movieDAO.schheduleList();
		// ArrayList<ArrayList<String>> simg1 = new ArrayList<ArrayList<String>>();
		// ArrayList<String> simg2 = new ArrayList<String>();

		// 계산식
		int inum = 1;
		int num = 0;
		for (int w = 0; w < scheduleMovieImg.size(); w++) {
			num = num + 1;
			if (num == 9) {
				inum = inum + 1;
				num = 0;
			}
		}
		ArrayList<ArrayList<String>> simg1 = new ArrayList<ArrayList<String>>();
		int result = 1;
		for (int i = 0; i < inum; i++) {
			ArrayList<String> simg2 = new ArrayList<String>();
			for (int j = 0; j < scheduleMovieImg.size(); j++) {

				if (scheduleMovieImg.size() / 8 == i && (scheduleMovieImg.size() % 8 != 0 && j == scheduleMovieImg.size() % 8)) {

					break;
				} else if (j < 8) {
					simg2.add(scheduleMovieImg.get(j).getMovieTitleCut());
					result = scheduleMovieImg.size() - j;
					System.out.println("result:" + result);

				}
			}
			simg1.add(simg2);
		}

		for (int www = 0; www < simg1.size(); www++) {
			System.out.println(simg1.get(www));
		}
		mav.addObject("inum", inum);
		mav.addObject("simg1", simg1);
		mav.addObject("scheduleMovieImg", scheduleMovieImg);
		mav.setViewName("view/schedule/scheduleMovie");

		return mav;
	}

	@RequestMapping(value = "/scheduleInfo.do", method = RequestMethod.POST)
	public ModelAndView scheduleInfoSubmit() {
		ModelAndView mav = new ModelAndView();

		return mav;
	}

}
