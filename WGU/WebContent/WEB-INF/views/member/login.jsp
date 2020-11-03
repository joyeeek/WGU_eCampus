<%@ page language="java" contentType="text/html; charset=UTF-8" 
   import="wgu.member.model.vo.Member"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여성시대학교 - 로그인</title>
<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
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

/* 대학소개 */
.logoBtn1 {
   display: inline-block;
   font-size: 20px;
   text-color: gray;
   background-color: white;
   border: none;
   position: absolute;
   top: 93px;
   left: 555px;
}

/* 성적정보 */
.logoBtn2 {
   display: inline-block;
   font-size: 20px;
   text-color: gray;
   background-color: white;
   border: none;
   position: absolute;
   top: 93px;
   left: 741px;
}

/* 수강정보 */
.logoBtn3 {
   display: inline-block;
   font-size: 20px;
   text-color: gray;
   background-color: white;
   border: none;
   position: absolute;
   top: 93px;
   left: 927px;
}

/* 대학복지 */
.logoBtn4 {
   display: inline-block;
   font-size: 20px;
   text-color: gray;
   background-color: white;
   border: none;
   position: absolute;
   top: 93px;
   left: 1113px;
}

/* 게시판 */
.logoBtn5 {
   display: inline-block;
   font-size: 20px;
   text-color: gray;
   background-color: white;
   border: none;
   position: absolute;
   top: 93px;
   left: 1300px;
}

/* 헤더 */
header {
   font-family: '맑은 고딕';
   width: 1200px;
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


.mypageLogout3 {
   position: absolute;
   top: 20px;
   left: 1120px;
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
#contentLine { /* hr선 색 수정 : background-color, height, border */
   margin-top: -100px;
   background-color: rgba(0, 0, 0, 0.3);
   height: 1px;
   border: 2;
   margin-left: 5px;
}

/* wgu에 오신것을 환영합니다. */
#welcome{font-size: 30px; 
           font-weight: 600;
       font-family: "맑은 고딕";}
       
#wguWelcome{vertical-align: middle;}

/* ---------------------    내용작성 ------------------------------ */
#login{width:500px; height:1000px;
      margin-top: 100px; margin-left: 350px;
           font-size: large;}

#loginlogo{font-size: 30px; 
           font-weight: 800;
       font-family: "맑은 고딕";}

#idLabel{margin-left: 18px;}
#idLabel,#passwordLabel{color: rgb(71, 71, 71);}

#loginFine{font-size: medium; color: rgb(104, 104, 104); cursor: pointer;}

#loginClick, #joinClick{background-color: rgb(56, 103, 166);
      color: white;
      border: none;
      width: 300px; height: 50px;
      font-size: 21px;
      margin-top: 30px;
      margin-left: 110px;
      border-radius: 5px;
      cursor: pointer;}

#errMsg{color: red; font-size: 21px; margin-top: 25px;}            

/* 요소 바꾸기 */
#loginText{border: 2px solid rgb(216,216,216);
         padding: 50px; width: 400px; height: 150px;
         background-color: rgba(242, 255, 237, 0.4);
         text-align: center;}         

#loginText>label{display: block; margin-top: 25px;}

.bannerTxt{
position : absolute;
top : -700px;
left : -300px;
}

#banner {
   position: absolute;
   top: 160px;
   left: 0px;
   width: 1519.5px;
   height: 240px;
   display: inline-block;
}

.join {
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
<%@ include file="../common/menubar.jsp" %>
   
   <section>
      <!-- 2 -->
      <div class="bannerTxt" id="bannerTxt">
      <img id='banner' class='banner' src="image/5.png">
         <p class='join'>로그인</p>
</div>

   <!-- 각자 구현부분 -->
   <!-- 라인 -->
   <hr id = 'contentLine'>
   
   <!-- wgu에 오신것을 환영합니다. --> 
   <p align="center" id = "welcome" >
   <img src ="image/로고2.png" id = "wguWelcome" width="80px" height="80px">
     WGU에 오신 것을 환영합니다.
   </p>
<!--                            내용작성                                                                                       -->   
    <hr>
   <!-- 전체 다이브 -->
   <div id = "login">
   <p align="center" id="loginlogo">로그인</p>
      <!-- 텍스트 다이브 -->
   <form name = "loginForm" action="<%= request.getContextPath() %>/memberLogin.me" method="post" onsubmit="return idPwd();">
      <div id = "loginText">
      <label id ="idLabel">아이디
      <input type ="text" size="30" maxlength="10" style="height:30px" name="wguId" id="wguId">
      </label>
      <label id="passwordLabel" >비밀번호
      <input type ="password" size="30" maxlength="16" style="height:30px" name="wguPwd" id="wguPwd">
      </label>
      </div>   
      <p align="right" id = "loginFine" onclick="memberFineIdPwd();">아이디 / 비밀번호 찾기</p>
       <input type="submit" id = "loginClick" value="로그인">
       </form> 
       <input type="button" id = "joinClick" value="회원가입" onclick="memberJoin();">   
      </div>
   <script>
   function memberFineIdPwd(){
      location.href="<%= request.getContextPath() %>/fineIdPwdForm.me";
   }

   function memberJoin(){
      location.href="<%= request.getContextPath() %>/signUpForm.me";
   }
   
   //아이디와 비밀번호를 입력하지 않고 확인을 눌렀을때의 이벤트
   function idPwd(){
      if($('#wguId').val()==''){
            alert("아이디를 입력해주세요.");
            $('#wguId').focus();
            return false;
         }
      if($('#wguPwd').val()==''){
         alert("비밀번호를 입력해주세요.");
         $('#wguPwd').focus();
         return false;
         }
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
   <footer>
   	<%@ include file="../common/foot.jsp" %>
   </footer>
</body>
</html>