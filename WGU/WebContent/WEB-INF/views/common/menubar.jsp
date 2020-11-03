<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="wgu.member.model.vo.Member"%>
<%
   Member loginUser = (Member)session.getAttribute("loginUser");
%>    
<!DOCTYPE html>
<html lang = "ko">
<head>
<meta charset="UTF-8">
<title>여성시대학교 홈페이지에 오신 것을 환영합니다.</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet"> 
<style>
 /* 맨위 파란색바 */
.div1 {
    display: inline-block;
    position : absolute;
    left : 0px;
    top : 0px;
    width : 1519px;
    height : 55px;
    background : #3867A6;
    color : white;
}

.btn1 {
    position : absolute;
    left : 1230px;
    border : none;
    background-color : #3867A6;
    color : white;
    cursor: pointer;
}

.btn2 {
    position : absolute;
    left : 1300px;
    border : none;
    background-color : #3867A6;
    color : white;
    cursor: pointer;
}

/* 로그인 성공시 보이는 버튼화면 */
.btn3 {
    position : absolute;
    border : none;
    left : 1200px;
    background-color : #3867A6;
    color : white;
    cursor: pointer;
}

.btn4 {
    position : absolute;
    border : none;
    left : 1355px;
    background-color : #3867A6;
    color : white;
    cursor: pointer;
}



/* 로고  */
.logoImg{
    position : absolute;
    top : 70px;
    left : 170px;
}

.logoDiv{
    display: inline-block;
    font-size : 27px;
    text-color : gray;
    font-weight : bold; 
    position : absolute;
    top : 87px;
    left : 245px;
}





/* 메뉴바 */
.drop_down {
  font-family: 'Nanum Gothic', sans-serif;
  display: inline-block;
  font-size : 20px;
  background-color : white;
  border : none;
  position : absolute;
  top : 85px;
  left : 550px;   
}

.main_menu{
    margin : 0px;
    padding : 0px;
    list-style-type : none;
}

.sub_menu1{
    margin : 0px;
    padding : 0px;
    list-style-type : none;
    position : absolute;
    top : 59px; 
    left : -560px;
    top : 59px;
    background : white;
    width : 1529px;
    height : 50px;
    font-size : 12px;
    text-align : center;
    border-top : 1px solid lightgray;
    visibility: hidden;
}

.sub_menu2{
    margin : 0px;
    padding : 0px;
    list-style-type : none;
    position : absolute;
    left : -560px;
    top : 59px;
    background : white;
    width : 1529px;
    height : 50px;
    font-size : 12px;
    text-align : center;
    border-top : 1px solid lightgray;
    visibility: hidden;
}

.sub_menu3{
    margin : 0px;
    padding : 0px;
    list-style-type : none;
    position : absolute;
    left : -560px;
    top : 59px;
    background : white;
    width : 1529px;
    height : 50px;
    font-size : 12px;
    text-align : center;
    border-top : 1px solid lightgray;
    visibility: hidden;
}

.sub_menu4{
    margin : 0px;
    padding : 0px;
    list-style-type : none;
    position : absolute;
    left : -560px;
    top : 59px;
    background : white;
    width : 1529px;
    height : 50px;
    font-size : 12px;
    text-align : center;
    border-top : 1px solid lightgray;
    visibility: hidden;
}

.sub_menu5{
    margin : 0px;
    padding : 0px;
    list-style-type : none;
    position : absolute;
    left : -560px;
    top : 59px;
    background : white;
    width : 1529px;
    height : 50px;
    font-size : 12px;
    text-align : center;
    border-top : 1px solid lightgray;
    visibility: hidden;
}

.sub11{
    font-size : 14px;
    position : absolute;
    left : 580px;
    top : -4px;
}

.sub12{
    font-size : 14px;
    text-color : #3867A6;
    position : absolute;
    left : 743px;
    top : -4px;
}

.sub21{
    font-size : 14px;
    position : absolute;
    left : 608px;
    top : -4px;
}

.sub22{
    font-size : 14px;
    text-color : #3867A6;
    position : absolute;
    left : 743px;
    top : -4px;
}

.sub31{
    font-size : 14px;
    position : absolute;
    left : 608px;
    top : -4px;
}

.sub32{
    font-size : 14px;
    text-color : #3867A6;
    position : absolute;
    left : 743px;
    top : -4px;
}

.sub41{
    font-size : 14px;
    position : absolute;
    left : 608px;
    top : -4px;
}

.sub42{
    font-size : 14px;
    text-color : #3867A6;
    position : absolute;
    left : 773px;
    top : -4px;
}

.sub51{
    font-size : 14px;
    position : absolute;
    left : 605px;
    top : -4px;
}

.sub52{
    font-size : 14px;
    position : absolute;
    left : 753px;
    top : -4px;
}

.main_menu > li {
    float : left;
}

.main_menu > li > a {
    font-size : 20px;
    color : black;
    text-align : center;
    text-decoration : none;
    letter-spacing : 0.05em;
    display : block;
    padding : 12px 36px;
}

