<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여성시대학교 - 회원가입</title>
<script src="js/jquery-3.5.1.min.js"></script>
<style>

/* 로고이미지 */
.logoImg {
   position: absolute;
   top: 70px;
   left: 170px;
}

/* 대학이름 */
.logoDiv {
   display: inline-block;
   font-size: 27px;
   text-color: gray;
   font-weight: bold;
   position: absolute;
   top: 87px;
   left: 245px;
}



/* 1 */
#loginInform {
   display: inline-block;
   position: absolute;
   left: 0px;
   width: 1519.5px;
   height: 50px;
   background: #3867A6;
   color: white;
}

/* 2 */
#banner {
   position: absolute;
   top: 160px;
   left: 0px;
   width: 1520px;
   height: 240px;
   display: inline-block;
}

.join {
   position: absolute;
   top: 435px;
   left: 310px;
   font-weight: 800;
   font-size: 48px;
}

.mypageP2 {
   position: absolute;
   top: 565px;
   left: 320px;
   line-height: 10px;
   font-size: 15px;
}

.mypageLogout1 {
   color: white;
   cursor: pointer;
}

.mypageLogout2 {
   color: white;
   cursor: pointer;
}

.mypageLogout3 {
   position: absolute;
   top: 20px;
   left: 1065px;
   color: white;
}

/* 좌측 메뉴바 */
aside {
   position: absolute;
   top: 470px;
   width: 230px;
   height: 1500px;
   background: white;
   font-family: "맑은 고딕";
   font-weight: 700;
}


#menu {
   width: 200px;
   height: 100%;
   padding-right: 10px;
   font-size: 22px;
}

.menuList {
   list-style: none;
   text-align: center;
}

#menuimg {
   width: 150px;
   height: 80px;
}

a {
   text-decoration: none;
   color: black;
}

.mypageMenu {
   font-size: 18px;
}



/* 각자 구현 내용*/
section {
   position: absolute;
   top: 700px;
   left: 300px;
   background: white;
   width: 1200px;
   height: 1000px;
}

/* 라인 */
hr{ background-color: rgba(0, 0, 0, 0.3);
   height: 1px;
   border: 2;
   margin-left: 5px;}

#contentLine { /* hr선 색 수정 : background-color, height, border */
   margin-top: -100px;}


/* wgu에 오신것을 환영합니다. */
#welcome{font-size: 30px; 
  			font-weight: 600;
		 font-family: "맑은 고딕";}
		 
#wguWelcome{vertical-align: middle;}

/* ---------------------    내용작성 ------------------------------ */
sup{color: red;}

#input_value{width:500px; height:1000px;
   			position:absolute;
    		 top: 150px; left: 420px;
    		 font-size: large;}
/* 텍스트간격 */
form>label{line-height: 35px;} 	 
form>label{font-weight: bold;}
	
section button,#checkId{background-color: rgb(56, 103, 166);
					color: white; border: none;
					width: 100px; height: 30px;
					font-size: 12px;
					border-radius: 5px;
					cursor: pointer;}
					
					
.birth{cursor: pointer;}			
#gender{cursor: pointer;}
#department{cursor: pointer;}
#choice{cursor: pointer;}
.userGradeChoice{display: none;}	
	
/* 회원가입 버튼 */					
#joinclick{background-color: rgb(56, 103, 166);
			color: white;
			border: none;
			width: 200px; height: 50px;
			font-size: 21px;
			margin-top: 30px;
			margin-left: 90px;
			cursor: pointer;
			border-radius: 5px;
			}
	

footer {
	position: absolute;
   display: inline-block;
   left : 0px;
   margin-top: 700px;
   width : 100%;
   top : 1700px;
   height : 150px;
   background : #3867A6;
   color : white;
   text-align: center;
   }
   
#logoimg{
      width: 60px;
      height: 60px;
      position: relative;
      top: 60px;
      left: -400px;
   }
   
   #copyright{
      position: relative;
   }
   
</style>
</head>
<body>

   <!-- 헤더 -->
   <header>
   	<%@ include file="../common/menubar.jsp" %>
		<!-- 2 -->
      <img id='banner' src="image/5.png">
         <p class='join'>회원가입</p>
   </header>

   <!-- 각자 구현부분 -->
   <section>
   <!-- 라인 -->
   <hr id = 'contentLine'>
   
   <!-- wgu에 오신것을 환영합니다. --> 
	<p align="center" id = "welcome" >
	<img src ="image/로고2.png" id = "wguWelcome" width="80px" height="80px">
	  WGU에 오신 것을 환영합니다.
	</p>
	<hr>
	
