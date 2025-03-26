<%@page import="GroceryStore.dto.User"%>
<%@page import="GroceryStore.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Item</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f0f4f8;
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

form input, form select {
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
}

form input[type="submit"]:hover {
	background-color: #0056b3;
}

h1 {
	color: #333333;
	text-align: center;
}
button {
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        padding: 10px 20px;
        font-size: 16px;
        cursor: pointer;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        transition: background-color 0.3s;
    }
    button:hover {
        background-color: #0056b3;
    }
    button:focus {
        outline: none;
    }
    a button {
        display: inline-block;
        margin: 0 auto;
    }
    #dash{
    	position:absolute;
    	top : 50px;
    	right:50px;
    }
    #dBut{
    	padding:10px 8px;
    	color:white;
    	background-color:green;
    	border:none;
        border-radius: 5px;
        padding: 10px 20px;
        font-size: 16px;
        cursor: pointer;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        transition: background-color 0.3s;
    }
</style>
</head>
<body>
	<%
	HttpSession h = request.getSession();
	String email = (String) h.getAttribute("loginEmail");
	UserDao dao = new UserDao();
	User db = dao.fetchUser(email);
	if (db != null) {
	%>
	
	<div id="dash">
		<a href="vendashboard.jsp"><button id="dBut">DashBoard</button></a>
	</div>
	
	<form action="additem" method="post">
		<label for="itemid">Item Id:</label> <input type="number" id="itemid"
			placeholder="Enter the item id" name="itemid"> <label
			for="itemtype">Item Type:</label> <select id="itemtype"
			name="itemtype">
			<option value="fruits">Fruits</option>
			<option value="vegetables">Vegetables</option>
			<option value="snacks">Snacks</option>
		</select> <label for="name">Item Name:</label> <input type="text" id="name"
			placeholder="Enter the item name" name="name"> <label
			for="price">Item Price:</label> <input type="number" id="price"
			placeholder="Enter the item price" name="price"> <label
			for="quantity">Item Quantity:</label> <input type="text"
			id="quantity" placeholder="Enter the item quantity" name="quantity">

		<label for="image">Item Image:</label> <input type="url" id="image"
			placeholder="Provide the image URL" name="image"> <label
			for="email">Email:</label> <input type="email" id="email"
			name="email" value="<%=db.getEmail()%>" readonly="readonly">

		<input type="submit" value="Add Items">
	</form>
	<%
	} else {
	request.getRequestDispatcher("vendashboard.jsp").include(request, response);
	}
	%>

</body>
</html>
