<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	background-color: #BFAF84;
}

@font-face {
	font-family: 'GyeonggiBatang';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/GyeonggiBatang.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

* {
	font-family: 'GyeonggiBatang';
}

* {
	margin: 0;
	padding: 0;

}

a {
	text-decoration: none;
}

img {
	border: 1;
}
li {
	list-style: none;
}ol {
	list-style: none;
}


ul {
	list-style: none;
}

body {
	width: 980px;
	margin: 0 auto;
}
/* 헤더 */
#main_header {
	postion: relative;
	height: 120px;
}

#main_header>h1.logo {
	display: flex;
	justify-content: center;
	align-items: center;
}

#main_header>div.login_menu>span {
	position: absolute;
	top: 10px;
	right:100px;
}

#main_header>#login_menu>a {
	color:white;
}

/* 네비게이션 */
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;

}

li {
    float: left;
}

li a, .dropbtn {
    display: inline-block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

li a:hover, .dropdown:hover .dropbtn {
    background-color: #97a758;
}

li.dropdown {
	
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
	float: left;
    color: white;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
}

.dropdown-content a:hover {background-color: #97a758}

.dropdown:hover .dropdown-content {
    display: block;
}
/* 본문 */
#content {
	/* 	display: flex;
	justify-content: center;
	align-items: center; */
	margin-top: 10px;
}

#product_section {
	overflow: hidden;
	width:960px;
	margin:0 auto;
	margin-top: 5px;
}

#product_section>#product_article>img {
	overflow: hidden;
	float: left;
	padding: 5px;
	padding-top: 0px;
	width: 200px;
}

#product_section2>#product_aside {
	overflow: hidden;
	float: right;
	width: 750px;
	display: block;
	color: white;
}
#product_section2 {
	clear:both;
	overflow: hidden;
	width:960px;
	margin:0 auto;
	margin-top: 5px;
}
#product_section2>#product_article2>img {
	float: right;
	padding: 5px;
	padding-top: 0px;
	width: 600px;
}

#product_section>#product_aside2 {
	float: left;
	width: 250px;
	display: block;
	color: white;
}

/* 푸터 */
#main_footer {
	height : 40px;
	padding: 10px;
	margin-bottom: 10px;
	color: white;
	background: #000000;
	font-size:0.8em;
	border-radius: 5px;
	border-radius: 5px;
	text-align: center;

}

#main_fotter>h1 {
	font-size: 1.0em;
}
}
</style>

</head>
<body>
	<!-- 헤더 -->
	<header id="main_header">
		<h1 class="logo">
			<a href="#"><img src="img/logo.jpg" width=115px; /></a>
		</h1>
		<div class="login_menu">
			<span><a href="#">로그인</a></span> <span><a href="#">회원가입</a></span> <span><a
				href="#">장바구니</a></span>
		</div>

	</header>

	<!-- 메뉴 -->

	<!-- 네비게이션 -->

	<nav>
<ul>
  <li><a href="#">메인</a></li>
  <li class="dropdown">
    <a href="javascript:void(0)" class="dropbtn">책들</a>
    <div class="dropdown-content">
      <a href="#">소설</a>
      <a href="#">에세이</a>
      <a href="#">시집</a>
      <a href="#">단상집</a>
      <a href="#">그림책</a>
    </div>
  </li>
  <li><a href="#">1:1</a></li>
  <li><a href="#">FAQ</a></li>
  <li><a href="#">인스타</a></li>
</ul>
</nav>
	<hr>
	<p>
		<!-- 본문 -->
	<div id="content">
		<section id="product_section">
			<article id="product_article">
				<img src="http://placekitten.com/200/200"  />
			</article>
			<aside id="product_aisde">
				<h1>책방 소개</h1>
				소개입니다
			</aside>
		</section>
	</div>
	<hr>
	<p>
	<div id="content">
		<section id="product_section2">
			<aside id="product_aside2">
				<h1>네이버 지도</h1>
				서울 종로구 난계로27길 30-7 <br>✿ 운영시간 토일 | 12시 ~ 4시 평일

			</aside>
			<article id="product_article2">
				<img src="http://placekitten.com/700/200"/>
			</article>
		</section>
	</div>
	<hr>
	<p>
	<div id="content">
		<section id="product_section">
			<article id="product_article">
				<img src="http://placekitten.com/200/200"/>
			</article>
			<aside id="product_aisde">
				<h1>책방지기의 말</h1>
				==========================================================
			</aside>
		</section>
	</div>

	<!-- 푸터 -->
	<footer id="main_footer">
		마당책방<br /> ✿서울 종로구 난계로27길 30-7 ✿ 운영시간 토일 | 12시 ~ 4시 평일 |
	</footer>
</body>
</html>