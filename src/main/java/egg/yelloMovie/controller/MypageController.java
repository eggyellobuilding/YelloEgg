package egg.yelloMovie.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import egg.cinema.admin.model.CinemaDAO;
import egg.cinema.admin.model.CinemaDTO;
import egg.member.model.MemberDAO;
import egg.member.model.MemberDTO;
import egg.mypage.model.MypageDAO;
import egg.mypage.model.MypageDTO;

@Controller 
public class MypageController {

	@Autowired
	private MemberDAO memberdao;
	
	@Autowired
	private MypageDAO mypagedao;
	
	@Autowired
	private CinemaDAO cdao;
	
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
	@RequestMapping("/mypageQaboardList.do")
	public ModelAndView mypageQaboardList(@RequestParam(value="cp",defaultValue="1")int cp,
										@RequestParam(value="memberIdx")int memberIdx) {
		int totalCnt=mypagedao.qaboardTotalCnt(memberIdx);
		int listSize=10;
		int pageSize=10;
		List<MypageDTO> lists=mypagedao.mypageQaboardList(listSize, cp, memberIdx);
		String pageStr=egg.commons.PageModule2.makePage("mypageQaboardList.do", totalCnt, listSize, pageSize, cp, memberIdx);
		ModelAndView mav=new ModelAndView();
		mav.addObject("pageStr", pageStr);
		mav.addObject("lists", lists);
		mav.setViewName("view/mypage/mypageQaboardList");
		return mav;
	}
	
	@RequestMapping("/adminQaCinemaFindJquery.do")
	public ModelAndView adminQaCinemaFindJquery() {
		List<CinemaDTO> cityLists =  cdao.theaterCinemaCity();
		ModelAndView mav = new ModelAndView("yongJson");
		mav.addObject("cityLists", cityLists);
		return mav;
	}
	
	//영화관 이름 목록  json
	@RequestMapping(value="/adminQaCinemaNameFindJquery.do",method=RequestMethod.GET)
	public ModelAndView adminScheduleCinemaNameFind(@RequestParam("cinemaCity")String cinemaCity) {
		List<CinemaDTO> nameLists = cdao.theaterCinemaName(cinemaCity);
		ModelAndView mav = new ModelAndView("yongJson");
		mav.addObject("nameLists",nameLists);
		return mav;
	}
	
	/**마이페이지 1:1문의 글 쓰기 폼*/
	@RequestMapping("/mypageQaboardWriteForm.do")
	public String mypageQaboardWriteForm() {
		return "view/mypage/mypageQaboardWriteForm";
	}
	
	/**마이페이지 1:1문의 글 쓰기 submit*/
	@RequestMapping("/mypageQaboardWrite.do")
	public ModelAndView mypageQaboardWriteSubmit(@RequestParam(value="qaCinemaIdx")int qaCinemaIdx,
												@RequestParam(value="memberIdx")int memberIdx,
												@RequestParam(value="qaTitle")String qaTitle,
												@RequestParam(value="qaContent")String qaContent,
												MypageDTO qadto) {
		qadto.setQaCinemaIdx(qaCinemaIdx);
		qadto.setQaMemberIdx(memberIdx);
		qadto.setQaTitle(qaTitle);
		qadto.setQaContent(qaContent);
		int result = mypagedao.mypageQaboardWrite(qadto);
		String msg=result>0?"1:1문의글 작성을 하였습니다.":"1:1문의글 작성을 실패하였습니다.";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("goUrl", "mypageQaboardList.do?memberIdx="+memberIdx);
		mav.setViewName("view/mypage/mypageMsg");
		return mav;
	}
	
	/**마이페이지 회원정보 수정 폼*/
	@RequestMapping("/mypageUpdateMemberForm.do")
	public ModelAndView mypageUpdateMemberForm(MemberDTO dto) {
		MemberDTO dtos=memberdao.getMemberImfo(dto);
		ModelAndView mav = new ModelAndView("view/mypage/mypageUpdateMemberForm","dtos",dtos);
		return mav;
		
	}
	
	/**마이페이지 회원정보 수정submit*/
	@RequestMapping("/mypageUpdateMember.do")
	public ModelAndView mypageUpdateMemberSubmit(@RequestParam(value="memberIdx")int memberIdx,
												@RequestParam(value="tel")String tel,
												@RequestParam(value="email")String email,
												MemberDTO dto) {
		
		dto.setMemberIdx(memberIdx);
		dto.setEmail(email);
		dto.setTel(tel);
		ModelAndView mav = new ModelAndView();
		int result=memberdao.updateMember(dto);
		String msg=result>0?"회원정보 수정하였습니다.":"회원정보 수정 실패하였습니다.";
		mav.addObject("msg",msg);
		mav.addObject("goUrl", "mypageForm.do");
		mav.setViewName("view/mypage/mypageMsg");
		return mav;
	}
	/**마이페이지 비밀번호 변경 폼*/
	@RequestMapping("mypageChangePwdForm.do")
	public String mypageChangePwdForm() {
		return "view/mypage/mypageChangePwdForm";
	}
	
