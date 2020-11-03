package wgu.cafeteria.model.vo;

public class Cafeteria {
	private String cafeteriaTitle;
	private String cafeteriaTime;
	private String cafeteriaLocation;
	private int cafeteriaPrice;
	
	public Cafeteria() {}

	public Cafeteria(String cafeteriaTitle, String cafeteriaTime, String cafeteriaLocation, int cafeteriaPrice) {
		super();
		this.cafeteriaTitle = cafeteriaTitle;
		this.cafeteriaTime = cafeteriaTime;
		this.cafeteriaLocation = cafeteriaLocation;
		this.cafeteriaPrice = cafeteriaPrice;
	}

	public String getCafeteriaTitle() {
		return cafeteriaTitle;
	}

	public void setCafeteriaTitle(String cafeteriaTitle) {
		this.cafeteriaTitle = cafeteriaTitle;
	}

	public String getCafeteriaTime() {
		return cafeteriaTime;
	}

	public void setCafeteriaTime(String cafeteriaTime) {
		this.cafeteriaTime = cafeteriaTime;
	}

	public String getCafeteriaLocation() {
		return cafeteriaLocation;
	}

	public void setCafeteriaLocation(String cafeteriaLocation) {
		this.cafeteriaLocation = cafeteriaLocation;
	}

	public int getCafeteriaPrice() {
		return cafeteriaPrice;
	}

	public void setCafeteriaPrice(int cafeteriaPrice) {
		this.cafeteriaPrice = cafeteriaPrice;
	}

	@Override
	public String toString() {
		return "Cafeteria [cafeteriaTitle=" + cafeteriaTitle + ", cafeteriaTime=" + cafeteriaTime
				+ ", cafeteriaLocation=" + cafeteriaLocation + ", cafeteriaPrice=" + cafeteriaPrice + "]";
	}
	
	

	
}
