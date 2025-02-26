<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Actions</title>
    <style>
        body {
/*             border: 2px solid black; */
            height: 100vh;
            font-size: 25px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            background-color: #f8f9fa;
        }

        .btn {
            background-color: green;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 12px 20px;
            font-size: 18px;
            text-decoration: none;
            display: inline-block;
            text-align: center;
            width: 250px;
            margin: 10px;
            transition: background-color 0.3s, color 0.3s;
        }

        .btn:hover {
            background-color: lightgreen;
            color: red;
        }

        .btn:focus {
            outline: none;
        }

        .dashboard-btn {
            margin-top: 40px;
            text-decoration: none;
            background-color: cyan;
            color: black;
            padding: 12px 20px;
            border-radius: 5px;
            font-size: 18px;
            transition: background-color 0.3s;
        }

        .dashboard-btn:hover {
            background-color: lightblue;
        }

        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 10px;
        }
    </style>
</head>
<body>
<script>
        window.onload = function () {
            const logoutBtn = document.getElementById("log");
            if (logoutBtn) {
                logoutBtn.addEventListener("click", function (event) {
                    event.preventDefault();
                    let confirmLogout = confirm("Are you sure you want to logout?");
                    if (confirmLogout) {
                        window.location.href = "Userlogout";
                    }
                });
            }
        };
    </script>
    <div class="container">
        <a href="update.jsp" class="btn">Update Your Profile</a>
        <a href="delete.jsp" class="btn">Delete Your Profile</a>
        <a href="view.jsp" class="btn">View Your Profile</a>
        <a  id="log" class="btn">Logout</a>
    </div>

    <a href="vendashboard.jsp" class="dashboard-btn"><button>DASHBOARD</button></a>

    

</body>
</html>
