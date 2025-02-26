<%@page import="GroceryStore.dto.User"%>
<%@page import="GroceryStore.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .profile-container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: left;
            max-width: 400px;
            width: 100%;
        }

        h2 {
            color: #333;
            margin-bottom: 15px;
            text-align: center;
        }

        p {
            font-size: 16px;
            color: #555;
            margin: 10px 0;
        }

        strong {
            color: #333;
        }

        .back-btn {
            display: inline-block;
            margin-top: 15px;
            text-decoration: none;
            color: white;
            background-color: #007bff;
            padding: 10px 15px;
            border-radius: 5px;
            text-align: center;
            transition: 0.3s ease;
        }

        .back-btn:hover {
            background-color: #0056b3;
        }

        .back-btn-container {
            text-align: center;
        }
    </style>
</head>
<body>

    <div class="profile-container">
        <h2>User Profile</h2>

        <%
            HttpSession h = request.getSession();
            String email = (String) h.getAttribute("loginEmail");

            UserDao u = new UserDao();
            User db = u.fetchUser(email);
            if (db != null) {
        %>
            <p><strong>User Type:</strong> <%= db.getUsertype() %></p>
            <p><strong>Name:</strong> <%= db.getName() %></p>
            <p><strong>Email:</strong> <%= db.getEmail() %></p>
            <p><strong>Password:</strong> <%= db.getPassword() %></p>
            <p><strong>Phone:</strong> <%= db.getPhone() %></p>
            <p><strong>Address:</strong> <%= db.getAddress() %></p>
        <%
            }
        %>

        <div class="back-btn-container">
            <a href="profile.jsp" class="back-btn">Go Back</a>
        </div>
    </div>

</body>
</html>

