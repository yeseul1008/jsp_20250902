<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 자바처럼 외부클래스는 import를 해서 사용해야함 -->
	<!-- 자바랑 import 방법에 차이가 있다. html에서 작성해야하기 때문 -->
	
	<%@ page import="java.util.Date"  %>
	
	<%= (new Date()).toLocaleString() %>
	
	
</body>
</html>