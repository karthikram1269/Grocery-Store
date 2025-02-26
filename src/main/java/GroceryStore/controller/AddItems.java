package GroceryStore.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import GroceryStore.dao.GroceryDao;
import GroceryStore.dto.Grocery;

@WebServlet("/additem")
public class AddItems extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// Parse request parameters safely
			int itemid = Integer.parseInt(req.getParameter("itemid"));
			String itemtype = req.getParameter("itemtype");
			String itemname = req.getParameter("name");
			int itemprice = Integer.parseInt(req.getParameter("price"));
			String itemquantity = req.getParameter("quantity");
			String itemimage = req.getParameter("image");

			// Get user email from session
			HttpSession session = req.getSession();
			String email = (String) session.getAttribute("loginEmail");

			if (email == null) {
				throw new ServletException("User is not logged in.");
			}

			// Create Grocery object
			Grocery grocery = new Grocery(itemid, itemtype, itemname, itemprice, itemquantity, itemimage, email);
			System.out.println(grocery);

			// Save item using DAO
			GroceryDao dao = new GroceryDao();
			int result = dao.saveItem(grocery);
			System.out.println(result + " item added successfully");

			// Send response to JSP
			if (result > 0) {
				req.setAttribute("msg", "Item added successfully...");
				req.getRequestDispatcher("vendashboard.jsp").include(req, resp);
			} else {
				req.setAttribute("msg", "Failed to add item.");
				req.getRequestDispatcher("error.jsp").include(req, resp);
			}
		} catch (NumberFormatException e) {
			System.err.println("Invalid number format: " + e.getMessage());
			req.setAttribute("error", "Invalid input format. Please enter valid numbers.");
			req.getRequestDispatcher("error.jsp").include(req, resp);
		} catch (SQLException e) {
			System.err.println("Database error: " + e.getMessage());
			req.setAttribute("error", "Database error. Please try again later.");
			req.getRequestDispatcher("error.jsp").include(req, resp);
		} catch (ServletException e) {
			System.err.println("Servlet error: " + e.getMessage());
			req.setAttribute("error", "Session error. Please log in again.");
			resp.sendRedirect("login.jsp");
		} catch (Exception e) {
			System.err.println("Unexpected error: " + e.getMessage());
			req.setAttribute("error", "An unexpected error occurred. Please try again.");
			req.getRequestDispatcher("error.jsp").include(req, resp);
		}
	}
}
