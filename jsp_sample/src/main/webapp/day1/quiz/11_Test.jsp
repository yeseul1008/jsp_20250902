<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- %를 여는 위치, 닫는 위치 잘 설정하면 이런식으로 html언어와 자바언어를 함께 쓸 수 있다 -->
	<%
		for(int i=1; i<=10; i++){
	%>
	<div>test</div>
	<div>1234</div>
	<span>zzzzz</span>
	<p>안녕?<p>
	<%
		}
	%>
	
</body>
</html>