<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- form태그의 action을 실행하게되면 (submit) -->
	<!-- 내부에 있는 input박스의 값들을 파라미터로 보낸다 -->
	<!-- 이때, name속성이 key, 입력받은 값이 value -->
	
	<!-- 메소드 속성을 생략 가능, 디폴트는  -->
	
	<!-- "get"전송 방식은 url에 값을 담아서 보낸다. 보안에 취약함(비밀번호주소에 다뜸) -->
	<!-- 대신 빠른처리 가능 간단한정보보낼때 사용/ 사용자의 개인정보를 전송할 때 사용하면 안된다. -->
	
	<!-- "post" 전송 방식은 get이랑 반대 (데이터를 숨겨서 보냄) -->
	<!-- 실습할 때는 데이터 확인을 위해 주로 get으로 사용 -->
	<form action="8_LoginResult.jsp" method="post">
		<div>
			<lable>아이디: <input type="text" name ="userId"></lable>
		</div>
		<div>
			<lable>패스워드: <input type="password" name ="pwd"></lable>
		</div>
	
		<input type="submit" value="제출버튼"> <!-- 클릭시 form태그의 action에 있는 페이지로 이동 -->
	</form>


</body>
</html>