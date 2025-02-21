<%@page import="GroceryStore.dto.Billings"%>
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
		Billings b = (Billings)session.getAttribute("billa");
	%>
	<div>
		<h1> BiLL done</h1>
		<h6>Bill no - <%=b.getBillTime()%></h6>
		 <p>Thank you !! visit again &#x1F60A;</p>
	</div>
</body>
</html>