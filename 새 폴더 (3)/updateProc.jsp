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
</head>
<body>
<jsp:useBean id="users" class="user.Users"></jsp:useBean> <!-- 로그인페이지에서 넘겨준 userID를 자바로 정의한 users에 넣어줌 -->

<jsp:setProperty name="users" property="userPassword"/>
<jsp:setProperty name="users" property="userName"/>
<jsp:setProperty name="users" property="userPhoneNo"/>
<jsp:setProperty name="users" property="userEmail"/>
<jsp:setProperty name="users" property="userAddr"/>
<%
String userID = (String)session.getAttribute("userID");
String sql = null;
InitialContext ic = new InitialContext();
DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
Connection conn = ds.getConnection();
sql = "update users set userpassword=?, userPhoneNo=?, userEmail=?, userAddr=? where userId=?";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, users.getUserPassword());
pstmt.setString(2, users.getUserPhoneNo());
pstmt.setString(3, users.getUserEmail());
pstmt.setString(4, users.getUserAddr());
pstmt.setString(5, userID);
pstmt.execute();
pstmt.close();
conn.close();
%>
<jsp:forward page="myInfo.jsp"/>
</body>
</html>


