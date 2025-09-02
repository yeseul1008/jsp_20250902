<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="login" action="Quiz1_Result.jsp" method="post">
		<div>
			<lable>아이디: <input type="text" name ="userId"></lable>
		</div>
		<div>
			<lable>패스워드: <input type="password" name ="pwd"></lable>
		</div>
	
		<!-- <input type="submit" value="로그인"> <!-- 클릭시 form태그의 action에 있는 페이지로 이동 -->
		<!-- <button onclick="fnCheck(); return false;">로그인</button> -->
		
		<input type="button" value="로그인" onclick="fnCheck()">
		<input type="button" value="회원가입">
		
	</form>
</body>
</html>
<script>
	// 아이디, 비밀번호가 빈 값이 아닐 때만 action 실행
	function fnCheck() {
		// from 태그의 name을 이용해서 객체 가져오기
		let login = document.login;
		if(login.userId.value.length == 0){
			alert("아이디를 입력해주세요.");
			login.userId.focus();
			return;
		}
		
		if(login.pwd.value.length == 0){
			alert("비밀번호를 확인해주세요.");
			login.pwd.focus();
			return;
		}
		// 위에 조건을 모두 통과했을 때 최종 submit(action 실행)
		login.submit();
	}
	
	
</script>