<!--                            내용작성                                                                                       -->	
    
    <sup>*</sup>은 필수 입력 항목입니다.
	<br><br>
	<div id = "input_value">
		<form name = "inputSignUpForm" action ="<%=request.getContextPath() %>/insert.me" method="post" onsubmit="return checkSubmit();">
			<label><sup>*</sup>아이디</label><br>
			<input type="text" id="userId" name="userId" size="50" placeholder="5~10자이내의 영소문자, 숫자,특수문자(- _)허용"  maxlength="10" style="height:30px" required pattern="^[a-z0-9-_]{5,10}$">&nbsp; <input type="button" id="checkId" onclick="checkIdFun();" value="중복확인" >
			<div class="check_font" id="idFont"></div>
			<br>
			<label><sup>*</sup>비밀번호</label><br> 
			<input type="password" id="userPwd" name="userPwd" size="50" placeholder="8~16자이내의 영소문자, 숫자,특수문자(!@#$%^&*)허용" maxlength="16" style="height:30px" required pattern="^[a-z0-9!@#$%^&*]{8,16}$">
			<div class="check_font" id="pwdFont"></div>
			<br>
			<label><sup>*</sup>비밀번호 재확인</label><br>
			<input type="password" id="userPwdConfirm" name="userPwdConfirm" size="50" placeholder="위의 입력한 비밀번호와 동일하게 입력해 주세요."  maxlength="16" style="height:30px" required pattern="^[a-z0-9!@#$%^&*]{8,16}$">
			<div class="check_font" id="pwdConfirmFont"></div>
			<br>
			<label><sup>*</sup>이름</label><br>
			<input type="text" id="userName" name="userName" size="50" style="height:30px" required pattern="^[가-힣]{2,6}$">
			<div class="check_font" id="nameFont"></div>
			<br>
			<label><sup>*</sup>생년월일</label><br>
			<select class = "userBirthYear" name="years" id="years" style="height:40px; width:110px; margin-right: 10px;">
			<option value ="">년도</option></select>
			<select class = "userBirthMonth" name="month" id="month" style="height:40px; width:110px; margin-right: 10px;">
			<option value ="">월</option></select>
			<select class = "userBirthDay" name="days" id="days" style="height:40px; width:110px;">
			<option value ="">일</option></select>
			<script>
				$(function() {
			   	 //년도
			    	for (i = new Date().getFullYear(); i > 1900; i--){
			       		 $('#years').append($('<option />').val(i).html(i));
			   		 } 
					//월
			    	for (i = 1; i < 13; i++){
			        	$('#month').append($('<option />').val(i).html(i));
			   		 }
			   		 //일
			    	for (i = 1; i <= 31; i++){
			       		 $('#days').append($('<option />').val(i).html(i));
			   		 }
			   		 
				});
				
			</script>
			<br><br>
			<label><sup>*</sup>성별</label><br>
			<select id="gender" name="gender" style="height:40px; width:360px;">
			<option value ="">== 선택 ==</option>
			<option value="여자">여자</option>
			<option value="남자">남자</option>
			</select>
			<br><br>
			<label><sup>*</sup>이메일</label><br>
			<input type="email" id="userEmail" name="userEmail" size="50" placeholder= "wgu@naver.com" style="height:30px" required pattern="^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-z-A-Z]([-_.]?[0-9a-zA-Z])*.[a-z]{2,3}$">
			<div class="check_font" id="emailFont"></div>
			<br>
			<label>주소</label><br>
			<input type="text" id="userAddress" name="userAddress" size="50" style="height:30px">
			<br><br>
			<label><sup>*</sup>본인확인 휴대폰번호</label><br>
			<input type="tel" id="userPhone" name="userPhone" size="50" style="height:30px" placeholder=" -를 제외하고 입력해주세요."  required pattern="(010)([1-9]{1}[0-9]{2,3})([0-9]{4})$">
			<div class="check_font" id="phoneFont"></div>
			<br>
			<label><sup>*</sup>학과</label><br>
			<select id="department" name="department" style="height:40px; width:360px;">
			<option value ="">== 선택 ==</option>
			<option value="컴퓨터학과">컴퓨터학과</option>
			<option value="경영학과">경영학과</option>
			<option value="전자공학과">전자공학과</option>
			<option value="경제학과">경제학과</option>
			<option value="실용음악과">실용음악과</option>
			<option value="체육학과">체육학과</option>
			<option value="사회복지학과">사회복지학과</option>
			</select>
			<br><br>
			<label><sup>*</sup>회원구분</label><br>
			<select id="choice" name="userGroup"  style="height:40px; width:360px;">
			<option value ="" selected="selected">== 선택 ==</option>
			<option value="학생">학생</option>
			<option value="교수">교수</option>
			</select>
			<br><br>
			<div class = "userGradeChoice">
			<label><sup>*</sup>학년</label><br>
			<select id="grade" name="userGrade"  style="height:40px; width:360px;">
			<option value ="">== 선택 ==</option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			</select>
			</div>
			<br>
			<label><sup>*</sup>교수코드 & 학번</label><br>
			<input type="text" id="userNo" name="userNo" size="50" style="height:30px" required pattern="([SP])([0-9]{8})$">
			<div class="check_font" id="userNoFont"></div>
			<br><br>
		
		<!-- 회원가입버튼  -->
		<input type="submit" id ="joinclick" value="회원가입"/>	
	</form>
	</div>
	<script>
	//아이디 중복체크
	function checkIdFun(userId){
		var inputUserId = $('#userId').val();
		
		 $.ajax({
			url:'checkId.do',
			type:'post',
			dataType:'json',
			data:{userId:inputUserId},
			sucsess:function(data){
					if (data.cnt > 0){
						alert("아이디가 존재합니다.")
						$('#idFont').text('중복된 아이디 입니다.');
						$('#idFont').css({'color':'red','font-size':'small'});
						$("userId").focus();
					};
				}
			});
		 }
