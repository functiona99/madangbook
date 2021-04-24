<%@page import="java.util.*,book.Book" %>
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
session.removeAttribute("cartList");
response.sendRedirect("cart.jsp");
%>
</body>
</html>