	/**마이페이지 비밀번호 변경 submit*/
	@RequestMapping("/mypageChangePwd.do")
	public ModelAndView mypageChangePwdSubmit(MemberDTO dto,
											@RequestParam(value="memberIdx")int memberIdx,
											@RequestParam(value="nowPwd")String nowPwd_s,
											@RequestParam(value="newPwd")String newPwd_s,
											@RequestParam(value="pwd")String pwd) {
		String nowPwd=testMD5(nowPwd_s);
		String newPwd=testMD5(newPwd_s);
		dto.setPwd(pwd);

		ModelAndView mav = new ModelAndView();
		
		String msg=null;
		String goUrl=null;
		
		if(dto.getPwd().equals(nowPwd)) {
			
			dto.setPwd(newPwd);
			int result=memberdao.mypageChangePwd(dto);
			if(result>0) {
				msg="비밀번호 변경을 성공하였습니다.";
				goUrl="mypageForm.do";
			}else {
				msg="비밀번호 변경을 실패하였습니다.";
				goUrl="mypageForm.do";
			}

		}else {
			msg="비밀번호를 다시 입력하세요.";
			goUrl="mypageChangePwdForm.do";
		}
		mav.addObject("msg", msg);
		mav.addObject("goUrl", goUrl);
		mav.setViewName("view/mypage/mypageMsg");
		return mav;
	}
	
	/**마이페이지 회원탈퇴  폼*/
	@RequestMapping("/mypageDeleteMemberForm.do")
	public String mypageDeleteMemberForm() {
		return "view/mypage/mypageDeleteMemberForm";
	}
	
