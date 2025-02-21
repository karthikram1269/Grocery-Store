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
		int itemid = Integer.parseInt(req.getParameter("itemid"));
		String itemtype = req.getParameter("itemtype");
		String itemname = req.getParameter("name");
		int itemprice = Integer.parseInt(req.getParameter("price"));
		String itemquantity = req.getParameter("quantity");
		String itemimage = req.getParameter("image");
		HttpSession h = req.getSession();
		String email = (String) h.getAttribute("loginEmail");
		Grocery grocery = new Grocery(itemid, itemtype, itemname, itemprice, itemquantity, itemimage, email);
		System.out.println(grocery);
		GroceryDao dao = new GroceryDao();
		try {
			int result = dao.saveItem(grocery);
			System.out.println(result + " item added sucessfully");
			if (result > 0) {
				req.setAttribute("msg", "Item added successfully...");
				req.getRequestDispatcher("vendashboard.jsp").include(req, resp);

			} else {
				System.out.println("Item not Added....");
			}
		} catch (Exception e) {

			e.printStackTrace();
		}
	}
}
