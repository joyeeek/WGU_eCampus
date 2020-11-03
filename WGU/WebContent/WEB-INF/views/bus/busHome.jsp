<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="wgu.member.model.vo.Member"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여성시대학교 스쿨버스</title>
<script src='https://code.jquery.com/jquery-3.5.1.min.js'></script>
<style>
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

.divMain0_0{
display: inline-block;
position : absolute;
 width : 5%; 
 height : 50px;
}

.divMain0_1{
display: inline-block;
position : absolute;
 width : 5%; 
 height : 400px;
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

#loginInform {
   display: inline-block;
   position: absolute;
   left: 0px;
   width: 1519.5px;
   height: 50px;
   background: #3867A6;
   color: white;
}

#banner {
   position: absolute;
   top: 160px;
   left: 0px;
   width: 1519.5px;
   height: 280px;
   display: inline-block;
}

.mypage {
   position: absolute;
   top: 435px;
   left: 310px;
   font-weight: 800;
   font-size: 48px;
}

.mypageP1 {
   position: absolute;
   top: 540px;
   left: 320px;
   line-height: 10px;
   font-size: 15px;
}

.mypageP2 {
   position: absolute;
   top: 565px;
   left: 320px;
   line-height: 10px;
   font-size: 15px;
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
   height: 300px;
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
   height: 100px;
}

#contentLine {
   margin-top: -17px;
   background-color: rgba(0, 0, 0, 0.3);
   height: 1px;
   border: 0;
   margin-left: 413px;
}
/* hr선 색 수정 : background-color, height, border */
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

.tab-content {
   display: none;
}
#hak{background : white; border-bottom-color: white;}

#mealTable {
   margin-left : 30px;
   border-collapse : collapse;
   font-family : '맑은 고딕';
   font-size : 14px;
   font-weight: 200;
}

#mealTable th{height : 40px;}

#mealTitle {
   background: rgb(236, 236, 236);
   font-size : 16px;
   font-weight: 700;
}

.tab-content.current {
   display: inherit;
}

#reservationCancle {
   margin-left: 1052px;
   margin-top: 20px;
   background: rgb(56, 103, 166);
   color: white;
   border: 1px solid rgb(56, 103, 166);
   width: 150px;
   height: 40px;
}

