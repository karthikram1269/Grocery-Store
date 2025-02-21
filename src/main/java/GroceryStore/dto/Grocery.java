package GroceryStore.dto;

public class Grocery {
	private int itemid;
	private String itemtype;
	private String itemname;
	private int itemprice;
	private String itemquantity;
	private String itemimage;
	private String email;

	public Grocery() {
	}

	public Grocery(int itemid, String itemtype, String itemname, int itemprice, String itemquantity, String itemimage,
			String email) {
		super();
		this.itemid = itemid;
		this.itemtype = itemtype;
		this.itemname = itemname;
		this.itemprice = itemprice;
		this.itemquantity = itemquantity;
		this.itemimage = itemimage;
		this.email = email;
	}

	public int getItemid() {
		return itemid;
	}

	public void setItemid(int itemid) {
		this.itemid = itemid;
	}

	public String getItemtype() {
		return itemtype;
	}

	public void setItemtype(String itemtype) {
		this.itemtype = itemtype;
	}

	public String getItemname() {
		return itemname;
	}

	public void setItemname(String itemname) {
		this.itemname = itemname;
	}

	public int getItemprice() {
		return itemprice;
	}

	public void setItemprice(int itemprice) {
		this.itemprice = itemprice;
	}

	public String getItemquantity() {
		return itemquantity;
	}

	public void setItemquantity(String itemquantity) {
		this.itemquantity = itemquantity;
	}

	public String getItemimage() {
		return itemimage;
	}

	public void setItemimage(String itemimage) {
		this.itemimage = itemimage;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "Grocery [itemid=" + itemid + ", itemtype=" + itemtype + ", itemname=" + itemname + ", itemprice="
				+ itemprice + ", itemquantity=" + itemquantity + ", itemimage=" + itemimage + ", email=" + email + "]";
	}

}
