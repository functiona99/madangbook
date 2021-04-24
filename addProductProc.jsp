<%@page import="java.util.*, book.Book"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*, java.io.*" %>
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
<% request.setCharacterEncoding("utf-8"); %>
	<%
	
	String path = application.getRealPath("/upload");//시스템 물리적인 경로
	int size = 1024*1024*10;
	MultipartRequest multi = new MultipartRequest(
		request, path, size, "UTF-8", new DefaultFileRenamePolicy());
		String bookID = multi.getParameter("bookID");
		String bookName = multi.getParameter("bookName");
		String bookAuthor = multi.getParameter("bookAuthor");
		int price = Integer.parseInt(multi.getParameter("price"));
		String bookContent = multi.getParameter("bookContent");
		String bookauthorItd = multi.getParameter("bookauthorItd");
		String ceoComment = multi.getParameter("ceoComment");
		String publisher = multi.getParameter("publisher");
		String category = multi.getParameter("category");
		
		Enumeration files = multi.getFileNames();
		String name = (String)files.nextElement();
		String file = multi.getFilesystemName(name);
		String orgFile = multi.getOriginalFileName(name);
		
		InitialContext ic = new InitialContext();
		DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
		Connection conn = ds.getConnection();

		PreparedStatement pstmt = conn.prepareStatement("insert into book (bookid, bookname, bookauthor, price, bookcontent,bookauthoritd,ceocomment,publisher,category, filename)values(?,?,?,?,?,?,?,?,?,?)");
		pstmt.setString(1, bookID);
		pstmt.setString(2, bookName);
		pstmt.setString(3, bookAuthor);
		pstmt.setInt(4, price);
		pstmt.setString(5, bookContent);
		pstmt.setString(6, bookauthorItd);
		pstmt.setString(7, ceoComment);
		pstmt.setString(8, publisher);
		pstmt.setString(9, category);
		pstmt.setString(10, orgFile);
		pstmt.execute();
		
		pstmt.close();
		conn.close();
		out.println(bookID);
	
	
	
	%>
	
	<jsp:include page="menuMg.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 입력내역</h1>
		</div>
	</div>
	<div class="container">
	<div class="col-md-6">
		<h1>저장이 완료되었습니다!</h1>
		<p><b>상품명 : ${book.bookName}</b></p>
		<p><b>상세설명 : </b> ${book.bookContent}</p>
		<p><b>상품코드 : </b><span class="badge badge-danger">${book.bookID}</span></p>
		<p><b>제조사 : </b>${book.publisher}</p>
		<p><b>가격 : </b>${book.price}</p>
		<p><b>제품분류 : </b>${book.category}</p>
		<a href="products.jsp" class="btn btn-secondary">상품목록&raquo;</a>
	</div>
	</div>
	<jsp:include page="footer.jsp"/>

</body>
</html>