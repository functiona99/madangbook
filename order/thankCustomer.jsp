<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
request.setCharacterEncoding("utf-8");
String shippingCartId = "";
String shippingName = "";
String phoneNo = "";
String shippingZipCode = "";
String shippingAddr = "";

Cookie[] cookies = request.getCookies();
if(cookies!=null){
	for(int i=0; i<cookies.length; i++){
		Cookie thisCookie = cookies[i];
		String name = thisCookie.getName();
		if(name.equals("shippingCartId")){
			shippingCartId = URLDecoder.decode(thisCookie.getValue(), "utf-8");
		}
		if(name.equals("shippingName")){
			shippingName = URLDecoder.decode(thisCookie.getValue(), "utf-8");
		}
		if(name.equals("phoneNo")){
			phoneNo = URLDecoder.decode(thisCookie.getValue(), "utf-8");
		}
		if(name.equals("shippingZipCode")){
			shippingZipCode = URLDecoder.decode(thisCookie.getValue(), "utf-8");
		}
		if(name.equals("shippingAddr")){
			shippingAddr = URLDecoder.decode(thisCookie.getValue(), "utf-8");
		}
	}
}
%>
<jsp:include page="menuCart.jsp"/>
<div class="jumbotron" align="center">
	<h1 class="display-3">주문 완료</h1>
</div>

<div class="container">
	<h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
	<p>주문번호 : <%=shippingCartId%></p>
	<p>이름 : <%=shippingName%></p>
	<p>전화번호 : <%=phoneNo%></p>
	<p>주소 : <%=shippingAddr%></p>
</div>
<%

if(cookies != null){
    for(int i=0; i < cookies.length; i++){
         
        // 쿠키의 유효시간을 0으로 설정하여 만료시킨다
        cookies[i].setMaxAge(0) ;
         
        // 응답 헤더에 추가한다
        response.addCookie(cookies[i]) ;
    }
}
/* session.removeAttribute("cartList");
for(int i=0; i<cookies.length; i++){
	Cookie thisCookie = cookies[i];
	if(thisCookie.getName().equals("shippingCartId")){
		cookies[i].setMaxAge(0);
	}else if(thisCookie.getName().equals("shippingName")){
		cookies[i].setMaxAge(0);
	}else if(thisCookie.getName().equals("shippingDate")){
		cookies[i].setMaxAge(0);
	}else if(thisCookie.getName().equals("shippingCountry")){
		cookies[i].setMaxAge(0);
	}else if(thisCookie.getName().equals("shippingZipCode")){
		cookies[i].setMaxAge(0);
	}else if(thisCookie.getName().equals("shippingAddr")){
		cookies[i].setMaxAge(0);
	}
	
} */
%>
<div class="container">
	<p><a href="../products.jsp" class="btn btn-secondary">&laquo;상품 목록</a></p>
</div>

<jsp:include page="../footer.jsp"/>
</body>
</html>