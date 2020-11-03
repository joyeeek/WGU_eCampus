package wgu.schedule.model.vo;

import java.sql.Date;

public class Schedule {
	private String scheduleNo;
	private Date scheduleDate;
	private String scheduleContent;
	private String scheduleTitle;
	
	public Schedule() {}

	public Schedule(String scheduleNo, Date scheduleDate, String scheduleContent, String scheduleTitle) {
		super();
		this.scheduleNo = scheduleNo;
		this.scheduleDate = scheduleDate;
		this.scheduleContent = scheduleContent;
		this.scheduleTitle = scheduleTitle;
	}
	
	

	public Schedule(Date scheduleDate, String scheduleContent, String scheduleTitle) {
		super();
		this.scheduleDate = scheduleDate;
		this.scheduleContent = scheduleContent;
		this.scheduleTitle = scheduleTitle;
	}

	public String getScheduleNo() {
		return scheduleNo;
	}

	public void setScheduleNo(String scheduleNo) {
		this.scheduleNo = scheduleNo;
	}

	public Date getScheduleDate() {
		return scheduleDate;
	}

	public void setScheduleDate(Date scheduleDate) {
		this.scheduleDate = scheduleDate;
	}

	public String getScheduleContent() {
		return scheduleContent;
	}

	public void setScheduleContent(String scheduleContent) {
		this.scheduleContent = scheduleContent;
	}

	public String getScheduleTitle() {
		return scheduleTitle;
	}

	public void setScheduleTitle(String scheduleTitle) {
		this.scheduleTitle = scheduleTitle;
	}

	@Override
	public String toString() {
		return "Schedule [scheduleNo=" + scheduleNo + ", scheduleDate=" + scheduleDate + ", scheduleContent="
				+ scheduleContent + ", scheduleTitle=" + scheduleTitle + "]";
	}
	
	
}
