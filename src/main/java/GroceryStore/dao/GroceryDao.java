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
	        
	        out.println("<html><head>");
	        out.println("<style>");
	        out.println("body { font-family: Arial, sans-serif; background-color: #f4f4f4; text-align: center; padding: 20px; }");
	        out.println("h1 { color: #333; }");
	        out.println("table { width: 80%; margin: 20px auto; border-collapse: collapse; background-color: white; box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); }");
	        out.println("th, td { padding: 12px; border: 1px solid #ddd; text-align: center; }");
	        out.println("th { background-color: #007bff; color: white; }");
	        out.println("tr:nth-child(even) { background-color: #f9f9f9; }");
	        out.println("tr:hover { background-color: #f1f1f1; transition: 0.3s; }");
	        out.println("img { border-radius: 5px; }");
	        out.println(".btn { padding: 10px 20px; margin-top: 20px; border: none; background-color: #007bff; color: white; font-size: 16px; border-radius: 5px; cursor: pointer; transition: 0.3s; }");
	        out.println(".btn a { text-decoration: none; color: white; }");
	        out.println(".btn:hover { background-color: #0056b3; }");
	        out.println("</style>");
	        out.println("</head><body>");

	        out.println("<h1>All My Items</h1>");
	        out.println("<table><tr><th>Item Id</th><th>Item Type</th><th>Item Name</th><th>Item Price</th><th>Item Quantity</th><th>Item Image</th></tr>");

	        while (res.next()) {
	            int itemid = res.getInt(1);
	            String itemtype = res.getString(2);
	            String itemname = res.getString(3);
	            int itemprice = res.getInt(4);
	            String itemquantity = res.getString(5);
	            String itemimage = res.getString(6);

	            System.out.println(itemid + " " + itemtype + " " + itemname + " " + itemprice + " " + itemquantity + " " + itemimage + " " + email);
	            out.println("<tr>");
	            out.println("<td>" + itemid + "</td>");
	            out.println("<td>" + itemtype + "</td>");
	            out.println("<td>" + itemname + "</td>");
	            out.println("<td>&#8377;" + itemprice + "</td>");
	            out.println("<td>" + itemquantity + "</td>");
	            out.println("<td><img src='" + itemimage + "' alt='" + itemname + "' width='100'/></td>");
	            out.println("</tr>");
	            count++;
	        }

	        out.println("</table>");

	        if (count == 0) {
	            System.out.println("Invalid email....");
	            out.println("<p>No items found for the provided email.</p>");
	        }

	        out.println("<br><a href='vendashboard.jsp'><button class='btn'>DASHBOARD</button></a>");
	        out.println("</body></html>");
	    } catch (Exception e) {
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

	public Grocery fetchItem(String email,String itemname) {
		try {
			createTable();
			PreparedStatement p = con.prepareStatement("select * from item where itemname=? and email = ?");
			p.setString(1, itemname);
			p.setString(2, email);
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

	public int updateItems(int itemprice, String itemquantity, String itemimage, String itemname,String email) {

		try {
			createTable();
			PreparedStatement p = con
					.prepareStatement("update item set itemprice=?,itemquantity=?,itemimage=? where itemname=? and email = ?");
			p.setInt(1, itemprice);
			p.setString(2, itemquantity);
			p.setString(3, itemimage);
			p.setString(4, itemname);
			p.setString(5, email);
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
