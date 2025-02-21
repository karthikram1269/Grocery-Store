<%@page import="GroceryStore.dto.Grocery"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Item Details</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>

    <form action="search" method="get">
        <label for="itemname">Item name:</label>
        <input type="text" id="itemname" name="itemname" placeholder="Enter the Item name" required>
        <input type="submit" value="Search">
    </form>
	
    <%
        String msg = (String) request.getAttribute("itmmsg");
        String msg2 = (String) request.getAttribute("itmmsg2");
        if (msg != null) {
    %>
        <h2><%= msg %></h2>
    <%
        }

        Grocery item = (Grocery) request.getAttribute("item");
        if (item != null) {
    %>
        <h3>Item Details:</h3>
        <table border="1">
            <tr>
                <th>Item ID</th>
                <td><%= item.getItemid() %></td>
            </tr>
            <tr>
                <th>Item Type</th>
                <td><%= item.getItemtype() %></td>
            </tr>
            <tr>
                <th>Item Name</th>
                <td><%= item.getItemname() %></td>
            </tr>
            <tr>
                <th>Item Price</th>
                <td><%= item.getItemprice() %></td>
            </tr>
            <tr>
                <th>Item Quantity</th>
                <td><%= item.getItemquantity() %></td>
            </tr>
            <tr>
                <th>Item Image</th>
                <td><img src="<%= item.getItemimage() %>" alt="Item Image" width="100"></td>
            </tr>
            <tr>
                <th>Email</th>
                <td><%= item.getEmail() %></td>
            </tr>
        </table>

        <!-- Anchor tags for Update and Delete are displayed only when an item is found -->
        <a href="updateitems.jsp"><button>Update Items</button></a>
        <a href="deleteitem"><button>Delete Items</button></a>
    <%
        } else {
    %>
        <h2><%= msg2 %></h2>
    <%
        }
    %>

</body>
</html>
