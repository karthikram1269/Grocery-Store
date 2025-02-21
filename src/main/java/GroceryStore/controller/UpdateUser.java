package GroceryStore.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import GroceryStore.dao.UserDao;



@WebServlet("/edit")
public class UpdateUser extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String name=req.getParameter("name");
		long phone=Long.parseLong(req.getParameter("phone"));
		String address=req.getParameter("address");
		
		
		HttpSession h = req.getSession();
		String sessionemail = (String)h.getAttribute("loginEmail");
		UserDao dao=new UserDao();
		int result;
		try {
			result = dao.updateUser(name,phone,address,sessionemail);
			if(result>0) {
				req.setAttribute("upmsg", "updated successfully...");	
				req.getRequestDispatcher("update.jsp").include(req,res);
				
				}
				else {
					System.out.println("not updated....");
				}
			
			
			
		}	catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
}
