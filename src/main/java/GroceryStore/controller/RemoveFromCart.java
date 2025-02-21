package GroceryStore.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import GroceryStore.dao.CartDao;
import GroceryStore.dto.Cart;

@WebServlet("/removeFrom")
public class RemoveFromCart extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Get the index from the request
		HttpSession session = request.getSession() ;
	    String indexParam = request.getParameter("index");
	    CartDao dao = new CartDao();
	    if (indexParam != null) {
	        int index = Integer.parseInt(indexParam);
	        Cart[] cartItems = (Cart[]) session.getAttribute("cartView");

	        if (cartItems != null && index >= 0 && index < cartItems.length) {
	            Cart itemToRemove = cartItems[index];
	            if (itemToRemove != null) {
	                // Logic to remove the item from the cart
	                dao.deleteCartItem(itemToRemove.getCartId()); // Hypothetical method to remove the item
	                // Optionally, update the session cart
	                // You may want to create a new array without the removed item
	            }
	        }
	    }
	    session.setAttribute("cartView", dao.fetchAllInCart());

	    request.getRequestDispatcher("Cart.jsp").include(request, response);
	}
}
