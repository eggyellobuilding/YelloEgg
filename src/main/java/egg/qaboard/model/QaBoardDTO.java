package egg.qaboard.model;

import java.sql.Date;

public class QaBoardDTO {

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
	
	/**admin*/
	private int adminIdx;
	private String adminId;
	private String adminPwd;
	private Date adminJoinDate;
	private String adminGrade;
	private int adminCinemaIdx;
	
	/**cinema*/
	private int cinemaIdx;
	private String cinemaCity;
	private String cinemaGu; 
	private String cinemaBungi;
	private String cinemaAddr;
	private String cinemaName;
	private int cinemaTheater;
	
	/**qa*/
	private int qaIdx;
	private String qaTitle;
	private String qaContent;
	private Date qaWriteDate;
	private String qaCate;
	private String qaAnswer;
	private int qaMemberIdx;
	private int qaCinemaIdx;
	
	public QaBoardDTO() {
		super();
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

	public int getCinemaIdx() {
		return cinemaIdx;
	}

	public void setCinemaIdx(int cinemaIdx) {
		this.cinemaIdx = cinemaIdx;
	}

	public String getCinemaCity() {
		return cinemaCity;
	}

	public void setCinemaCity(String cinemaCity) {
		this.cinemaCity = cinemaCity;
	}

	public String getCinemaGu() {
		return cinemaGu;
	}

	public void setCinemaGu(String cinemaGu) {
		this.cinemaGu = cinemaGu;
	}

	public String getCinemaBungi() {
		return cinemaBungi;
	}

	public void setCinemaBungi(String cinemaBungi) {
		this.cinemaBungi = cinemaBungi;
	}

	public String getCinemaAddr() {
		return cinemaAddr;
	}

	public void setCinemaAddr(String cinemaAddr) {
		this.cinemaAddr = cinemaAddr;
	}

	public String getCinemaName() {
		return cinemaName;
	}

	public void setCinemaName(String cinemaName) {
		this.cinemaName = cinemaName;
	}

	public int getCinemaTheater() {
		return cinemaTheater;
	}

	public void setCinemaTheater(int cinemaTheater) {
		this.cinemaTheater = cinemaTheater;
	}

	public int getQaIdx() {
		return qaIdx;
	}

	public void setQaIdx(int qaIdx) {
		this.qaIdx = qaIdx;
	}

	public String getQaTitle() {
		return qaTitle;
	}

	public void setQaTitle(String qaTitle) {
		this.qaTitle = qaTitle;
	}

	public String getQaContent() {
		return qaContent;
	}

	public void setQaContent(String qaContent) {
		this.qaContent = qaContent;
	}

	public Date getQaWriteDate() {
		return qaWriteDate;
	}

	public void setQaWriteDate(Date qaWriteDate) {
		this.qaWriteDate = qaWriteDate;
	}

	public String getQaCate() {
		return qaCate;
	}

	public void setQaCate(String qaCate) {
		this.qaCate = qaCate;
	}

	public String getQaAnswer() {
		return qaAnswer;
	}

	public void setQaAnswer(String qaAnswer) {
		this.qaAnswer = qaAnswer;
	}

	public int getQaMemberIdx() {
		return qaMemberIdx;
	}

	public void setQaMemberIdx(int qaMemberIdx) {
		this.qaMemberIdx = qaMemberIdx;
	}

	public int getQaCinemaIdx() {
		return qaCinemaIdx;
	}

	public void setQaCinemaIdx(int qaCinemaIdx) {
		this.qaCinemaIdx = qaCinemaIdx;
	}
	
	
}
