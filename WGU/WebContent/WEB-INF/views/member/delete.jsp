<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="wgu.member.model.vo.Member"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여성시대학교 - 회원탈퇴</title>
<script src="js/jquery-3.5.1.min.js"></script>
<style>

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

.mypageLogout1 {
   position: absolute;
   top: 20px;
   left: 1140px;
   color: white;
}

.mypageLogout2 {
   color: white;
   cursor: pointer;
}



.btn1 {
	position : absolute;
	left : 280px;
	border : none;
	background-color : #3867A6;
	color : white;
	cursor: pointer;
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


.delete {
   position: absolute;
   top: 435px;
   left: 310px;
   font-weight: 800;
   font-size: 48px;
}


/* ---------------- 각자 구현부분 ---------------------- */

section {
   position: absolute;
   top: 700px;
   left: 300px;
   background: white;
   width: 1300px;
   height: 1000px;
}



#fine {
   background: white;
   border-bottom-color: white;
}

	
/* 회원탈퇴 입력내용 */	
#deleteLine{margin-top: -120px; margin-left: -10px; height: 2px;
		 	width: 1250px;}

#deleteInfo{font-size: 35px; 
	  		font-weight: 800;
			 font-family: "맑은 고딕";
			 margin-top: 100px;
			 margin-left: -188px;}
			 
#deleteInfoMsg{font-size: 18px;
			color: rgb(93, 93, 93);
			 margin-top: -20px;
			margin-left: -200px;}		

#deleteText{width:500px; height:1500px;
   			margin-top: 50px; margin-left: 300px;
    		font-size: large;
    		border: 2px solid rgb(216,216,216);
			padding: 50px; width: 400px; height: 470px;
			background-color: rgba(242, 255, 237, 0.4);
			text-align: center;}	
	

#userGroupLabel{margin-left: 0px;}

#userNameLabel{margin-right: 43px;}

#userDeleteClick{background-color: rgb(56, 103, 166);
			color: white;
			border: none;
			width: 300px; height: 50px;
			font-size: 21px;
			margin-top: 50px;
			margin-left: 405px;
			border-radius: 5px;
			cursor: pointer; }
		

#deleteText>label{display: block; margin-top: 25px; color: rgb(71, 71, 71);
					margin-left: 80px; text-align: left; font-weight: bold;}


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

.bannerTxt{
position : absolute;
top : -700px;
left : -300px;
}

.mypageDiv{
position : absolute;
top : 5px;
left : 10px;
width : 300px;
}

.mypage {
width : 250px;
}

footer {
   display: inline-block;
    position : absolute;
    left : 0px;
   top: 1845px;
   width : 100%;
   height : 150px;
   background : #3867A6;
   color : white;
   text-align: center;
   }




</style>
</head>
<body>
	<!-- 헤더 -->
   	<header>
   	<%@ include file="../common/menubar.jsp" %>
   	
	<!-- 2 -->
	 <!-- 라인 -->
      <img id='banner' src="image/5.png">
         <p class='delete'>회원탈퇴하기</p>
   </header>
 	 
   <!-- 각자 구현부분 -->
   <section>     
       <!-- 회원탈퇴입력 내용-->
         <div>
         <hr id ="deleteLine">
   		 <p align="center" id="deleteInfo">회원탈퇴 안내입니다.</p> 
   		 <p align="center" id="deleteInfoMsg">회원탈퇴시 모든 정보가 삭제되오니 신중하게 탈퇴 신청을 해주시기 바랍니다.<br>
   		 회원님의 정보보호를 위해 비밀번호를 다시한번 입력해주시기 바랍니다.</p>
   		<form name ="deleteForm" action="<%=request.getContextPath() %>/delete.me" method="post" onsubmit="return inputPass();">
   		<div id = "deleteText">
		<label id ="userGroupLabel">회원구분<br>
		<input type ="text" value="<%= loginUser.getMemberGroup() %>" size="30" maxlength="10" style="height:30px; background:whitesmoke;" readonly="readonly">
		</label>
		<label id="userNameLabel">이름<br>
		<input type ="text" value="<%= loginUser.getMemberName() %>" size="30" maxlength="16" style="height:30px; background:whitesmoke;" readonly="readonly">
		</label>
		<label id="userIdLabel">아이디<br>
		<input type ="text" name="userId" id="userId" value="<%= loginUser.getMemberId() %>" size="30" maxlength="16" style="height:30px; background:whitesmoke;" readonly="readonly">
		</label>
		<label id="userPwdLabel">비밀번호<br>
		<input type ="password" name="userPwd" id="userPwd" size="30" maxlength="16" style="height:30px">
		</label>	
		<label id="PwdConfirmLabel">비밀번호 재확인<br>
		<input type ="password" name="pwdConfirm" id="pwdConfirm" size="30" maxlength="16" style="height:30px">
		</label>
		<div class="check_font" id="pwdConfirmFont"></div>
		</div>
		<input type="submit" value="회원탈퇴" id = "userDeleteClick">
   		</form>
   		</div>
   </section>
	<script>
		//비밀번호 일치확인
		$("#pwdConfirm").blur(function(){
			if($('#userPwd').val() == $(this).val()){
				$('#pwdConfirmFont').text('');
				$('#userDeleteClick').attr("disabled",false);
				} else {
					$('#pwdConfirmFont').text('비밀번호가 일치하지 않습니다.');
					$('#pwdConfirmFont').css({'color':'red','font-size':'small'});
					$('#userDeleteClick').attr("disabled",true);
					}
				});
		
		//비밀번호 입력하지 않았을때 경고창
		function inputPass(){
			if($('#userPwd').val()==''){
				alert("비밀번호를 입력해주세요.");
				$("#userPwd").focus();
				return false;
			}
			
			if($('#pwdConfirm').val()==''){
				alert("비밀번호를 다시한번 입력해주세요.");
				$("#pwdConfirm").focus();
				return false;
			}
		}
	</script>


   <!-- 좌측 메뉴바 -->
    <aside>
      <div id='menu' class='menuDiv'>
         <ul class='menuList'>
            <li>회원 페이지</li>
            <li><img src="image/줄.PNG"></li>
            <li><br><a onclick="subjectBtn();" class='mypageMenu' style="cursor: pointer;">수강신청하기</a><br><br></li>
            <li><a onclick="busBtn();" class='mypageMenu' style="cursor: pointer;" >스쿨버스예약하기</a><br><br></li>
            <li><a onclick="mealBtn();" class='mypageMenu' style="cursor: pointer;">학식예약하기</a><br><br></li>
         </ul>
      </div>
   </aside>
   <script>
   function subjectBtn(){
		location.href="<%= request.getContextPath() %>/applySubject.su";   
   }
   
   function busBtn(){
	   location.href="<%= request.getContextPath() %>/bus.wgu";
   }
   
   function mealBtn(){
	   location.href="<%= request.getContextPath() %>/list.cafe";
   }
   </script>
      <footer>
   	<%@ include file="../common/foot.jsp" %>
   </footer>
</body>
</html>