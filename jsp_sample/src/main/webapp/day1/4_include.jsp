<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 모든 페이지에서 공동되는 헤더, 푸터영역은 모든 페이지마다 따로 생성하면 -->
	<!-- 유지보수 측면에서 불편함 그래서 include 를 사용한다 -->

	<!-- 헤더 영역~~~ -->
	<%@ include file="Header.jsp" %>
	<hr>
	
	<!-- 메인 영역~~~ -->
	<div>메인 ~~~ 메인 123</div>
	<hr>
	
	<!-- 푸터 영역~~~ -->
	<%@ include file="Footer.jsp" %>
</body>
</html>