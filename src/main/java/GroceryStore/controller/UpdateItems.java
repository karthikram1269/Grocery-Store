package GroceryStore.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import GroceryStore.dao.GroceryDao;



@WebServlet("/editItem")
public class UpdateItems extends HttpServlet{
@Override
protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	int itemid= Integer.parseInt(req.getParameter("itemid"));
	String itemtype=req.getParameter("itemtype");
	HttpSession h = req.getSession();
	String itemname=(String)h.getAttribute("ItemName");

	int itemprice=Integer.parseInt(req.getParameter("price"));
	String itemquantity=req.getParameter("quantity");
	String itemimage=req.getParameter("image");
	
	
	GroceryDao dao=new GroceryDao();
	int result;
	try {
		result = dao.updateItems(itemprice, itemquantity, itemimage, itemname);
		if(result>0) {
			req.setAttribute("upmsg", "updated successfully...");	
			req.getRequestDispatcher("updateitems.jsp").include(req,res);
			
			}
			else {
				System.out.println("not updated....");
			}
		
	}	catch(Exception e) {
		e.printStackTrace();
	}
	
}
}
