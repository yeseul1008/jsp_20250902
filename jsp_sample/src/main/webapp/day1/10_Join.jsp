<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="login" action="Join_Result.jsp" method="post">
		<div>
			<label>아이디: <input name="userId"></label>
		</div>
		<div>
			<label>비밀번호: <input type="password" name="pwd"></label>
		</div>
		<div>
			<label>비밀번호 확인: <input type="password" name="pwdCk"></label>
		</div>
		<div>
			<label>이름: <input type="password" name="name"></label>
		</div>
		<div>
		<label><input type="radio" name="gender" value="M">남자</label>
		<label><input type="radio" name="gender" value="F">여자</label>
		</div>
		<div>
			취미:
			<label><input type="checkbox" name="hobby" value="운동">운동</label>
			<label><input type="checkbox" name="hobby" value="코딩">코딩</label>
			<label><input type="checkbox" name="hobby" value="독서">독서</label>
			<label><input type="checkbox" name="hobby" value="영화감상">영화감상</label>
			<label><input type="checkbox" name="hobby" value="게임">게임</label>
		
		</div>
		<div>
			<input type="submit" value="가입" onclick="fnCheck()">
		</div>
	</form>	



</body>
</html>
<script>

	function fnCheck() {
		// from 태그의 name을 이용해서 객체 가져오기
		let login = document.login;
		if(login.userId.value.length < 6){
			alert("아이디는 6글자 이상 입력해주세요.");
			login.userId.focus();
			return;
		}
		
		if(login.pwd.value.length < 8){
			alert("비밀번호는 8글자 이상 입력해주세요");
			login.pwd.focus();
			return;
		}
		if(login.pwd.value !== login.pwdCk.value){
		    alert("비밀번호와 비밀번호 확인 값이 다릅니다");
		    login.pwdCk.focus();
		    return;
		}
		// 위에 조건을 모두 통과했을 때 최종 submit(action 실행)
		login.submit();
	}
	
	
</script>