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
	
	@WebServlet("/cart")
	public class CartDisplay extends HttpServlet {

	    @Override
	    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	        HttpSession session = req.getSession();
	        CartDao dao = new CartDao();
	        Cart[] db = dao.fetchAllInCart();

	        if (db != null && db.length > 0) {
	            session.setAttribute("cartView", db);
	        } else {
	            session.setAttribute("cartView", null); // Ensure attribute is set even if the cart is empty
	            System.out.println("Nothing added to display in cart");
	        }

	        // Forward the request to the JSP page
	        req.getRequestDispatcher("Cart.jsp").forward(req, resp);
	    }
	}

