package GroceryStore.dto;

public class Cart {

	private int cartId;
	private String cItemName;
	private int cItemPrice;
	private String cItemImage;
	private String custEmail;

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public String getcItemName() {
		return cItemName;
	}

	public void setcItemName(String cItemName) {
		this.cItemName = cItemName;
	}

	public int getcItemPrice() {
		return cItemPrice;
	}

	public void setcItemPrice(int cItemPrice) {
		this.cItemPrice = cItemPrice;
	}

	public String getcItemImage() {
		return cItemImage;
	}

	public void setcItemImage(String cItemImage) {
		this.cItemImage = cItemImage;
	}

	public String getCustEmail() {
		return custEmail;
	}

	public void setCustEmail(String custEmail) {
		this.custEmail = custEmail;
	}

	public Cart() {
		super();
	}

	public Cart(int cartId, String cItemName, int cItemPrice, String cItemImage,
			String custEmail) {
		super();
		this.cartId = cartId;
		this.cItemName = cItemName;
		this.cItemPrice = cItemPrice;
		this.cItemImage = cItemImage;
		this.custEmail = custEmail;
	}

	@Override
	public String toString() {
		return "Cart [cartId=" + cartId + ", cItemName=" + cItemName + ", cItemPrice=" + cItemPrice + ", cItemQuantity="
				+ ", cItemImage=" + cItemImage + ", custEmail=" + custEmail + "]";
	}

}
