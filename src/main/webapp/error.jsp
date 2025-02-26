<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	String s = (String) request.getAttribute("error");
	if (s != null) {
	%>
	<div
		style="display: flex; justify-content: center; align-items: center;">
		<h1><%=s%></h1>
			&nbsp;&nbsp;
		<button
			style="border-radius: 3px; background-color: green; font-size: 12px; color: white; border: none; padding: 8px; box-shadow: 8px 8px 0px rgba(0, 0, 0, 0.5)">
			<a style="text-decoration: none;" href="vendashboard.jsp">
				DASHBOARD </a>
		</button>
	</div>

	<%
	}
	%>
</body>
</html>
