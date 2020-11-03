package wgu.bulletin.model.vo;

import java.sql.Date;

public class Comments {
	private String commentsNo;
	private String commentsNick;
	private String comments;
	private Date commentsDate;
	private String memberNo; // 익명인지 or 닉네임
	private String bulletinNo; // 게시글번호
	private String status;
	
	public Comments() {}

	public Comments(String commentsNo, String commentsNick, String comments, Date commentsDate, String memberNo,
			String bulletinNo, String status) {
		super();
		this.commentsNo = commentsNo;
		this.commentsNick = commentsNick;
		this.comments = comments;
		this.commentsDate = commentsDate;
		this.memberNo = memberNo;
		this.bulletinNo = bulletinNo;
		this.status = status;
	}

	public String getCommentsNo() {
		return commentsNo;
	}

	public void setCommentsNo(String commentsNo) {
		this.commentsNo = commentsNo;
	}

	public String getCommentsNick() {
		return commentsNick;
	}

	public void setCommentsNick(String commentsNick) {
		this.commentsNick = commentsNick;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public Date getCommentsDate() {
		return commentsDate;
	}

	public void setCommentsDate(Date commentsDate) {
		this.commentsDate = commentsDate;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getBulletinNo() {
		return bulletinNo;
	}

	public void setBulletinNo(String bulletinNo) {
		this.bulletinNo = bulletinNo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Comments [commentsNo=" + commentsNo + ", commentsNick=" + commentsNick + ", comments=" + comments
				+ ", commentsDate=" + commentsDate + ", memberNo=" + memberNo + ", bulletinNo=" + bulletinNo
				+ ", status=" + status + "]";
	}
	
	
	
	
}
