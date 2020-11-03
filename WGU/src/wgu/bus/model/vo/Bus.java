package wgu.bus.model.vo;

import java.sql.Date;

public class Bus {
	private int busNo;
	private Date busDate;
	private String busLine;
	private String busSeat;
	private int busPrice;
	private String busComment;
	
	public Bus() {}
	
//	public Bus(int busNo, String busDate, String busLine, String busSeat, int busPrice) {
//		super();
//		this.busNo = busNo;
//		this.busDate = busDate;
//		this.busLine = busLine;
//		this.busSeat = busSeat;
//		this.busPrice = busPrice;
//	}
//
//
//	public Bus(int busNo, String busDate, String busLine, String busSeat, int busPrice, String busComment) {
//		super();
//		this.busNo = busNo;
//		this.busDate = busDate;
//		this.busLine = busLine;
//		this.busSeat = busSeat;
//		this.busPrice = busPrice;
//		this.busComment = busComment;
//	}

	public Bus(int busNo, Date busDate, String busLine, String busSeat, int busPrice, String busComment) {
		super();
		this.busNo = busNo;
		this.busDate = busDate;
		this.busLine = busLine;
		this.busSeat = busSeat;
		this.busPrice = busPrice;
		this.busComment = busComment;
	}




	public Bus(int busNo, Date busDate, String busLine, String busSeat, int busPrice) {
		super();
		this.busNo = busNo;
		this.busDate = busDate;
		this.busLine = busLine;
		this.busSeat = busSeat;
		this.busPrice = busPrice;
	}

	public int getBusNo() {
		return busNo;
	}


	public void setBusNo(int busNo) {
		this.busNo = busNo;
	}



//	public String getBusDate() {
//		return busDate;
//	}
//
//	public void setBusDate(String busDate) {
//		this.busDate = busDate;
//	}
	
	

	public String getBusLine() {
		return busLine;
	}

	public Date getBusDate() {
		return busDate;
	}

	public void setBusDate(Date busDate) {
		this.busDate = busDate;
	}

	public void setBusLine(String busLine) {
		this.busLine = busLine;
	}

	public String getBusSeat() {
		return busSeat;
	}

	public void setBusSeat(String busSeat) {
		this.busSeat = busSeat;
	}

	public int getBusPrice() {
		return busPrice;
	}

	public void setBusPrice(int busPrice) {
		this.busPrice = busPrice;
	}

	public String getBusComment() {
		return busComment;
	}

	public void setBusComment(String busComment) {
		this.busComment = busComment;
	}

	@Override
	public String toString() {
		return "Bus [busNo=" + busNo + ", busDate=" + busDate + ", busLine=" + busLine + ", busSeat=" + busSeat
				+ ", busPrice=" + busPrice + ", busComment=" + busComment + "]";
	}
	
	
	
}
