package GroceryStore.dto;

public class User {

	private String usertype;
	private String name;
	private String email;
	private String password;
	private long phone;
	private String address;

	public User() {

	}

	public User(String usertype, String name, String email, String password, long phone, String address) {
		super();
		this.usertype = usertype;
		this.name = name;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.address = address;
	}

	public String getUsertype() {
		return usertype;
	}

	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public long getPhone() {
		return phone;
	}

	public void setPhone(long phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "User [usertype=" + usertype + ", name=" + name + ", email=" + email + ", password=" + password
				+ ", phone=" + phone + ", address=" + address + "]";
	}

}
