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
	
	@Autowired
	private JavaMailSender mailSender;
	
  	
	/**인증번호 난수 발생 메서드*/
	public int getRandom(){
	  int random= 0;
	  random =(int)Math.floor((Math.random()*(99999-10000+1)))+10000;
	  return random;
  	}
	
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
  	
  	/**회원가입 이용약관*/
  	@RequestMapping("/memberAgreeForm.do")
  	public String memberAgreeForm() {
  		return "view/member/memberAgreeForm";
  		
  	}
  	
  	/**회원가입 폼*/
	@RequestMapping("/memberJoinForm.do")
	public ModelAndView memberJoinForm() {
		int random=getRandom();
		ModelAndView mav=new ModelAndView();
		mav.addObject("random", random);
		mav.setViewName("view/member/memberJoinForm");
		return mav;
		
	}
	/**회원가입 submit*/
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
		System.out.println(temp);
		dto.setTel(tel);
		dto.setBirthDate(temp);
		System.out.println(dto.getBirthDate());
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
	
	/**인증코드 이메일로 전송*/
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
	
	/**아이디 중복 체크*/
	@RequestMapping("/memberIdCheck.do")
	public ModelAndView memberIdCheckSubmit(HttpServletRequest req) {
		String userId=req.getParameter("id");
		String userIdStr=userId.substring(0, 5);
		ModelAndView mav = new ModelAndView();
		String msg=null;
		int result = memberdao.idCheck(userId);
		
		if(userIdStr.equals("admin") || userIdStr.equals("master")) {
			msg=userIdStr+"이 들어간 아이디는 사용할 수 없습니다.";
		}else{
			if(result>0) {
				msg=userId+"는 중복된 아이디 입니다.";
			}else {
				msg=userId+"는 사용가능한 아이디 입니다.";
			}
			
		}
		mav.addObject("msg", msg);
		mav.setViewName("view/member/idCheckMsg");
		return mav;
	}
	
	/**로그인 폼*/
	@RequestMapping("/memberLoginForm.do")
	public String memberLoginForm() {
		return "view/member/memberLoginForm";
	}
	
	/**로그인 submit*/
	@RequestMapping("/memberLogin.do")
	public ModelAndView  memberLogin(MemberDTO dto,
			HttpSession session, HttpServletResponse resp,
			@RequestParam(value="id")String id,
			@RequestParam(value="pwd")String pwd_s,
			@RequestParam(value="rememberId",required=false)String rememberId) {

		/**로그인 시간 가져오기*/
		Calendar now = Calendar.getInstance();
		int y = now.get(Calendar.YEAR);
		int m = now.get(Calendar.MONTH)+1;
		int d = now.get(Calendar.DATE);
		int h = now.get(Calendar.HOUR);
		int min = now.get(Calendar.MINUTE);
		int sec = now.get(Calendar.SECOND);
		String today = "Last Login:"+y+"-"+m+"-"+d+" "+h+":"+min+":"+sec;
		
		
		ModelAndView mav=new ModelAndView();
		String adminId=id.substring(0, 5);
		
		if(id.equals("master") || adminId.equals("admin")) {
			dto.setAdminId(id);
			dto.setAdminPwd(pwd_s);
			MemberDTO dto_admin=memberdao.adminLogin(dto);
			
			if(!(dto_admin.getAdminId().equals(id))||!(dto_admin.getAdminPwd().equals(pwd_s))) {
				mav.addObject("msg", "아이디 혹은 패스워드가 맞지않습니다.");
				mav.addObject("goUrl", "main.do");
				mav.setViewName("view/member/memberMsg");
				
			}else if(dto_admin.getAdminId().equals(id)&&dto_admin.getAdminPwd().equals(pwd_s)) {
				
				session.setAttribute("addto", dto_admin);
		
				mav.addObject("addto", dto_admin);
				mav.addObject("msg", dto_admin.getAdminId()+"님, 환영합니다!");
				mav.addObject("goUrl", "admin.do");
				mav.setViewName("view/member/memberMsg");
			}
			
		}else {

			String userPwd=testMD5(pwd_s);
			dto.setId(id);
			dto.setPwd(userPwd);
			
			MemberDTO dto_member=memberdao.memberLogin(dto);
			
			if(!(dto_member.getId().equals(id))||!(dto_member.getPwd().equals(userPwd))) {
				mav.addObject("msg", "아이디 혹은 패스워드가 맞지않습니다.");
				mav.addObject("goUrl", "main.do");
				mav.setViewName("view/member/memberMsg");
				
			}else if(dto_member.getId().equals(id)&&dto_member.getPwd().equals(userPwd)) {
				
				session.setAttribute("mdto", dto_member);
				Cookie ck1=new Cookie("lastday", today);
				ck1.setMaxAge(60*60*24*30);
				resp.addCookie(ck1);
				
				if(rememberId==null||rememberId.equals("")) {
					
					Cookie ck=new Cookie("rememberId", id);
					ck.setMaxAge(0);
					resp.addCookie(ck);
					
				}else {
									
					Cookie ck=new Cookie("rememberId", id);
					ck.setMaxAge(60*60*24*30);
					resp.addCookie(ck);
				}
		
				mav.addObject("mdto", dto_member);
				mav.addObject("msg", dto_member.getId()+"님, 환영합니다!");
				mav.addObject("goUrl", "main.do");
				mav.setViewName("view/member/memberMsg");
			}
			
		}		
		
		return mav;
	}
	
	/**로그인 후 화면 폼*/
	@RequestMapping("memberLoginState.do")
	public ModelAndView memberLoginState() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("view/member/memberLoginState");
		return mav;
	}
	
	/**로그아웃*/
	@RequestMapping("/memberLogout.do")
	public String memberLogout(HttpSession session,
			Model model) {
		session.invalidate();
		model.addAttribute("msg", "로그아웃하였습니다.");
		model.addAttribute("goUrl", "main.do");
		return "view/member/memberMsg";
	}
	
	/**아이디/패스워드 찾기*/
	@RequestMapping("/memberFindForm.do")
	public String memberFindForm() {
		return "view/member/memberFindForm";
	}
	
	
}
