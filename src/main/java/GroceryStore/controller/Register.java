package GroceryStore.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import GroceryStore.dao.UserDao;
import GroceryStore.dto.User;


@WebServlet("/register")
public class Register extends HttpServlet{
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	String usertype=req.getParameter("usertype");
	String name=req.getParameter("name");
	String email=req.getParameter("email");
	String password=req.getParameter("password");
	long phone= Long.parseLong(req.getParameter("phone"));
	String address= req.getParameter("address");
	User user= new User(usertype,name,email,password,phone,address);
	System.out.println(user);
	UserDao dao=new UserDao();
	try {
		int result=dao.saveUser(user);
		System.out.println("inserted "+result+" rows");
		RequestDispatcher dis=req.getRequestDispatcher("login.jsp");
		dis.forward(req, resp);
		dao.createTable();
	} catch (Exception e) {
		req.setAttribute("ExistMes","User already exists,try with some other details or login");
		RequestDispatcher dis= req.getRequestDispatcher("register.jsp");
		dis.include(req, resp);
	} 
	
}
	
}