/* 	<!-- 유효성 체크 -->
	<!-- 회원구분에서 교수를 선택했을때는 학년 선택비활성화  -->
	<!--교수를 선택했을때는 다시 학년이 없어지도록  --> */
		$('#choice').change(function(){
			var state = $('#choice option:selected').val();
			if(state == '학생'){
			$('.userGradeChoice').show();
				} else {
				$('.userGradeChoice').hide();
				}
			});


	//onsubmit : 공백확인
			//입력란  유효성검사 1.정규식 변수 만들기
			//모든 공백 체크 정규식
			var empJ = /\s/g;
			//아이디 5~10자이내의 영소문자,숫자,특수문자(-_)
			var idJ = /^[a-z0-9-_]{5,10}$/;
			//비밀번호 8~16자이내의 영소문자, 숫자,특수문자(!@#$%^&*)허용"
			var pwdJ=/^[a-z0-9!@#$%^&*]{8,16}$/;
			//이름정규식 가~힣, 한글로 이뤄진 문자만으로  2~6자리이름
			var nameJ=/^[가-힣]{2,6}$/; 
			//이메일 검사
			var emailJ=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-z-A-Z]([-_.]?[0-9a-zA-Z])*.[a-z]{2,3}$/i;
			//전화번호 -를 뺀 010으로시작하는 12자리
			var phoneJ=/(010)([1-9]{1}[0-9]{2,3})([0-9]{4})$/;
			
			//교수 코드, 학번 S나P로 시작해야하고 숫자8자리여야한다.
			var userNoJ=/([SP])([0-9]{8})$/;	

				
			//아이디유효성검사
			$("#userId").blur(function(){
				if(idJ.test($(this).val())){
					//콘솔창에 확인하기
					console.log(idJ.test($(this).val()));
					$("#userId").text('');
					$('#idFont').text('사용가능한 아이디입니다!');
					$('#idFont').css({'color':'mediumblue','font-size':'small'});
				} else {
					$('#idFont').text('5~10자의 영문 소문자, 숫자와 특수문자(-),(_)만 사용 가능합니다.');
					$('#idFont').css({'color':'red','font-size':'small'});
				}
			});
				
			//비밀번호 확인
			$("#userPwd").blur(function(){
				if(pwdJ.test($(this).val())){
					//콘솔창에 확인하기
					console.log('true');
					$('#pwdFont').text('사용가능한 비밀번호입니다.');
					$('#pwdFont').css({'color':'mediumblue','font-size':'small'});
					} else {
						$('#pwdFont').text('8~16자 영문 소문자, 숫자, 특수문자(!@#$%^&*)를 허용합니다.');
						$('#pwdFont').css({'color':'red','font-size':'small'});
					}	
				});
			
			//비밀번호 일치 확인
			$("#userPwdConfirm").blur(function(){
				if($('#userPwd').val() == $(this).val()){
					$('#pwdConfirmFont').text('비밀번호가 일치합니다.');
					$('#pwdConfirmFont').css({'color':'mediumblue','font-size':'small'});
					} else {
						$('#pwdConfirmFont').text('비밀번호가 일치하지 않습니다.');
						$('#pwdConfirmFont').css({'color':'red','font-size':'small'});
						$('#joinclick').attr("disabled",true);
					}
				});
			
			//이름확인
			$("#userName").blur(function(){
				if(nameJ.test($(this).val())){
					//콘솔창에 확인하기
					console.log(nameJ.test($(this).val()));
					$("#userName").text('');
					$('#nameFont').text('');
				} else {
					$('#nameFont').text('올바른 이름이 아닙니다.');
					$('#nameFont').css({'color':'red','font-size':'small'});
				}
			});
			
			$("#userEmail").blur(function(){
				if(emailJ.test($(this).val())){
					//콘솔창에 확인하기
					console.log(emailJ.test($(this).val()));
					$("#userEmail").text('');
					$('#emailFont').text('');
				} else {
					$('#emailFont').text('올바른 이메일 주소가 아닙니다.');
					$('#emailFont').css({'color':'red','font-size':'small'});
				}
			});
			
			//휴대폰번호유효성검사
			$("#userPhone").blur(function(){
				if(phoneJ.test($(this).val())){
					//콘솔창에 확인하기
					console.log(phoneJ.test($(this).val()));
					$("#userPhone").text('');
					$('#phoneFont').text('');
				} else {
					$('#phoneFont').text('올바른 휴대폰번호가 아닙니다.');
					$('#phoneFont').css({'color':'red','font-size':'small'});
				}
			});
			
			
			//교수코드 학번 유효성검사
			$("#userNo").blur(function(){
				if(userNoJ.test($(this).val())){
					//콘솔창에 확인하기
					console.log(userNoJ.test($(this).val()));
					$("#userNo").text('');
					$('#userNoFont').text('');
				} else {
					$('#userNoFont').text('올바른 교수코드나 학번이 아닙니다.');
					$('#userNoFont').css({'color':'red','font-size':'small'});
				}
			});
			
			
