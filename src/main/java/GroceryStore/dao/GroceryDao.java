package GroceryStore.dao;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import GroceryStore.dto.Grocery;
import GroceryStore.dto.User;

public class GroceryDao {

	Connection con;

	public void createTable() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/grocery_db?createDatabaseIfNotExist=true",
				"root", "KaDB@1269");
		System.out.println("Data base created");
		Statement s = con.createStatement();
		s.execute(
				"create table if not exists item(itemid int primary key,itemtype varchar(45),itemname varchar(45) ,itemprice int,itemquantity varchar(45),itemimage varchar(800),email varchar(45))");
		System.out.println("table created");
	}

	public int saveItem(Grocery grocery) throws SQLException, ClassNotFoundException {
		createTable();
		PreparedStatement p = con.prepareStatement("insert into item values(?,?,?,?,?,?,?)");
		p.setInt(1, grocery.getItemid());
		p.setString(2, grocery.getItemtype());
		p.setString(3, grocery.getItemname());
		p.setInt(4, grocery.getItemprice());
		p.setString(5, grocery.getItemquantity());
		p.setString(6, grocery.getItemimage());
		p.setString(7, grocery.getEmail());
		return p.executeUpdate();
	}

	public int fetchAllHisItems(String email, HttpServletResponse resp) {

		int count = 0;
		try {
			PrintWriter out = resp.getWriter();
			createTable();
			PreparedStatement p = con.prepareStatement("select * from item where email=?");
			p.setString(1, email);
			ResultSet res = p.executeQuery();
			out.println("<html><body>");
			out.println("<h1>All My Items</h1>");
			out.println(
					"<table border='1'><tr><th>Item Id</th><th>Item Type</th><th>Item Name</th><th>Item Price</th><th>Item Quantity</th><th>Item Image</th></tr>");
			while (res.next()) {
				int itemid = res.getInt(1);
				String itemtype = res.getString(2);
				String itemname = res.getString(3);
				int itemprice = res.getInt(4);
				String itemquantity = res.getString(5);
				String itemimage = res.getString(6);

				System.out.println(itemid + " " + itemtype + " " + itemname + " " + itemprice + " " + itemquantity + " "
						+ itemimage + " " + email);
				out.println("<tr>");
				out.println("<td>" + itemid + "</td>");
				out.println("<td>" + itemtype + "</td>");
				out.println("<td>" + itemname + "</td>");
				out.println("<td>" + itemprice + "</td>");
				out.println("<td>" + itemquantity + "</td>");
				out.println("<td><img src='" + itemimage + "' alt='" + itemname + "' width='100'/></td>");
				out.println("</tr>");
				count++;
			}
			if (count == 0) {
				System.out.println("Invalid email....");
				out.println("<p>No items found for the provided email.</p>");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return count;
	}

	public Grocery[] fetchAllItems() {
		List<Grocery> groceryList = new ArrayList<>();
		try {
			createTable();
			PreparedStatement p = con.prepareStatement("select * from item");
			ResultSet rs = p.executeQuery();
			while (rs.next()) {
				Grocery grocery = new Grocery(rs.getInt("itemid"), rs.getString("itemtype"), rs.getString("itemname"),
						rs.getInt("itemprice"), rs.getString("itemquantity"), rs.getString("itemimage"),
						rs.getString("email"));
				groceryList.add(grocery);
			}
		} catch (Exception e) {
			System.out.println(" Could not fetch groceries, check with the code !!");
		}
		return groceryList.toArray(new Grocery[0]);
	}

	public Grocery fetchItem(String itemname) {
		try {
			createTable();
			PreparedStatement p = con.prepareStatement("select * from item where itemname=?");
			p.setString(1, itemname);
			ResultSet rs = p.executeQuery();
			if (rs.next()) {
				return new Grocery(rs.getInt("itemid"), rs.getString("itemtype"), rs.getString("itemname"),
						rs.getInt("itemprice"), rs.getString("itemquantity"), rs.getString("itemimage"),
						rs.getString("email"));
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public int updateItems(int itemprice, String itemquantity, String itemimage, String itemname) {

		try {
			createTable();
			PreparedStatement p = con
					.prepareStatement("update item set itemprice=?,itemquantity=?,itemimage=? where itemname=?");
			p.setInt(1, itemprice);
			p.setString(2, itemquantity);
			p.setString(3, itemimage);
			p.setString(4, itemname);
			return p.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public int deleteItem(String itemname) {
		try {
			createTable();
			PreparedStatement p = con.prepareStatement("delete from item where itemname=?");
			p.setString(1, itemname);

			return p.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
}
