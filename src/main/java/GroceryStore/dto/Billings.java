package GroceryStore.dto;

public class Billings {

	private String billTime;
	private double billAmount;
	private String billItems;
	private String custemail;
	
	public Billings(String billTime, double billAmount, String billItems, String custemail) {
		super();
		this.billTime = billTime;
		this.billAmount = billAmount;
		this.billItems = billItems;
		this.custemail = custemail;
	}
	@Override
	public String toString() {
		return "Billings [billTime=" + billTime + ", billAmount=" + billAmount + ", billItems="
				+ billItems + ", custemail=" + custemail + "]";
	}
	public Billings() {
		super();
	}
	public String getBillTime() {
		return billTime;
	}
	public void setBillTime(String billTime) {
		this.billTime = billTime;
	}
	public double getBillAmount() {
		return billAmount;
	}
	public void setBillAmount(double billAmount) {
		this.billAmount = billAmount;
	}
	public String getBillItems() {
		return billItems;
	}
	public void setBillItems(String billItems) {
		this.billItems = billItems;
	}
	public String getCustemail() {
		return custemail;
	}
	public void setCustemail(String custemail) {
		this.custemail = custemail;
	}
	
}
