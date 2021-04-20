<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="menu.jsp"/>
<div class="jumbotron">
<div class="container">
		<h1 class="display-3">상품 등록</h1>
	</div>
</div>

<% String imageUrl = request.getContextPath()+"/upload"; %>


<div class="container">
	<form action="addBookProc.jsp" method="post" name="newBook" class="form-horizontal" enctype="multipart/form-data">
		<div class="form-group row">
		<label class="col-sm-2"><b>책 아이디(숫자로 입력)</b></label>
		<input type="text" name="bookID" id="bookID" class="form-control">
		</div>
		<div class="form-group row">
		<label class="col-sm-2"><b>책 제목</b></label>
		<input type="text" name="bookName" id="bookName" class="form-control">
		</div>
		<div class="form-group row">
		<label class="col-sm-2"><b>저자</b></label>
		<input type="text" name="bookAuthor" id="bookAuthor" class="form-control">
		</div>
		<div class="form-group row">
		<label class="col-sm-2"><b>가격</b></label>
		<input type="number" name="price" id="price" class="form-control">
		</div>
		<div class="form-group row">
		<label class="col-sm-2">책 내용</label>
		<textarea type="text" id="bookContent" name="bookContent" class="form-control"></textarea>
		</div>
		<div class="form-group row">
		<label class="col-sm-2">작가 소개</label>
		<input type="text" name="bookAuthorItd" id="bookAuthorItd" class="form-control">
		</div>
		<div class="form-group row">
		<label class="col-sm-2">책방지기 코멘트</label>
		<input type="text" name="CEOcomment" id="CEOcomment" class="form-control">
		</div>
		<div class="form-group row">
		<label class="col-sm-2">출판사</label>
		<input type="text" name="publisher" id="publisher" class="form-control">
		</div>
		<div class="form-group row">
		<label class="col-sm-10">카테고리
		<b>소설</b><input type="radio" name="category" value="소설" >
		<b>그림책</b><input type="radio" name="category" value="그림책" >
		<b>시집</b><input type="radio" name="category" value="시집" >
		<b>에세이</b><input type="radio" name="category" value="에세이" >
		</label>
		</div>
		
		<div class="form-group row">
		<label class="col-sm-2">수량</label>
		<input type="number" name="stock" id="stock" class="form-control">
		</div>
		
		<div class="form-group row">
		<label class="col-sm-2">상품이미지</label>
		<input type="file" name="filename" id="filename" class="form-control"> 
		</div> <!-- 이미지 이름 확인 -->
		
		<div class="form-group row">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="submit" class="btn btn-primary" value="등록">
			</div>  
		</div>
	</form>
</div>

<jsp:include page="footer.jsp"/>
</body>
</html>