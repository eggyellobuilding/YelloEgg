package egg.member.model;

public interface MemberDAO {

	public int memberJoin(MemberDTO dto);
	
	public int idCheck(String userid);
	
	public MemberDTO memberLogin(MemberDTO dto);
}