.main_menu > li:hover .sub_menu {
    opacity : 0.8;
    visibility : visible;
}




/* 헤더 */
header {
    height : 300px;
}

</style> 
</head>
<body>
<header>
       <div id="div1" class="div1" align = "right">
       <br>
       <% //로그인된 아이디가 없을경우 화면 
       if(loginUser == null){ 
          %>
             <div class="loginBtns">
            <input type="submit" class="btn1" id="btn1" value="로그인" onclick="memberLogin();">
            <input type="button" class="btn2" value="회원가입" onclick="memberJoin();">
             </div>
          <% 
             //로그인된 아이디가  admin일때 => 관리자 : 일반회원
             } else {  %> 
             <% if (loginUser.getMemberId().equals("admin")){ 
             %>
               <input type = "button" class="btn3" id="btn3" value="<%= loginUser.getMemberName() %>님의 관리페이지  /" onclick="adminPage();">
              <input type="button" class="btn4" value="로그아웃" onclick="logout();">
              <input type="hidden" class="memberId" id="memberId" value="<%= loginUser.getMemberId() %>">
             <% } else {%>
               <input type = "button" class="btn3" id="btn3" value="<%= loginUser.getMemberName() %>님의 마이페이지  /" onclick="myPage();">
              <input type="button" class="btn4" value="로그아웃" onclick="logout();">
              <input type="hidden" class="memberNo" id="memberNo" value="<%= loginUser.getMemberNo() %>">             
             <% } %>
          <% } %>
       </div>
       <script>
             function memberLogin(){
                location.href="<%= request.getContextPath() %>/loginForm.me";
             }
             
             function memberJoin(){
                location.href="<%= request.getContextPath() %>/signUpForm.me";
             }           
             
             //관리자 페이지 서블릿
             function adminPage(){
            	 location.href='<%= request.getContextPath() %>/adminSList.sc';
             }
             
             function myPage(){
            	 location.href='<%= request.getContextPath() %>/memberMyPage.me';
             }
             
             function logout(){
                location.href="<%= request.getContextPath() %>/logout.me";
             }
       </script>
       
       <br>
       <img src = "image/로고2.png" class ="logoImg" id="logoImg" width = "70px" height = "70px" onclick="mainGo();" style="cursor:pointer">
       <div class = "logoDiv" id="logoDiv" onclick="mainGo();" style="cursor:pointer;">여성시대학교</div>
       <nav>
<div class = "drop_down">
  <ul class="main_menu">
    <li id = "h1"><a href="#0">수강정보</a>
    <ul class = "sub_menu1" style = "z-index : 4;">
            <li class = "sub21" id="sub21"> <a style="color: #3867A6; text-decoration: none; cursor:pointer;"><br>수강신청</a></li>        
            <li class = "sub22" id="sub22"> <a style="color: #3867A6; text-decoration: none; cursor:pointer;"><br>과목개설(교수)</a></li>
        </ul></li>
    <li id = "h2"><a href="#1">성적정보</a>
        <ul class = "sub_menu2" style = "z-index : 4;">
            <li class = "sub11" id="sub11"> <a style="color: #3867A6; text-decoration: none; cursor:pointer;"><br>이번학기 성적조회</a></li>        
            <li class = "sub12" id="sub12"> <a style="color: #3867A6; text-decoration: none; cursor:pointer;"><br>성적입력(교수)</a></li>
        </ul></li>
    <li id = "h3"><a href="#2">강의평가</a>
    <ul class = "sub_menu3" style = "z-index : 4;">
            <li class = "sub31" id= "sub31"> <a style="color: #3867A6; text-decoration: none; cursor:pointer;"><br>강의평가</a></li>
            <li class = "sub32" id= "sub32"> <a style="color: #3867A6; text-decoration: none; cursor:pointer;"><br>평가확인(교수)</a></li>
        </ul></li>
    <li id = "h4"><a href="#3">대학복지</a>
    <ul class = "sub_menu4" style = "z-index : 4;">
            <li class = "sub41"> <a style="color: #3867A6; text-decoration: none; cursor:pointer;" onclick="bus();"><br>스쿨버스</a></li>        
             <li class = "sub42"> <a href = "<%= request.getContextPath() %>/list.cafe" style="color: #3867A6; text-decoration: none; cursor:pointer;"><br>학식</a></li>
        </ul></li> 
    <li id = "h5"><a href="#4">게시판</a>
    <ul class = "sub_menu5" style = "z-index : 4;">
            <li class = "sub51"> <a href = "<%= request.getContextPath() %>/NoticeList.nr" style="color: #3867A6; text-decoration: none; cursor:pointer;" ><br>공지사항</a></li>  
            <li class = "sub52"> <a href = "<%= request.getContextPath() %>/BulletinList.bu" style="color: #3867A6; text-decoration: none; cursor:pointer;" ><br>익명게시판</a></li>        
        </ul></li> 
  </ul>
