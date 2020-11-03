package wgu.subject.model.vo;

public class OkSubject {
	
	private String subjectNo;      // 과목번호
	private String subjectName;    // 과목명
	private String subjectType;    // 전공구분
	private int subjectCredit;  // 학점
	private int subjectLimit;      // 정원
	private String subjectGrade;   // 수강학년
	private String subjectTime;    // 강의시간
	private String subjectMajor;   // 전공
	private String memberNo;
	private String status;
	private String memberResult;
	
	public OkSubject() {
		
	}

	public OkSubject(String memberNo, String subjectNo, String status) {
		super();
		this.memberNo = memberNo;
		this.subjectNo = subjectNo;
		this.status = status;
	}
	
	public OkSubject(String memberNo, String subjectNo) {
		super();
		this.memberNo = memberNo;
		this.subjectNo = subjectNo;
	}
	
	public OkSubject(String subjectNo, String subjectName, String subjectType, int subjectCredit, int subjectLimit,
			String subjectGrade, String subjectTime, String subjectMajor, String memberNo, String status) {
		super();
		this.subjectNo = subjectNo;
		this.subjectName = subjectName;
		this.subjectType = subjectType;
		this.subjectCredit = subjectCredit;
		this.subjectLimit = subjectLimit;
		this.subjectGrade = subjectGrade;
		this.subjectTime = subjectTime;
		this.subjectMajor = subjectMajor;
		this.memberNo = memberNo;
		this.status = status;
	}
	
	public OkSubject(String subjectType, String subjectMajor, String subjectName, String subjectTime, String subjectNo, String status) {
		super();
		this.subjectType = subjectType;
		this.subjectMajor = subjectMajor;
		this.subjectName = subjectName;
		this.subjectTime = subjectTime;
		this.subjectNo = subjectNo;
		this.status = status;
	}	
	

	public OkSubject(String memberNo, String subjectNo, String subjectTime, String status, String memberResult) {
		super();
		this.memberNo = memberNo;
		this.subjectNo = subjectNo;
		this.subjectTime = subjectTime;		
		this.status = status;
		this.memberResult = memberResult;
	}

	public String getSubjectNo() {
		return subjectNo;
	}

	public void setSubjectNo(String subjectNo) {
		this.subjectNo = subjectNo;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public String getSubjectType() {
		return subjectType;
	}

	public void setSubjectType(String subjectType) {
		this.subjectType = subjectType;
	}

	public int getSubjectCredit() {
		return subjectCredit;
	}

	public void setSubjectCredit(int subjectCredit) {
		this.subjectCredit = subjectCredit;
	}

	public int getSubjectLimit() {
		return subjectLimit;
	}

	public void setSubjectLimit(int subjectLimit) {
		this.subjectLimit = subjectLimit;
	}

	public String getSubjectGrade() {
		return subjectGrade;
	}

	public void setSubjectGrade(String subjectGrade) {
		this.subjectGrade = subjectGrade;
	}

	public String getSubjectTime() {
		return subjectTime;
	}

	public void setSubjectTime(String subjectTime) {
		this.subjectTime = subjectTime;
	}

	public String getSubjectMajor() {
		return subjectMajor;
	}

	public void setSubjectMajor(String subjectMajor) {
		this.subjectMajor = subjectMajor;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getMemberResult() {
		return memberResult;
	}

	public void setMemberResult(String memberResult) {
		this.memberResult = memberResult;
	}

	@Override
	public String toString() {
		return "OkSubject [subjectNo=" + subjectNo + ", subjectName=" + subjectName + ", subjectType=" + subjectType
				+ ", subjectCredit=" + subjectCredit + ", subjectLimit=" + subjectLimit + ", subjectGrade="
				+ subjectGrade + ", subjectTime=" + subjectTime + ", subjectMajor=" + subjectMajor + ", memberNo="
				+ memberNo + ", status=" + status + ", memberResult=" + memberResult + "]";
	}

	

	


	

}