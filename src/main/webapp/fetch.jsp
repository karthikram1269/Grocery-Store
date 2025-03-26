<%@page import="GroceryStore.dto.Grocery"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Item Details</title>
<link rel="stylesheet" type="text/css" href="style.css">
<style type="text/css">
     #dash{ 
     	position:absolute; 
     	top : 50px; 
     	right:50px; 
     } 
     #dBut,button{ 
     	color:white;
     	border:2px solid grey;
     	background-color:black; 
     	font-size: 16px;
     	padding: 10px 20px;
     	border-radius:5px ;
        cursor: pointer;
        box-shadow: 4px 4px 6px rgba(0, 0, 0, 0.2), 
                -4px -4px 6px rgba(255, 255, 255, 0.7); /* 3D effect */
    transition: all 0.2s ease-in-out;
     }  

	#dBut:hover {
        background-color: #0056b3;
    }
    #upDel{
    	position:absolute;
    	bottom:30px;
    	right:40px;
    }
    .but{
    	font-size: 13px;
    }
    #upDel a:nth-child(2) button {
    	background-color: red;
	}
	#upDel a:nth-child(1) button {
    	background-color: orange;
	}
	
	
	

</style>
</head>
<body>

	<div id = "dash">
		<a href = "vendashboard.jsp"><button id = "dBut"> DashBoard</button></a>
	</div>

    <form action="search" method="post">
        <label for="itemname">Item name:</label>
        <input type="text" id="itemname" name="itemname" placeholder="Enter the Item name" required>
        <input type="submit" value="Search">
    </form>
	
    <%
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
       	<div id = "upDel">
       	 	<a href="updateitems.jsp"><button class = "but">Update Items</button></a>
        	<a href="deleteitem"><button class = "but">Delete Items</button></a>
       	</div>
    <%
        
        }
    %>
    
    <script>
    <%
    String msg = (String) request.getAttribute("itmmsg");
    if (msg != null) {
%>
    	alert("<%= msg %>");
<%
    }
    %>
    </script>

</body>
</html>
