package egg.member.model;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class MemberDAOImple implements MemberDAO {

	private SqlSessionTemplate sqlMap;
		
	public MemberDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	/**회원가입*/
	public int memberJoin(MemberDTO dto) {
		int count =sqlMap.insert("memberJoin", dto);
		return count;
	}

	/**아이디중복*/
	public int idCheck(String userid) {
		int count = sqlMap.selectOne("idCheck", userid);
		return count;
	}

	/**로그인*/
	public MemberDTO memberLogin(MemberDTO dto) {
		MemberDTO dto_member=sqlMap.selectOne("memberLogin", dto);
		return dto_member;
	}
	
	/**관리자 로그인*/
	public MemberDTO adminLogin(MemberDTO dto) {
		MemberDTO dto_admin=sqlMap.selectOne("adminLogin", dto);
		return dto_admin;
	}
	
	/**회원탈퇴시 상태와 날짜 업데이트*/
	public int memberUpdateState(MemberDTO dto) {
		int count = sqlMap.update("memberUpdateState", dto);
		return count;
	}
	
	/**회원목록*/
	public List<MemberDTO> adminMemberList() {
		List<MemberDTO> lists=sqlMap.selectList("adminMemberList");
		return lists;
	}
	
	/**탈퇴회원목록*/
	public List<MemberDTO> adminDeleteMemberList() {
		List<MemberDTO> lists=sqlMap.selectList("adminDeleteMemberList");
		return lists;
	}
	
	/**30일뒤 회원정보 완전삭제*/
	public int afterDaysDeleteMember(MemberDTO dto) {
		int count =sqlMap.delete("afterDaysDeleteMember", dto);
		return count;
	}
	
	/**회원정보가져오기*/
	public MemberDTO getMemberImfo(MemberDTO dto) {
		MemberDTO dtos=sqlMap.selectOne("getMemberImfo", dto);
		return dtos;
	}
	
	/**회원정보수정*/
	public int adminUpdateMember(MemberDTO dto) {
		int count = sqlMap.update("adminUpdateMember", dto);
		return count;
	}
	
	/**회원삭제*/
	public int adminDeleteMember(int memberIdx) {
		int count = sqlMap.delete("adminDeleteMember", memberIdx);
		return count;
	}
}
