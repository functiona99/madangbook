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
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<!-- 홈페이지의 로고 -->
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expand="false">
				<span class="icon-bar"></span>
				<!-- 줄였을때 옆에 짝대기 -->
				<span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<!-- active로 현재 페이지가 메인페이지임을 알림 -->
				<li><a href="bbs.jsp">게시판</a></li>
			</ul>
			<%
    		//접속하기 버튼은 로그인을 하지 않은 사람만 보일 수 있게 if 걸음
                if(userID == null) {//로그인 하지 않았다면
                
            %>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul></li>
			</ul>
			<% } else { //로그인 되어있다면 접속이 되었음을 알려줌 /!! 여기서 이름 뜰 수 있게 +마이페이지 수정까지 구현 가능하기를
            %>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
						<li class="active"><a href="myInfo.jsp">내정보</a></li>
					</ul></li>
			</ul>
			<%
                }
            %>

		</div>

	</nav>
	
	 <div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="updateProc.jsp">
					<h3 style="text-align: center;">정보 수정</h3>
					<div class="form-group">
						아이디 <input type="text" class="form-control" value="<%=rs.getString(2)%>"
							name="userID" maxlength="20" readonly >
					</div>
					<div class="form-group">
						비밀번호 <input type="password" class="form-control" value="<%=rs.getString(3)%>"
							name="userPassword" maxlength="20">
					</div>
					<div class="form-group">
						이름 <input type="text" class="form-control" value="<%=rs.getString(4)%>"
							name="userName" maxlength="20" readonly>
					</div>
					<div class="form-group">
						전화번호 <input type="text" class="form-control" value="<%=rs.getString(5)%>"
							name="userPhoneNo" maxlength="20">
					</div>
					<div class="form-group">
						이메일 <input type="email" class="form-control" value="<%=rs.getString(6)%>"
							name="userEmail" maxlength="30">
					</div>
					<div class="form-group">
						주소 <input type="text" class="form-control" value="<%=rs.getString(7)%>"
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