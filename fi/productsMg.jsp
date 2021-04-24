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
<link rel="stylesheet" href="css/bootstrap.css"> 
</head>
<body>
	<jsp:useBean id="book" class="book.Book" scope="request" />
	<%
		InitialContext ic = new InitialContext();
	DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
	Connection conn = ds.getConnection();

	PreparedStatement pstmt = conn.prepareStatement("select * from book");
	ResultSet rs = pstmt.executeQuery();
	ArrayList<Book> bList = new ArrayList<Book>();
	while (rs.next()) {
		bList.add(new Book(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), 
				rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),rs.getInt(11)));
	}
	rs.close();
	pstmt.close();
	conn.close();
	
	String imageUrl = request.getContextPath()+"/upload";
	%>
	<% //로그인이 된 사람은 이 메인페이지에서 로그인 정보를 담을 수 있게 해준다
    String userID = null; // 로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
    if (session.getAttribute("userID") != null)//이 세션을 유지하는 사람이라면 이 아이디 값을 받아서 관리할 수 있게 해줌
    {
        userID = (String)session.getAttribute("userID");//형 변환으로 세션 값을 그대로 받아올 수 있게  
      //로그인을 한 사람이라면 유저아이디에 해당 아이디가 담길 것이고 로그인을 안 했으면 null값에 담기게 됨
    }
    
 
%>
    <jsp:include page="menuMg.jsp"/>
    
    
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>
	<div class="container">
		<div class="row" align="center">
			<c:set var="bList" value="<%=bList%>" />
			<c:forEach var="bList" items="${bList}">
			<div class="col-md-4">
			<img alt="ddd" src="<%=imageUrl%>/${bList.filename}" width="300px">
			<h3>${bList.bookName}</h3>
			<p>${bList.bookAuthor}</p>
			<p>${bList.price}원</p>
			<P><a href="productDetail.jsp?bookID=${bList.bookID}" class="btn btn-secondary" role="button">상세정보</a></P>
			</div>
			
			</c:forEach>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
	

</body>
</html>