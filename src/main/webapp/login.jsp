<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Form</title>
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
        padding: 25px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        max-width: 400px;
        width: 100%;
    }
    h1 {
        text-align: center;
        margin-bottom: 20px;
        color: #333333;
        font-size: 1.5rem;
    }
    label {
        display: block;
        margin-bottom: 8px;
        font-weight: bold;
        color: #555555;
    }
    input[type="text"], input[type="email"], input[type="password"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #cccccc;
        border-radius: 5px;
        box-sizing: border-box;
        font-size: 1rem;
    }
    input[type="radio"] {
        margin-right: 8px;
        accent-color: #007bff;
    }
    .radio-group {
        margin-bottom: 15px;
        font-size: 1rem;
    }
    .radio-group label {
        display: inline;
        margin-right: 15px;
        color: #333;
    }
    input[type="submit"] {
        background-color: #007bff;
        color: #ffffff;
        padding: 10px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        width: 100%;
        font-size: 1rem;
        font-weight: bold;
    }
    input[type="submit"]:hover {
        background-color: #0056b3;
    }
    p {
        text-align: center;
        margin-top: 15px;
        font-size: 1rem;
    }
    p a {
        color: #007bff;
        text-decoration: none;
        font-weight: bold;
    }
    p a:hover {
        text-decoration: underline;
    }
    .error-message {
        color: red;
        text-align: center;
        margin-top: 15px;
        font-size: 1rem;
        font-weight: bold;
    }
</style>
</head>
<body>
    <form action="login" method="post">
        <h1>Login Form</h1>
        <label for="email">Email:</label>
        <input type="email" id="email" placeholder="Enter your email" name="email">

        <label for="password">Password:</label>
        <input type="password" id="password" placeholder="Enter your password" name="password">

        <div class="radio-group">
            <label>User Type:</label>
            <label><input type="radio" value="vendor" name="usertype"> Vendor</label>
            <label><input type="radio" value="customer" name="usertype"> Customer</label>
        </div>

        <input type="submit" value="LOGIN">

        <!-- Move the "Not registered yet?" line inside the form -->
        <p>
            Not registered yet? <a href="register.jsp">Register here</a>
        </p>
    </form>
    <% String msg = (String) request.getAttribute("pwdmsg");
       if (msg != null) { %>
       <div class="error-message"><%= msg %></div>
    <% } %>
    <% String msg1 = (String) request.getAttribute("emmsg");
       if (msg1 != null) { %>
       <div class="error-message"><%= msg1 %></div>
    <% } %>
</body>
</html>
