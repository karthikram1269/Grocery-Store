package GroceryStore.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import GroceryStore.dao.GroceryDao;
@WebServlet("/FetchAllHisItems")
public class FetchAllHisItems extends HttpServlet{

@Override
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	// TODO Auto-generated method stub
	HttpSession h = req.getSession();
	String email=(String)h.getAttribute("loginEmail");
	GroceryDao dao = new GroceryDao();
	try {
		int i = dao.fetchAllHisItems(email,resp);
		
	}catch(Exception e) {
		System.out.println(e.getMessage());
	}
}	
	
}
