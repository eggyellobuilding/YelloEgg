package egg.yelloMovie.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.util.Calendar;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import egg.member.model.MemberDAO;
import egg.member.model.MemberDTO;

@Controller
public class MemberController {

	@Autowired
	private MemberDAO memberdao;
	
	private JavaMailSender mailSender;
	
  	
	public int getRandom(){
	  int random= 0;
	  random =(int)Math.floor((Math.random()*(99999-10000+1)))+10000;
	  return random;
  	}
	
  	
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
  	
	@RequestMapping("/memberJoinForm.do")
	public ModelAndView memberJoinForm() {
		int random=getRandom();
		ModelAndView mav=new ModelAndView();
		mav.addObject("random", random);
		mav.setViewName("view/member/memberJoinForm");
		return mav;
		
	}
	
	@RequestMapping("/memberJoin.do")
	public ModelAndView memberJoinSubmit(HttpServletRequest req, 
			@RequestParam(value="id")String id,
			@RequestParam(value="name")String name,
			@RequestParam(value="gender")String gender,
			@RequestParam(value="email")String email,
			MemberDTO dto) {
		
		String tel1 = req.getParameter("tel1");
		String tel2 = req.getParameter("tel2");
		String tel3 = req.getParameter("tel3");
		String year = req.getParameter("year");
		String month = req.getParameter("month");
		String date = req.getParameter("date");
		String pwd_s = req.getParameter("pwd");
		String tel=tel1+"-"+tel2+"-"+tel3;
		String birthDate=year+"-"+month+"-"+date;
		Date temp = Date.valueOf(birthDate);
		String pwd = testMD5(pwd_s);
		dto.setTel(tel);
		dto.setBirthDate(temp);
		dto.setPwd(pwd);
		dto.setId(id);
		dto.setName(name);
		dto.setGender(gender);
		dto.setEmail(email);
		
		ModelAndView mav= new ModelAndView();
		int result = memberdao.memberJoin(dto);
		String msg = result>0?"회원가입을 하였습니다.":"회원가입에 실패하였습니다.";
		mav.addObject("msg", msg);
		mav.addObject("goUrl", "main.do");
		mav.setViewName("view/member/memberMsg");
		return mav;
	}
	@RequestMapping("/sendCodeCheck.do")
	public ModelAndView sendCodeCheckSubmit(HttpServletRequest request){
		
		ModelAndView mav=new ModelAndView();
		String setfrom="tjazmswk89@gmail.com";		
		String tomail=request.getParameter("email");
		String title="비밀번호인증";
		String code=request.getParameter("code");
		System.out.println(code);
		System.out.println(tomail);
		String codeMsg="인증번호["+code+"]";
		mav.addObject("code", code);
		mav.setViewName("view/member/sendCodeCheck");
		
		try{
			MimeMessage message =mailSender.createMimeMessage();
			MimeMessageHelper messageHelper 
				= new MimeMessageHelper(message,true,"UTF-8");
			messageHelper.setFrom(setfrom);	
			messageHelper.setTo(tomail);	
			messageHelper.setSubject(title);
			messageHelper.setText(codeMsg); 
			mailSender.send(message);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return mav; 
	}

	@RequestMapping("/memberIdCheck.do")
	public ModelAndView memberIdCheckSubmit(HttpServletRequest req) {
		String userId=req.getParameter("id");
		int result = memberdao.idCheck(userId);
		String msg=null;
		if(result>0) {
			msg=userId+"는 중복된 아이디 입니다.";
		}else {
			msg=userId+"는 사용가능한 아이디 입니다.";
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("view/member/idCheckMsg");
		return mav;
	}
	@RequestMapping("/memberLoginForm.do")
	public String memberLoginForm() {
		return "view/member/memberLoginForm";
	}
	
	@RequestMapping("/memberLogin.do")
	public ModelAndView  memberLogin(MemberDTO dto,
			HttpSession session, HttpServletResponse resp,
			@RequestParam(value="id")String userid,
			@RequestParam(value="pwd")String userpwd_s,
			@RequestParam(value="rememberid",required=false)String rememberid) {

		Calendar now = Calendar.getInstance();
		int y = now.get(Calendar.YEAR);
		int m = now.get(Calendar.MONTH)+1;
		int d = now.get(Calendar.DATE);
		int h = now.get(Calendar.HOUR);
		int min = now.get(Calendar.MINUTE);
		int sec = now.get(Calendar.SECOND);
		String today = "Last Login:"+y+"-"+m+"-"+d+" "+h+":"+min+":"+sec;
	
		String userpwd=testMD5(userpwd_s);
		dto.setId(userid);
		dto.setPwd(userpwd);
		
		MemberDTO dto_s=memberdao.memberLogin(dto);
		ModelAndView mav=new ModelAndView();
		
		if(!(dto_s.getId().equals(userid))||!(dto_s.getPwd().equals(userpwd))) {
			mav.addObject("msg", "아이디 혹은 패스워드가 맞지않습니다.");
			mav.addObject("goUrl", "main.do");
			mav.setViewName("view/member/memberMsg");
			
		}else if(dto_s.getId().equals(userid)&&dto_s.getPwd().equals(userpwd)) {
			
			session.setAttribute("dto", dto);
			
			if(rememberid==null||rememberid.equals("")) {
				
				Cookie ck=new Cookie("rememberid", userid);
				ck.setMaxAge(0);
				resp.addCookie(ck);
				
			}else {
								
				Cookie ck=new Cookie("rememberid", userid);
				ck.setMaxAge(60*60*24*30);
				resp.addCookie(ck);
				Cookie ck1=new Cookie("lastday", today);
				ck1.setMaxAge(60*60*24*30);
				resp.addCookie(ck1);
			}
	
			
			mav.addObject("msg", dto.getId()+"님, 환영합니다!");
			mav.addObject("goUrl", "main.do");
			mav.setViewName("view/member/memberMsg");
		}
		
		return mav;
	}
	
	@RequestMapping("memberLoginState.do")
	public String memberLoginState() {
		return "view/member/memberLoginState";
	}
	
	@RequestMapping("/memberLogout.do")
	public String memberLogout(HttpSession session,
			Model model) {
		session.invalidate();
		model.addAttribute("msg", "로그아웃하였습니다.");
		model.addAttribute("goUrl", "main.do");
		return "view/member/memberMsg";
	}
	@RequestMapping("/memberFindForm.do")
	public String memberFindForm() {
		return "view/member/memberFindForm";
	}
	
	
}
