package egg.member.model;


import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	/**ID 찾기*/
	public String memberFindId(String tel, String name, Date birthDate) {
		Map map=new HashMap();
		map.put("tel", tel);
		map.put("name", name);
		map.put("birthDate", birthDate);

		String findId=(String)sqlMap.selectOne("memberFindId", map);
		return findId;
	}

	/**비밀번호 찾기*/
	public String memberFindPwd(String id, String name, String email) {
		Map map=new HashMap();
		map.put("id", id);
		map.put("name", name);
		map.put("email", email);
		System.out.println("2");
		String findPwd=(String)sqlMap.selectOne("memberFindPwd", map);
		return findPwd;	
	}
	
	/**비밀번호 찾은 후 업데이트*/
	public int memberUpdatePwd(MemberDTO dto) {
		int count =sqlMap.update("memberUpdatePwd", dto);
		return count;
	}
	
	/**회원탈퇴시 상태와 날짜 업데이트*/
	public int memberUpdateState(MemberDTO dto) {
		int count = sqlMap.update("memberUpdateState", dto);
		return count;
	}
	/**totalcnt 가져오기*/
	public int getTotalCnt() {
		int result=sqlMap.selectOne("totalCnt");
		return result;
	}
	
	/**회원목록*/
	public List<MemberDTO> adminMemberList(int ls, int cp) {
		Map data=new HashMap();
		int startnum=(cp-1)*ls+1;
		int endnum=cp*ls;
		data.put("startnum", startnum);
		data.put("endnum", endnum);
		List<MemberDTO> lists=sqlMap.selectList("adminMemberList",data);
		return lists;
	}
	
	/**회원의 총마일리지*/
	public MemberDTO sumMileage(int memberIdx) {
		MemberDTO dtos=sqlMap.selectOne("sumMileage", memberIdx);
		return dtos;
	}
	
	/**탈퇴회원목록*/
	public List<MemberDTO> adminDeleteMemberList(int ls, int cp) {
		Map data=new HashMap();
		int startnum=(cp-1)*ls+1;
		int endnum=cp*ls;
		data.put("startnum", startnum);
		data.put("endnum", endnum);
		List<MemberDTO> lists=sqlMap.selectList("adminDeleteMemberList",data);
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
	
	/**회원삭제*/
	public int adminDeleteMember(int memberIdx) {
		int count = sqlMap.delete("adminDeleteMember", memberIdx);
		return count;
	}
	
	/**관리자 사원목록*/
	public List<MemberDTO> adminEmployeeList(int ls, int cp) {
		Map data=new HashMap();
		int startnum=(cp-1)*ls+1;
		int endnum=cp*ls;
		data.put("startnum", startnum);
		data.put("endnum", endnum);
		List<MemberDTO> lists=sqlMap.selectList("adminEmployeeList",data);
		return lists;
	}
		
	/**사원삭제*/
	public int adminDeleteEmployee(int adminIdx) {
		int count =sqlMap.delete("adminDeleteEmployee", adminIdx);
		return count;
	}
	
	/**관리자 아이디 중복확인*/
	public int adminIdCheck(String adminId) {
		int count = sqlMap.selectOne("adminIdCheck", adminId);
		return count;
	}
	
	/**사원 등록*/
	public int adminRegisterEmployee(MemberDTO dto) {
		int count = sqlMap.insert("adminRegisterEmployee", dto);
		return count;
	}
	
	/**비밀번호변경*/
	public int mypageChangePwd(MemberDTO dto) {
		int count = sqlMap.update("mypageChangePwd", dto);
		return count;
	}
	
	/**회원정보 수정*/
	public int updateMember(MemberDTO dto) {
		int count = sqlMap.update("mypageUpdateMember", dto);
		return count;
	}
	/**어드민 검색 jquery*/
	public int adminCount(int cinemaIdx) {
		int result = sqlMap.selectOne("adminCount",cinemaIdx);
		return result;
	}
	
	/**admintotalcnt 가져오기*/
	public int adminTotalCnt() {
		int result=sqlMap.selectOne("adminTotalCnt");
		System.out.println(result);
		return result;
	}
}
