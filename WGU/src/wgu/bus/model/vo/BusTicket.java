package wgu.bus.model.vo;

public class BusTicket {
	private int ticketNo;
	private String useYn;
	private String memberNo;
	private int busNo;
	
	public BusTicket() {}
	
	

	public BusTicket(int ticketNo, String memberNo, int busNo) {
		super();
		this.ticketNo = ticketNo;
		this.memberNo = memberNo;
		this.busNo = busNo;
	}

	public BusTicket(int ticketNo, String useYn, String memberNo, int busNo) {
		super();
		this.ticketNo = ticketNo;
		this.useYn = useYn;
		this.memberNo = memberNo;
		this.busNo = busNo;
	}

	public int getTicketNo() {
		return ticketNo;
	}

	public void setTicketNo(int ticketNo) {
		this.ticketNo = ticketNo;
	}

	public String getUseYn() {
		return useYn;
	}

	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public int getBusNo() {
		return busNo;
	}

	public void setBusNo(int busNo) {
		this.busNo = busNo;
	}

	@Override
	public String toString() {
		return "BusTicket [ticketNo=" + ticketNo + ", useYn=" + useYn + ", memberNo=" + memberNo + ", busNo=" + busNo
				+ "]";
	}
	
	
}
