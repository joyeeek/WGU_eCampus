
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="wgu.member.model.vo.*"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
<script src="js/jquery-3.5.1.min.js"></script>
<style>

   
   #banner{
   position: absolute;
   top: 160px;
   left: 0px;
   width: 1519.5px;
   height: 240px;
   display: inline-block;
   }
   
   .mypage{
   position: absolute;
   top: 435px;
   left: 310px;
   font-weight: 800;
   font-size: 48px;
   width: 500px;
   }
   
   
   /* 좌측 메뉴바 */
   aside {
   position: absolute;
   top: 470px;
   width: 230px;
   height: 500px;
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
   
   
   a {
   text-decoration: none;
   color: black;
   }
   
   .mypageMenu {
   font-size: 18px;
   }
      
   /* 세션시작 */
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
   

   
   /* 각자 구현 내용*/
   
   section {
   position: absolute;
   top: 700px;
   left: 300px;
   background: white;
   width: 600px;
   height: 850px;
}
   
   
   #contentLine { /* hr선 색 수정 : background-color, height, border */
   margin-top: -100px;
   background-color: rgba(0, 0, 0, 0.3);
   height: 1px;
   border: 0;
   width: 1210px;
   margin-left:5px;
   } 

   #schedulediv{position: relative; top: 40px;}
   
   /* 일정리스트 */
   #scheduleList{
   position: absolute; 
   left: 40px; 
   background: lightgray; 
   border-radius: 6px;
   width: 500px; 
   height: 700px;
   }
   
   #divtitle1{
   position: absolute; left: 20px; top: 23px;
   font-weight: bold; font-size: 22px;
   }
   
   #modifyB{
   width: 80px; height: 30px;
   border: none; background: gray;
   color: white; border-radius: 4px;
   position: absolute; top: 23px; left: 300px;
   }
   
   #deleteB{
   width: 80px; height: 30px;
   border: none; background: gray;
   color: white; border-radius: 4px;
   position: absolute; top: 23px; left: 390px;
   }
   
   #inlist{
   border-radius: 6px;
   margin-top: 78px;
   margin-left: 4px;
   width: 98%;
   height: 600px;
   overflow-y:scroll;
   background: white;
   }
   
   
   /* 일정등록 */
   #scheduleInsert{
   position: absolute; 
   left: 660px; 
   background: lightgray; 
   border-radius: 6px;
   width: 500px; 
   height: 700px;
   }
   
   #divtitle2{
   position: absolute; left: 20px; top: 23px;
   font-weight: bold; font-size: 22px;
   }
   
   #insertB{
   width: 80px; height: 30px;
   border: none; background: gray;
   color: white; border-radius: 4px;
   position: absolute; top: 23px; left: 390px;
   }
   
   #ininsert{
   border-radius: 6px;
   margin-top: 78px;
   margin-left: 5px;
   width: 98%;
   height: 600px;
   background: white;
   }
   
   /* 등록된 일정들 */
   .sList{
   width: 435px; min-height: 80px;
   margin-top: 20px;
   position: relative; left: 12px;
   border-radius: 8px; background: rgba(173, 216, 230, 0.7);
   padding: 7px; word-break: break-all;/* 글자별로 자동 줄바꿈 */
   }
   
   .sTitle, .sContent, .sDate, .sNo{
   border:none; background: none;
   }
   
   .sDate{
   width: 300px; height: 30px; 
   font-size: 18px; font-weight: bold;
   position: absolute; left: 10px;
   }
   
   .sNo {
   width: 30px; height: 30px; 
   font-size: 13px; font-weight: bold;
   position: relative; left: 395px;
   }
   
   .sCheck{
   position: relative; left: 372px; top: 2px; 
   width: 15px; height: 15px;
   }
   
   .sTitle{ 
   height: 20px; width: 425px;
   position: relative; top: 10px; 
   overflow-y:scroll; border-radius: 4px;
   }
   
   .sContent{
   min-height: 40px; width: 425px;
   position: relative; top: 5px;
   margin-bottom: 15px; border-radius: 4px;
   text-align: top;
   }
   
   #sline{
   margin-top: 20px; margin-bottom: 5px;
   }
   
   
   /* 일정 등록하는 부분 */
   #titleI, #dateI, #contentI{
   font-size: 19px; font-weight: bold;
   position: relative; left: 20px;
   }
   
   
   #insertT{
   width: 440px; height: 25px;
   border-radius: 4px; border: 1px solid gray;
   position: relative; top: 10px;
   }
   #titleI{
   position: relative; top: 15px;
   }
   
   
   #dateI{
   position: relative; top: 40px;
   }
   #insertD{
   position: relative; top: 10px;
   }
   
   
   #contentI{
   position: relative; top: 60px;
   }
   #insertC{
   position: relative; top: 15px; 
   margin-bottom: 15px; resize: none;
   border-radius: 4px; width: 440px; height: 355px;
   }
   
   /* 수정하기 */
   #sModifyB{
   width: 80px; height: 30px;
   border: none; background: gray;
   color: white; border-radius: 4px;
   position: absolute; top: 23px; left: 390px;
   }
   
   /* 큰 탭 부분 : 전체게시판, 공지사항등록 */
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
   
   .tab-content {display: none;}
   
   #hak { background: white; border-bottom-color: white; }


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


