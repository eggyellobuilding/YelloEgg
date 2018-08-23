package egg.member.model;

import java.sql.Date;

public class MemberDTO {

	private int memberIdx;
	private String id;
	private String pwd;
	private String name;
	private String gender;
	private String tel;
	private Date birthDate;
	private String email;
	private Date joinDate;
	private String state;
	private int memberGradeIdx;
	public MemberDTO() {
		super();
	}
	public MemberDTO(int memberIdx, String id, String pwd, String name, String gender, String tel, Date birthDate,
			String email, Date joinDate, String state, int memberGradeIdx) {
		super();
		this.memberIdx = memberIdx;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.gender = gender;
		this.tel = tel;
		this.birthDate = birthDate;
		this.email = email;
		this.joinDate = joinDate;
		this.state = state;
		this.memberGradeIdx = memberGradeIdx;
	}
	public int getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(int memberIdx) {
		this.memberIdx = memberIdx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Date getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getMemberGradeIdx() {
		return memberGradeIdx;
	}
	public void setMemberGradeIdx(int memberGradeIdx) {
		this.memberGradeIdx = memberGradeIdx;
	}
	
	
}
