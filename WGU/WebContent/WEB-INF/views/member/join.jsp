<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여성시대학교 - 회원가입</title>
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

#contentLine { /* hr선 색 수정 : background-color, height, border */
   margin-top: -100px;
   background-color: rgba(0, 0, 0, 0.3);
   height: 1px;
   border: 2;
   margin-left: 5px;
}

#contents{width: 520px; height: 1000px;
			margin: auto; padding: 100px;}
			
#agreement{border: 1px solid gray; padding: 20px; 
				width : 500px; height : 500px;
				overflow:scroll; overflow-x: hidden; text-align: center;}
#agreement_content {text-align: left;}
				
.check{cursor: pointer;}				

#textbox{width: 300px; height: 200px; margin-left: 140px;}


/* 취소버튼과 확인버튼 */
#button>input{color: white;
		border: none;
		width: 200px; height: 50px;
		font-size: 21px; margin: 10px;
		border-radius: 5px; cursor: pointer;}
#button{margin-left: 50px; margin-top: -100px;}		
#cencle{background-color: rgba(56, 103, 166, 0.75)}
#next{background-color: rgb(56, 103, 166);}
	
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
         <p class='join'>회원가입</p>
   </header>

   <!-- 각자 구현부분 -->
   <section>
      <!-- 라인 -->
   <hr id = 'contentLine'>

   <!-- 개인정보 수집 및 이용동의  -->
   <div id = 'contents'>
		<div id = "agreement">개인정보 수집 및 이용동의(필수)
		<br>
		<br>
		<div id = "agreement_content">
		 가. 수집하는 개인정보의 항목 첫째, 회원가입, 원활한 회원관리, 각종 서비스의 제공을 위해 최초 회원가입 당시 아래와 같은 최소한의 개인정보를 필수항목으로 수집하고 있습니다.
		 <br><br>
		첫째, 회원가입<br>
		- 아이디, 비밀번호, 이름, 생년월일, 성별, 이메일, 주소, 휴대폰 번호, 학과, 학번, 교수코드, 가입인증정보<br><br>
		둘째, 서비스 이용과정이나 홈페이지 처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.<br>
		- IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록<br>
		셋째, 네이버 아이디를 이용한 부가 서비스 및 맞춤식 서비스 이용 또는 이벤트 응모 과정에서 해당 서비스의 이용자에 한해서만 개인정보 추가 수집이 발생할 수 있으며, 이러한 경우 별도의 동의를 받습니다.<br><br>
		넷째, 학식결제, 스쿨버스 결제 등 일부 서비스 이용시 관련 법률 준수를 위해 본인인증이 필요한 경우, 아래와 같은 정보들이 수집될 수 있습니다.<br>
		- 이름, 생년월일, 성별, 중복가입확인정보(DI), 암호화된 동일인 식별정보(CI), 휴대폰 번호(선택), 아이핀 번호(아이핀 이용시)<br><br>
		다섯째, 학식결제, 스쿨버스 결제 등 유료 서비스 이용 과정에서 아래와 같은 결제 정보들이 수집될 수 있습니다.<br>
		- 신용카드 결제시 : 카드사명, 카드번호 등<br>
		- 휴대전화 결제시 : 이동전화번호, 통신사, 결제승인번호 등<br>
		- 계좌이체시 : 은행명, 계좌번호 등<br><br>
		나. 개인정보 수집방법회사는 다음과 같은 방법으로 개인정보를 수집합니다.<br>
		- 홈페이지, 전자결제, 서면양식, 팩스, 전화, 상담 게시판, 이메일<br>
		- 협력업체로부터의 제공<br>
		<br>
		</div>
		</div>
		<br>
		<form id="loginCheckFormSubmit" method="post" action="goSignUp.me" onsubmit="return checkSubmit();">	
		<div id = "textbox">
			<input type = "checkbox" class ="check" name ="check" value ="agree">
			<label>개인정보 수집 및 이용동의(필수)</label>
		</div>
		<div id = "button">
		<input type="button" value="취소" id = "cencle" onclick="history.back();">
		<input type="submit" value="확인" id = "next">
		</div>
		</form>
		<!-- 버튼을 눌렀을때의 액션 함수-->
	<script>
	function checkSubmit(){
			if($('.check').is(":checked")==false){ 
				alert('개인정보수집 및 이용 안내에 대해 동의하셔야 가입이 가능합니다.');
				$(".check").focus();
				return false;
					}	
	}
	</script>
		
</div>


 
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