	@RequestMapping("/mypageDeleteMember.do")
	public ModelAndView mypageDeleteMemberSubmit(HttpServletRequest req, 
												MemberDTO dto,
												HttpSession session) {
		String memberIdx_s=req.getParameter("memberIdx");
		int memberIdx=Integer.parseInt(memberIdx_s);
		String userPwd_s=req.getParameter("userPwd");
		String userPwd=testMD5(userPwd_s);
		String pwd=req.getParameter("pwd");
		dto.setPwd(pwd);
		dto.setMemberIdx(memberIdx);
		
		int result = memberdao.memberUpdateState(dto);
		ModelAndView mav = new ModelAndView();
		String msg=null;
		String goUrl=null;
		if(pwd.equals(userPwd)) {
			if(result>0) {
				msg="회원탈퇴를 하였습니다.";
				session.invalidate();
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
		mav.setViewName("view/mypage/mypageMsg");	
		return mav;		
	}
	

	/**마이페이지 예약내역*/
	@RequestMapping("/mypageReservationList.do")
	public ModelAndView mypageReservationList(@RequestParam(value="cp",defaultValue="1")int cp,
											@RequestParam(value="memberIdx")int memberIdx) {
		int totalCnt=mypagedao.reservationTotalCnt(memberIdx);
		int listSize=10;
		int pageSize=10;
		List<MypageDTO> lists=mypagedao.mypageReservationList(listSize, cp, memberIdx);
		String pageStr=egg.commons.PageModule2.makePage("mypageReservationList.do", totalCnt, listSize, pageSize, cp, memberIdx);
		ModelAndView mav=new ModelAndView();
		mav.addObject("pageStr", pageStr);
		mav.addObject("lists", lists);
		mav.setViewName("view/mypage/mypageReservationList");
		return mav;
		
	}
	
	/**예매 취소*/
	@RequestMapping("/mypageCancelReservation.do")
	public ModelAndView mypageCancelRservation(@RequestParam(value="reservationIdx")int reservationIdx,
												HttpServletRequest req,
												MypageDTO mpdto) {

		String memberIdx_s=req.getParameter("memberIdx");
		int memberIdx=Integer.parseInt(memberIdx_s);
		int reservationMileage = mypagedao.getUseReservationMileage(reservationIdx);
		mpdto.setMileageMemberIdx(memberIdx);
		mpdto.setMileagePrice(reservationMileage);		
		ModelAndView mav = new ModelAndView();
		int result=mypagedao.mypageUdpateReservationState(reservationIdx);
		int result_s=mypagedao.mypageCancelReservation(reservationIdx);
		int result_t=mypagedao.refundReservationMileage(mpdto);
		String msg=null;
		if(result>0) {
			if(result_s>0) {
				if(result_t>0) {
					if(reservationMileage==0) {
						msg="예매를 취소하였습니다.";
					}else {
						msg="예매를 취소하였습니다."+reservationMileage+"P를 반환해드렸습니다.";
					}
				}else {
					msg="마일리지 반환을 실패하였습니다.";
				}
			}else {
				msg="예매취소날짜 입력을 실패하였습니다.";
			}
		}else {
			msg="예매취소에 실패하였습니다.";
		}
		mav.addObject("msg", msg);
		mav.addObject("goUrl", "mypageReservationList.do?memberIdx="+memberIdx);
		mav.setViewName("view/mypage/mypageMsg");
		return mav;
	}
	
	
	/**마이페이지 에약취소내역*/
	@RequestMapping("/mypageReservationCancelList.do")
	public ModelAndView mypageReservationCancelList(@RequestParam(value="cp",defaultValue="1")int cp,
													@RequestParam(value="memberIdx")int memberIdx) {
		int totalCnt=mypagedao.reservationCancelTotalCnt(memberIdx);
		int listSize=10;
		int pageSize=10;
		List<MypageDTO> lists=mypagedao.mypageReservationCancelList(listSize, cp, memberIdx);
		String pageStr=egg.commons.PageModule2.makePage("mypageReservationCancelList.do", totalCnt, listSize, pageSize, cp, memberIdx);
						
		ModelAndView mav=new ModelAndView();
		mav.addObject("pageStr", pageStr);
		mav.addObject("lists", lists);
		mav.setViewName("view/mypage/mypageReservationCancelList");
		return mav;

	}
	
	/**마이페이지 스토어 구매 내역*/
	@RequestMapping("/mypageStoreBuyList.do")
	public ModelAndView mypageStoreBuyList(@RequestParam(value="cp",defaultValue="1")int cp,
											@RequestParam(value="memberIdx")int memberIdx) {
		
		int totalCnt=mypagedao.storeBuyTotalCnt(memberIdx);
		int listSize=10;
		int pageSize=10;
		List<MypageDTO> lists=mypagedao.mypageStoreBuyList(listSize, cp, memberIdx);
		String pageStr=egg.commons.PageModule2.makePage("mypageStoreBuyList.do", totalCnt, listSize, pageSize, cp, memberIdx);
		ModelAndView mav=new ModelAndView();
		mav.addObject("pageStr", pageStr);
		mav.addObject("lists", lists);
		mav.setViewName("view/mypage/mypageStoreBuyList");
		return mav;
	}
	
	
	@RequestMapping("/mypageCancelStoreBuy.do")
	public ModelAndView mypageCancelStoreBuy(HttpServletRequest req,
											MypageDTO mpdto) {
		String storePayIdx_s=req.getParameter("storePayIdx");
		int storePayIdx=Integer.parseInt(storePayIdx_s);
		String memberIdx_s=req.getParameter("memberIdx");
		int memberIdx=Integer.parseInt(memberIdx_s);
		int storePayMileage=mypagedao.getUseStoreMileage(storePayIdx);
		mpdto.setMileagePrice(storePayMileage);
		mpdto.setMileageMemberIdx(memberIdx);
		ModelAndView mav = new ModelAndView();
		int result=mypagedao.mypageUdpateStoreState(storePayIdx);
		int result_s=mypagedao.mypageCancelStoreBuy(storePayIdx);
		int result_t=mypagedao.refundStoreMileage(mpdto);
		String msg=null;
		if(result>0) {
			if(result_s>0) {
				if(result_t>0) {
					if(storePayMileage==0) {
						msg="구매를 취소하였습니다.";
					}else {
						msg="구매를 취소하였습니다."+storePayMileage+"P를 반환해 드렸습니다.";
					}
				}else {
					msg="마일리지 반환을 실패하였습니다.";
				}
			}else {
				msg="취소날짜입력을 실패하였습니다.";
			}
		}else {
			msg="구매취소에 실패하였습니다.";
		}
		mav.addObject("msg", msg);
		mav.addObject("goUrl", "mypageStoreBuyList.do?memberIdx="+memberIdx);
		mav.setViewName("view/mypage/mypageMsg");
		return mav;
	}
	/**마이페이지 스토어 취소 내역*/
	@RequestMapping("/mypageStoreCancelList.do")
	public ModelAndView mypageStoreCancelList(@RequestParam(value="cp",defaultValue="1")int cp,
												@RequestParam(value="memberIdx")int memberIdx) {
		
		int totalCnt=mypagedao.storeCancelTotalCnt(memberIdx);
		int listSize=10;
		int pageSize=10;
		List<MypageDTO> lists=mypagedao.mypageStoreCancelList(listSize, cp, memberIdx);
		String pageStr=egg.commons.PageModule2.makePage("mypageStoreCancelList.do", totalCnt, listSize, pageSize, cp, memberIdx);
		ModelAndView mav=new ModelAndView();
		mav.addObject("pageStr", pageStr);
		mav.addObject("lists", lists);
		mav.setViewName("view/mypage/mypageStoreCancelList");
		return mav;
	}
	
}
