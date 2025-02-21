<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>Item deleted sucessfully</h1>
<%String msg=(String)request.getAttribute("delmsg");
 if(msg!=null){%>
 <h1 ><%=msg %></h1>
 <% } %>
 
 <%String msg1=(String)request.getAttribute("delmsgs");
 if(msg1!=null){%>
 <h1 ><%=msg1 %></h1>
 <% } %>
 
 <%String msg2=(String)request.getAttribute("delmsgs1");
 if(msg2!=null){%>
 <h1 ><%=msg2 %></h1>
 <% } %>
 <a href="vendashboard.jsp">Click here to go back</a>
</body>
</html>