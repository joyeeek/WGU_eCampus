package wgu.bulletin.model.vo;

public class Attachment {
	private String fileId;
	private String bulletinNo; // 게시번호
	private String noticeNo; // 공지번호 --> 둘중하나쓰기
	private String originName;
	private String changeName;
	private String filePath;
	private String status;
	
	public Attachment() {}
	
	public Attachment(String fileId, String bulletinNo, String noticeNo, String originName, String changeName,
			String filePath, String status) {
		super();
		this.fileId = fileId;
		this.bulletinNo = bulletinNo;
		this.noticeNo = noticeNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.status = status;
	}
	
	

	public Attachment(String fileId, String originName, String changeName, String filePath) {
		super();
		this.fileId = fileId;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
	}

	public String getFileId() {
		return fileId;
	}


	public void setFileId(String fileId) {
		this.fileId = fileId;
	}


	public String getBulletinNo() {
		return bulletinNo;
	}


	public void setBulletinNo(String bulletinNo) {
		this.bulletinNo = bulletinNo;
	}


	public String getNoticeNo() {
		return noticeNo;
	}


	public void setNoticeNo(String noticeNo) {
		this.noticeNo = noticeNo;
	}


	public String getOriginName() {
		return originName;
	}


	public void setOriginName(String originName) {
		this.originName = originName;
	}


	public String getChangeName() {
		return changeName;
	}


	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}


	public String getFilePath() {
		return filePath;
	}


	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "Attachment [fileId=" + fileId + ", bulletinNo=" + bulletinNo + ", noticeNo=" + noticeNo
				+ ", originName=" + originName + ", changeName=" + changeName + ", filePath=" + filePath + ", status="
				+ status + "]";
	}
	
	
	
}
