<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="wgu.member.model.vo.*, java.util.ArrayList, wgu.schedule.model.vo.*" %>
<%
	ArrayList<Schedule> sList = (ArrayList<Schedule>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여성시대학교 - 관리자(학사일정관리)</title>
<script src="js/jquery-3.5.1.min.js"></script>
<style>
@media screen and (min-width: 480px) {
background-color: lightgreen;
}
	
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
	width: 1200px;
	height: 1000px;
	}
	
	#contentLine { /* hr선 색 수정 : background-color, height, border */
	margin-top: -50px;
	background-color: rgba(0, 0, 0, 0.3);
	height: 1px;
	border: 0;
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

	footer {
	display: inline-block;
    position : absolute;
    left : 0px;
	top: 1845px;
	width : 1519px;
	height : 150px;
	background : #3867A6;
	color : white;
	text-align: center;
	}

</style>
</head>
<body>

<%@ include file="../common/menubar.jsp" %>

   <!-- 각자 구현부분 -->
   <section>
        <div class="bannerTxt" id="bannerTxt">
        <img id='banner' src="image/6.jpg">
      <div id='mypageDiv' class="mypageDiv">
         <p class='mypage'>학사일정 관리페이지</p>
      </div>
      <br>
      </div>
      <div id = 'content'> <!-- section 전체 div -->
		
		<hr id='contentLine'>
		
		<div id = "schedulediv">
			<div id = "scheduleList">
				<label id="divtitle1">일정 리스트</label>
				<input type="button" id="modifyB" value="수정하기">
				<input type="button" id="deleteB" value="삭제하기">
				<div id="inlist">
					<% if(sList.isEmpty()) { %>
					<div class="sList">
						<div>등록된 일정이 없습니다.</div>
					</div>
					<% } else { %>
						<% for(int s = 0; s < sList.size(); s++) { %>
						<div class="sList">
							<input type="text" class="sDate" value="<%= sList.get(s).getScheduleDate() %>" disabled><!-- String -->
							<input type="text" class="sNo" value="<%= sList.get(s).getScheduleNo() %>" disabled>
							<input type="checkbox" id="sCheck" class="sCheck"><br>
							<input type="text" class="sTitle" value="<%= sList.get(s).getScheduleTitle() %>" disabled>
							<hr id="sline">
							<input type="text" class="sContent" value="<%= sList.get(s).getScheduleContent() %>" disabled>
						</div>
						<% } %>
					<% } %>
				</div>
			</div>
			<div id = "scheduleInsert">
				<label id="divtitle2">일정 등록하기</label>
				<input type="button" id="insertB" value="등록하기">
				<div id="ininsert">
					<label id="titleI">
						학사일정 제목<br>
						<input type="text" id="insertT" name="insertT" class="insertT" placeholder="학사일정 제목을 입력하세요">
					</label><br>
					
					<label id="dateI">
						학사일정 날짜<br>
						<input type="date" id="insertD" name="insertD" class="insertD">
					</label><br>
					
					<label id="contentI">
						학사일정 내용<br>
						<textarea id="insertC" name="insertC" class="insertC" placeholder="학사일정 내용을 입력하세요"></textarea>
					</label>
					
				</div>
			</div>
		</div>
		
		</div> 
		<!-- section 전체 div -->
	
	<script>
		// 등록하기
		$("#insertB").click(function(){
			var title = $("#insertT").val();
			var content = $("#insertC").val(); // string
			var date = $("#insertD").val();
			
			$.ajax({
				url: "AdminSInsert.sc",
				data: {title:title, content:content, date:date},
				type: "post",
				success: function(data){
					
					if(title != "" && content != "" && date != ""){
						alert("등록되었습니다");
						location.reload();
					} else if(title == ""){
						alert("제목을 입력해 주세요");
						$("#insertT").focus();
					} else if(content == "") {
						alert("내용을 입력해 주세요");
						$("#insertC").focus();
					} else if(date == "") {
						alert("날짜를 입력해 주세요");
						$("#insertD").focus();
					}
					
				}
			});
		});
		
		
		// 삭제하기
		$("#deleteB").click(function(){
			var checklength = $("input[class=sCheck]:checked").length;
			
			var sNoList = new Array();
			for(var i = 0; i < checklength; i++){
				var s = $("input[class=sCheck]:checked").prev("input[class=sNo]").eq(i);
				sNoList[i] = $(s).val();
			}
			
			var checked = confirm("삭제하시겠습니까?");
			
			if(checked == true){
				jQuery.ajaxSettings.traditional = true;
				$.ajax({
					url: "AdminSDelete.sc",
					type: "post",
					data: {sNoList:sNoList},
					success: function(data){
						alert("삭제되었습니다");
						location.reload();
					}
				});
			} else {
				alert("취소하셨습니다");
			}
		});
		
		
		// 수정하기
		// 체크박스 체크하고 수정하기 버튼누르면 일정 등록부분이 수정부분으로 바뀌게하기(하나에 한개밖에 못함)
		$("#modifyB").click(function(){
			var checklength = $("input[class=sCheck]:checked").length;
			
			
			if(checklength > 1){
				alert("수정은 하나씩 가능합니다");
				$("input[class=sCheck]").prop("checked", false);
			} else {
				var sNo = $("input[class=sCheck]:checked").prev("input[class=sNo]").eq(0).val();
				
				
				// 수정할 학사일정 가져오기
				$.ajax({
					url: "AdminSelectOne.sc",
					dataType: "json",
					data: {sNo:sNo},
					success: function(data){
						var scheduleInsert = $("div[id=scheduleInsert]"); // 일정등록하기부분 수정하기로 바꾸기위해서 가져온다
						
						var divtitle2 = $("label[id=divtitle2]").html("일정 수정하기"); // 등록하기부분을 수정으로 바꿔주기
						var sModifyB = $("<input type=button id=sModifyB value=수정하기>"); // 수정하기 버튼만들어줘서 바꿔주기
						scheduleInsert.append(sModifyB);
						
					 	var insertT = $("input[id=insertT]").val(data[0].scheduleTitle);
					 	var insertD = $("input[id=insertD]").val(data[0].scheduleDate);
					 	var insertC = $("textarea[id=insertC]").val(data[0].scheduleContent);
					 	
					 	
					 	$(sModifyB).click(function(){
					 		var modifyT = $(insertT).val();
					 		var modifyD = $(insertD).val();
					 		var modifyC = $(insertC).val();
					 		
					 		$.ajax({
					 			url: "AdminSUpdate.sc",
					 			type: "post",
					 			data: {modifyT:modifyT, modifyD:modifyD, modifyC:modifyC, sNo:sNo},
					 			success: function(data){
					 				alert("수정되었습니다");
					 				location.reload();
					 			},
					 			error: function(data){
					 				alert("수정에 실패했습니다");
					 			}
					 		});
					 	});
					}
				}); // 수정할 학사일정가져오기 + 수정하기  끝
				
				
			}
		});
		
		
	</script>
	
	
	</section>





   <!-- 좌측 메뉴바 -->
	<aside>
      <div id='menu' class='menuDiv'>
         <ul class='menuList'>
            <li><a href='#'>관리자페이지</a></li>
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