<%@page import="java.util.ArrayList, book.Book"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
#product_section {
	overflow: hidden;
	width:960px;
	margin:0 auto;
	margin-top: 5px;
}

#product_section>#product_article>img {
	overflow: hidden;
	float: left;
	padding: 5px;
	padding-top: 0px;
	width: 250px;
}

#product_section>#product_aside {
display: block;
	overflow: hidden;
	width: 200px;
}
#product_section>#product_div {
display: block;
	overflow: hidden;
	float: right;
	width: 500px;
}
</style> 
</head>
<body>

<jsp:useBean id="book" class="book.Book" scope="request" />
<jsp:setProperty property="*" name="book"/>
	<%
		InitialContext ic = new InitialContext();
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
	Connection conn = ds.getConnection();

	PreparedStatement pstmt = conn.prepareStatement("select * from book where bookId=?");
	pstmt.setString(1, request.getParameter("bookID"));
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	book = new Book(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), 
			rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getInt(11));
	
	rs.close();
	pstmt.close();
	conn.close();
	
	String imageUrl = request.getContextPath()+"/upload";
	%>
	<c:set var="bo" value="<%=book%>" />
	
	
	<jsp:include page="menuPd.jsp"/>
	
	<aside>
	
	</aside>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 상세정보</h1>
		</div>
	</div>

	<div class="container">
		<div class="col-md-6">
			<section id="product_section">
				<article id="product_article">
					<img alt="ddd" src="<%=imageUrl%>/${bo.filename}" width="200px">
				</article>
				<aside id="product_aside">
					<h1>${bo.bookName}</h1>
					<p>${bo.bookAuthor}</p>
					<p>
						<b>상품코드 : </b><span class="badge badge-danger">${bo.bookID}</span>
					</p>
					<p>
						<b>출판사 : </b>${bo.publisher}</p>
					<p>
						<b>가격 : </b>${bo.price}</p>
					<p>
						<b>카테고리 : </b>${bo.category}</p>

					<!-- 이 위는 설명이기 때문에 폼X 밑은 다른 쪽에 보내니까 폼 사용 -->
				</aside>
				<div id="product_div">
					<form name="addForm" action="addCart.jsp?bookID=${bo.bookID}"
						method="post">
						<a href="#" class="btn btn-info" onclick="addToCart()">상품 주문
							&raquo;</a> <a href="cart.jsp" class="btn btn-warning">장바구니
							&raquo;</a> <a href="products.jsp" class="btn btn-secondary">상품
							목록 &raquo;</a>

					</form>
				</div>
			</section>
			책 내용<br>
			${bo.bookContent}
			<hr>
			작가소개<br>
			${bo.bookauthorItd}
			<hr>
			책방지기의 말<br>
			${bo.ceoComment}
			<hr>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
	
	<script type="text/javascript">
	function addToCart(){
		if(confirm("상품을 장바구니에 추가하시겠습니까?")){
			document.addForm.submit(); //제출
		}else{
			document.addForm.reset(); //리셋
		}
	}
	</script>
</body>
</html>