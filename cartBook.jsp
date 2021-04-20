<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.util.Enumeration"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bookshop.Book" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 페이지</title>
</head>
<body>
<jsp:include page="menu.jsp"/>
<%
	String cartBooktId = session.getId();
%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">장바구니</h1>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<!-- cartId 만들어야 함 -->
					<td align="left"><a href="deleteBookCart.jsp?cartBookId=<%=cartBooktId%>"
						class="btn btn-danger">삭제하기</a>
					<td align="right"><a
						href="order/shippingInfo.jsp?cartBookId=<%=cartBooktId%>"
						class="btn btn-success">주문하기</a></td>
				</tr>
			</table>
		</div>
	</div>
	<div style="padding-top: 50px">
		<table class="table table-hover">
			<tr>
				<th>상품</th>
				<th>가격</th>
				<th>수량</th>
				<th>소계</th>
				<th>비고</th>
			</tr>
			<%-- <%
				request.setCharacterEncoding("UTF-8");
			String userId = request.getParameter("cartList");
			session.setAttribute("cartList", cartList);
			%> --%>

			<%
				request.setCharacterEncoding("UTF-8");
						int sum = 0;
					ArrayList<Book> cartBookList = (ArrayList<Book>) session.getAttribute("cartBookList");
					if (cartBookList == null) {
						cartBookList = new ArrayList<Book>();
					}
					for (int i = 0; i < cartBookList.size(); i++) {
						Book book = cartBookList.get(i);
						int total = book.getPrice() * book.getStock();
						sum += total; //가격
			%>
			<tr>
				<td><%=book.getBookID()%> - <%=book.getBookName()%></td>
				<td><%=book.getPrice()%></td>
				<td><%=book.getStock()%></td>
				<td><%=total%></td>
				<td><a href="removeBookCart.jsp?proId=<%=book.getBookID()%>"
					"class="badge badge-danger">삭제</a></td>
			</tr>
			<%
				}
			%>
			<tr>
				<th></th>
				<th></th>
				<th>총액</th>
				<th><%=sum%></th>
				<th></th>
			</tr>
		</table>
		<a href="Books.jsp" class="btn btn-secondary">&laquo; 쇼핑 계속하기</a>
		<jsp:include page="footer.jsp" />
</body>
</html>