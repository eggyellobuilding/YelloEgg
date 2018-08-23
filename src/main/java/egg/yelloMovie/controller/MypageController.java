package egg.yelloMovie.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {

	@RequestMapping("/mypageForm.do")
	public String mypageForm() {
		return "view/mypage/mypageForm";
	}
	@RequestMapping("/mypageInquiryList.do")
	public String mypageInquiryList() {
		return "view/mypage/mypageInquiryList";
	}
	
	@RequestMapping("/mypageInquiryWriteForm.do")
	public String mypageInquiryWriteForm() {
		return "view/mypage/mypageInquiryWriteForm";
	}
	
	@RequestMapping("/mypageUpdateMemberForm.do")
	public String mypageUpdateMemberForm() {
		return "view/mypage/mypageUpdateMemberForm";
		
	}
	
	@RequestMapping("mypageChangePwdForm.do")
	public String mypageChangePwdForm() {
		return "view/mypage/mypageChangePwdForm";
	}
	
	@RequestMapping("/mypageDeleteMemberForm.do")
	public String mypageDeleteMemberForm() {
		return "view/mypage/mypageDeleteMemberForm";
	}

	@RequestMapping("/mypageReservationList.do")
	public String mypageReservationList() {
		return "view/mypage/mypageReservationList";
	}
	
	@RequestMapping("/mypageReservationCancelList.do")
	public String mypageReservationCancelList() {
		return "view/mypage/mypageReservationCancelList";
	}
	
	@RequestMapping("/mypageStoreBuyList.do")
	public String mypageStoreBuyList() {
		return "view/mypage/mypageStoreBuyList";
	}
	
	@RequestMapping("/mypageStoreCancelList.do")
	public String mypageStoreCancelList() {
		return "view/mypage/mypageStoreCancelList";
	}
	
}
