package GroceryStore.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import GroceryStore.dao.GroceryDao;


@WebServlet("/deleteitem")
public class DeleteItem extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession h = req.getSession();
		String itemname=(String)h.getAttribute("ItemName");
		if(itemname!=null) {

			GroceryDao dao=new GroceryDao();
			int result=dao.deleteItem(itemname);
			if(result>0) {
				
				req.getRequestDispatcher("deleteitem.jsp").forward(req, resp);
				req.setAttribute("delmsg", "deleted sucessfully");
			}else {
				
				req.setAttribute("delmsgs", "Item not deleted");
			}
		}else {
			req.getRequestDispatcher("fetch.jsp").include(req, resp);
			req.setAttribute("delmsgs1", "No such item exists");
		}
	}
	}
	

