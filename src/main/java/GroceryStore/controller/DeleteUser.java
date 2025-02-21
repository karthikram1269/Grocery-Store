package GroceryStore.controller;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import GroceryStore.dao.UserDao;



@WebServlet("/delete")
public class DeleteUser extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	     String password= req.getParameter("password");
	     HttpSession h = req.getSession();
	     String sessionEmail= (String)h.getAttribute("loginEmail");
	     
	     if(sessionEmail!=null) {
				UserDao dao=new UserDao();
				int result=dao.deleteUser(sessionEmail,password);
				if(result>0) {
					
					req.getRequestDispatcher("register.jsp").include(req, resp);
				}else {
					req.setAttribute("delmsg", "please enter your password properly");
					req.getRequestDispatcher("delete.jsp").include(req, resp);
				}
			}else {
				req.getRequestDispatcher("login.jsp").include(req, resp);
			}
		}
	     
	}


