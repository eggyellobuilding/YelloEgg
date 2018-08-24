package egg.member.model;

import java.sql.Date;

public class MemberDTO {

	/**member*/
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
		
	/**grade*/
	private int gradeIdx;
	private String gradeName;
	
	/**admin*/
	private int adminIdx;
	private String adminId;
	private String adminPwd;
	private Date adminJoinDate;
	private String adminGrade;
	private int adminCinemaIdx;
	
	public MemberDTO() {
		super();
	}

	public MemberDTO(int memberIdx, String id, String pwd, String name, String gender, String tel, Date birthDate,
			String email, Date joinDate, String state, int memberGradeIdx, int gradeIdx, String gradeName, int adminIdx,
			String adminId, String adminPwd, Date adminJoinDate, String adminGrade, int adminCinemaIdx) {
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
		this.gradeIdx = gradeIdx;
		this.gradeName = gradeName;
		this.adminIdx = adminIdx;
		this.adminId = adminId;
		this.adminPwd = adminPwd;
		this.adminJoinDate = adminJoinDate;
		this.adminGrade = adminGrade;
		this.adminCinemaIdx = adminCinemaIdx;
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

	public int getGradeIdx() {
		return gradeIdx;
	}

	public void setGradeIdx(int gradeIdx) {
		this.gradeIdx = gradeIdx;
	}

	public String getGradeName() {
		return gradeName;
	}

	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}

	public int getAdminIdx() {
		return adminIdx;
	}

	public void setAdminIdx(int adminIdx) {
		this.adminIdx = adminIdx;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getAdminPwd() {
		return adminPwd;
	}

	public void setAdminPwd(String adminPwd) {
		this.adminPwd = adminPwd;
	}

	public Date getAdminJoinDate() {
		return adminJoinDate;
	}

	public void setAdminJoinDate(Date adminJoinDate) {
		this.adminJoinDate = adminJoinDate;
	}

	public String getAdminGrade() {
		return adminGrade;
	}

	public void setAdminGrade(String adminGrade) {
		this.adminGrade = adminGrade;
	}

	public int getAdminCinemaIdx() {
		return adminCinemaIdx;
	}

	public void setAdminCinemaIdx(int adminCinemaIdx) {
		this.adminCinemaIdx = adminCinemaIdx;
	}

}
