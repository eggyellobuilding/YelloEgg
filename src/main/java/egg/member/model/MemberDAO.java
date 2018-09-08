package egg.member.model;

import java.sql.Date;
import java.util.*;

public interface MemberDAO {

	/**회원가입*/
	public int memberJoin(MemberDTO dto);
	
	/**회원가입시 아이디체크*/
	public int idCheck(String userid);
	
	/**회원가입시 memberIdx가져오기*/
	public int getMemberIdx(String email);
	
	/**회원가입시 보너스로 마일리지 주기*/
	public int mileageAdd(MemberDTO dto);
	
	/**일반회원로그인*/
	public MemberDTO memberLogin(MemberDTO dto);
	
	/**관리자로그인*/
	public MemberDTO adminLogin(MemberDTO dto);
	
	/**아이디찾기*/
	public String memberFindId(String tel, String name, Date birthDate);
	
	/**비밀번호찾기*/
	public String memberFindPwd(String id, String name, String email);
	
	/**비밀번호 변경*/
	public int memberUpdatePwd(MemberDTO dto);
	
	/**회원탈퇴시, 상태와 날짜 변경*/
	public int memberUpdateState(MemberDTO dto);
	
	/**관리자페이지- 회원목록*/
	public List<MemberDTO> adminMemberList(int ls, int cp);
	
	/**총 마일리지*/
	public MemberDTO sumMileage(int memberIdx);
	
	/**멤버 totalCnt가져오기*/
	public int memberTotalCnt();
	
	/**탈퇴된 멤버 totalCnt가져오기*/
	public int deleteMemberTotalCnt();
	
	/**관리자페이지- 탈퇴회원목록*/
	public List<MemberDTO> adminDeleteMemberList(int ls, int cp);
	
	/**관리자페이지 - 30일후 탈퇴회원 정보 완전 삭제*/
	public int afterDaysDeleteMember(MemberDTO dto);
	
	/**회원정보 가져오기*/
	public MemberDTO getMemberImfo(MemberDTO dto);
	
	/**관리자페이지 - 관리자가 회원을 삭제*/
	public int adminDeleteMember(int memberIdx);
	
	/**관리자페이지 - 사원목록*/
	public List<MemberDTO> adminEmployeeList(int ls, int cp);
	
	/**관리자페이지 - 사원삭제*/
	public int adminDeleteEmployee(int adminIdx);
	
	/**관리자페이지 - 사원등록*/
	public int adminRegisterEmployee(MemberDTO dto);
	
	/**비밀번호 변경*/
	public int mypageChangePwd(MemberDTO dto);
	
	/**개인정보수정*/
	public int updateMember(MemberDTO dto);
	
	/**관리자 검색*/
	public int adminCount(int cinemaIdx);
	
	/**관리자table totalCnt가져오기*/
	public int adminTotalCnt();
	
}