function checkSubmit(){	
			if($('#userId').val()==''){
				alert("아이디를 입력하지 않았습니다.");
				$('#userId').focus();
				return false;
				}
			
			if($('#userPwd').val()==''){
				alert("비밀번호를 입력하지 않았습니다.");
				$('#userPwd').focus();
				return false;
				}
			
			if($('#userPwdConfirm').val()==''){
				alert("비밀번호를  재확인을 입력하지 않았습니다.");
				$('#userPwdConfirm').focus();
				return false;
				}
			
			if($('#userName').val()==''){
				alert("이름을 입력하지 않았습니다.");
				$('#userName').focus();
				return false;
				}
			
			if($('#years').val()==''|| $('#month').val()==''|| $('#days').val() ==''){
				alert("생일을 선택하지 않았습니다.");
				$('#years').focus();
				return false;
				}
			
			if($('#gender').val()==''){
				alert("성별을 선택하지 않았습니다.");
				$('#gender').focus();
				return false;
				}
			
			if($('#userEmail').val()==''){
				alert("이메일을 입력하지 않았습니다.");
				$('#userEmail').focus();
				return false;
				}
			
			if($('#userPhone').val()==''){
				alert("휴대폰번호를 입력하지 않았습니다.");
				$('#userPhone').focus();
				return false;
				}
			
			if($('#department').val()==''){
				alert("학과를 선택하지 않았습니다.");
				$('#department').focus();
				return false;
				}
			
			if($('#choice').val()==''){
				alert("회원 종류를 선택하지 않았습니다.");
				$('#choice').focus();
				return false;
				}
			
			//학생은 학년을 선택해야함
			if($('#choice').val()=='학생' && $('#grade').val()==''){
				alert("학년을 선택하지 않았습니다.");
				$('#grade').focus();
				return false;	
				} 
				
			
			if($('#userNo').val()==''){ 
				if($('#choice').val()=='학생'){
				alert("학번을 입력하지 않았습니다.");
				$('#userNo').focus();
				} else{ 
					alert("교수코드를 입력하지 않았습니다.");
					$('#userNo').focus();
					}
				return false;	
				}
			
			

		
//스크립트 끝 	
		}
		</script>
   </section>

   <!-- 좌측 메뉴바 -->
  <aside>
      <div id='menu' class='menuDiv'>
         <ul class='menuList'>
            <li>회원 페이지</li>
            <li><img src="image/줄.PNG"></li>
            <li><br><a onclick="loginPlz();" class='mypageMenu' style="cursor: pointer;">수강신청하기</a><br><br></li>
            <li><a onclick="loginPlz();" class='mypageMenu' style="cursor: pointer;" >스쿨버스예약하기</a><br><br></li>
            <li><a onclick="loginPlz();" class='mypageMenu' style="cursor: pointer;">학식예약하기</a><br><br></li>
         </ul>
      </div>
   </aside>
   <script>
   function loginPlz(){
	   window.alert("회원만 이용이 가능합니다.");
   }
   </script>
</body>
<footer>
   <div id=logo>
      <img id="logoimg" src = "image/로고.jpg">
   </div>
   <div id="copyright">
      01234 서울시 강남구 강남구 테헤란로14길 6 남도빌딩 | TEL. (02)1234-0000 | FAX.(02)0000-1234<br>
      COPYRIGHT(C) 2020 WOMEN GENERATION UNIVERSITY. ALL RIGHTS RESERVED.
   </div>
 </footer>
</html>