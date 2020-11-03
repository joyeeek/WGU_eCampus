package wgu.evaluation.model.vo;

public class EvalQuestion {
	private String subjectNo;
	private String memberNo;
	private String queone;
	private String quetwo;
	private String quethree;
	private String quefour;
	private String quefive;
	private String quememo;
	
	public EvalQuestion() {
		
	}

	public EvalQuestion(String subjectNo, String memberNo, String queone, String quetwo, String quethree,
			String quefour, String quefive, String quememo) {
		super();
		this.subjectNo = subjectNo;
		this.memberNo = memberNo;
		this.queone = queone;
		this.quetwo = quetwo;
		this.quethree = quethree;
		this.quefour = quefour;
		this.quefive = quefive;
		this.quememo = quememo;
	}

	public EvalQuestion(String subjectNo, String quememo) {
		super();
		this.subjectNo = subjectNo;
		this.quememo = quememo;
	}

	public String getSubjectNo() {
		return subjectNo;
	}

	public void setSubjectNo(String subjectNo) {
		this.subjectNo = subjectNo;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getQueone() {
		return queone;
	}

	public void setQueone(String queone) {
		this.queone = queone;
	}

	public String getQuetwo() {
		return quetwo;
	}

	public void setQuetwo(String quetwo) {
		this.quetwo = quetwo;
	}

	public String getQuethree() {
		return quethree;
	}

	public void setQuethree(String quethree) {
		this.quethree = quethree;
	}

	public String getQuefour() {
		return quefour;
	}

	public void setQuefour(String quefour) {
		this.quefour = quefour;
	}

	public String getQuefive() {
		return quefive;
	}

	public void setQuefive(String quefive) {
		this.quefive = quefive;
	}

	public String getQuememo() {
		return quememo;
	}

	public void setQuememo(String quememo) {
		this.quememo = quememo;
	}

	@Override
	public String toString() {
		return "EvalQuestion [subjectNo=" + subjectNo + ", memberNo=" + memberNo + ", queone=" + queone + ", quetwo="
				+ quetwo + ", quethree=" + quethree + ", quefour=" + quefour + ", quefive=" + quefive + ", quememo="
				+ quememo + "]";
	}
	
	

}
