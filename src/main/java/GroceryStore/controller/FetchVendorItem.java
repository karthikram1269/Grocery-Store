package GroceryStore.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import GroceryStore.dao.GroceryDao;
import GroceryStore.dto.Grocery;

@WebServlet("/search")
public class FetchVendorItem extends HttpServlet {
	GroceryDao dao = new GroceryDao();

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession ses = req.getSession();
		String email = (String) ses.getAttribute("loginEmail");
		String itemname = req.getParameter("itemname");
		Grocery db = dao.fetchItem(email,itemname);

		if (db != null) {
			
			HttpSession h = req.getSession();
			h.setAttribute("ItemName", itemname);
			req.setAttribute("itmmsg", "Item fetched successfully!");
			req.setAttribute("item", db);

			// Send Grocery object to JSP
			req.getRequestDispatcher("venfetch.jsp").forward(req, resp);
		} else {
			req.setAttribute("itmmsg", "No such item exists in your database.");
			req.getRequestDispatcher("venfetch.jsp").include(req, resp);
		}
	}
}
