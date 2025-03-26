package GroceryStore.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/ut")
public class Userlogout extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5655757644716632061L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println(" entered user logn out .java");
		HttpSession h = req.getSession(false);
		if(h!=null) {
			h.invalidate();
			System.out.println(" entered not nulluser logn out .java");
			RequestDispatcher dis= req.getRequestDispatcher("register.jsp");
			dis.forward(req, resp);
		}
	}
	
}