/* 로고이미지 */
.logoImg {
   position: absolute;
   top: 70px;
   left: 170px;
}

.logoDiv {
   display: inline-block;
   font-size: 27px;
   text-color: gray;
   font-weight: bold;
   position: absolute;
   top: 87px;
   left: 245px;
}


/* 2 */

.fine {
   position: absolute;
   top: 435px;
   left: 310px;
   font-weight: 800;
   font-size: 48px;
}

#infoLine{
   position: absolute;
   top: 533px;
   left: 320px;
 font-size: 20px;
}


/* ---------------- 각자 구현부분 ---------------------- */


/* 탭 */
.tab {
   list-style: none;
   margin-top: -40px; /* 스쿨버스 등록, 수정 탭 top사이즈 */
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


/* 탭안에 내용 넣는 영역  */

.tab-content.current {
	margin-top:500px;
display: inherit;
					   width:700px; height:0px;
					   top:-600px;
   						position:absolute;
   						left:20px;
/*     		 			left: 20px; 콘텐트 안 내용물 left */
    		 			font-size: large;}

#tabs2 {width: 70%;}
.tab-content {display: none;}


form{margin-left: 160px;}


/* 텍스트간격 */
form>label{line-height: 35px;} 	 

	
section button{background-color: rgb(56, 103, 166);
					color: white; border: none;
					width: 100px; height: 30px;
					font-size: 12px;
					border-radius: 5px;
					cursor: pointer;}
					
					
.birth{cursor: pointer;}			
#gender{cursor: pointer;}
#department{cursor: pointer;}
#choice{cursor: pointer;}

									




#title{background-color: rgb(56, 103, 166); width: 500px; height: 75px; border-radius: 10px;
font-size: 50px; font-family: "맑은 고딕"; text-align: center; font-weight: 900; margin-left: 400px;
margin-top: 150px;
}
#img{margin-top:10px;}
#list1{font-size:40px; font-family: "맑은 고딕"; font-weight: 600;}
#enroll{width: 300px; height: 60px; background-color: rgb(56, 103, 166); border-radius: 10px; margin-left: 500px; font-size: 40px; font-family: "맑은 고딕"; font-weight: 600;}
/* input{height: 40px; width: 400px;} */

footer {
   display: inline-block;
    position : absolute;
    left : 0px;
	top: 1650px;
   width : 1519px;
	height : 150px;
	background : #3867A6;
	color : white;
	text-align: center;
	margin: 0px;
	}


