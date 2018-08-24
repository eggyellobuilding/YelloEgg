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
	public ModelAndView adminMemberList() {
		List<MemberDTO> lists=memberdao.adminMemberList();
		ModelAndView mav=new ModelAndView("admin/member/adminMemberList","lists",lists);
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
	public ModelAndView adminUpdateMemberSubmit(HttpServletRequest req, MemberDTO dto) {
		String memberIdx_s=req.getParameter("memberIdx");
		int memberIdx=Integer.parseInt(memberIdx_s);
		dto.setMemberIdx(memberIdx);
		String email=req.getParameter("email");
		String tel=req.getParameter("tel");
		dto.setEmail(email);
		dto.setTel(tel);
		
		int result =memberdao.adminUpdateMember(dto);
		String msg =result>0?"회원정보를 수정하였습니다.":"회원정보 수정에 실패하였습니다.";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("goUrl","adminMemberList.do");
		mav.setViewName("admin/member/adminMemberMsg");
		return mav;
	}
	
	/**탈퇴회원 목록*/
	@RequestMapping("/adminDeleteMemberList.do")
	public ModelAndView adminDeleteMemberList() {
		List<MemberDTO> lists=memberdao.adminDeleteMemberList();
		ModelAndView mav=new ModelAndView("admin/member/adminDeleteMemberList","lists", lists);
		
		return mav;
	}
	
	@RequestMapping("/afterDaysDeleteMember.do")
	public ModelAndView afterDaysDeleteMemberSubmit(MemberDTO dto) {
		ModelAndView mav = new ModelAndView();
		int result =memberdao.afterDaysDeleteMember(dto);
		String msg= result>0?"모든 회원정보를 삭제하였습니다.":"회원정보 삭제에 실패하였습니다.";
		mav.addObject("msg", msg);
		mav.addObject("goUrl", "admin.do");
		mav.setViewName("admin/member/adminMemberMsg");
		return mav;
	}
	
	@RequestMapping("/adminDeleteMember.do")
	public ModelAndView adminDeleteMemberSubmit(@RequestParam(value="memberIdx")int memberIdx) {
		int result = memberdao.adminDeleteMember(memberIdx);
		String msg=result>0?"회원을 삭제하였습니다.":"회원삭제를 실패하였습니다.";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("goUrl", "adminMemberList.do");
		mav.setViewName("admin/member/adminMemberMsg");
		return mav;
				
	}
	
}
