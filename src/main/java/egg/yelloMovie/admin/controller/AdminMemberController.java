package egg.yelloMovie.admin.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import egg.member.model.*;

@Controller
public class AdminMemberController { 
 
	@Autowired
	private MemberDAO  memberdao;

	/**회원목록*/
	@RequestMapping("/adminMemberList.do")
	public ModelAndView adminMemberList(@RequestParam(value="cp",defaultValue="1")int cp) {
		int totalCnt=memberdao.memberTotalCnt();
		int listSize=10;
		int pageSize=10;
		List<MemberDTO> lists=memberdao.adminMemberList(listSize, cp);
		String pageStr=egg.commons.PageModule.makePage("adminMemberList.do", totalCnt, listSize, pageSize, cp);
		ModelAndView mav=new ModelAndView();
		mav.addObject("pageStr", pageStr);
		mav.addObject("lists", lists);
		mav.setViewName("admin/member/adminMemberList");
		return mav;
	}
	
	/**회원정보수정 폼*/
	@RequestMapping("/adminUpdateMemberForm.do")
	public ModelAndView adminUpdateMemberForm(MemberDTO dto) {
		MemberDTO dtos=memberdao.getMemberImfo(dto);
		ModelAndView mav = new ModelAndView("admin/member/adminUpdateMemberForm","dtos",dtos);
		return mav;
	}
	
	/**회원수정 submit*/
	@RequestMapping("/adminUpdateMember.do")
	public ModelAndView adminUpdateMemberSubmit(@RequestParam(value="email")String email,
												@RequestParam(value="tel")String tel,
												@RequestParam(value="memberIdx",required=false)int memberIdx,		
												MemberDTO dto) {
		dto.setMemberIdx(memberIdx);
		dto.setEmail(email);
		dto.setTel(tel);
		
		int result =memberdao.updateMember(dto);
		String msg =result>0?"회원정보를 수정하였습니다.":"회원정보 수정에 실패하였습니다.";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("goUrl","adminMemberList.do");
		mav.setViewName("admin/member/adminMemberMsg");
		return mav;
	}
	
	/**탈퇴회원 목록*/
	@RequestMapping("/adminDeleteMemberList.do")
	public ModelAndView adminDeleteMemberList(@RequestParam(value="cp",defaultValue="1")int cp) {
		int totalCnt=memberdao.deleteMemberTotalCnt();
		int listSize=10;
		int pageSize=10;
		
		List<MemberDTO> lists=memberdao.adminDeleteMemberList(listSize, cp);
		String pageStr=egg.commons.PageModule.makePage("adminDeleteMemberList.do", totalCnt, listSize, pageSize, cp);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("pageStr", pageStr);
		mav.addObject("lists", lists);
		mav.setViewName("admin/member/adminDeleteMemberList");
		return mav;
	}
	
	/**30일후 회원삭제*/
	@RequestMapping("/afterDaysDeleteMember.do")
	public ModelAndView afterDaysDeleteMemberSubmit(MemberDTO dto) {
		ModelAndView mav = new ModelAndView();
		int result =memberdao.afterDaysDeleteMember(dto);
		String msg=null;
		String goUrl=null;
		if(result>0) {
			msg="30이 지난 회원만 삭제하였습니다.";
			goUrl="admin.do";
		}else {
			msg="30일이 지나지 않아 삭제할 수 없습니다.(30일까지 회원정보를 보유)";
			goUrl="adminDeleteMemberList.do";
		}
		
		mav.addObject("msg", msg);
		mav.addObject("goUrl", goUrl);
		mav.setViewName("admin/member/adminMemberMsg");
		return mav;
	}
	
	/**관리자가 회원을 삭제*/
	@RequestMapping("/adminDeleteMember.do")
	public ModelAndView adminDeleteMemberSubmit(HttpServletRequest req) {
		String memberIdx_s=req.getParameter("memberIdx");
		int memberIdx=Integer.parseInt(memberIdx_s);
		int result = memberdao.adminDeleteMember(memberIdx);
		String msg=result>0?"회원을 삭제하였습니다.":"회원삭제를 실패하였습니다.";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("goUrl", "adminMemberList.do");
		mav.setViewName("admin/member/adminMemberMsg");
		return mav;
				
	}
	
}
