package GroceryStore.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import GroceryStore.dao.CartDao;
import GroceryStore.dao.GroceryDao;
import GroceryStore.dto.Cart;
import GroceryStore.dto.Grocery;

@WebServlet("/savecrt")
public class SaveToCart extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		GroceryDao dao = new GroceryDao();
		Grocery g = dao.fetchItem(req.getParameter("name"));
	
		int cartId=g.getItemid();
		String cItemName=g.getItemname();
		int cItemPrice=g.getItemprice();
		String cItemImage= g.getItemimage();
		String custEmail = (String) session.getAttribute("loginEmail");
		
		Cart c = new Cart(cartId, cItemName, cItemPrice, cItemImage, custEmail);

		CartDao cdao = new CartDao();
		try {
			int result=cdao.saveCartItem(c);
			System.out.println(result+" cart item added sucessfully");
			if(result>0) {
				req.setAttribute("cartmsg", "Item added successfully...");	
				Grocery[] groceries = dao.fetchAllItems();
				req.setAttribute("fAllItems", groceries);
				req.getRequestDispatcher("cusdashboard.jsp").include(req,resp);
				}
				else {
					System.out.println("cart Item not Added....");
				}
		} catch (Exception e) {
			Grocery[] groceries = dao.fetchAllItems();
			req.setAttribute("fAllItems", groceries);
			req.getRequestDispatcher("cusdashboard.jsp").include(req,resp);
			System.out.println("Already added to cart : "+e.getMessage());
		} 
	}
}