</div>

<script>
          $(function(){
             $('#h1').on('click',function(){
                $('.sub_menu1').css('visibility', 'visible');
                $('.sub_menu2').css('visibility', 'hidden');
                $('.sub_menu3').css('visibility', 'hidden');
                $('.sub_menu4').css('visibility', 'hidden');
                $('.sub_menu5').css('visibility', 'hidden');
             });
             
             $('#h2').on('click',function(){
                $('.sub_menu2').css('visibility', 'visible');
                $('.sub_menu1').css('visibility', 'hidden');
                $('.sub_menu3').css('visibility', 'hidden');
                $('.sub_menu4').css('visibility', 'hidden');
                $('.sub_menu5').css('visibility', 'hidden');
             });
             
             $('#h3').on('click',function(){
                $('.sub_menu3').css('visibility', 'visible');
                $('.sub_menu2').css('visibility', 'hidden');
                $('.sub_menu1').css('visibility', 'hidden');
                $('.sub_menu4').css('visibility', 'hidden');
                $('.sub_menu5').css('visibility', 'hidden');
             });
             
             $('#h4').on('click',function(){
                $('.sub_menu4').css('visibility', 'visible');
                $('.sub_menu2').css('visibility', 'hidden');
                $('.sub_menu3').css('visibility', 'hidden');
                $('.sub_menu1').css('visibility', 'hidden');
                $('.sub_menu5').css('visibility', 'hidden');
             });
             
             $('#h5').on('click',function(){
                $('.sub_menu5').css('visibility', 'visible');
                $('.sub_menu2').css('visibility', 'hidden');
                $('.sub_menu3').css('visibility', 'hidden');
                $('.sub_menu4').css('visibility', 'hidden');
                $('.sub_menu1').css('visibility', 'hidden');
             });
          });
                   
          
              $('#sub21').on('click',function(){  
              var app = $('#btn1').val();
              var adm = $('#memberId').val();
        	  if(app=="로그인"){
        		  alert("수강신청은 로그인 후 이용가능합니다");
        	  } else if(adm=="admin"){
        		  alert("수강신청은 학생만 이용가능합니다");
        	  } else {
        		  location.href="<%= request.getContextPath() %>/applySubject.su"; 
        	  }        	  
          });
              
              $('#sub22').on('click',function(){
            	  var app = $('#btn1').val();
            	  var adm = $('#memberId').val();
            	  if(app=="로그인"){
            		  alert("과목개설은 로그인 후 이용가능합니다");
            	  } else if(adm=="admin"){
            		  alert("과목개설은 교수만 이용가능합니다");
            	  } else {
            		  location.href="<%= request.getContextPath() %>/insertSubject.su"; 
            	  }        	  
              });  
              
              $('#sub11').on('click',function(){
            	  var app = $('#btn1').val();
            	  var adm = $('#memberId').val();
            	  if(app=="로그인"){
            		  alert("성적조회는 로그인 후 이용가능합니다");
            	  } else if(adm=="admin"){
            		  alert("성적조회는 학생만 이용가능합니다");
            	  } else {
            		  location.href="<%= request.getContextPath() %>/checkStu.gr"; 
            	  }        	  
              });
                  
               $('#sub12').on('click',function(){
            	   var app = $('#btn1').val();
            	   var adm = $('#memberId').val();
                	  if(app=="로그인"){
                		  alert("성적입력은 로그인 후 이용가능합니다");
                	  } else if(adm=="admin"){
                		  alert("성적입력은 교수만 이용가능합니다");
                	  } else {
                		  location.href="<%= request.getContextPath() %>/insertPro.gr"; 
                	  }        	  
                  });
               
               $('#sub31').on('click',function(){
            	   var app = $('#btn1').val();
            	   var adm = $('#memberId').val();
             	  if(app=="로그인"){
             		  alert("강의평가는 로그인 후 이용가능합니다");
             	  } else if(adm=="admin"){
            		  alert("강의평가는 학생만 이용가능합니다");
            	  } else {
             		  location.href="<%= request.getContextPath() %>/insertEvaluation.ev"; 
             	  }        	  
               });
                   
                   $('#sub32').on('click',function(){
                	   var app = $('#btn1').val();
                	   var adm = $('#memberId').val();
                 	  if(app=="로그인"){
                 		  alert("평가확인은 로그인 후 이용가능합니다");
                 	  } else if(adm=="admin"){
                		  alert("평가확인은 교수만 이용가능합니다");
                	  } else {
                 		  location.href="<%= request.getContextPath() %>/selectEvaluation.ev"; 
                 	  }        	  
                   });  
        
          
          function bus(){
              location.href="<%= request.getContextPath() %>/bus.wgu";
           }
          
          function mainGo(){
        	  location.href="<%= request.getContextPath() %>";
          }                  
          
      </script>
</nav>
</header> 

</body>
</html>