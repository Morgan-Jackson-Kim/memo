<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" href="/static/css/style.css">
<title>메모 - 회원가입</title>
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		<section class="content  d-flex justify-content-center">
			<div class="signUp-box h-100 d-flex justify-content-center align-items-center">
				<div class="w-100">
					<h1 class="text-center">회원가입</h1>
					<input type="text" class="form-control mt-3" id="loginIdInput" placeholder="아이디">
					<input type="password" class="form-control mt-3" id="passwordInput" placeholder="패스워드">
					<input type="password" class="form-control mt-3" id="passwordConfirmInput" placeholder="패스워드 확인">
					<small class="text-danger d-none " id="errorPassword">비밀번호가 일치하지 않습니다.</small>
					<input type="text" class="form-control mt-3" id="nameInput" placeholder="이름">
					<input type="text" class="form-control mt-3" id="emailInput" placeholder="이메일">
					<button id="signUpBtn" type="submit" class="btn btn-info btn-block mt-3">회원가입</button>
				</div>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>
	
	<script>
		$(document).ready(function(){
			$("#signUpBtn").on("click",function(){
				var signId = $("#loginIdInput").val();
				var password = $("#passwordInput").val();
				var passwordConfirm = $("#passwordConfirmInput").val();
				var name = $("#nameInput").val().trim();
				var email = $("#emailInput").val().trim();
				
				if(signId == null || signId ==  ""){
					alert("아이디를 입력해주세요");
					return;
				}
				if(password == null || password ==  ""){
					alert("비밀번호를 입력해주세요");
					return;
				}
				if(password != passwordConfirm || passwordConfirm ==  "" || passwordConfirm ==  null){
					$("#errorPassword").removeClass('d-none')
					return;
				}
				if(password == passwordConfirm){
					$("#errorPassword").addClass('d-none')
				}
				
				if(name == null || name ==  ""){
					alert("이름를 입력해주세요");
					return;
				}
				if(email == null || email ==  ""){
					alert("이메일 입력해주세요");
					return;
				}
				
			});
		});
	</script>
	
	
</body>
</html>