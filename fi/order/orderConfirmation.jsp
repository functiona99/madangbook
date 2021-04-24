<%@page import="java.net.URLDecoder"%>
<%@page import="book.*, java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width", initial-scale="1" >  <!-- 반응형 웹에 사용하는 메타태그 -->
<link rel="stylesheet" href="css/bootstrap.css"> <!-- 참조  -->
</head>
<body>
<%
String cartId = session.getId();
String shippingCartId = "";
String shippingName = "";
String shippingDate = "";
String shippingCountry = "";
String shippingZipCode = "";
String shippingAddr = "";

Cookie[] cookies = request.getCookies();
if(cookies!=null){
	for(int i=0; i<cookies.length; i++){
		Cookie thisCookie = cookies[i];
		String name = thisCookie.getName();
		if(name.equals("shippingCartId")){
			shippingCartId = URLDecoder.decode(thisCookie.getValue(), "utf-8");
		}
		if(name.equals("shippingName")){
			shippingName = URLDecoder.decode(thisCookie.getValue(), "utf-8");
		}
		if(name.equals("shippingDate")){
			shippingDate = URLDecoder.decode(thisCookie.getValue(), "utf-8");
		}
		if(name.equals("shippingCountry")){
			shippingCountry = URLDecoder.decode(thisCookie.getValue(), "utf-8");
		}
		if(name.equals("shippingZipCode")){
			shippingZipCode = URLDecoder.decode(thisCookie.getValue(), "utf-8");
		}
		if(name.equals("shippingAddr")){
			shippingAddr = URLDecoder.decode(thisCookie.getValue(), "utf-8");
		}
	}
}
%>
<jsp:include page="menuCart.jsp"/>
<div class="jumbotron" align="center">
	<h1 class="display-3">주문확인</h1>
</div>
<div class="container col-8 alert alert-info">
	<div class="text-center"><h1>영수증</h1></div>
	<div class="row justify-content-between">
		<div class="col-4" align="left">
			<strong>배송주소</strong>
			<br>이름 : <%=shippingName %>
			<br>우편번호 : <%=shippingZipCode %>
			<br>주소 : <%=shippingAddr %>(<%=shippingCountry %>)<br>
		</div>
		<div class="col-4" align="right">
			<p><em>배송일 : <%=shippingDate%></em></p>
		</div>
	</div>
	
	<div style="padding-top: 50px;">
	<table class="table table-hover" width ="80%">
		<tr><th>상품</th><th>가격</th><th>수량</th><th>소계</th></tr>
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
		</tr>
		<%}%>
		<tr><th></th><th></th><th>총액</th><th><b><span style="color: red; "><%=sum%></span></b>원</th><th></th></tr>
	</table>
	<a href="shippingInfo.jsp?cartId=<%=shippingCartId%>" class="btn btn-secondary" role="button">이전</a>
	<a href="thankCustomer.jsp" class="btn btn-success" role="button">주문 완료</a>
	<a href="checkoutCancelled.jsp" class="btn btn-secondary" role="button">취소</a>
</div>
	
</div>
<jsp:include page="../footer.jsp"/>
</body>
</html>