<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Form</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f0f4f8;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

form {
	background: #ffffff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	max-width: 400px;
	width: 100%;
}

h1 {
	text-align: center;
	margin-bottom: 20px;
	color: #333333;
}

label {
	display: block;
	margin-bottom: 8px;
	font-weight: bold;
	color: #555555;
}

input[type="text"], input[type="email"], input[type="password"], input[type="tel"]
	{
	width: 100%;
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #cccccc;
	border-radius: 5px;
	box-sizing: border-box;
}

input[type="radio"] {
	margin-right: 5px;
}

.radio-group {
	margin-bottom: 15px;
}

input[type="submit"] {
	background-color: #007bff;
	color: #ffffff;
	padding: 10px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	width: 100%;
}

input[type="submit"]:hover {
	background-color: #0056b3;
}

p {
	text-align: center;
	margin-top: 15px;
}

p a {
	color: #007bff;
	text-decoration: none;
}

p a:hover {
	text-decoration: underline;
}

.error-message {
	color: red;
	text-align: center;
	margin-top: 15px;
}
</style>
</head>
<body>
	<form action="register" method="post">
		<h1>Registration Form</h1>
		<div class="radio-group">
			<label>User Type:</label> <input type="radio" value="vendor"
				name="usertype"> Vendor <input type="radio" value="customer"
				name="usertype"> Customer
		</div>
		<label for="name">Name:</label> <input type="text" id="name"
			placeholder="Enter your name" name="name"> <label for="email">Email:</label>
		<input type="email" id="email" placeholder="Enter your email"
			name="email"> <label for="password">Password:</label> <input
			type="password" id="password" placeholder="Enter your password"
			name="password"> <label for="phone">Mobile Number:</label> <input
			type="tel" id="phone" placeholder="Enter your mobile number"
			name="phone"> <label for="address">Address:</label> <input
			type="text" id="address" placeholder="Enter your address"
			name="address"> <input type="submit" value="REGISTER">
	</form>
	<p id="cormth">
	<span id="account-text">Already have an account?</span> <a href="login.jsp">Login from here</a>
</p>

<%
	String msg = (String) request.getAttribute("ExistMes");
	if (msg != null) {
%>
<div class="error-message" id="error-msg"><%=msg%></div>
<%
	}
%>

<script>
	// Check if the error message exists
	window.onload = function() {
		const errorMessage = document.getElementById('error-msg');
		if (errorMessage) {
			// Only clear the "Already have an account?" text
			const accountText = document.getElementById('account-text');
			if (accountText) {
				accountText.textContent = ''; // Clear the text content
			}
		}
	};
</script>


</body>
</html>
