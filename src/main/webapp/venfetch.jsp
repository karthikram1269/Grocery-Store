<%@page import="GroceryStore.dto.Grocery"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Item Details</title>
<link rel="stylesheet" type="text/css" href="style.css">
<style>
/* Global Styles */
body {
	position: relative;
	font-family: Arial, sans-serif;
	background-color: #f0f4f8;
	margin: 0;
	padding: 0;
	min-height: 100vh;
	box-sizing: border-box;
}

/* Dashboard Button */
.dashboard-btn {
	position: absolute;
	right: 20px;
	text-decoration: none;
	background-color: green;
	color: white;
	padding: 12px 20px;
	border-radius: 5px;
	font-size: 14px;
	transition: background-color 0.3s ease;
	border: 1px solid black;
	box-shadow: 3px 3px 0px rgba(0, 0, 0, 0.5);
	margin-bottom: 20px;
}

.dashboard-btn:hover {
	background-color: lightblue;
}

form {
	width: 400px;
	background-color: white;
	padding: 10px;
	border-radius: 8px;
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
	margin-bottom: 20px;
	background-color: white;
}

form label {
	font-weight: bold;
	margin-right: 10px;
}

form input[type="text"] {
	border: 1px solid #ccc;
	border-radius: 5px;
}

form input[type="submit"] {
	background-color: blue;
	color: white;
	/* 	padding: 10px 0px; */
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

form input[type="submit"]:hover {
	background-color: darkblue;
}

/* Error Message */
.error-msg {
	color: red;
	font-size: 20px;
	margin-top: 20px;
}

/* Item Container */
.item-container {
	background-color: white;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
	width: 50%;
	text-align: center;
}

/* Table Styling */
table {
	position: relative;
	width: 100%;
	border-collapse: collapse;
	margin-top: 10px;
}

table, th, td {
	border: 1px solid black;
}

th, td {
	padding: 10px;
	text-align: left;
}

/* Buttons */
span {
	margin: 200px 40px 0px;
}

button {
	background-color: orange;
	border: none;
	padding: 10px 15px;
	color: white;
	font-size: 16px;
	cursor: pointer;
	border-radius: 5px;
}

button:hover {
	background-color: darkorange;
}
</style>
</head>

<body>
	<script>
		window.onload = function() {

			const delItem = document.getElementById("del");
            if (delItem) {
            	delItem.addEventListener("click", function (event) {
                    event.preventDefault();
                    let confirmLogout = confirm("Are you sure you want to delete the item?");
                    if (confirmLogout) {
                        window.location.href="deleteitem";
                    }
                });
            }
            
			var itemExists =
<%=(request.getAttribute("item") != null) ? "true" : "false"%>;
			if (itemExists) {
				document.getElementById("msg2").style.display = "none";
			}

			// Confirm before delete
			const deleteBtn = document.getElementById("toDel");
			if (deleteBtn) {
				deleteBtn
						.addEventListener(
								"click",
								function(event) {
									event.preventDefault();
									let confirmDelete = confirm("Are you sure you want to delete?");
									if (confirmDelete) {
										window.location.href = "deleteitem";
									}
								});
			}
		};
	</script>

	<a href="vendashboard.jsp" class="dashboard-btn">DASHBOARD</a>

	<form action="search" method="get">
		<label for="itemname">Item name:</label> <input style="width: 380px;"
			type="text" id="itemname" name="itemname"
			placeholder="Enter the Item name" required> <input
			type="submit" value="Search">
	</form>

	<%
	String msg = (String) request.getAttribute("itmmsg");
	Grocery item = (Grocery) request.getAttribute("item");

	if (item != null) {
	%>
	<h3>Item Details:</h3>
	<div style="display: flex;">
		<table border="1">
			<tr>
				<th>Item ID</th>
				<td><%=item.getItemid()%></td>
			</tr>
			<tr>
				<th>Item Type</th>
				<td><%=item.getItemtype()%></td>
			</tr>
			<tr>
				<th>Item Name</th>
				<td><%=item.getItemname()%></td>
			</tr>
			<tr>
				<th>Item Price</th>
				<td><%=item.getItemprice()%></td>
			</tr>
			<tr>
				<th>Item Quantity</th>
				<td><%=item.getItemquantity()%></td>
			</tr>
			<tr>
				<th>Item Image</th>
				<td><img src="<%=item.getItemimage()%>" alt="Item Image"
					width="100"></td>
			</tr>
			<tr>
				<th>Email</th>
				<td><%=item.getEmail()%></td>
			</tr>
		</table>

		<!-- Buttons for Update and Delete -->
		<span> <a href="updateitems.jsp"><button>Update
					Items</button></a> 
					<button ><a id="del">Delete Items</button></a>
		</span>
		<%
		} else if (msg != null) {
		%>
		<h2 id="msg2"><%=msg%></h2>
		<%
		}
		%>
	</div>

</body>
</html>
