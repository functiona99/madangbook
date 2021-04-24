<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*,javax.sql.*, javax.naming.*"%>
<%@page import="java.io.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<jsp:useBean id="users" class="user.Users" scope="page"/><!-- 현재 페이지에서만 빈지가 사용될 수 있게 함 -->
<jsp:setProperty name="users" property="*"/> <!-- 로그인페이지에서 넘겨준 userID를 자바로 정의한 users에 넣어줌 -->
<%
String userID = (String)session.getAttribute("userID");
String sql = null;
InitialContext ic = new InitialContext();
DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
Connection conn = ds.getConnection();
sql = "select * from users where userid=?";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, userID);
ResultSet rs = pstmt.executeQuery();
rs.next();

%>
<jsp:include page="menuIf.jsp"/>
		
 	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
					<h3 style="text-align: center;">내 정보</h3>
					<form method="post" action="updateProc.jsp">
					<div class="form-group">
						아이디 : <%=rs.getString(1)%>
					</div>
					<div class="form-group">
						비밀번호 : <%=rs.getString(2)%>
					</div>
					<div class="form-group">
						이름 : <%=rs.getString(3)%>
					</div>
					<div class="form-group">
						전화번호 : <%=rs.getString(4)%>
					</div>
					<div class="form-group">
						이메일 : <%=rs.getString(5)%>
					</div>
					<div class="form-group">
						주소 : <%=rs.getString(6)%>
					</div>
					<div class="form-group">
						가입날짜 : <%=rs.getString(7)%>
					</div>
					<a href = "update.jsp">수정하러 가기</a>
				</form>
			</div>
		</div>
	</div> 
	
	 	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
					<h3 style="text-align: center;">주문 정보</h3>
					<form method="post" action="updateProc.jsp">
					<div class="form-group">
						주문번호 : <%=rs.getString(1)%>
					</div>
					<div class="form-group">
						비밀번호 : <%=rs.getString(2)%>
					</div>
					<div class="form-group">
						이름 : <%=rs.getString(3)%>
					</div>
					<div class="form-group">
						전화번호 : <%=rs.getString(4)%>
					</div>
					<div class="form-group">
						이메일 : <%=rs.getString(5)%>
		
					</div>
					<div class="form-group">
						주소 : <%=rs.getString(6)%>
					</div>
					<div class="form-group">
						가입날짜 : <%=rs.getString(7)%>
					</div>
					<a href = "update.jsp">수정하러 가기</a>
				</form>
			</div>
		</div>
	</div> 










	<script src="https://code.jquery.com/jquery-3.3.7.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>