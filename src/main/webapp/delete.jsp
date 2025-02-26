<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .delete-container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
            max-width: 400px;
            width: 100%;
        }

        h2 {
            color: #333;
            margin-bottom: 15px;
        }

        p {
            color: #666;
            font-size: 16px;
            margin-bottom: 20px;
        }

        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        .delete-btn {
            background-color: red;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s ease;
        }

        .delete-btn:hover {
            background-color: darkred;
        }

        .back-btn {
            display: inline-block;
            margin-top: 15px;
            text-decoration: none;
            color: white;
            background-color: #007bff;
            padding: 8px 15px;
            border-radius: 5px;
            transition: 0.3s ease;
        }

        .back-btn:hover {
            background-color: #0056b3;
        }

        .message {
            font-size: 18px;
            color: green;
            margin-top: 15px;
        }
    </style>
</head>
<body>

    <div class="delete-container">
        <h2>Confirm Deletion</h2>
        <p>Are you sure you want to delete? Enter your password to proceed.</p>

        <form action="delete" method="post">
            <input type="password" name="password" placeholder="Enter your password" required>
            <br>
            <input type="submit" value="DELETE" class="delete-btn">
        </form>

        <%
        String msg = (String) request.getAttribute("delmsg");
        if (msg != null) {
        %>
            <p class="message"><%= msg %></p>
        <%
        }
        %>

        <p><a href="profile.jsp" class="back-btn">Cancel and Go Back</a></p>
    </div>
</body>
</html>
