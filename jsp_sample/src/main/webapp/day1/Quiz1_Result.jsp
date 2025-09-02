<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quiz1_Result.jsp</title>
</head>
<body>
	<!-- userId가 'test', 'pwd'가 '1234'로 넘어올 경우 -->
	<!-- 화면에 파란색 글씨로 로그인 성공 출력 -->
	<!-- 아닐경우 빨간색 글씨로 '로그인 실패' 출력 -->
	
	<% 
	String userId = request.getParameter("userId");
	String pwd = request.getParameter("pwd");
	
	if(userId.equals("test") && pwd.equals("1234")){
		// out.println("<h2 style='color: blue'>로그인 성공!</h2>");
		response.sendRedirect("Main.jsp");
	} else{
		out.println("<h2 style='color: red'> 로그인 실패</h2>");
	}
	
	%>
	<div>아이디 : <%= request.getParameter("userId") %> </div>
	<div>패스워드 : <%= request.getParameter("pwd") %> </div>
	
</body>
</html>