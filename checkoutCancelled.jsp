<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width", initial-scale="1" >  <!-- 반응형 웹에 사용하는 메타태그 -->
<link rel="stylesheet" href="../css/bootstrap.css"> <!-- 참조  -->
</head>
<body>

<jsp:include page="../menuCart.jsp"/>
<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문취소</h1>
			<div class="alert alert-danger">
				<h1 class="display-4">주문이 취소되었습니다.</h1>
			</div>
			<p><a href="../products.jsp" class="btn btn-secondary">&laquo;상품 목록</a></p>
		</div>
	</div>
<jsp:include page="../footer.jsp"/>	
 <script src="https://code.jquery.com/jquery-3.3.7.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>