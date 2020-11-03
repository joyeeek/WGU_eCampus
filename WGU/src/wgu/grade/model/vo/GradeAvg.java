package wgu.grade.model.vo;

public class GradeAvg {
	private int sumSubject;
	private int sumCredit;
	private float avgResult;
	
	public GradeAvg() {
		
	}
	
	public GradeAvg(int sumSubject, int sumCredit, float avgResult) {
		super();
		this.sumSubject = sumSubject;
		this.sumCredit = sumCredit;
		this.avgResult = avgResult;
	}
	public int getSumSubject() {
		return sumSubject;
	}
	public void setSumSubject(int sumSubject) {
		this.sumSubject = sumSubject;
	}
	public int getSumCredit() {
		return sumCredit;
	}
	public void setSumCredit(int sumCredit) {
		this.sumCredit = sumCredit;
	}
	public float getAvgResult() {
		return avgResult;
	}
	public void setAvgResult(float avgResult) {
		this.avgResult = avgResult;
	}
	@Override
	public String toString() {
		return "GradeAvg [sumSubject=" + sumSubject + ", sumCredit=" + sumCredit + ", avgResult=" + avgResult + "]";
	}
	
	

}
