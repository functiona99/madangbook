<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bookshop.Book"%>
<%@ page import="javax.sql.DataSource"%>
<%@ page import="javax.naming.InitialContext"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 요청에서 패러미터를 추출하여 bookID에 저장 
	 정상적으로 카트에 추가된 후 상세보기 페이지로 이동 -->
	<%
		String bookID = request.getParameter("bookID");
			InitialContext ic = new InitialContext();
			DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
			Connection conn = ds.getConnection();

			PreparedStatement pstmt = conn.prepareStatement("select * from book where bookID=?");
			pstmt.setString(1, bookID);
			ResultSet rs = pstmt.executeQuery();

			Book selectedBook = null;
			if (rs.next()) {
			selectedBook = new Book(rs.getInt(1), rs.getString(2), rs.getString(3), 
				   rs.getInt(4), rs.getString(5), rs.getString(6),
				   rs.getString(7), rs.getString(8), rs.getString(9),
				   rs.getInt(10), rs.getString(11));
			}

			ArrayList<Book> cartBookList = (ArrayList<Book>)session.getAttribute("cartBookList");

			if (cartBookList == null) { //세션에 카트리스트가 없으면 카트 리스트는 선택된 모든 아이템 저장
				cartBookList = new ArrayList<Book>();
				session.setAttribute("cartBookList", cartBookList); //새로 생성
			}
			int cnt = 0;
			Book orderdBook = new Book(); //주문 상품
			for (int i = 0; i < cartBookList.size(); i++) {
				orderdBook = cartBookList.get(i); //세선에 추가된 상품을 주문 상품에 추가
		if (orderdBook.getBookID().eauls(bookID)) { //Cannot invoke equals(String) on the primitive type int
			//orderdBook.getBookID()==(bookID))
			//orderdBook.getBookID().equals((int)bookID))
			int orderedStock = orderdBook.getStock() + 1;
			orderdBook.setStock(orderedStock);
			out.print("++" + orderdBook.getStock());
		}
			}
			if (cnt == 0) { //카트에 추가된 적이 없으면
		selectedBook.setStock(1); //최초 주문수량을 1로 설정
		cartBookList.add(selectedBook); //카트리스트에 추가
			}
			/* out.print("aaa"); */
			response.sendRedirect("BookDetail.jsp?proId=" + bookID);
	%>

</body>
</html>