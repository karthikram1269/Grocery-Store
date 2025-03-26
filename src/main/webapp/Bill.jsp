<%@page import="GroceryStore.dto.Billings"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{
	margin:0;
	padding:0;
	box-sizing:border-box;
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
    #dBut,#dBut2{
    	padding:10px 8px;
    	color:white;
    	background-color:green;
        border-radius: 5px;
        padding: 10px 20px;
        font-size: 16px;
        cursor: pointer;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        transition: background-color 0.3s;
    }
    #dBut2{
    	background-color:red;
    	position:absolute;
    	top : 120px;
    	right:50px;
    }
</style>
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
	
	<form id="dash" action="login" method="post">
			<%
			HttpSession ses = request.getSession();
			%>
			<input name="email" type="email"
				value="<%=ses.getAttribute("loginEmail")%>" hidden="true"> <input
				type="radio" value="customer" name="usertype" checked="checked"
				hidden="true"> 
				<input type="password" name="password"
				value="<%=ses.getAttribute("loginPwd")%>" hidden="true">
		<a href="cusdashboard.jsp"><button id="dBut">DashBoard</button></a>
		<br><br>
		</form>
		<a href="ut"><button id="dBut2">LOGOUT</button></a>
	
</body>
</html>