</style>
</head>
<body>

   <!-- 헤더 -->
   <header>
	<%@ include file="../common/menubar.jsp" %>
	<!-- 2 -->
      <img id='banner' src="image/6.jpg">
   </header>



   <!-- 각자 구현부분 -->
   <section>     
   
   	        <div class="bannerTxt" id="bannerTxt">
        <img id='banner' src="image/6.jpg">
      <div id='mypageDiv' class="mypageDiv">
         <p class='mypage'>스쿨버스 관리페이지</p>
      </div>
      <br>
      </div>
   	
   
   		<div class='content'>
			<ul class='tab'>
				<li id='fine' class='tab-link current' data-tab='tab-1'>스쿨버스 등록</li>
				<li class='tab-link' data-tab='tab-2'>스쿨버스 삭제</li>
			</ul>

			<hr id='contentLine'>

			<!-- 학식 div -->
			<form action="<%= request.getContextPath() %>/insertadminbus.wgu">
			<div id="tab-1" class="tab-content current">
				<div id=title><img id="img" src="image/bus3.png" width=100 height=50 >&nbsp;스쿨버스 등록</div>
				<input type="hidden" id="choice" name="choice" value="관리자가 등록한 노선">
				<input type="hidden" id="priceShow" name="priceShow" value="0">
				<ul id="list1">
					<li>예약 시간 : <input id="date" name="date" type="date" style="height: 40px; width: 400px;" required></li>
					<br>
					<li>버스 번호 : <input id="busno" name="busno" type="text" style="height: 40px; width: 400px;" required></li>
					<br>
					<li>버스 노선 : <input type="text" id="nosun" name="nosun" style="height: 40px; width: 400px;" required></li>
					<br>
					<li>노선 설명(MEMO) : <br><br>
						<textarea id="memo" name="memo" cols=150 rows=10 required></textarea>
					</li>
				</ul>
				
				<input type="submit" value="등록하기" id="enroll">
			</div>
			</form>
			
			

			<form action="<%= request.getContextPath() %>/modifyadminbus.wgu" method="get">
			<div id="tab-2" class="tab-content">
				<div id=title><img id="img" src="image/bus3.png" width=100 height=50 >&nbsp;스쿨버스 삭제</div>
				<input type="hidden" id="choice" name="choice" value="관리자가 등록한 노선">
				<input type="hidden" id="priceShow" name="priceShow" value="0">
				<ul id="list1">
				
					<li>버스 번호 : <input type="text" id="busno" name="busno" value="숫자만 입력"  style="height: 40px; width: 400px; required"></li>
					<br>
					<li>변경 시간 : <input id="date" name="date" type="date" style="height: 40px; width: 400px; required"></li>
					<br>
					<li>노선 수정 : <input type="text" id="nosun" name="nosun" style="height: 40px; width: 400px; required"></li>
					<br>
					<li>노선 설명(MEMO) : <br><br>
						<textarea id="memo" name="memo" cols=150 rows=10 required></textarea>
					</li>
				</ul>
				
				<input type="submit" value="수정하기" id="enroll">
			</div>
			</form>

		</div>

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
		</script>

   </section>



   <!-- 좌측 메뉴바 -->
   <aside>
      <div id='menu' class='menuDiv'>
         <ul class='menuList'>
            <li><a href='#'>관리자 페이지</a></li>
            <li><img src="image/줄.PNG"></li>
         <li><br><a href='<%= request.getContextPath() %>/adminSList.sc' class='mypageMenu'>학사일정관리</a><br><br></li>
			<li><a href="<%= request.getContextPath() %>/adminPagebus.wgu" class='mypageMenu'>스쿨버스관리</a><br><br></li>
			<li><a href="<%= request.getContextPath() %>/insert.cafe" class='mypageMenu'>학식관리</a><br><br></li>
			<li><a href='<%= request.getContextPath() %>/AdminList.bu' class='mypageMenu'>게시판관리</a><br><br></li>
         </ul>
      </div>
   </aside>
   
   <footer>
	<%@ include file = "../common/foot.jsp" %>
</footer>
</body>
</html>