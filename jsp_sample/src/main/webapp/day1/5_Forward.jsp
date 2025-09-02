<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 리퀘스트로 파라미터로 보내는거도 가능 -->
    <jsp:forward page="ForwardView.jsp">
        <jsp:param name="userId" value="hong123"/>
        <jsp:param name="age" value="30"/>
    </jsp:forward>
	
	
</body>
</html>