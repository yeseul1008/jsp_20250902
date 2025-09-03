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
		String name = request.getParameter("userName");
		String age = request.getParameter("age");
		/* String으로 받아와야함 */
		/* js=> parseInt() */
		/* java=> Integer.parseInt */
		out.println(name+"님의 나이는"+age+"입니다.");
		/* 자바문법으로 출력 */
	%>
	<div>
	<!-- 표현식으로 출력 -->
	<%= name+"님의 나이는"+age+"입니다." %>
	</div>
	
</body>
</html>