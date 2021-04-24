<%@page import="java.util.ArrayList, bookshop.Book"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="bookshop.Book"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function addToCart() {
		if (confirm("상품을 장바구니에 추가하시겠습니까?")) {
			document.addForm.submit();
		} else {
			document.addForm.reset();
		}
	}
</script>
</head>
<body>

	<jsp:useBean id="book" class="bookshop.Book" scope="request" />
	<%
		InitialContext ic = new InitialContext();
			DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
			Connection conn = ds.getConnection();

			PreparedStatement pstmt = conn.prepareStatement("select * from Book where bookID=?");
			pstmt.setString(1, request.getParameter("bookID"));
			ResultSet rs = pstmt.executeQuery(); //executeUpdate() : 수행결과로 Int타입의 값을 반환, select 구문 제외한 다른 구문 수행 시 사용
			rs.next();
			book = new Book(rs.getInt(1), rs.getString(2), rs.getString(3), 
					   rs.getInt(4), rs.getString(5), rs.getString(6),
					   rs.getString(7), rs.getString(8), rs.getString(9),
					   rs.getInt(10), rs.getString(11));
			out.print(rs.getString(11)); //이미지 
				rs.close();
			pstmt.close();
			conn.close();
			
			String imageUrl = request.getContextPath()+"/upload";
			
	%>
	<c:set var="bk" value="<%=book%>" />
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 상세정보</h1>
		</div>
	</div>
	<div class="container">
		<div class="col-md-6">
			<h1>${bk.bookName}</h1>
			<p>${bk.bookContent}</p>
			<img src="upload/${bk.filename}" alt="" , width="80%">
			<%-- <img src="${imageUrl }/${pro.pImage}" alt="" , width="80%"> --%>
			<!-- 사진 넣기 -->
			<p>
				<b>카테고리 : </b><span class="badge badge-danger">${bk.category}</span>
			</p>
			<p>
				<b>저자 : </b>${bk.bookAuthor}</p>
			<p>
				<b>가격 : </b>${bk.price}</p>
			<p>
				<b>책 내용 : </b>${bk.bookContent}</p>
			<p>
				<b>작가 소개 : </b>${bk.bookAuthorItd}</p>
			<p>
				<b>책방지기 코멘트 : </b>${bk.CEOcomment}</p>
			<p>
				<b>출판사 : </b>${bk.publisher}</p>
			<p>
				<b>수량 : </b>${bk.stock}</p>
			<p>
				<b>작가 소개 : </b>${bk.bookAuthorItd}</p>
			<form name="addForm" action="addBookCart.jsp?proId=${bk.bookID}" method="post">
		<a href="#" class="btn btn-info" onclick="addToCart()">상품주문&raquo;</a>  <!-- onclick : 버튼 클릭 후 이동 -->
		<a href="cartBook.jsp" class="btn btn-warning">장바구니&raquo;</a>
		<a href="Books.jsp" class="btn btn-secondary">상품목록&raquo;</a>
		</form>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>