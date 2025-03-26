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
	box-sizing: border-box;
}

#dash {
	position: absolute;
	top: 50px;
	right: 50px;
}

#dBut {
	padding: 10px 8px;
	color: white;
	background-color: green;
	border: none;
	border-radius: 5px;
	padding: 10px 20px;
	font-size: 16px;
	cursor: pointer;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	transition: background-color 0.3s;
}

body {
	display: flex;
	flex-direction:column;
	justify-content: center;
	align-items:center;
	height:100vh;
}

body *{
	margin-bottom:20px;
	text-align:center;
}
input[type="submit"]{
	color:white;
	background-color:red;
	border:none;
	border-radius:5px;
	padding:10px 20px;
	font-size:16px;
	box-shadow: 0px 0px 5px rgba(0,0,0,0.4);
}

input[type="submit"]:hover{
	background-color:maroon;
}
label{
font-size: 20px;
}
</style>
</head>
<body>
	<div id="dash">
		<a href="vendashboard.jsp"><button id="dBut">DashBoard</button></a>
	</div>

	<h1>Are you sure to delete?</h1>
	<p>then enter your password to proceed</p>

	<form action="delete" method="post">
		<label>Password:</label>
		<input type="password" name="password"> 
		<br>
		<input	type="submit" value="DELETE">
	</form>
	<%
	String msg = (String) request.getAttribute("delmsg");
	if (msg != null) {
	%>
	<h1><%=msg%></h1>
	<%
	}
	%>


</body>
</html>