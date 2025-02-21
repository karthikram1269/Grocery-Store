package GroceryStore.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import GroceryStore.dto.Billings;

public class BillingsDao {

	Connection con;

	public void createTable() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/grocery_db?createDatabaseIfNotExist=true",
				"root", "KaDB@1269");
		Statement s = con.createStatement();
		s.execute(
				"create table if not exists billings(billTime time primary key,billAmount decimal(10,2),billItems varchar(500),custemail varchar(45))");
		System.out.println("bill table created");
	}
	
	public int saveBill(Billings b) {
		
		try {
			createTable();
			PreparedStatement p = con.prepareStatement("insert into billings values(?,?,?,?)");
			p.setString(1, b.getBillTime());
			p.setDouble(2, b.getBillAmount());
			p.setString(3, b.getBillItems());
			p.setString(4, b.getCustemail());
			
			return p.executeUpdate();
			
		} catch (ClassNotFoundException | SQLException e) {
			System.out.println(" The reason of not billing is : "+e.getMessage());
		}
		return 0;
	}
}
