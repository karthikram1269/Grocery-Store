<%@page import="GroceryStore.dto.Grocery"%>
<%@page import="GroceryStore.dao.GroceryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Item</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f9f9f9;
        margin: 0;
        padding: 20px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    form {
        background: #ffffff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        max-width: 500px;
        width: 100%;
    }
    form input {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #cccccc;
        border-radius: 5px;
        box-sizing: border-box;
    }
    form input[type="submit"] {
        background-color: #007bff;
        color: #ffffff;
        border: none;
        cursor: pointer;
        transition: background-color 0.3s;
    }
    form input[type="submit"]:hover {
        background-color: #0056b3;
    }
    h1 {
        color: #333333;
        text-align: center;
    }
    a {
        display: block;
        margin-top: 20px;
        text-align: center;
        color: #007bff;
        text-decoration: none;
    }
    a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>

<%
	HttpSession h = request.getSession();
	String itemname = (String) h.getAttribute("ItemName");
	GroceryDao dao = new GroceryDao();
	Grocery db = dao.fetchItem(itemname);

	if (db != null) {
%>
<form action="editItem">
    <label for="itemid">Item Id:</label>
    <input type="number" id="itemid" value="<%= db.getItemid() %>" readonly="readonly" name="itemid">

    <label for="itemtype">Item Type:</label>
    <input type="text" id="itemtype" name="itemtype" value="<%= db.getItemtype() %>" readonly="readonly">

    <label for="name">Item Name:</label>
    <input type="text" id="name" name="name" value="<%= db.getItemname() %>">

    <label for="price">Item Price:</label>
    <input type="number" id="price" name="price" value="<%= db.getItemprice() %>">

    <label for="quantity">Item Quantity:</label>
    <input type="text" id="quantity" name="quantity" value="<%= db.getItemquantity() %>">

    <label for="image">Item Image:</label>
    <input type="text" id="image" placeholder="Enter image URL" name="image" value="<%= db.getItemimage() %>">

    <label for="email">Email:</label>
    <input type="text" id="email" name="email" value="<%= db.getEmail() %>" readonly="readonly">

    <input type="submit" value="Edit">
</form>

<%
	} else {
		request.getRequestDispatcher("vendashboard.jsp").include(request, response);
	}
%>
<a href="vendashboard.jsp">Click here to go back</a>

<%
	String msg = (String) request.getAttribute("upmsg");
	if (msg != null) {
%>
<h1><%= msg %></h1>
<%
	}
%>

</body>
</html>
