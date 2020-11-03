package wgu.evaluation.model.vo;

public class Evaluation {
	private String subjectNo;      // 과목번호
	private String subjectName;    // 과목명
	private String memberName;
	
	public Evaluation() {
		
	}

	public Evaluation(String subjectName, String subjectNo, String memberName) {
		super();
		this.subjectName = subjectName;
		this.subjectNo = subjectNo;		
		this.memberName = memberName;
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

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	@Override
	public String toString() {
		return "Evaluation [subjectNo=" + subjectNo + ", subjectName=" + subjectName + ", memberName=" + memberName
				+ "]";
	}		

}
