<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<Style>
* {
	margin: 0;
	box-sizing: border-box;
}

body{
	display: flex;
	align-items: center;
	border: 2px solid black;
	height: 100vh;
}

#main {
    padding: 20px; 
    width: 300px;  
    display: flex;
    flex-direction: column; 
    align-items: center;  
    gap: 10px;  
    background-color: #k9j9f1; 
    box-shadow: 0px 8px 18px rgba(0, 0, 0, 0.4);
    border-radius: 10px;
    margin-left:50px;
}



a {
	padding:10px;
}
button {
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        padding: 10px 20px;
        font-size: 16px;
        cursor: pointer;
        box-shadow: 0 8px 18px rgba(0, 0, 0, 0.4);
        transition: background-color 0.3s;
	margin:10px 20px;
    }
    button:hover {
        background-color: #0056b3;
    }
    button:focus {
        outline: none;
    }
    a button {
        display: inline-block;
        margin: 0 auto;
    }
    #dash{
    	position:absolute;
    	top : 50px;
    	right:50px;
    }
    #dBut{
    	padding:10px 8px;
    	color:white;
    	background-color:green;
    	border:none;
        border-radius: 5px;
        padding: 10px 20px;
        font-size: 16px;
        cursor: pointer;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        transition: background-color 0.3s;
    }
</Style>
</head>
<body>

	<div id="dash">
		<a href="vendashboard.jsp"><button id="dBut">DashBoard</button></a>
	</div>

	<div id = "main">
		<a href="update.jsp"><button>Update Your Profile</button></a> 
		<a href="delete.jsp"><button>Delete Your Profile</button></a> 
		<a href="view.jsp"><button>View Your Profile</button></a> 
		<a id = "log" href= "#"><button onclick= "logout(event)">Logout</button></a> 
	</div>
	
	<script type="text/javascript">
		function logout(event){
			event.preventDefault();
			if(confirm(" are you sure to log out ? ")){
				window.location.href="Userlogout";
			}
		}
	</script>
</body>
</html>