#reservationCancle2 {
   margin-left: 1052px;
   margin-top: 20px;
   background: rgb(56, 103, 166);
   color: white;
   border: 1px solid rgb(56, 103, 166);
   width: 150px;
   height: 40px;
}

	#hr{margin-left: -10px; margin-top: -120px;}
	#img1{margin-left: -10px; margin-top: 50px;}
	#bu1{margin-left: -13px; width: 360px;}

	#img2{width: 550px;}
	#bu2{width: 550px;}
	#menu1{display : inline-block; width: 260px; font-weight: 700; font-size: 30px; margin-left: 10px;}
	#bu3{margin-top: -900px; width: 100px; height: 30px;}
	.mypageButton{border-radius: 10px; font-size: 20px; font-family: Tahoma, Geneva, sans-serif; background : #3867A6; border : 1px solid rgba(0, 0, 0, 0.3); width : 200px; height : 50px; font-weight: 1000;}

footer{
   display: inline-block;
    position : absolute;
    left : 0px;
    top : 950px;
    width : 1519px;
   height : 150px;
   background : #3867A6;
   color : white;
   text-align: center;
   }
   

/* footer { */
/*     position : absolute; */
/* 	top: 950px; */
/* 	width : 1530px; */
/* 	height : 150px; */
/* 	background : #3867A6; */
/* 	color : white; */
/* 	text-align: center; */
/* 	} */

</style>
</head>
<body>

   <!-- 헤더 -->
   <header>
   <!-- 1 -->
	<%@ include file="../common/menubar.jsp" %>
      <img id='banner' src="image/busmain.jpg">
      <div id='mypageDiv'>
         <p class='mypage' style="color: black;">스쿨버스</p>
<!--          <br><br> -->
<!--          <p class='mypageP1'>스쿨버스를 예약할 수 있는 폼입니다.</p>  -->
<!--          <p class='mypageP2'>조회하실 정보를 선택해주세요.</p> -->
         </div>
   </header>

   <!-- 각자 구현부분 -->
   <section>
		<article id='art'>

			<hr id="hr">
			<img id="img1" src = "image/bus1.png">
			&nbsp;&nbsp;&nbsp;
			<img id="img2" src = "image/bus2.png">
			<span id="menu1">공지사항<br>
			1 <span style="font-size: 17px;">버스 운행 시간 변경 안내</span><br>
			2 <span style="font-size: 17px;">코로나 예방수칙 지키기</span><br>
			3 <span style="font-size: 17px;">여성시대버스 감축운행</span><br>
			4 <span style="font-size: 17px;">강남역 버스 일지정지 안내</span><br>
			</span>
			
<!-- 			<p>공지사항</p> -->
<!-- 			<ul>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
			</ul> -->
			
			<br><br>
			
			<% if(loginUser == null) { %>
			      <button class = 'mypageButton' id = 'bu1' onclick="loginPage();">스쿨버스 예약하기</button>
    		  <% } else{ %>
			<button class = 'mypageButton' id = 'bu1' onclick="window.open('<%= request.getContextPath() %>/reservationForm.wgu', 'busreservation', 'width=1000, height=1200')">스쿨버스 예약하기</button>
			<% } %>
			&nbsp;&nbsp;
			<button class = 'mypageButton' id = 'bu2' onclick="nosunForm();">노선정보 보기</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button class = 'mypageButton' id = 'bu3' onclick="notice();">더보기</button>
		</article>


      <script>
      function notice(){
    	  location.href="<%= request.getContextPath() %>/NoticeList.nr";
      }
                 
       function bus(){
           location.href="<%= request.getContextPath() %>/bus.wgu";
        }
                    
      	function loginPage(){
			location.href="<%= request.getContextPath() %>/loginForm.me";
      	}
		
		function nosunForm(){
			location.href="<%= request.getContextPath() %>/nosunForm.wgu";
		}
      
         $(document).ready(function() {

            $('ul.tab li').click(function() {
               var tab_id = $(this).attr('data-tab');
               
               $('ul.tab li').removeClass('current');
               $('.tab-content').removeClass('current');
               $('ul.tab li').css({'background' : 'rgb(236, 236, 236)', 'border-bottom-color' : 'rgba(0, 0, 0, 0.3)'});

               $(this).addClass('current');
               $(this).css({'border-bottom-color' : 'white', 'background' : 'white'});
               $("#" + tab_id).addClass('current');
            })
            
            
           $('#reservationCancle').click(function(){
                $("input[name='cbx']:checked").each(function(){
                	console.log(this);
//                     $(this).parent().parent().next().remove();
                    $(this).parent().parent().remove();
                })
            })
            $('#reservationCancle2').click(function(){
            	console.log(1);
                $("input[name='cbx']:checked").each(function(){
                	console.log(this);
//                     $(this).parent().parent().next().remove();
                    $(this).parent().parent().remove();
                })
            })

         })
      </script>



   </section>

   <!-- 좌측 메뉴바 -->
   <aside>
      <div id='menu' class='menuDiv'>
         <ul class='menuList'>
            <li><a href='#'>대학복지</a></li>
            <li><img src="image/줄.PNG"></li>
            <li><br><a href="<%= request.getContextPath() %>/bus.wgu" class='mypageMenu'>스쿨버스</a><br><br></li>
             <li><a href="<%= request.getContextPath() %>/list.cafe" class='mypageMenu'>학식</a></li>
         </ul>
      </div>
   </aside>
   
   <footer>
	<%@ include file = "../common/foot.jsp" %>
</footer>
</body>
</html>