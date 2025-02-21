<%@page import="GroceryStore.dto.User"%>
<%@page import="GroceryStore.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
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
        border: 1px solid #ced4da;
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
        margin-bottom: 20px;
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
    h1, h2 {
        color: #495057;
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
    <form action="edit" method="post">
        <h1>Edit Profile</h1>

        <label for="usertype">User Type:</label>
        <input type="text" id="usertype" value="<%= db.getUsertype() %>" readonly="readonly">

        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="<%= db.getName() %>">

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="<%= db.getEmail() %>" readonly="readonly">

        <label for="psw">Password:</label>
        <input type="password" id="psw" name="psw" value="<%= db.getPassword() %>" readonly="readonly">

        <label for="phone">Phone:</label>
        <input type="tel" id="phone" placeholder="Enter your phone" name="phone" value="<%= db.getPhone() %>">

        <label for="address">Address:</label>
        <input type="text" id="address" placeholder="Enter your address" name="address" value="<%= db.getAddress() %>">

        <input type="submit" value="Edit">
    </form>
<%
    } else {
        request.getRequestDispatcher("login.jsp").include(request, response);
    }
%>
<a href="profile.jsp">Click here to go back</a>
<%
    String msg = (String) request.getAttribute("upmsg");
    if (msg != null) {
%>
    <h2><%= msg %></h2>
<%
    }
%>
</body>
</html>
