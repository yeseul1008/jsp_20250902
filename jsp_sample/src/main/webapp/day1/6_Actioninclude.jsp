<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 디렉티브 -->
	<!-- 파일을 한곳에 다 모은 다음 컴파일한다 -->
	<%@ include file="Variable.jsp" %>
	
	
	<!-- 액션태그 -->
	<!-- 각 파일에서 먼저 컴파일하고 그 결과를 모아서 출력 -->
	<!--<jsp:include page="Variable.jsp"></jsp:include>-->
	<!-- 액션태그는 밑 코드 오류남 -->
	
	
	<%= num1+num2 %>
	
	
	
</body>
</html>