<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Food Items Management</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f0f4f8;
	margin: 0;
	padding: 0;
	padding-left:100px;
	box-sizing:border-box;
	display: flex;
	justify-content: center;
	align-items: flex-start;
	height: 100vh;
	flex-direction: column;
/* 	border:2px solid black; */
	width:100vw;
}

h1 {
	color: #333;
	margin-bottom: 20px;
}

a {
	text-decoration: none;
	margin-bottom: 15px;
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
</style>
</head>
<body>
	<%
	String msg = (String) request.getAttribute("msg");
	if (msg != null) {
	%>
	<h1><%=msg%></h1>
	<%
	}
	%>
	<div>
		<h1>Food Items Management</h1>
	</div>
	<a href="profile.jsp"
		style="position: absolute; top: 80px; right: 80px; padding: 10px 20px; background-color: green; color: white; text-decoration: none; border-radius: 5px;">
		Profile </a> &nbsp;&nbsp;

	<div style = "display:flex;justify-content:space-between;flex-direction:column; margin:40px;">
		<a href="additems.jsp"><button>Add Food Items</button></a> <br> 
		<a href="venfetch.jsp"><button>Update Food Items</button></a> <br> 
		<a href="venfetch.jsp"><button>Delete Food Items</button></a> <br>
		<a href="venfetch.jsp"><button>Fetch Food Items based on Item name</button></a> <br> 
		<a href="FetchAllHisItems"><button>Fetch All His Items</button></a> <br>
	</div>

	<div>
	<%
		String s1 = (String) request.getAttribute("addIt");
		if(s1 != null){
	 %>
		<h1 style='color:red'><%=s1%></h1>
	<%} %>
	</div>

</body>
</html>
