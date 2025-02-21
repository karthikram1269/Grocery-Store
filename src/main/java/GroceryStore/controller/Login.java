package GroceryStore.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import GroceryStore.dao.GroceryDao;
import GroceryStore.dao.UserDao;
import GroceryStore.dto.Grocery;
import GroceryStore.dto.User;

@WebServlet("/login")
public class Login extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String usertype = req.getParameter("usertype");

		UserDao dao = new UserDao();
		GroceryDao gdao = new GroceryDao();
		User db = dao.fetchUser(email);
		if (db != null) {
			if (db.getPassword().equals(password) && db.getUsertype().equals(usertype)) {
				HttpSession httpsession = req.getSession();
				httpsession.setAttribute("loginEmail", email);
				httpsession.setAttribute("loginPwd", password);
				httpsession.setAttribute("logintype", usertype);

				if (usertype.equals("vendor")) {
					req.getRequestDispatcher("vendashboard.jsp").forward(req, resp);
				} else {
					Grocery[] groceries = gdao.fetchAllItems();
					req.setAttribute("fAllItems", groceries);
					req.getRequestDispatcher("cusdashboard.jsp").forward(req, resp);
				}
			} else {
				req.setAttribute("pwdmsg", "invalid details");
				req.getRequestDispatcher("login.jsp").include(req, resp);
			}
		} else {
			req.setAttribute("emmsg", "email is invalid");
			req.getRequestDispatcher("login.jsp").include(req, resp);
		}
	}

}
