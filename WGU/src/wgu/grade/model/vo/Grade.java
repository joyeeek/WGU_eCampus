package wgu.grade.model.vo;

public class Grade {
	
	private String memberNo;      // 학번
	private String subjectNo;     // 과목번호
	private String subjectTime;   // 강의시간
	private String memberResult;  // 성적
	private String subjectMajor;  // 학과
	private String memberName;    // 이름
	private String memberGrade;   // 학년
	
	
	public Grade() {
		
	}


	public Grade(String subjectMajor, String memberNo,  String memberName, String memberGrade , String memberResult, String subjectNo) {
		super();
		this.subjectMajor = subjectMajor;
		this.memberNo = memberNo;
		this.memberName = memberName;
		this.memberGrade = memberGrade;		
		this.memberResult = memberResult;
		this.subjectNo = subjectNo;
	}
	
	
	public Grade(String memberNo, String subjectNo, String memberResult) {
		super();
		this.memberNo = memberNo;
		this.subjectNo = subjectNo;
		this.memberResult = memberResult;
	}


	public String getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}


	public String getSubjectNo() {
		return subjectNo;
	}


	public void setSubjectNo(String subjectNo) {
		this.subjectNo = subjectNo;
	}


	public String getSubjectTime() {
		return subjectTime;
	}


	public void setSubjectTime(String subjectTime) {
		this.subjectTime = subjectTime;
	}


	public String getMemberResult() {
		return memberResult;
	}


	public void setMemberResult(String memberResult) {
		this.memberResult = memberResult;
	}


	public String getSubjectMajor() {
		return subjectMajor;
	}


	public void setSubjectMajor(String subjectMajor) {
		this.subjectMajor = subjectMajor;
	}


	public String getMemberName() {
		return memberName;
	}


	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}


	public String getMemberGrade() {
		return memberGrade;
	}


	public void setMemberGrade(String memberGrade) {
		this.memberGrade = memberGrade;
	}


	@Override
	public String toString() {
		return "Grade [memberNo=" + memberNo + ", subjectNo=" + subjectNo + ", subjectTime=" + subjectTime
				+ ", memberResult=" + memberResult + ", subjectMajor=" + subjectMajor + ", memberName=" + memberName
				+ ", memberGrade=" + memberGrade + "]";
	}

	
	

}
