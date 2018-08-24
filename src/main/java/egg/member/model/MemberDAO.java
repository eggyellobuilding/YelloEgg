package egg.member.model;

import java.util.*;

public interface MemberDAO {

	public int memberJoin(MemberDTO dto);
	
	public int idCheck(String userid);
	
	public MemberDTO memberLogin(MemberDTO dto);
	
	public MemberDTO adminLogin(MemberDTO dto);
	
	public int memberUpdateState(MemberDTO dto);
	
	public List<MemberDTO> adminMemberList();
	
	public List<MemberDTO> adminDeleteMemberList();
	
	public int afterDaysDeleteMember(MemberDTO dto);
	
	public MemberDTO getMemberImfo(MemberDTO dto);
	
	public int adminUpdateMember(MemberDTO dto);
	
	public int adminDeleteMember(int memberIdx);
}
