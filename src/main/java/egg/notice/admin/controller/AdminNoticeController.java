package egg.notice.admin.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import egg.notice.admin.model.AdminNoticeDAO;
import egg.notice.admin.model.AdminNoticeDTO;

@Controller
public class AdminNoticeController {

	@Autowired
	private AdminNoticeDAO adao;

	
	private int pagesize = 5;
	private int listsize = 5;
	
	@RequestMapping(value="/adminNotice.do")
	public ModelAndView adminNotice(@RequestParam(value="cp", defaultValue="1") int cp, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		ServletContext context = session.getServletContext();
		int totalcnt = adao.getNoticeCount();
		HashMap<String, String> temp = new HashMap<String, String>();
		temp.put("start", ((cp -1) * pagesize) + "");
		temp.put("end", (((cp -1) * pagesize) + pagesize) + "");
		List<AdminNoticeDTO> arr = adao.getAllList(temp);
		String pageStr = egg.commons.PageModule.makePage("adminNotice.do", totalcnt, listsize, pagesize, cp);
		mav.setViewName("admin/adminNotice/noticeList");
		mav.addObject("pageStr", pageStr);
		mav.addObject("arr", arr);
		mav.addObject("cp", cp);
		return mav;
	}
	
	@RequestMapping(value="/noticeContent.do")
	public ModelAndView noticeContent(@RequestParam(value="noticeIdx", defaultValue="0") int noticeIdx) {
		ModelAndView mav = new ModelAndView("yongJson");
		AdminNoticeDTO dto = adao.getNotice(noticeIdx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@RequestMapping(value="/insertNotice.do")
	public ModelAndView insertNotice(HttpServletRequest req, @RequestParam(value="noticeCinemaIdx", defaultValue="") int noticeCinemaIdx) {
		ModelAndView mav = new ModelAndView();
		AdminNoticeDTO dto = new AdminNoticeDTO();
		dto.setNoticeTitle(req.getParameter("noticeTitle"));
		dto.setNoticeContent(req.getParameter("noticeContent").replaceAll("\n", "<br>"));
		dto.setNoticeCinemaIdx(noticeCinemaIdx);
		int result = adao.insertNotice(dto);
		if(result > 0 ) {
			mav.addObject("msg", "공지사항 등록");
		}else {
			mav.addObject("msg", "공지사항 실패");
		}
		mav.setViewName("admin/adminNotice/adminNoticeMsg");
		return mav;
	}
	
	@RequestMapping(value="/updateNotice.do")
	public ModelAndView updateNotice(@RequestParam(value="noticeIdx", defaultValue="0") int noticeIdx, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		AdminNoticeDTO adto = new AdminNoticeDTO();
		adto.setNoticeTitle(req.getParameter("noticeTitle"));
		adto.setNoticeContent(req.getParameter("noticeContent").replaceAll("\n", "<br>"));
		adto.setNoticeIdx(noticeIdx);
		adto.setCinemaIdx(Integer.parseInt(req.getParameter("noticeCinemaIdx")));
		int result = adao.updateNotice(adto);
		mav.setViewName("admin/adminNotice/adminNoticeMsg");
		if(result > 0) {
			mav.addObject("msg","공지사항 수정이 완료되었습니다.");
		}else {
			mav.addObject("msg","수정 실패.");
		}
		return mav;
	}
	
	
}
