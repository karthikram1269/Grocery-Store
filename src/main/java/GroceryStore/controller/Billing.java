package GroceryStore.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import GroceryStore.dao.BillingsDao;
import GroceryStore.dao.CartDao;
import GroceryStore.dto.Billings;
import GroceryStore.dto.Cart;

@WebServlet("/billing")
public class Billing extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Billings b = new Billings();
		BillingsDao bdao = new BillingsDao();
		CartDao cd = new CartDao();
		HttpSession ses = req.getSession();

		CartDao dao = new CartDao();
		String bill = req.getParameter("billAmount");
		b.setBillAmount(Double.parseDouble(bill));

		String email = (String)ses.getAttribute("loginEmail");

		Cart[] db = dao.fetchAllInCart();
		String billItems = "";
		for (int i = 0; i < db.length; i++) {
			Cart c = db[i];
			billItems += c.getcItemName() + "/";
		}
		
		b.setBillItems(billItems);

		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();
		String stt = dtf.format(now);
		b.setBillTime(stt);

		b.setCustemail(email);
		
		bdao.saveBill(b);
		cd.deleteCartTotal();
//		ses.invalidate();
		
		ses.setAttribute("billa", b);
		RequestDispatcher r = req.getRequestDispatcher("Bill.jsp");
		r.forward(req, resp);

//		session.setAttribute("cartView", dao.fetchAllInCart());
//
//		request.getRequestDispatcher("Cart.jsp").include(request, response);
//		Cart[] db = (Cart[]) req.getAttribute("cartView");
	}
}
