package wgu.bulletin.model.vo;

import java.sql.Date;

public class Bulletin {
	// 게시물번호, 제목, 내용, 작성자, 조회수, 날짜, 공지or일반게시글인지(구분자)//익명으로 처리하기 때문에 닉네임 사용x
	private String bulletinNo;
	private String bulletinTitle;
	private String bulletinContent;
	private Date bulletinDate;
	private int bulletinGroup; // 공지글인지 게시글인지
	private String memberNo; // 작성자
	private int bulletinCount;
	private String status;

	public Bulletin() {}
	
	
	
	
	// 매개변수 생성자는 필요할때마다 하나씩 만들어주는것으로 하기
	public Bulletin(String bulletinNo, String bulletinTitle, String bulletinContent, Date bulletinDate,
			int bulletinGroup, String memberNo, int bulletinCount, String status) {
		super();
		this.bulletinNo = bulletinNo;
		this.bulletinTitle = bulletinTitle;
		this.bulletinContent = bulletinContent;
		this.bulletinDate = bulletinDate;
		this.bulletinGroup = bulletinGroup;
		this.memberNo = memberNo;
		this.bulletinCount = bulletinCount;
		this.status = status;
	}
	
	
	public Bulletin(String bulletinNo, String bulletinTitle, String bulletinContent) {
		super();
		this.bulletinNo = bulletinNo;
		this.bulletinTitle = bulletinTitle;
		this.bulletinContent = bulletinContent;
	}

	
	

	public Bulletin(String bulletinNo, String bulletinTitle) {
		super();
		this.bulletinNo = bulletinNo;
		this.bulletinTitle = bulletinTitle;
	}




	public String getBulletinNo() {
		return bulletinNo;
	}




	public void setBulletinNo(String bulletinNo) {
		this.bulletinNo = bulletinNo;
	}




	public String getBulletinTitle() {
		return bulletinTitle;
	}




	public void setBulletinTitle(String bulletinTitle) {
		this.bulletinTitle = bulletinTitle;
	}




	public String getBulletinContent() {
		return bulletinContent;
	}




	public void setBulletinContent(String bulletinContent) {
		this.bulletinContent = bulletinContent;
	}




	public Date getBulletinDate() {
		return bulletinDate;
	}




	public void setBulletinDate(Date bulletinDate) {
		this.bulletinDate = bulletinDate;
	}




	public int getBulletinGroup() {
		return bulletinGroup;
	}




	public void setBulletinGroup(int bulletinGroup) {
		this.bulletinGroup = bulletinGroup;
	}




	public String getMemberNo() {
		return memberNo;
	}




	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}




	public int getBulletinCount() {
		return bulletinCount;
	}




	public void setBulletinCount(int bulletinCount) {
		this.bulletinCount = bulletinCount;
	}




	public String getStatus() {
		return status;
	}




	public void setStatus(String status) {
		this.status = status;
	}




	@Override
	public String toString() {
		return "Bulletin [bulletinNo=" + bulletinNo + ", bulletinTitle=" + bulletinTitle + ", bulletinContent="
				+ bulletinContent + ", bulletinDate=" + bulletinDate + ", bulletinGroup=" + bulletinGroup
				+ ", memberNo=" + memberNo + ", bulletinCount=" + bulletinCount + ", status=" + status + "]";
	}
	
	
	
}
