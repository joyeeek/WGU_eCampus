package wgu.grade.model.vo;

public class GradeInfo {
	
	private String subjectType;
	private String subjectMajor;
	private String subjectName;
	private String subjectCredit;
	private String subjectTime;
	private String subjectNo;
	private String memberResult;
	
	public GradeInfo() {
		
	}

	public GradeInfo(String subjectType, String subjectMajor, String subjectName, String subjectCredit, String subjectTime, String subjectNo,
			String memberResult) {
		super();
		this.subjectType = subjectType;
		this.subjectMajor = subjectMajor;
		this.subjectName = subjectName;
		this.subjectCredit = subjectCredit;
		this.subjectTime = subjectTime;
		this.subjectNo = subjectNo;
		this.memberResult = memberResult;
	}

	public String getSubjectType() {
		return subjectType;
	}

	public void setSubjectType(String subjectType) {
		this.subjectType = subjectType;
	}

	public String getSubjectMajor() {
		return subjectMajor;
	}

	public void setSubjectMajor(String subjectMajor) {
		this.subjectMajor = subjectMajor;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	
	public String getSubjectCredit() {
		return subjectCredit;
	}

	public void setSubjectCredit(String subjectCredit) {
		this.subjectCredit = subjectCredit;
	}

	public String getSubjectTime() {
		return subjectTime;
	}

	public void setSubjectTime(String subjectTime) {
		this.subjectTime = subjectTime;
	}

	public String getSubjectNo() {
		return subjectNo;
	}

	public void setSubjectNo(String subjectNo) {
		this.subjectNo = subjectNo;
	}

	public String getMemberResult() {
		return memberResult;
	}

	public void setMemberResult(String memberResult) {
		this.memberResult = memberResult;
	}

	@Override
	public String toString() {
		return "GradeInfo [subjectType=" + subjectType + ", subjectMajor=" + subjectMajor + ", subjectName="
				+ subjectName + ", subjectCredit=" + subjectCredit + ", subjectTime=" + subjectTime + ", subjectNo="
				+ subjectNo + ", memberResult=" + memberResult + "]";
	}
	

}
