<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여성시대학교 - 계정정보찾기</title>
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
   color: white;
}

.mypageLogout2 {
   color: white;
   cursor: pointer;
}

.mypageLogout3 {
   position: absolute;
   top: 20px;
   left: 1120px;
   color: white;
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

.fine {
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
   width: 1200px;
   height: 1000px;
}


/* 탭 */
.tab {
   list-style: none;
   margin-top: -80px;
   margin-left: -30px;
}

.tab>li {
   display: inline-block;
   background: rgb(236, 236, 236);
   font-family: '맑은 고딕';
   font-size: 15px;
   width: 200px;
   height: 50px;
   text-align: center;
   display: table-cell;
   vertical-align: middle;
   border: 1px solid rgba(0, 0, 0, 0.3);
   cursor: pointer;
}


#fine {
   background: white;
   border-bottom-color: white;
}

/* 라인 */
#contentLine { /* hr선 색 수정 : background-color, height, border */
   margin-top: -17px;
   background-color: rgba(0, 0, 0, 0.3);
   height: 1px;
   border: 0;
   margin-left: 414px;
}


/* 탭안에 내용 넣는 영역  */
.tab-content.current {display: inherit;}

#tabs2 {width: 70%;}
.tab-content {display: none;}


table {
   margin-left: 33px;
}

/* 아이디 찾기 CSS */
#idFine{font-size: 35px; 
  		font-weight: 800;
		 font-family: "맑은 고딕";
		 margin-top: 100px;}
		 
#idFineMsg{font-size: 18px;
			color: rgb(93, 93, 93);
			margin-top: -10px;}		 

#fineText{width: 400px; height: 200px;
   			margin-top: 30px; margin-left: 335px;
    		 font-size: large; font-weight: bold;
    		 border: 2px solid rgb(216,216,216);
			padding: 60px; 
			background-color: rgba(242, 255, 237, 0.4);
			text-align: left;}

#fineText>label{color: rgb(71, 71, 71);}
#idLabel{margin-left: 89px;}
#phoneLabel{margin-left: 33px;}
#numLabel{margin-right: 20px;}


#idFineClick{background-color: rgb(56, 103, 166);
			color: white;
			border: none;
			width: 300px; height: 50px;
			font-size: 21px;
			margin-top: 50px;
			margin-left: 445px;
			border-radius: 5px;
			cursor: pointer; }
				

/* 요소 바꾸기 */
#fineText>label{display: block; margin-top: 10px;}


/* 비밀번호 찾기 CSS */
#pwdFine{font-size: 35px; 
  		font-weight: 800;
		 font-family: "맑은 고딕";
		 margin-top: 100px;}
		 
#pwdFineMsg{font-size: 18px;
			color: rgb(93, 93, 93);
			margin-top: -10px;}		 

