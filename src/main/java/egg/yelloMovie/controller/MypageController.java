package egg.yelloMovie.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egg.member.model.MemberDAO;
import egg.member.model.MemberDTO;

@Controller
public class MypageController {

	@Autowired
	private MemberDAO memberdao;
	
	/**비밀번호 암호화 메서드*/
  	public String testMD5(String str){
		String MD5 = "";		
		try{
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(str.getBytes()); 
			byte byteData[] = md.digest();
			StringBuffer sb = new StringBuffer(); 

			for(int i = 0 ; i < byteData.length ; i++){

				sb.append(Integer.toString((byteData[i]&0xff) + 0x100, 16).substring(1));
			}

			MD5 = sb.toString();

		}catch(NoSuchAlgorithmException e){
			e.printStackTrace(); 
			MD5 = null; 
		}
		return MD5;
	}
  	
	/**마이페이지*/
	@RequestMapping("/mypageForm.do")
	public ModelAndView mypageForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("view/mypage/mypageForm");
		return mav;
	}
	
	/**마이페이지 1:1문의 내역*/
	@RequestMapping("/mypageInquiryList.do")
	public String mypageInquiryList() {
		return "view/mypage/mypageInquiryList";
	}
	
	/**마이페이지 1:1문의 글 쓰기*/
	@RequestMapping("/mypageInquiryWriteForm.do")
	public String mypageInquiryWriteForm() {
		return "view/mypage/mypageInquiryWriteForm";
	}
	
	/**마이페이지 회원정보 수정*/
	@RequestMapping("/mypageUpdateMemberForm.do")
	public String mypageUpdateMemberForm() {
		return "view/mypage/mypageUpdateMemberForm";
		
	}
	
	/**마이페이지 비밀번호 변경*/
	@RequestMapping("mypageChangePwdForm.do")
	public String mypageChangePwdForm() {
		return "view/mypage/mypageChangePwdForm";
	}
	
	/**마이페이지 회원탈퇴  폼*/
	@RequestMapping("/mypageDeleteMemberForm.do")
	public String mypageDeleteMemberForm() {
		return "view/mypage/mypageDeleteMemberForm";
	}
	
	@RequestMapping("/mypageDeleteMember.do")
	public ModelAndView mypageDeleteMemberSubmit(HttpServletRequest req, MemberDTO dto) {
		String memberIdx_s=req.getParameter("memberIdx");
		int memberIdx=Integer.parseInt(memberIdx_s);
		String userPwd_s=req.getParameter("userPwd");
		String userPwd=testMD5(userPwd_s);
		String pwd=req.getParameter("pwd");
		dto.setPwd(pwd);
		dto.setMemberIdx(memberIdx);
		
		int result = memberdao.memberUpdateState(dto);
		ModelAndView mav = new ModelAndView();
		System.out.println("3");
		String msg=null;
		String goUrl=null;
		if(pwd.equals(userPwd)) {
			if(result>0) {
				msg="회원탈퇴를 하였습니다.";
				goUrl="main.do";
				
			}else {
				msg="회원탈퇴 실패하였습니다.";
				goUrl="main.do";	
			}
		}else {
			msg="비밀번호를 다시 입력해주세요.";
			goUrl="mypageDeleteMemberForm.do";
			
		}
		mav.addObject("msg", msg);
		mav.addObject("goUrl", goUrl);
		mav.setViewName("view/mypage/memberMsg");	
		return mav;		
	}
	

	/**마이페이지 예약내역*/
	@RequestMapping("/mypageReservationList.do")
	public String mypageReservationList() {
		return "view/mypage/mypageReservationList";
	}
	
	/**마이페이지 에약취소내역*/
	@RequestMapping("/mypageReservationCancelList.do")
	public String mypageReservationCancelList() {
		return "view/mypage/mypageReservationCancelList";
	}
	
	/**마이페이지 스토어 구매 내역*/
	@RequestMapping("/mypageStoreBuyList.do")
	public String mypageStoreBuyList() {
		return "view/mypage/mypageStoreBuyList";
	}
	
	/**마이페이지 스토어 취소 내역*/
	@RequestMapping("/mypageStoreCancelList.do")
	public String mypageStoreCancelList() {
		return "view/mypage/mypageStoreCancelList";
	}
	
}
