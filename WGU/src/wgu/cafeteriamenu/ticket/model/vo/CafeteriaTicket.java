package wgu.cafeteriamenu.ticket.model.vo;

public class CafeteriaTicket {
	private int ticketNo;
	private String memberNo;
	private String todayMenuTitle;
	private String useYN;
	
	public CafeteriaTicket() {}

	public CafeteriaTicket(int ticketNo, String memberNo, String todayMenuTitle, String useYN) {
		super();
		this.ticketNo = ticketNo;
		this.memberNo = memberNo;
		this.todayMenuTitle = todayMenuTitle;
		this.useYN = useYN;
	}

	public CafeteriaTicket(String memberNo, String todayMenuTitle) {
		super();
		this.memberNo = memberNo;
		this.todayMenuTitle = todayMenuTitle;
	}
	
	
	public CafeteriaTicket(int ticketNo, String memberNo, String useYN) {
		super();
		this.ticketNo = ticketNo;
		this.memberNo = memberNo;
		this.useYN = useYN;
	}

	public CafeteriaTicket(int ticketNo, String memberNo) {
		super();
		this.ticketNo = ticketNo;
		this.memberNo = memberNo;
	}

	public int getTicketNo() {
		return ticketNo;
	}

	public void setTicketNo(int ticketNo) {
		this.ticketNo = ticketNo;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getTodayMenuTitle() {
		return todayMenuTitle;
	}

	public void setTodayMenuTitle(String todayMenuTitle) {
		this.todayMenuTitle = todayMenuTitle;
	}

	public String getUseYN() {
		return useYN;
	}

	public void setUseYN(String useYN) {
		this.useYN = useYN;
	}

	@Override
	public String toString() {
		return "CafeteriaTicket [ticketNo=" + ticketNo + ", memberNo=" + memberNo + ", todayMenuTitle=" + todayMenuTitle
				+ ", useYN=" + useYN + "]";
	}

	
	
}
