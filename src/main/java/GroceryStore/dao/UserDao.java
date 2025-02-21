package GroceryStore.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import GroceryStore.dto.User;




public class UserDao {

	Connection con;
	public void createTable() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/grocery_db?createDatabaseIfNotExist=true","root","KaDB@1269");
		 System.out.println("data base is created");
		Statement s= con.createStatement();
  
		s.execute("create table if not exists register(usertype varchar(45),name varchar(45),email varchar(45) primary key,password varchar(45),phone bigint(10),address varchar(45))");
		System.out.println("table is created");
	}
	
	public int saveUser(User user) throws SQLException, ClassNotFoundException {
		createTable();
		PreparedStatement p= con.prepareStatement("insert into register values(?,?,?,?,?,?)");
		p.setString(1, user.getUsertype());
		p.setString(2,user.getName());
		p.setString(3, user.getEmail());
		p.setString(4, user.getPassword());
		p.setLong(5, user.getPhone());
		p.setString(6, user.getAddress());
		return p.executeUpdate();
	}
	
	
	 public User fetchUser(String email) {
			try {
				 createTable();
				  PreparedStatement p = con.prepareStatement("select * from register where email=?");
				  p.setString(1,email);
				  ResultSet rs=p.executeQuery();
				  if(rs.next()) {
					return new User(rs.getString("usertype"),rs.getString("name"),rs.getString("email"),rs.getString("password"),rs.getLong("phone"),rs.getString("address")) ; 
				  }
				  
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 return null; 
		  }
	 
	  
	    public int updateUser(String name,long phone,String address,String email) {
	    	
	    	try {
	    		createTable();
				PreparedStatement p = con.prepareStatement("update register set name=?,phone=?,address=? where email=?");
				p.setString(1, name);
				p.setLong(2, phone);
				p.setString(3, address);
			    p.setString(4, email);
				return p.executeUpdate();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	return 0;
	    		}
	    
	    public int deleteUser(String email,String password) {
	    	
	    	try {
	    		createTable();
				PreparedStatement p = con.prepareStatement("delete from register where email=? and password=?");
				p.setString(1, email);
				p.setString(2, password);
				 return p.executeUpdate();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	return 0;
	    }
}
