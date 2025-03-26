<%@ page import="GroceryStore.dto.Grocery"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            position: relative;
        }

        h1 {
            text-align: center;
            margin: 20px 0;
        }

        .search-bar {
            position: relative; 
            text-align: center;
            margin: 20px 0;
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

        /* Responsive View Cart Button */
        .cart-container {
            position: absolute;
            right: 5%;
            top: 0;
        }

        .view-cart {
            box-shadow: 5px 5px 0px rgba(0, 0, 0, 0.5);
            border-radius: 5px;
            background-color: black;
            color: white;
            padding: 8px;
            font-size: 13px;
            width: max-content;
        }

        /* Responsive Design for Mobile Screens */
        @media (max-width: 768px) {
            .cart-container {
                right: 2%;
                top: 5px;
            }

            .view-cart {
                font-size: 12px;
                padding: 6px;
            }
        }

        .card-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            padding: 20px;
            justify-content: center;
            margin: 0 40px;
        }

        .card {
            border: 1px solid #ccc;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
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
        function filterItems() {
            let input = document.getElementById("searchInput").value.toLowerCase();
            let cards = document.getElementsByClassName("card");

            for (let i = 0; i < cards.length; i++) {
                let itemName = cards[i].getElementsByTagName("h3")[0].innerText.toLowerCase();
                if (itemName.includes(input)) {
                    cards[i].style.display = "block";
                } else {
                    cards[i].style.display = "none";
                }
            }
        }
    </script>
</head>

<body>
    <div>
        <h1>Customer Dashboard</h1>

		<p id="message" style="position:absolute;left:10%;top:10%;display: none; font-weight: bold; color: red;">item added to cart !</p>
        <!-- Search Bar -->
        <div class="search-bar">
            <input type="text" id="searchInput" placeholder="Search for an item..." onkeyup="filterItems()">

            <!-- View Cart Button -->
            <div class="cart-container">
                <a href="cart">
                    <button class="view-cart">View Cart</button>
                </a>
            </div>
        </div>
    </div>

    <div class="card-container">
        <%
        Grocery[] groceries = (Grocery[]) request.getAttribute("fAllItems");
        if (groceries != null && groceries.length > 0) {
            for (Grocery grocery : groceries) {
        %>
        <div class="card">
            <img src="<%=grocery.getItemimage()%>" alt="<%=grocery.getItemname()%>">
            <h3><%=grocery.getItemname()%></h3>
            <p>Price: &#8377;<%=grocery.getItemprice()%></p>
            <p>Quantity: <%=grocery.getItemquantity()%></p>
            
            <button id = "cbtt<%=grocery.getItemname()%>" onclick="saveCart('<%=grocery.getItemname()%>')">Add to cart</button>
            
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
    <script >
    	function saveCart(em){
    		fetch("savecrt",{
    			method:"POST",
				headers : {
					"Content-Type":"application/x-www-form-urlencoded"
				},
    			body:"name="+encodeURIComponent(em)
    		})
    		<%
    		String st = (String)session.getAttribute("cartmsg");
    		if(st != null){
    			%>
    			let message = document.getElementById("message");
    			let txtmodify = document.getElementById("cbtt"+em);
    			  message.style.display = "block"; 
    			  message.textContent += "  "+em;
    			  txtmodify.textContent = "Added to cart";
    			  txtmodify.style.color = "white";
    			  txtmodify.style.backgroundColor = "green";
    			  
    			  setTimeout(function() {
    			    message.style.display = "none"; 
    			  }, 2000);
    			<%
    		}
    		%>
    	}
    </script>
</body>
</html>
