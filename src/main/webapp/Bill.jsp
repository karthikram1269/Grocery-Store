<%@page import="GroceryStore.dto.Billings"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bill Confirmation</title>
<style>
    /* General Page Styling */
    body {
        font-family: 'Poppins', sans-serif;
        background-color: #f4f4f4;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    /* Main Bill Container */
    .bill-container {
        background: white;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        text-align: center;
        max-width: 400px;
    }

    h1 {
        color: #2c3e50;
        margin-bottom: 10px;
    }

    h6 {
        color: #555;
        font-size: 16px;
        margin-bottom: 15px;
    }

    p {
        font-size: 18px;
        color: #27ae60;
        font-weight: bold;
    }

    /* Dashboard Button */
    .dashboard-btn {
        display: inline-block;
        background-color: #3498db;
        color: white;
        padding: 12px 20px;
        border: none;
        border-radius: 5px;
        font-size: 18px;
        cursor: pointer;
        box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.2);
        transition: background 0.3s, transform 0.2s;
        text-decoration: none;
        margin-top: 15px;
    }

    .dashboard-btn:hover {
        background-color: #2980b9;
        transform: scale(1.05);
    }
</style>
</head>
<body>

<%
Billings b = (Billings) session.getAttribute("billa");
%>

<div class="bill-container">
    <h1>Bill Completed ✅</h1>
    <h6>Bill No: <%= b.getBillTime() %></h6>
    <p>Thank you! Visit again 😊</p>

    <!-- Dashboard Button -->
    <a href="cusdashboard.jsp" class="dashboard-btn">Go to Dashboard</a>
</div>

</body>
</html>
