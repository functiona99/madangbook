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
	<%
String userID = (String)session.getAttribute("userID");
String sql = null;
InitialContext ic = new InitialContext();
DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
Connection conn = ds.getConnection();
sql = "select * from users where userid = ?";
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
				<form method="post" action="updateProc.jsp">
					<h3 style="text-align: center;">정보 수정</h3>
					<div class="form-group">
						아이디 <input type="text" class="form-control" value="<%=rs.getString(1)%>"
							name="userID" maxlength="20" readonly >
					</div>
					<div class="form-group">
						비밀번호 <input type="password" class="form-control" value="<%=rs.getString(2)%>"
							name="userPassword" maxlength="20">
					</div>
					<div class="form-group">
						이름 <input type="text" class="form-control" value="<%=rs.getString(3)%>"
							name="userName" maxlength="20" readonly>
					</div>
					<div class="form-group">
						전화번호 <input type="text" class="form-control" value="<%=rs.getString(4)%>"
							name="userPhoneNo" maxlength="20">
					</div>
					<div class="form-group">
						이메일 <input type="email" class="form-control" value="<%=rs.getString(5)%>"
							name="userEmail" maxlength="30">
					</div>
					<div class="form-group">
						주소 <input type="text" class="form-control" value="<%=rs.getString(6)%>"
							name="userAddr" maxlength="40">
					</div>
					<input type="submit" class="btn btn-primary form-control" value="수정하기">
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