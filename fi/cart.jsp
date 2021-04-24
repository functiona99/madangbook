<%@page import="book.Book"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
@font-face {
	font-family: 'GyeonggiBatang';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/GyeonggiBatang.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

* {
	font-family: 'GyeonggiBatang';
}

* {
	margin: 0;
	padding: 0;

}

a {
	text-decoration: none;
}

body{
	
}
table{
	width:980px;/* 
	display: flex;
	justify-content: center;
	align-items: center; */
}
#btn btn-secondary{
overflow: hidden; 
float: left; 
padding: 100px;}
</style>
</head>
<body>
<%
String cartId = session.getId();
//ArrayList<Products> cartList = new ArrayList<Products>();
//cartList = (ArrayList<Products>)session.getAttribute("cartList"); 
%>

<jsp:include page="menuCart.jsp"/>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">장바구니</h1>
	</div>
</div>
<div class="container">
	<div class="row">
		<table width="80%">
			<tr>
				<td align="left"><a href="deleteCart.jsp?cartId=<%=cartId%>"
				class="btn btn-danger">삭제하기</a></td>
				<td align="right"><a href="order/shippingInfo.jsp?cartId=<%=cartId%>"
				class="btn btn-success">주문하기</a></td>
			</tr>
		</table>
	</div>
</div>
<div style="padding-top: 50px;">
	<table class="table table-hover">
		<tr><th>상품</th><th>가격</th><th>수량</th><th>소계</th><th>비고</th></tr>
		<%
		int sum=0;
		ArrayList<Book> cartList = new ArrayList<Book>();
		cartList = (ArrayList<Book>)session.getAttribute("cartList"); 
		if(cartList==null){cartList = new ArrayList<Book>();}
		for(int i=0; i<cartList.size(); i++){
			Book book = cartList.get(i);
			int total = book.getPrice()*book.getQuantity();
			sum += total;
		%>
		<tr>
			<td><%=book.getBookID()%>-<%=book.getBookName()%></td>
			<td><%=book.getPrice()%></td>
			<td><%=book.getQuantity()%></td>
			<td><%=total%></td>
			<td><a href="removeCart.jsp?bookID=<%=book.getBookID()%>" class="badge badge-danger">삭제</a></td>
		</tr>
		<%}%>
		<tr><th></th><th></th><th>총액</th><th><%=sum%></th><th></th></tr>
	</table>
	<a href="products.jsp" class="btn btn-secondary">&laquo; 쇼핑 계속하기</a>
</div>

<jsp:include page="footer.jsp"/>
</body>
</html>