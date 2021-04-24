<%@page import="java.util.*,book.Book"%>
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
String bookID = request.getParameter("bookID");
ArrayList<Book> cartList = (ArrayList<Book>)session.getAttribute("cartList");
Book selectedItem = new Book();
for(int i=0; i<cartList.size(); i++){
	selectedItem = cartList.get(i);
	if(selectedItem.getBookID().equals(bookID)){
		cartList.remove(selectedItem);
	}
}
response.sendRedirect("cart.jsp");
%>
</body>
</html>