#pwdIdLabel{margin-left: 45px;}
#pwdNameLabel{margin-left: 63px;}
#pwdPhoneLabel{margin-left: 10px;}

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
      <img id='banner' src="image/5.png">
         <p class='fine'>계정정보찾기</p>
   </header>



   <!-- 각자 구현부분 -->
   <section>     
      <!-- 탭 -->
         <ul class='tab'>
            <li class='tab-link current' data-tab='tab-1' id='fine'>아이디 찾기</li>
            <li class='tab-link' data-tab='tab-2'>비밀번호 찾기</li>
         </ul>

		<!-- 라인 -->
         <hr id='contentLine'>

     
         <!-- 탭안에 내용 넣는 영역 -->
         <!-- 아이디 찾기 내용-->
         <div id="tab-1" class="tab-content current">
   		 <p align="center" id="idFine">아이디 찾기</p> 
   		 <p align="center" id="idFineMsg">등록된 이름과 휴대폰번호, 회원번호로 아이디 찾기가 가능합니다.<br>학생은 등록된 학번, 교수는 등록된 코드를 입력해주세요.</p>
   		
   		<!-- 텍스트 다이브 -->
   		<form name="fineUserId" id="fineUserId" method="post" action="<%=request.getContextPath()%>/fineId.me" onsubmit="return idSubmit();" target="idPopup">
   		<div id = "fineText">
		<label id="idLabel">이름
		<input type ="text" id="userName" name="userName" size="30" maxlength="10" style="height:30px">
		</label><br>
		<label id="phoneLabel">휴대폰번호
		<input type ="text" id="userPhone" name="userPhone" size="30" maxlength="16" style="height:30px" placeholder="-를 제외하고 입력하세요.">
		</label><br>
		<label id="numLabel">교수코드&학번
		<input type ="text" id="userNo" name="userNo" size="30" maxlength="16" style="height:30px">
		</label>
		</div>
		<input type="submit" id="idFineClick" value="확인">
   		</form>
   		</div>

         <!-- 비밀번호 찾기 고정메뉴 탭을 눌렀을 때 나오는 내용 -->
         <div id="tab-2" class="tab-content">
          <p align="center" id="pwdFine">비밀번호 찾기</p> 
   		 <p align="center" id="pwdFineMsg">등록된 이름과 아이디, 휴대폰 번호로 비밀번호 찾기가 가능합니다.</p>
   		
   		<!-- 텍스트 다이브 -->
   		<form name="fineUserPwd" id="fineUserPwd" method="post" action="<%=request.getContextPath()%>/finePwd.me" onsubmit="return pwdSubmit();" target="pwdPopup">
   		<div id = "fineText">
		<label id="pwdIdLabel">아이디
		<input type ="text" id="pwdUserId" name="pwdUserId" size="30" maxlength="10" style="height:30px">
		</label><br>
		<label id="pwdNameLabel">이름
		<input type ="text" id="pwdUserName" name="pwdUserName" size="30" maxlength="16" style="height:30px">
		</label><br>
		<label id="pwdPhoneLabel">휴대폰번호
		<input type ="text" id="pwdUserPhone" name="pwdUserPhone" size="30" maxlength="16" style="height:30px" placeholder="-를 제외하고 입력하세요." >
		</label>
		</div>
		<input type="submit" id="idFineClick" value="확인">
   		</form>
   		</div>


      <!-- 각 탭을 를 눌렀을 때 해당하는 탭에 대한 정보가 나오는 곳 -->
      <script>
         $(document).ready(function() {

            $('ul.tab li').click(function() {
               var tab_id = $(this).attr('data-tab');

               $('ul.tab li').removeClass('current');
               $('.tab-content').removeClass('current');
               $('ul.tab li').css({
                  'background' : 'rgb(236, 236, 236)',
                  'border-bottom-color' : 'rgba(0, 0, 0, 0.3)'
               });

               $(this).addClass('current');
               $(this).css({
                  'border-bottom-color' : 'white',
                  'background' : 'white'
               });
               $("#" + tab_id).addClass('current');
            })

         })
         
         //아이디찾기
         function idSubmit(){
        	if($('#userName').val()==''){
    			alert("이름을 입력하세요.");
    			$('#userName').focus();
    			return false;
    			}
          
        	if($('#userPhone').val()==''){
    			alert("등록된 휴대폰번호를 입력해주세요.(-제외)");
    			$('#userPhone').focus();
    			return false;
    			}
        	
          	if($('#userNo').val()==''){
    			alert("회원코드를 입력해주세요.");
    			$('#userNo').focus();
    			return false;
    			} 
          	
          	 window.open("","idPopup","width=400, height=300");
 	 		$("#fineUserId").submit(); 
         } 
		
         
         //비밀번호찾기
         function pwdSubmit(){
         	if($('#pwdUserId').val()==''){
     			alert("아이디를 입력해주세요.");
     			$('#pwdUserId').focus();
     			return false;
     			}
           
         	if($('#pwdUserName').val()==''){
     			alert("이름을 입력해주세요.");
     			$('#pwdUserName').focus();
     			return false;
     			}
         	
           	if($('#pwdUserPhone').val()==''){
     			alert("등록된 휴대폰번호를 입력해주세요.(-제외)");
     			$('#pwdUserPhone').focus();
     			return false;
     			} 
           	
           	
           	 window.open("","pwdPopup","width=450, height=500");        	 
  	 		$("#fineUserPwd").submit(); 
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
   	<%@ include file="../common/foot.jsp" %>
 </footer>

</html>