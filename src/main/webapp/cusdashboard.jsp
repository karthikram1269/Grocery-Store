<%@ page import="GroceryStore.dto.Grocery"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Dashboard</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

h1 {
	text-align: center;
	margin: 20px 0;
}

.search-bar {
	text-align: center;
	margin: 20px 0;
}

.search-bar input {
	position: relative;
}

.search-bar input[type="text"] {
	width: 300px;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.search-bar button {
	padding: 10px 20px;
	margin-left: 10px;
	background-color: #28a745;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.search-bar button:hover {
	background-color: #218838;
}

.card-container {
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
	padding: 20px;
	justify-content: center;
	/* 	border:2px black solid; */
	margin: 0px 40px 0px 40px
}

.card {
	border: 1px solid #ccc;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.4);
	padding: 15px;
	text-align: center;
	width: 200px;
}

.card img {
	max-width: 100%;
	height: 150px;
	object-fit: cover;
	border-radius: 8px;
}

.card h3 {
	margin: 10px 0;
	font-size: 18px;
}

.card p {
	margin: 5px 0;
	color: #555;
}
</style>
<script>
	function logOut(event){
		if(confirm(" are you ready to log out ??")){
			window.location.href="Userlogout";
		}
	}
	function filterItems() {
		let input = document.getElementById("searchInput").value.toLowerCase();
		let cards = document.getElementsByClassName("card");

		for (let i = 0; i < cards.length; i++) {
			let itemName = cards[i].getElementsByTagName("h3")[0].innerText
					.toLowerCase();
			if (itemName.includes(input)) {
				cards[i].style.display = "block";
			} else {
				cards[i].style.display = "none";
			}
		}
	}
	const b = document.getElementById("aToCart");
	const i = document.getElementById("aToCart2");
	b.addEventListener("click",()=>{
		i.removeAttribute("hidden");
	})
</script>
</head>
<body>
	<div>
		<h1>Customer Dashboard</h1>

		<!-- Search Bar -->
		<div class="search-bar">
			<input type="text" id="searchInput"
				placeholder="Search for an item..." onkeyup="filterItems()">

			<button
				style="box-shadow: 5px 5px 0px rgba(0, 0, 0, 0.5); position: absolute; right: 180px; border-radius: 5px; background-color: black; padding: 8px;">
				<a style="text-decoration: none; color: white; font-size: 13px;"
					href="cart">View Cart</a>
			</button>

			<button
				style="box-shadow: 5px 5px 0px rgba(0, 0, 0, 0.5); position: absolute; right: 90px; border-radius: 5px; background-color: crimson; padding: 8px;">
				<a style="text-decoration: none; color: white; font-size: 13px;"
					onclick = "logOut(event)" > Log Out </a>
			</button>
		</div>
	</div>

	<div class="card-container">
		<%
		Grocery[] groceries = (Grocery[]) request.getAttribute("fAllItems");

		if (groceries == null) {
			HttpSession h = request.getSession();
			groceries = (Grocery[]) h.getAttribute("fAllItems");
		}
		if (groceries != null && groceries.length > 0) {
			for (Grocery grocery : groceries) {
		%>
		<div class="card">
			<img src="<%=grocery.getItemimage()%>"
				alt="<%=grocery.getItemname()%>">
			<h3><%=grocery.getItemname()%></h3>
			<p>
				Price: &#8377;<%=grocery.getItemprice()%></p>
			<p>
				Quantity:
				<%=grocery.getItemquantity()%></p>
			<form action="savecrt" method="post">
				<input style="display: none;" name="name"
					value="<%=grocery.getItemname()%>">
				<button class="aToCart">Add to cart</button>
				<input class="aToCart2" hidden value="Added">
			</form>
		</div>
		<%
		}
		%>

		<%
		} else {
		%>
		<p>No items available</p>
		<%
		}
		%>
	</div>
</body>
</html>
