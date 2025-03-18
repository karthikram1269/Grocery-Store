<%@page import="GroceryStore.dao.CartDao"%>
<%@ page import="GroceryStore.dto.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shopping Cart</title>
<style>
.card-container {
	display: flex;
	align-items: center;
	text-align: center;
	flex-wrap: wrap;
}

.card {
	border: 1px solid #ccc;
	margin: 10px;
	padding: 10px;
	width: 200px;
	text-align: center;
}

img {
	height: 100px;
	width: 140px;
}

button {
	padding: 5px 10px;
	margin: 5px;
}

.quantity {
	font-size: 18px;
	font-weight: bold;
	padding: 5px 10px;
	margin: 0 10px;
}

#total-sum {
	font-size: 20px;
	font-weight: bold;
	margin-top: 20px;
}
</style>
<script>
        document.addEventListener("DOMContentLoaded", () => {
        const totalItems = <%=(session.getAttribute("cartView") != null) ? ((Cart[]) session.getAttribute("cartView")).length : 0%>;
            for (let i = 0; i < totalItems; i++) {
                display(i); // Initialize individual item totals
            }
            updateGrandTotal(); // Calculate the initial grand total
        });

        function beforeBill(event){
        	if(!confirm(" are you ready to pay ??")){
        		event.preventDefault();
        	}
        }
        function increaseQuantity(index) {
            const quantityElement = document.getElementById(`q-` + index);
            let currentQuantity = parseInt(quantityElement.innerText);
            currentQuantity++;
            quantityElement.innerText = currentQuantity;
            display(index);
        }

        function decreaseQuantity(index) {
            const totalItems = <%=(session.getAttribute("cartView") != null) ? ((Cart[]) session.getAttribute("cartView")).length : 0%>;
            const quantityElement = document.getElementById(`q-` + index);
            let currentQuantity = parseInt(quantityElement.innerText);
            
            if (currentQuantity >= 1) {
                currentQuantity--;
            }
            
            if (currentQuantity == 0) {
                // Set the index in the hidden input and submit the form
                document.getElementById('removeIndex').value = index;
                document.getElementById('removeForm').submit();
                return;
            } else {
                quantityElement.innerText = currentQuantity;
            }
            
            display(index);
        }

        function display(index) {
            const priceDis = document.getElementById(`qdis-` + index);
            const price = document.getElementById(`price-` + index);
            const quant = document.getElementById(`q-` + index);

            const itemTotal = parseInt(price.dataset.price) * parseInt(quant.innerText);
            priceDis.textContent = itemTotal;

            updateGrandTotal();
        }

        function updateGrandTotal() {
        	const totalItems = <%=(session.getAttribute("cartView") != null) ? ((Cart[]) session.getAttribute("cartView")).length : 0%>;
            let grandTotal = 0;
			
            for (let i = 0; i < totalItems; i++) {
                const itemTotal = parseInt(document.getElementById(`qdis-` + i).textContent) || 0;
                grandTotal += itemTotal;
            }
            document.getElementById("total-sum").textContent = `Amount to be paid : ₹`+grandTotal;
            document.getElementById("billAmount").value = grandTotal;
        }
    </script>
</head>
<body>
	<div class="card-container">
		<%
		Cart[] cart = (Cart[]) session.getAttribute("cartView");
		if (cart != null && cart.length > 0) {
			for (int i = 0; i < cart.length; i++) {
				Cart c = cart[i];
				if (c != null) {
		%>
		<div class="card" id="card-<%=i%>">
			<img src="<%=c.getcItemImage()%>" alt="<%=c.getcItemName()%>">
			<h3><%=c.getcItemName()%></h3>
			<p>
				Cart ID:
				<%=c.getCartId()%></p>
			<p id="price-<%=i%>" data-price="<%=c.getcItemPrice()%>">
				Price: ₹<%=c.getcItemPrice()%></p>
			<div>
				<button type="button" onclick="decreaseQuantity(<%=i%>)">-</button>
				<span id="q-<%=i%>" class="quantity">1</span>

				<form id="removeForm" action="removeFrom" method="post"
					style="display: none;">
					<input type="hidden" name="index" id="removeIndex">
				</form>

				<button type="button" onclick="increaseQuantity(<%=i%>)">+</button>
			</div>
			<p>
				Total Price: ₹<span id="qdis-<%=i%>"></span>
			</p>
		</div>
		<%
		}
		}
		%>
	</div>
	<p id="total-sum">Grand Total: ₹</p>

	<form action="billing" method="post"
		style="text-align: center; margin-top: 20px;">
		<input type="number" hidden="true" name="billAmount" id="billAmount">
		<button onclick = "beforeBill(event)" style = "border:3px solid gray; font:15px serif;" type="submit">PAY</button>
	</form>
	<%
	} else {
	%>
	<div style= "display : flex; flex-direction : column; width : 100vw; height : 100vh; align-items : center; justify-content : center">
		<h2>No items available</h2>
		
	<%
	}
	%>
	<form action="log-in" method="post">
			<%
			HttpSession ses = request.getSession();
			%>
			<input name="email" type="email"
				value="<%=ses.getAttribute("loginEmail")%>" hidden="true"> <input
				type="radio" value="customer" name="usertype" checked="checked"
				hidden="true"> 
				<input type="password" name="password"
				value="<%=ses.getAttribute("loginPwd")%>" hidden="true">
			<button style = "bORDER-RADIUS : 3px;BORDER : 1PX SOLID BLACK;box-shadow : 5px 5px gray;color:blue; background-color: cerel"> DASHBOARD </button>
		</form>
	</div>
</body>
</html>
