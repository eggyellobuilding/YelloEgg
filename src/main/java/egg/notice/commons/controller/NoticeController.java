package egg.notice.commons.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import egg.cinema.admin.model.CinemaDAO;
import egg.cinema.admin.model.CinemaDTO;
import egg.notice.admin.model.AdminNoticeDTO;
import egg.notice.commons.model.NoticeDAO;
import egg.notice.commons.model.NoticeDTO;

@Controller
public class NoticeController {

	@Autowired
	private NoticeDAO adao;
	
	private int pagesize = 5;
	private int listsize = 5;

		@RequestMapping(value="/NoticeList.do")
		public ModelAndView adminNotice(@RequestParam(value="cp", defaultValue="1") int cp, HttpServletRequest req) {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("view/notice/noticeList");
			HttpSession session = req.getSession();
			ServletContext context = session.getServletContext();
			int totalcnt = adao.getNoticeCount();
			HashMap<String, String> temp = new HashMap<String, String>();
			temp.put("start", ((cp -1) * pagesize) + "");
			temp.put("end", (((cp -1) * pagesize) + pagesize) + "");
			List<NoticeDTO> arr = adao.NoticeList(temp);
			String pageStr = egg.commons.PageModule.makepage("NoticeList.do", totalcnt, listsize, pagesize, cp);
			mav.addObject("pageStr", pageStr);
			mav.addObject("arr", arr);
			mav.addObject("cp", cp);
			return mav;
		}
		@RequestMapping(value="/nContent.do")
		public ModelAndView noticeContent(@RequestParam(value="noticeIdx", defaultValue="0") int noticeIdx) {
			ModelAndView mav = new ModelAndView("yongJson");
			NoticeDTO dto=new NoticeDTO();
			AdminNoticeDTO nt=new AdminNoticeDTO();
			adao.readNotice(noticeIdx);
			dto = adao.Notice(noticeIdx);
			
			mav.addObject("dto", dto);
			return mav;
	}
}
