<%@page import="GroceryStore.dto.User"%>
<%@page import="GroceryStore.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

body * {
	margin-bottom: 20px;
	font-size: 18px;
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
	<div id="dash">
		<a href="vendashboard.jsp"><button id="dBut">DashBoard</button></a>
	</div>
	<%
	HttpSession h = request.getSession();
	String email = (String) h.getAttribute("loginEmail");

	UserDao u = new UserDao();
	User db = u.fetchUser(email);
	if (db != null) {
	%>

	<div>
		<p>
			<strong>UserType: </strong><i><%=db.getUsertype()%></i></p>
		<p>
			<strong>Name: </strong><i><%=db.getName()%></i></p>
		<p>
			<strong>Email: </strong><i><%=db.getEmail()%></i></p>
		<p>
			<strong>Password: </strong><i><%=db.getPassword()%></i></p>
		<p>
			<strong>Phone: </strong><i><%=db.getPhone()%></i></p>
		<p>
			<strong>Address: </strong><i><%=db.getAddress()%></i></p>

	</div>
	<%
	}
	%>
</body>
</html>

