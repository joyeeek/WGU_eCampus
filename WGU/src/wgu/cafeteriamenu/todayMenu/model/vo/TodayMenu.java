package wgu.cafeteriamenu.todayMenu.model.vo;


public class TodayMenu {
	private String cafeteriaTitle;
	private String monMenu;
	private String tueMenu;
	private String wenMenu;
	private String thuMenu;
	private String friMenu;
	private String satMenu;
	
	public TodayMenu() {}

	public TodayMenu(String cafeteriaTitle, String monMenu, String tueMenu, String wenMenu, String thuMenu,
			String friMenu, String satMenu) {
		super();
		this.cafeteriaTitle = cafeteriaTitle;
		this.monMenu = monMenu;
		this.tueMenu = tueMenu;
		this.wenMenu = wenMenu;
		this.thuMenu = thuMenu;
		this.friMenu = friMenu;
		this.satMenu = satMenu;
	}

	public String getCafeteriaTitle() {
		return cafeteriaTitle;
	}

	public void setCafeteriaTitle(String cafeteriaTitle) {
		this.cafeteriaTitle = cafeteriaTitle;
	}

	public String getMonMenu() {
		return monMenu;
	}

	public void setMonMenu(String monMenu) {
		this.monMenu = monMenu;
	}

	public String getTueMenu() {
		return tueMenu;
	}

	public void setTueMenu(String tueMenu) {
		this.tueMenu = tueMenu;
	}

	public String getWenMenu() {
		return wenMenu;
	}

	public void setWenMenu(String wenMenu) {
		this.wenMenu = wenMenu;
	}

	public String getThuMenu() {
		return thuMenu;
	}

	public void setThuMenu(String thuMenu) {
		this.thuMenu = thuMenu;
	}

	public String getFriMenu() {
		return friMenu;
	}

	public void setFriMenu(String friMenu) {
		this.friMenu = friMenu;
	}

	public String getSatMenu() {
		return satMenu;
	}

	public void setSatMenu(String satMenu) {
		this.satMenu = satMenu;
	}

	@Override
	public String toString() {
		return "TodayMenu [cafeteriaTitle=" + cafeteriaTitle + ", monMenu=" + monMenu + ", tueMenu=" + tueMenu
				+ ", wenMenu=" + wenMenu + ", thuMenu=" + thuMenu + ", friMenu=" + friMenu + ", satMenu=" + satMenu
				+ "]";
	}

	

}
