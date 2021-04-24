<!-- USERDAO를 통해 로그인 작업 처리 -->
<%@page import="user.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import = "user.UserDAO" %>
	<%@page import =  "java.io.PrintWriter"%>
	<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="users" class="user.Users" scope="page"/><!-- 현재 페이지에서만 빈지가 사용될 수 있게 함 -->
<jsp:setProperty name="users" property="userID"/> <!-- 로그인페이지에서 넘겨준 userID를 자바로 정의한 users에 넣어줌 -->
<jsp:setProperty name="users" property="userPassword"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
/* 로그아웃한 회원은 로그인페이지에 들어갈 수 없게 */
String userID = null;
if(session.getAttribute("userID") != null){ /* 세션이 존재하는 아이디는 해당 세션값을 갖게 해줌 */
	userID = (String)session.getAttribute("userID"); /* 정상적으로 유저아이디라는 변수가 자기에게 할당된 세션의 아이디를 담을 수 있게끔 함 */
}
if(userID != null){ /* 이미 로그인한 사람은 또 로그인 할 수 없게 만들어줌 */
	PrintWriter script=response.getWriter();
	 script.println("<script>");
	 script.println("alert('이미 로그인이 되어있습니다')"); //팝업으로 뜨는 창
	 script.println("location.href = 'main.jsp'"); /* 로그인에 성공했을 때 나오는 페이지 */
	 script.println("</script>");
}
/* ----------------------------------------------------------------- */
UserDAO userDAO = new UserDAO(); //유저다오 씀
int result = userDAO.login(users.getUserID(),users.getUserPassword());
 /* 로그인 화면에서 입력한 값들을 자바에 정의한 login에 넣어줌 각각의 결과에 따라 -2부터 1까지에 대한 값을 result에 담아줌 */
 if(result==1){ //로그인에 성공했을 때
	 session.setAttribute("userID", users.getUserID());
	 PrintWriter script=response.getWriter();
	 script.println("<script>");
	 script.println("location.href = 'main.jsp'"); /* 로그인에 성공했을 때 나오는 페이지 */
	 script.println("</script>");
 }
 else if(result==0){ //비밀번호가 틀렸을 때
	 PrintWriter script=response.getWriter();
	 script.println("<script>");
	 script.println("alert('비밀번호가 틀렸습니다')"); //팝업으로 뜨는 창
	 script.println("history.back()"); //이전 페이지로 사용자를 돌려보냄(로그인창으로)
	 script.println("</script>");
 }
 else if(result==-1){ //비밀번호가 틀렸을 때
	 PrintWriter script=response.getWriter();
	 script.println("<script>");
	 script.println("alert('아이디가 존재하지 않음')"); //팝업으로 뜨는 창
	 script.println("history.back()"); //이전 페이지로 사용자를 돌려보냄(로그인창으로)
	 script.println("</script>");
 }
 else if(result==-2){ //비밀번호가 틀렸을 때
	 PrintWriter script=response.getWriter();
	 script.println("<script>");
	 script.println("alert('데이터베이스 오류가 발생했습니다')"); //팝업으로 뜨는 창
	 script.println("history.back()"); //이전 페이지로 사용자를 돌려보냄(로그인창으로)
	 script.println("</script>");
 }


%>
</body>
</html>