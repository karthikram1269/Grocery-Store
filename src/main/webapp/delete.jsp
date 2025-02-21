<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="delete" method="post">
<p>Are you ok to delete! then enter your password to proceed</p>
Password:<input type="password" name="password">
<input type="submit" value="DELETE">
</form>
<%String msg=(String)request.getAttribute("delmsg");
 if(msg!=null){%>
 <h1 ><%=msg %></h1>
 <% } %>
 
<p>If you do not want to delete<a href="profile.jsp">Click here to go back</a></p>
</body>
</html>