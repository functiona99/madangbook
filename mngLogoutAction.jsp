<%@page import="user.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="user.UserDAO"%>
<%@page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		session.invalidate(); /* 로그아웃한 사람의 세션을 빼앗기도록 함 */
	%>
	<script>
		location.href = 'main.jsp'; /* 탈퇴하면 메인으로 가게끔 */
	</script>
</body>
</html>