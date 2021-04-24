<%@page import="java.util.ArrayList,book.Book"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String bookID = request.getParameter("bookID");
String sql = "select * from book where bookID=?";
InitialContext ic = new InitialContext();
DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
Connection conn = ds.getConnection();
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, bookID);
ResultSet rs = pstmt.executeQuery();
Book selectedItem = null;
rs.next();
selectedItem = new Book(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4), 
		rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),rs.getInt(11));

rs.close(); pstmt.close(); conn.close();

ArrayList<Book> cartList = (ArrayList<Book>)session.getAttribute("cartList");
//세션에 저장되어있는 ArrayList<Products> 타입의 cartList를 불러온다
//만일 동일한 제품을 반복 주문한 경우에는 
if(cartList==null){//cartList가 null인 경우 즉 장바구니에 아무 것도 들어있지 않은 경우 실행
	cartList = new ArrayList<Book>();
	//cartList 객체 생성하여 세션에 저장
	session.setAttribute("cartList", cartList);
}
int cnt = 0;
Book orderedItem = new Book();
for(int i=0; i<cartList.size(); i++){
	orderedItem = cartList.get(i);
	if(orderedItem.getBookID().equals(bookID)){
		cnt++;
		int orderedQuantity = orderedItem.getQuantity()+1;
		orderedItem.setQuantity(orderedQuantity);
	}
}
if(cnt==0){
	selectedItem.setQuantity(1);
	cartList.add(selectedItem);
}
	response.sendRedirect("productDetail.jsp?bookID="+bookID);
%>
<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 입력내역</h1>
		</div>
	</div>

</body>
</html>