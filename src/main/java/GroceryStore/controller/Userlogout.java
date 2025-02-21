package GroceryStore.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/Userlogout")
public class Userlogout extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession h = req.getSession(false);
		if(h!=null) {
			h.invalidate();
			
			RequestDispatcher dis= req.getRequestDispatcher("register.jsp");
			dis.forward(req, resp);
		}
	}
	
}
