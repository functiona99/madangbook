<%@page import="java.net.URLEncoder"%>
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
request.setCharacterEncoding("utf-8");
Cookie cartId = new Cookie("shippingCartId", URLEncoder.encode(request.getParameter("cartId"), "utf-8"));
Cookie name = new Cookie("shippingName", URLEncoder.encode(request.getParameter("name"), "utf-8"));
Cookie phoneNo = new Cookie("phoneNo", URLEncoder.encode(request.getParameter("phoneNo"), "utf-8"));
Cookie zipCode = new Cookie("shippingZipCode", URLEncoder.encode(request.getParameter("zipCode"), "utf-8"));
Cookie addr = new Cookie("shippingAddr", URLEncoder.encode(request.getParameter("addr"), "utf-8"));

cartId.setMaxAge(24*60*60); name.setMaxAge(24*60*60); phoneNo.setMaxAge(24*60*60);
 zipCode.setMaxAge(24*60*60); addr.setMaxAge(24*60*60);

response.addCookie(cartId); response.addCookie(name); response.addCookie(phoneNo);
 response.addCookie(zipCode); response.addCookie(addr);

response.sendRedirect("orderConfirmation.jsp");
%>
</body>
</html>