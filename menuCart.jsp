<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width", initial-scale="1" >  <!-- 반응형 웹에 사용하는 메타태그 -->
<link rel="stylesheet" href="css/bootstrap.css"> <!-- 참조  -->
</head>
<body>

	<% //로그인이 된 사람은 이 메인페이지에서 로그인 정보를 담을 수 있게 해준다
    String userID = null; // 로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
    if (session.getAttribute("userID") != null)//이 세션을 유지하는 사람이라면 이 아이디 값을 받아서 관리할 수 있게 해줌
    {
        userID = (String)session.getAttribute("userID");//형 변환으로 세션 값을 그대로 받아올 수 있게  
      //로그인을 한 사람이라면 유저아이디에 해당 아이디가 담길 것이고 로그인을 안 했으면 null값에 담기게 됨
    }
    
 
%>
    <nav class ="navbar navbar-default">
        <div class="navbar-header"> <!-- 홈페이지의 로고 -->
            <button type="button" class="navbar-toggle collapsed"
                data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                aria-expand="false">
                <span class ="icon-bar"></span> <!-- 줄였을때 옆에 짝대기 -->
                <span class ="icon-bar"></span>
                <span class ="icon-bar"></span>
            </button>
            <a class ="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                 <li><a href="main.jsp">메인</a></li>
                <!-- active로 현재 페이지가 메인페이지임을 알림 -->
               	<li><a href="products.jsp">상품</a></li>
            </ul>
            <%
    		//접속하기 버튼은 로그인을 하지 않은 사람만 보일 수 있게 if 걸음
                if(userID == null) {//로그인 하지 않았다면
                
            %>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                <a href="#" class = "dropdown-toggle"
                    data-toggle="dropdown" role ="button" aria-haspopup="true"
                    aria-expanded="false">접속하기<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="login.jsp">로그인</a></li>
                        <li><a href="mngLogin.jsp">관리자 로그인</a></li>
                        <li><a href="join.jsp">회원가입</a></li>                    
                    </ul>
                </li>
            </ul>
            <% } else { //로그인 되어있다면 접속이 되었음을 알려줌 /!! 여기서 이름 뜰 수 있게 +마이페이지 수정까지 구현 가능하기를
            %>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                <a href="#" class = "dropdown-toggle"
                    data-toggle="dropdown" role ="button" aria-haspopup="true"
                    aria-expanded="false">회원관리<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                       <li><a href="logoutAction.jsp">로그아웃</a></li>
                       <li><a href="myInfo.jsp">내정보</a></li>
                       <li><a href="cart.jsp">장바구니</a></li>
                    </ul>
                </li>
            </ul>
       <%
       }%>
        </div>
    </nav>
    
 <script src="https://code.jquery.com/jquery-3.3.7.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>