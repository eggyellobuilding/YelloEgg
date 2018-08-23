package egg.yelloMovie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MovieReservationController {

	@RequestMapping("/movieReservation.do")
	public String movieReservationForm() {
		
		return "view/reservation/reservationMovie";
	}
	
	@RequestMapping("/reservationSeat.do")
	public String reservationSeatForm() {
		
		return "view/reservation/reservationSeat";
	}
}
