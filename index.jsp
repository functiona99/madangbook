<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!String greeting = "Bookstore";
String tagline = "마당책방에 오신 것을 환영합니다.";%>
<jsp:include page="menu.jsp"/>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3"><%=greeting %></h1>
	</div>
</div>
<main role="main">
	<div class="container">
		<div class="text">
			<h3><%=tagline%></h3>
		</div>
		<hr>
	</div>
</main>
<jsp:include page="footer.jsp"/>
</body>
</html>