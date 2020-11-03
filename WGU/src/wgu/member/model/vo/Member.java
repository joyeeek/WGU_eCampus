package wgu.member.model.vo;

public class Member {
	private String memberNo; 	//학번&교수코드
	private String memberId; 	//회원 id
	private String memberPwd; 	//회원pwd
	private String memberName;	//회원 이름
	private String birthDay; 	//생일
	private String gender; 		//성별
	private String email; 		//이메일
	private String address;		//주소
	private String phone;		//폰
	private String memberGrade;	//학년
	private String memberGroup; //구분(학생,교수)
	private String majorName;	//학과명
	private String status; 		//회원 상태
	
	public Member() {}
	
	public Member(String memberId) {
		super();
		this.memberId = memberId;
	}

	public Member(String memberId, String memberPwd) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
	}
	
	public Member(String memberNo, String memberName, String phone) {
		super();
		this.memberNo = memberNo;
		this.memberName = memberName;
		this.phone = phone;
	}
	
	public Member(String memberId, String memberName, String phone, String status) {
		super();
		this.memberNo = memberId;
		this.memberName = memberName;
		this.phone = phone;
		this.status = status;
	}

	public Member(String memberNo, String memberId, String memberPwd, String memberName, String birthDay, String gender,
			String email, String address, String phone, String memberGrade, String memberGroup, String majorName) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.birthDay = birthDay;
		this.gender = gender;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.memberGrade = memberGrade;
		this.memberGroup = memberGroup;
		this.majorName = majorName;
	}
	

	public Member(String memberNo, String memberId, String memberPwd, String memberName, String birthDay, String gender,
			String email, String address, String phone, String memberGrade, String memberGroup, String majorName,
			String status) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.birthDay = birthDay;
		this.gender = gender;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.memberGrade = memberGrade;
		this.memberGroup = memberGroup;
		this.majorName = majorName;
		this.status = status;
	}
		
	public Member(String majorName, String memberNo, String memberName, String memberGrade, String phone, String email) {
		super();		
		this.memberName = memberName;
		this.memberNo = memberNo;
		this.majorName = majorName;
		this.memberGrade = memberGrade;
		this.phone = phone;
		this.email = email;						
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(String birthDay) {
		this.birthDay = birthDay;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMemberGrade() {
		return memberGrade;
	}

	public void setMemberGrade(String memberGrade) {
		this.memberGrade = memberGrade;
	}

	public String getMemberGroup() {
		return memberGroup;
	}

	public void setMemberGroup(String memberGroup) {
		this.memberGroup = memberGroup;
	}

	public String getMajorName() {
		return majorName;
	}

	public void setMajorName(String majorName) {
		this.majorName = majorName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPwd=" + memberPwd + ", memberName="
				+ memberName + ", birthDay=" + birthDay + ", gender=" + gender + ", email=" + email + ", address="
				+ address + ", phone=" + phone + ", memberGrade=" + memberGrade + ", memberGroup=" + memberGroup
				+ ", magorName=" + majorName + ", status=" + status + "]";
	}
	

}
