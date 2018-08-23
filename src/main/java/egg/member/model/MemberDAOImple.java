package egg.member.model;


import org.mybatis.spring.SqlSessionTemplate;

public class MemberDAOImple implements MemberDAO {

	private SqlSessionTemplate sqlMap;
		
	public MemberDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public int memberJoin(MemberDTO dto) {
		System.out.println(dto.getId());
		System.out.println(dto.getPwd());
		System.out.println(dto.getName());
		System.out.println(dto.getTel());
		System.out.println(dto.getBirthDate());
		System.out.println(dto.getEmail());
		System.out.println(dto.getGender());
		int count =sqlMap.insert("memberJoin", dto);
		return count;
	}

	public int idCheck(String userid) {
		int count = sqlMap.selectOne("idCheck", userid);
		return count;
	}

	public MemberDTO memberLogin(MemberDTO dto) {
		MemberDTO dto_s=sqlMap.selectOne("memberLogin", dto);
		return dto_s;
	}

}
