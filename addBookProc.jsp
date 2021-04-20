<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.util.Enumeration"%>
<%@page import="javax.sql.DataSource"%>

<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	MultipartRequest multi = null;
	String path = application.getRealPath("/upload");
	int size = 1024*1024*10;
		multi = new MultipartRequest(
		request, path, size, "UTF-8", new DefaultFileRenamePolicy());
		
		int bookID = Integer.parseInt(multi.getParameter("bookID")); //책 아이디
		String bookName = multi.getParameter("bookName"); //책 제목
		String bookAuthor = multi.getParameter("bookAuthor"); //저자
		int price = Integer.parseInt(multi.getParameter("price")); //가격
		String bookContent = multi.getParameter("bookContent"); //책 내용
		String bookAuthorItd = multi.getParameter("bookAuthorItd"); //작가소개
		String CEOcomment = multi.getParameter("CEOcomment"); //책방지기 코멘트
		String publisher = multi.getParameter("publisher"); //출판사
		String category = multi.getParameter("category"); //카테고리
		int stock = Integer.parseInt(multi.getParameter("stock")); //수량
		String filename = multi.getParameter("filename"); //파일 올리기 
		
		
		Enumeration files = multi.getFileNames();
		String name = (String)files.nextElement();
		String file = multi.getFilesystemName(name);
		String orgFile = multi.getOriginalFileName(name);
		
		InitialContext ic = new InitialContext();
		DataSource ds = (DataSource) ic.lookup("java:comp/env/jdbc/myoracle");
		Connection conn = ds.getConnection();

		PreparedStatement pstmt = conn.prepareStatement("insert into book values(?,?,?,?,?,?,?,?,?,?,?)");
		pstmt.setInt(1, bookID);
		pstmt.setString(2, bookName);
		pstmt.setString(3, bookAuthor);
		pstmt.setInt(4, price);
		pstmt.setString(5, bookContent);
		pstmt.setString(6, bookAuthorItd);
		pstmt.setString(7, CEOcomment);
		pstmt.setString(8, publisher);
		pstmt.setString(9, category);
		pstmt.setInt(10, stock);
		pstmt.setString(11, filename); 
		pstmt.executeQuery();
		
		pstmt.close();
		conn.close();
		
		out.println(bookID);
	%>
	
	<%--  <c:set var="pro" value="<%=product%>" /> --%>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 입력내역</h1>
		</div>
	</div>
	<div class="container">
	<div class="col-md-6">
		<h1>저장이 완료되었습니다!</h1>
		<p><b>책 아이디 : ${bookID}</b></p>
		<p><b>책 제목 : ${bookName}</b></p>
		<p><b>작가 소개 : ${bookAuthor}</b></p>
		<p><b>가격: ${price}</b></p>
		<p><b>책 내용 : </b> ${bookContent}</p>
		<p><b>작가 소개 : </b> ${bookAuthorItd}</p>
		<p><b>책방지기 코멘트 : </b>${CEOcomment}</p>
		<p><b>출판사 : </b>${publisher}</p>
		<p><b>카테고리 : </b>${category}</p>
		<p><b>수량 : </b>${stock}</p>
		<p><b>파일  : </b>${filename}</p>
		<a href="Books.jsp" class="btn btn-secondary">상품목록으로 이동&raquo;</a>
	</div>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>