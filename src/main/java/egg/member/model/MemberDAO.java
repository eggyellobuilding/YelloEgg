package egg.member.model;

import java.sql.Date;
import java.util.*;

public interface MemberDAO {

	public int memberJoin(MemberDTO dto);
	
	public int idCheck(String userid);
	
	public MemberDTO memberLogin(MemberDTO dto);
	
	public MemberDTO adminLogin(MemberDTO dto);
	
	public String memberFindId(String tel, String name, Date birthDate);
	
	public String memberFindPwd(String id, String name, String email);
	
	public int memberUpdatePwd(MemberDTO dto);
	
	public int memberUpdateState(MemberDTO dto);
	
	public List<MemberDTO> adminMemberList(int ls, int cp);
	
	public MemberDTO sumMileage(int memberIdx);
	
	public int getTotalCnt();
	
	public List<MemberDTO> adminDeleteMemberList(int ls, int cp);
	
	public int afterDaysDeleteMember(MemberDTO dto);
	
	public MemberDTO getMemberImfo(MemberDTO dto);
	
	public int adminDeleteMember(int memberIdx);
	
	public List<MemberDTO> adminEmployeeList(int ls, int cp);
	
	public int adminDeleteEmployee(int adminIdx);
	
	public int adminIdCheck(String adminId);
	
	public int adminRegisterEmployee(MemberDTO dto);
	
	public int mypageChangePwd(MemberDTO dto);
	
	public int updateMember(MemberDTO dto);
	
	public int adminCount(int cinemaIdx);

	public int adminTotalCnt();
	
}
