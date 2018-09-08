package egg.yelloMovie.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import egg.mypage.model.MypageDAO;
import egg.mypage.model.MypageDTO;

@Controller
public class AdminMypageController {

	@Autowired
	private MypageDAO mypagedao;
	
	@RequestMapping("/adminQaboardList.do")
	public ModelAndView adminQaboardList(@RequestParam(value="cp",defaultValue="1")int cp) {
		int totalCnt=mypagedao.adminQaboardTotalCnt();
		int listSize=10;
		int pageSize=5;
		List<MypageDTO> lists=mypagedao.adminQaboardList(listSize, cp);
		String pageStr=egg.commons.PageModule.makePage("adminQaboardList.do", totalCnt, listSize, pageSize, cp);
		ModelAndView mav=new ModelAndView();
		mav.addObject("pageStr", pageStr);
		mav.addObject("lists", lists);
		mav.setViewName("admin/mypage/adminQaboardList");
		return mav;
	}
	
	@RequestMapping("/adminQaboardAnswer.do")
	public ModelAndView adminQaboardAnswerSubmit(@RequestParam(value="answerQaIdx")int answerQaIdx,
												@RequestParam(value="answerQaIdx")int qaIdx,
												@RequestParam(value="answerAdminIdx")int answerAdminIdx,
												@RequestParam(value="answerAnswer")String answerAnswer,
												MypageDTO mpdto) {
		mpdto.setAnswerQaIdx(answerQaIdx);
		mpdto.setAnswerAdminIdx(answerAdminIdx);
		mpdto.setAnswerAnswer(answerAnswer);
		int result=mypagedao.adminQaboardAnswer(mpdto);
		String msg=null;
		if(result>0) {
			
			int result_s=mypagedao.updateQaAnswer(qaIdx);
			if(result_s>0) {
				msg="문의글의 답변을 달았습니다.";
			}else {
				msg="문의글 답변상태 업데이트 실패하였습니다.";
			}
		}else {
			msg="문의글의 답변달기에 실패하였습니다.";
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("goUrl", "adminQaboardList.do");
		mav.setViewName("admin/mypage/adminQaboardMsg");
		return mav;
	}
	 
	/**관리자페이지 - 예약 확인 내역*/
	@RequestMapping("/adminReservationConfirmList.do")
	public ModelAndView adminReservationConfirmList(@RequestParam(value="cp",defaultValue="1")int cp) {
		int totalCnt=mypagedao.adminReservationConfirmTotalCnt();
		int listSize=10;
		int pageSize=10;
		List<MypageDTO> lists=mypagedao.adminReservationConfirmList(listSize, cp);
		String pageStr=egg.commons.PageModule.makePage("adminReservationConfirmList.do", totalCnt, listSize, pageSize, cp);
		ModelAndView mav = new ModelAndView();
		mav.addObject("pageStr", pageStr);
		mav.addObject("lists", lists);
		mav.setViewName("admin/mypage/adminReservationConfirmList");
		return mav;
	}
	
	/**관리자 페이지 - 예약 취소 내역*/
	@RequestMapping("/adminReservationCancelList.do")
	public ModelAndView adminReservationCancelList(@RequestParam(value="cp",defaultValue="1")int cp) {
		int totalCnt=mypagedao.adminReservationCancelTotalCnt();
		int listSize=10;
		int pageSize=10;
		List<MypageDTO> lists=mypagedao.adminReservationCancelList(listSize, cp);
		String pageStr=egg.commons.PageModule.makePage("adminReservationCancelList.do", totalCnt, listSize, pageSize, cp);
		ModelAndView mav = new ModelAndView();
		mav.addObject("pageStr", pageStr);
		mav.addObject("lists", lists);
		mav.setViewName("admin/mypage/adminReservationCancelList");
		return mav;
	
	}
	
	/**관리자페이지 - 스토어 구매 내역*/
	@RequestMapping("/adminStoreBuyList.do")
	public ModelAndView adminStoreBuyList(@RequestParam(value="cp",defaultValue="1")int cp) {
		int totalCnt=mypagedao.adminStoreBuyTotalCnt();
		int listSize=10;
		int pageSize=10;
		List<MypageDTO> lists=mypagedao.adminStoreBuyList(listSize, cp);
		String pageStr=egg.commons.PageModule.makePage("adminStoreBuyList.do", totalCnt, listSize, pageSize, cp);
		ModelAndView mav = new ModelAndView();
		mav.addObject("pageStr", pageStr);
		mav.addObject("lists", lists);
		mav.setViewName("admin/mypage/adminStoreBuyList");
		return mav;
	}
	
	/**관리자 페이지 - 스토어 취소 내역*/
	@RequestMapping("/adminStoreCancelList.do")
	public ModelAndView adminStoreCancelList(@RequestParam(value="cp",defaultValue="1")int cp) {
		int totalCnt=mypagedao.adminStoreCancelTotalCnt();
		int listSize=10;
		int pageSize=10;
		List<MypageDTO> lists=mypagedao.adminStoreCancelList(listSize, cp);
		String pageStr=egg.commons.PageModule.makePage("adminStoreCancelList.do", totalCnt, listSize, pageSize, cp);
		ModelAndView mav = new ModelAndView();
		mav.addObject("pageStr", pageStr);
		mav.addObject("lists", lists);
		mav.setViewName("admin/mypage/adminStoreCancelList");
		return mav;
	}
}
