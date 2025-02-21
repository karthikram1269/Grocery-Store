package GroceryStore.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import GroceryStore.dto.Cart;

public class CartDao {

	Connection con;

	public void createCartTable() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/grocery_db?createDatabaseIfNotExist=true",
				"root", "KaDB@1269");
		System.out.println("Data base created");
		Statement s = con.createStatement();
		s.execute(
				"create table if not exists cart(cartid int primary key,citemname varchar(45) ,citemprice int,citemimage varchar(800),custEmail varchar(45))");
		System.out.println("cart table created");
	}

	public int saveCartItem(Cart cart) throws SQLException, ClassNotFoundException {
		createCartTable();
		PreparedStatement p = con.prepareStatement("insert into cart values(?,?,?,?,?)");
		p.setInt(1, cart.getCartId());
		p.setString(2, cart.getcItemName());
		p.setDouble(3, cart.getcItemPrice());
		p.setString(4, cart.getcItemImage());
		p.setString(5, cart.getCustEmail());
		
		return p.executeUpdate();
	}

	public Cart[] fetchAllInCart() {

		List<Cart> cartList = new ArrayList<>();
		try {
			createCartTable();
			PreparedStatement ps = con.prepareStatement("select * from cart ");

			ResultSet s = ps.executeQuery();

			while (s.next()) {
				Cart c = new Cart(s.getInt("cartid"), s.getString("citemname"), s.getInt("citemprice"),
						s.getString("citemimage"), s.getString("custEmail"));
				cartList.add(c);
			}
		} catch (Exception e) {
			System.out.println(" Could not fetch groceries, check with the code !!");
		}
		return cartList.toArray(new Cart[0]);
	}

	public int deleteCartItem(int id) {

		try {
			createCartTable();
			PreparedStatement ps = con.prepareStatement("delete from cart where cartid = ?");
			ps.setInt(1, id);

			return ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(" could not delete : " + e.getMessage());
		}
		return 0;
	}

	public int deleteCartItem(String name) {

		try {
			createCartTable();
			PreparedStatement ps = con.prepareStatement("delete from cart where citemname = ?");
			ps.setString(1, name);

			return ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(" could not delete : " + e.getMessage());
		}
		return 0;
	}
	
	public int deleteCartTotal() {

		try {
			createCartTable();
			PreparedStatement ps = con.prepareStatement("delete from cart");

			return ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(" could not delete : " + e.getMessage());
		}
		return 0;
	}
	

}
