<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList, wgu.bus.model.vo.Bus, wgu.member.model.vo.Member" %>
<% ArrayList<Bus> list = (ArrayList<Bus>)request.getAttribute("list"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여성시대학교 스쿨버스</title>
<script src='https://code.jquery.com/jquery-3.5.1.min.js'></script>
<style>

#banner {
   position: absolute;
   top: 160px;
   left: 0px;
   width: 1519.5px;
   height: 240px;
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
   height: 750px;
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
   width: 1400px;
   height: 500px;
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

	#hr{margin-left: -10px; margin-top: -120px; width: 1230px;}
	#img1{margin-left: -10px; margin-top: 50px;}
	#bu1{margin-left: -13px; width: 360px;}

	#img2{width: 550px;}
	#bu2{width: 550px;}
	#menu1{display : inline-block; width: 200px; font-weight: 700; font-size: 30px; margin-left: 10px;}
	#bu3{margin-top: -900px; width: 100px; height: 30px;}
	.mypageButton{font-size: 15px; background : #3867A6; border : 1px solid rgba(0, 0, 0, 0.3); width : 200px; height : 50px;}

table {
	width: 1210px;
	text-align: center;
	border-collapse: collapse;
    font-family: Tahoma, Geneva, sans-serif;
}
table td {
	padding: 15px;
}
table thead td {
	background-color: #54585d;
	color: #ffffff;
	font-weight: bold;
	font-size: 13px;
	border: 1px solid #54585d;
}
table tbody td {
	color: #636363;
	border: 1px solid #dddfe1;
}
table tbody tr {
	background-color: #f9fafb;
}
table tbody tr:nth-child(odd) {
	background-color: #ffffff;
}

footer {
    position : absolute;
	top: 1100px;
	width : 1530px;
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
      <img id='banner' src="image/5.png">
      <div id='mypageDiv'>
         <p class='mypage' style="color: black;">스쿨버스 노선 정보</p>
<!--          <p class='mypageP1'>영실찡님의 예약현황입니다.</p> -->
<!--          <p class='mypageP2'>조회하실 정보를 선택해주세요.</p> -->
         </div>
   </header>

   <!-- 각자 구현부분 -->
   <section>
		<article id='art'>
			<hr id="hr">
			<br><br>
			<table border="1">
				<thead>
					<tr>
						<td>운영되는 요일</td>
						<td>버스 번호</td>
						<td>출발 정류장</td>
						<td>도착 정류장</td>
						<td>정차역</td>
						<td>소요 시간</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>월요일 ~ 일요일</td>
						<td>1번</td>
						<td>여성시대학교 또는 사당역</td>
						<td>사당역 또는 여성시대학교</td>
						<td>여성시대학교 → 사당역 / 사당역 → 여성시대학교</td>
						<td>1시간</td>
					</tr>
					<tr>
						<td>월요일 ~ 일요일</td>
						<td>2번</td>
						<td>여성시대학교 또는 안산역</td>
						<td>안산역 또는 여성시대학교</td>
						<td>여성시대학교 → 안산역 / 안산역 → 여성시대학교</td>
						<td>1시간</td>
					</tr>
					<tr>
						<td>월요일, 수요일, 금요일</td>
						<td>3번</td>
						<td>여성시대학교 또는 용산역</td>
						<td>용산역 또는 여성시대학교</td>
						<td>여성시대학교 → 용산역 / 용산역 → 여성시대학교</td>
						<td>1시간</td>
					</tr>
					<tr>
						<td>월요일 ~ 일요일</td>
						<td>4번</td>
						<td>여성시대학교 또는 강남역</td>
						<td>강남역 또는 여성시대학교</td>
						<td>여성시대학교 → 강남역 / 강남역 → 여성시대학교</td>
						<td>1시간</td>
					</tr>
				</tbody>
			</table>
			<br>

			<table border="1">
				<thead>
				<tr>
					<td width="100px" style="text-align: center">버스 번호</td>
					<td width="100px" style="text-align: center">이용 날짜</td>
					<td width="300px" style="text-align: center">노선 설명</td>
				</tr>
				</thead>
				<%
					if (list.isEmpty()) {
				%>
				<tr>
					<td colspan="3">관리자가 최근에 등록한 버스가 없습니다.</td>
				</tr>
				<%
					} else {
					for (Bus b : list) {
				%>
				<tbody>
				<tr>
					<td width="100px" style="text-align: center"><%=b.getBusNo()%></td>
					<td width="100px" style="text-align: center"><%=b.getBusDate()%></td>
					<td width="100px" style="text-align: center"><%=b.getBusComment()%></td>
				</tr>
				</tbody>
				<%
					}
				}
				%>

			</table>
			
			<br>
			<label style="color: red; margin-left: 800px;">※ 위 정보는 관리자에 의해 업데이트 될 수 있습니다.</label>
		</article>


      <script>
    	function loginPage(){
			location.href="<%= request.getContextPath() %>/loginForm.me";
      	}
		function reservationForm(){
			location.href="<%= request.getContextPath() %>/reservationForm.wgu";
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