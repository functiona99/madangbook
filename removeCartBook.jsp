<%@page import="java.util.ArrayList,bookshop.Book"%>
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
	String proId = request.getParameter("bookID");
	ArrayList<Book> cartBookList = (ArrayList<Book>) session.getAttribute("cartList");
	Book selectedItem = new Book();
	for(int i = 0; i<cartBookList.size(); i++) {
		selectedItem = cartBookList.get(i);
		if (selectedBook.getBookID().equals(bookID)) { 
			cartBookList.remove(selectedItem); }
	}
//cartBook.jsp로 리다이렉트
response.sendRedirect("cartBook.jsp");
%>
</body>
</html>