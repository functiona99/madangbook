<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width", initial-scale="1" >  <!-- 반응형 웹에 사용하는 메타태그 -->
<link rel="stylesheet" href="css/bootstrap.css"> <!-- 참조  -->
</head>
<body>
<jsp:include page="menuCart.jsp"/>

<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">배송정보입력</h1>
	</div>
</div>

<div class="container">


		<form action="shippingProc.jsp" class="form-horizontal" method="post">
			<input type="hidden" name="cartId"
				value="<%=request.getParameter("cartId")%>" />
			<div class="form-group row">
				<label class="col-sm-2">이름</label>
				<div class="col-sm-3">
					<input type="text" name="name" class="form-control">
				</div>
			</div>
			
			<div class="from-group row">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-3">
					<input type="text" name="phoneNo" class="phoneNo" />
				</div>
			</div>

			<div class="from-group row">
				<label class="col-sm-2">우편번호</label>
				<div class="col-sm-3">
					<input type="text" name="zipCode" class="form-control" />
				</div>
			</div>
			
			<div class="from-group row">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-3">
					<input type="text" name="addr" class="form-control" />
				</div>
			</div>

			<div class="form-group-row">
				<div class="col-sm-offset-2 col-sm-10">
					<a href="cart.jsp?cartId=<%=request.getParameter("cartID")%>"
						class="btn btn-secondary" role="버튼">이전</a> <input type="submit"
						class="btn btn-primary" value="등록" /> <a
						href="checkoutCanceled.jsp" class="btn btn-secondary" role="버튼">취소</a>
				</div>
			</div>
		</form>
	</div>
<jsp:include page="../footer.jsp"/>
</body>
</html>