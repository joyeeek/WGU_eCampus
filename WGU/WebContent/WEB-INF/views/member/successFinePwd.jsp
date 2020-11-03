<%@page import="wgu.member.model.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="wgu.member.model.vo.Member"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script src="js/jquery-3.5.1.min.js"></script>
<style>
#pwdFine{font-size: 25px; 
  		font-weight: 800;
  		text-align: center;
		 font-family: "맑은 고딕";
		 margin-top: 30px;}
		 
#pwdFineMsg{font-size: 15px;
			text-align: center;
			color: rgb(93, 93, 93);
			margin-top: -20px;}		 

#pwdFineText{border: 2px solid rgb(216,216,216);
			margin-left: 40px;
			padding: 50px; width: 250px; height: 230px;
			background-color: rgba(242, 255, 237, 0.4);
			font-weight: 800;}

#finePwdTable{margin-top: -20px;}

input{margin-left: -15px;
		margin-bottom: 5px;}			
		
#pwdFont, #pwdConfirmFont{margin-bottom: 20px; text-align: left;}		
			
#okBtn{background-color: rgb(56, 103, 166);
			color: white;
			border: none;
			width: 200px; height: 40px;
			font-size: 15px;
			margin-left: 20px;
			border-radius: 5px;
			cursor: pointer; }

.check_font{font-weight: normal;
			font-size: small;}
	
</style>
</head>
<body> 
         <div>
   		 <p id="pwdFine">비밀번호 찾기</p> 
   		 <p id="pwdFineMsg">새로운 비밀번호를 설정해주세요<br>8~16자이내의 영소문자,숫자,특수문자(!@#$%^&*)를 사용<br>비밀번호 확인이 일치해야만 변경이 가능합니다.</p>
   		
   		<!-- 텍스트 다이브 -->
   		<form name = "memberNewPwd" action ="<%=request.getContextPath() %>/updatePwd.me" method="post" onsubmit="return checkSubmit();">
   		<div id = "pwdFineText">
		<table id="finePwdTable">
		<tr>
			<td>새로운 비밀번호 입력<br></td>
		</tr>
		<tr>
			<td><input type = "password" id ="newPwd" name="newPwd" size="35" maxlength="16" style="height:30px"/></td>
		</tr>
		<tr>
			<td><div class="check_font" id="pwdFont"></div></td>
		</tr>		
		<tr>
			<td>새로운 비밀번호 확인</td>
		</tr>
		<tr>
			<td><input type = "password" id ="newPwdConfirm" name="newPwdConfirm" size="35" maxlength="16" style="height:30px"/></td>
		</tr>
		<tr>
			<td><div class="check_font" id="pwdConfirmFont"></div></td>
		</tr>
		
		<tr>
			<td><input type = "submit" id="okBtn" value="확인"></td>
		</tr>
		</table>
		</div>	
		</form>	
   		</div>

      <script>
    //비밀번호 8~16자이내의 영소문자, 숫자,특수문자(!@#$%^&*)허용"
		var pwdJ=/^[a-z0-9!@#$%^&*]{8,16}$/;
		
		//비밀번호 확인
		$("#newPwd").blur(function(){
			if(pwdJ.test($(this).val())){
				//콘솔창에 확인하기
				console.log('true');
				$('#pwdFont').text('사용가능한 비밀번호입니다.');
				$('#pwdFont').css({'color':'mediumblue','font-size':'small'});
				$('#okBtn').attr("disabled",false);
				} else {
					$('#pwdFont').text('8~16자 영문 소문자, 숫자, 특수문자(!@#$%^&*)를 허용합니다.');
					$('#pwdFont').css({'color':'red','font-size':'small'});
				}	
			});
		
		//비밀번호 일치 확인
		$("#newPwdConfirm").blur(function(){
			if($('#newPwd').val() == $(this).val()){
				$('#pwdConfirmFont').text('비밀번호가 일치합니다.');
				$('#pwdConfirmFont').css({'color':'mediumblue','font-size':'small'});
				} else {
					$('#pwdConfirmFont').text('비밀번호가 일치하지 않습니다.');
					$('#pwdConfirmFont').css({'color':'red','font-size':'small'});
					$('#okBtn').attr("disabled",true);
				}
			});
		
		//입력하지 않았을때
		function checkSubmit(){
			if($('#newPwd').val()==''){
				alert("비밀번호를 입력해주세요.");
				$("#newPwd").focus();
				return false;
			}
			
			if($('#newPwdConfirm').val()==''){
				alert("비밀번호를 다시한번 입력해주세요.");
				$("#newPwdConfirm").focus();
				return false;
			}
		}
		
         //확인버튼 클릭시 새로운비밀번호 등록하고 메인으로 넘어가기 
<%--          function okBtn(){
        	 opener.location.href="<%=request.getContextPath()%>/loginForm.me";
        	 window.close();
         } --%>
      </script>
</body>
</html>