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
	//설정돤 새션값들을 모두 사라지도록 함
	session.removeAttribute("cartBookList");
	//cart.jsp로 리다이렉트
	response.sendRedirect("cartBook.jsp");
%>
</body>
</html>