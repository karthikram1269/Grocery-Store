<%@page import="GroceryStore.dto.User"%>
<%@page import="GroceryStore.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
        HttpSession h = request.getSession();
        String email=(String)h.getAttribute("loginEmail");
         
		UserDao u = new UserDao();
		User db=u.fetchUser(email);
		if(db!=null){
			%>
			
			<p>  <strong>UserType:</strong><%= db.getUsertype()%></p>
			<p>  <strong>name:</strong><%= db.getName() %></p>
			<p>  <strong>email:</strong><%= db.getEmail() %></p>
			<p>  <strong>password:</strong><%= db.getPassword() %></p>
			<p>  <strong>phone:</strong><%= db.getPhone() %></p>
			<p>  <strong>address:</strong><%= db.getAddress() %></p>
			
			<% 
		}
%>
<p>If you do not want to delete<a href="profile.jsp">Click here to go back</a></p>
</body>
</html>

