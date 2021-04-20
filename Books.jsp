<%@page import="java.util.ArrayList,bookshop.Book"%>
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
</head>
<body>
	<jsp:useBean id="book" class="bookshop.Book" scope="request" />
	<%
		InitialContext ic = new InitialContext();
			DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
			Connection conn = ds.getConnection();

			PreparedStatement pstmt = conn.prepareStatement("select * from book"); //정확하게 입력됬는지 확인 또 확인!
			ResultSet rs = pstmt.executeQuery();
			
			ArrayList<Book> bList = new ArrayList<Book>();
			while (rs.next()) {
		bList.add(new Book(rs.getInt(1), rs.getString(2), rs.getString(3), 
						   rs.getInt(4), rs.getString(5), rs.getString(6),
						   rs.getString(7), rs.getString(8), rs.getString(9),
						   rs.getInt(10), rs.getString(11)));
			}
			rs.close();
			pstmt.close();
			conn.close();
			
			String imageUrl = request.getContextPath()+"/upload";
	%>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">책 목록</h1>
		</div>
	</div>
	<div class="container">
		<div class="row" align="center">
			<c:set var="bList" value="<%=bList%>" />
			<c:forEach var="bList" items="${bList}">
			<div class="col-md-4">
			<!-- Book.java에 filename추가 -->
			<img alt="test" src="<%=imageUrl%>/${bList.filename}" width="300px" height="300px">
			<h3>${bList.bookID}</h3>
			<p>${bList.bookContent}</p>
			<p>${bList.price}원</p>
			<P><a href="BookDetail.jsp?bookID=${bList.bookID}" class="btn btn-secondary" role="button">책 상세정보</a></P>
			</div>
			</c:forEach>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
	
</body>
</html>