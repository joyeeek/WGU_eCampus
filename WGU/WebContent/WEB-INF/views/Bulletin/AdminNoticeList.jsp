<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, wgu.bulletin.model.vo.*, wgu.member.model.vo.*" %>
<%
	ArrayList<Notice> nList = (ArrayList<Notice>)request.getAttribute("nList");
	PageNum np = (PageNum)request.getAttribute("np");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여성시대학교 - 관리자(공지게시판관리)</title>
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
	
	#contentLine {
	margin-top: -17px;
	background-color: rgba(0, 0, 0, 0.3);
	height: 1px;
	border: 0;
	margin-left: 413px;
	} 
	
	/* 게시판관리 - 전체게시판탭 */
	.tab-content.current {
	/* 상위 요소의 display속성을 받는다 */
	display: inherit;
	}
	
	
	
	
	/* 공지게시판 */
	#notice{
	border-bottom: 1px solid black;
	border-collapse: collapse; /* th,tr,td하고 table간격하고 없애기(한줄만들기) */
	width: 95%;
	margin-left: 29px;
	}
	
	#notice>th,tr,td{
	border-bottom: 2px solid rgb(224, 224, 224);
	text-align: center;
	}
	
	.n_th{
	padding-left: 10px;
	padding-top: 5px;
	padding-bottom: 5px;
	height: 50px;	
	background: lightgray;/* 수정해야함 */
	border-bottom: 2px solid rgb(224, 224, 224);
	}
	
	#n_box{ padding-left: 6px; }
	
	.n_td{
	padding-top: 10px;
	padding-bottom: 10px;
	height: 40px;
	background: rgb(255, 255, 255);	
	}
	
	#n_num{
	padding-right: 25px;
	padding-left: 25px;
	}
	
	/* 모든 버튼 */
	#n_button{position: relative; left: 950px;}
	
	/* 전체 체크 */
	#checkAll{width: 15px; height: 15px;}
	
	/* 공지사항 등록하기 */
	#n_write{
	padding-left: 10px; padding-right: 10px; 
	padding-top: 5px; padding-bottom: 5px; 
	border: none; background: rgb(94, 94, 94);
	border-radius: 6px; color: white;}
		
	
	/* 게시글 삭제하기 */
	#n_delete{
	margin-left: 3px;
	padding-left: 10px; padding-right: 10px; 
	padding-top: 5px; padding-bottom: 5px; 
	border: none; background: rgb(94, 94, 94);
	border-radius: 6px; color: white;}
	
	
	/* 제목 */
	#n_title{padding-right: 200px; padding-left: 200px;}
	/* 작성자 */
	#n_writer{padding-right: 50px; padding-left: 50px;}
	/* 작성일 */
	#n_date{padding-right: 30px; padding-left: 30px;}
	/* 조회수 */
	#n_see{padding-right: 25px; padding-left: 25px;}
	
	
	
	/* 페이지 갯수 */
	.n_paging{
	list-style: none; position: relative; 
	left: 430px; top: 15px;}
	
	.n_pagingnum{
	display: inline-block; margin-right: 4px;
	width: 30px; height: 25px; text-align: center;
	padding-top: 3px; padding-bottom: 3px;
	border-radius: 6px; background: rgb(236,236,236);/* 선택되면 rgba(56,103,166,0.56) */}
	
	.n_link{color: black; text-decoration: none;}
	
	.p_link{border:none; display: inline-block; margin-right: 4px;
	width: 30px; height: 30px; text-align: center;
	padding-top: 3px; padding-bottom: 3px;
	border-radius: 6px; background: rgb(236,236,236);}
	
	
	#research{position: relative; top: 50px; left: 450px;}
	#r_text{width: 290px; height: 25px; border: 1px solid gray; border-radius: 4px;}
	#r_button{width: 53px; height: 30px; background: rgb(94, 94, 94); 
	color: white; border: none; border-radius: 4px; 
	position: relative; top: 1px;}
	
	
	
	/* 큰 탭 부분 : 전체게시판, 공지사항등록 */
	
	.tab{
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
         <p class='mypage'>공지사항 관리페이지</p>
      </div>
      <br>
      </div>
      <div id = 'content'><!-- section 전체 div -->
		
		<ul class='tab'>
			<li class='tab1'>익명게시판</li>
			<li class='tab2' id='hak' onclick="location.href='<%= request.getContextPath() %>/AdminNoticeList.nr'">공지사항</li>
		</ul>
	
		<hr id='contentLine'>
	
		<!-- 익명게시판 -->
		<div id="tab-1">
		
		<br>
			<div id=notic_table>
			<div id=n_button>
				<button name=n_write id=n_write onclick="submit_n();">공지사항 등록</button>
				<input type="button" name=n_delete id=n_delete value="공지사항 삭제">
			</div>
			
			<br>
			
			<div>
				<table id=notice>
					<tr>
						<th id=n_check class=n_th><input name="n_checkAll" id="n_checkAll" type="checkbox"></th>
						<th id=n_num class=n_th>번호</th>
						<th id=n_title class=n_th>제목</th>
						<th id=n_writer class=n_th>작성자</th>
						<th id=n_date class=n_th>작성일</th>
						<th id=n_see class=n_th>조회수</th>
					</tr>
					<% if(nList.isEmpty()) { %>
					<tr class="n_contentList1">
						<td id="no_contentList" class=n_td colspan="6">게시된 공지가 없습니다.</td>
					</tr>
					<% } else { %>
						<% for(int i = 0; i < nList.size(); i ++) { %>
						<tr class="n_contentList2">
							<th id=n_box><input name="n_check" class="n_check" type="checkbox" value="<%= nList.get(i).getNoticeNo() %>"></th>
							<td class=n_td id="n_no"><input type="hidden" value="<%= nList.get(i).getNoticeNo() %>"><%= nList.get(i).getNoticeNo() %></td>
							<td class=n_td style="overflow: hidden; text-overflow:ellipsis;"><%= nList.get(i).getNoticeTitle() %></td>
							<td class=n_td><input type="hidden" value="<%= nList.get(i).getMemberNo() %>">관리자</td>
							<td class=n_td><%= nList.get(i).getNoticeDate() %></td>
							<td class=n_td><%= nList.get(i).getNoticeCount() %></td>
						</tr>
						<% } %> 
					<% } %>	
				</table>
					
				<br>
				
				</div>
				
			
				<!-- 페이지갯수넘버링 -->
				<div id='n_paging'>
				<ul class="n_paging">
					<li class=n_pagingnum>
					<button onclick="location.href='<%= request.getContextPath() %>/AdminNoticeList.nr?nCurrentPage=1'" class=p_link>&lt;&lt;</button>
					</li>
					<li class=n_pagingnum>
					<button onclick="location.href='<%= request.getContextPath() %>/AdminNoticeList.nr?nCurrentPage=<%= np.getCurrentPage() - 1 %>'" id="beforeN" class=p_link>&lt;</button>
					</li>
					<% for(int nn = np.getStartPage(); nn <=np.getEndPage(); nn++) { %>
						<% if(nn == np.getCurrentPage()) { %>
						<li class=n_pagingnum>
						<button class=p_link disabled style="background: rgba(56,103,166,0.56); color:white;"><%= nn %></button>
						</li>
						<% } else { %>
						<li class=n_pagingnum>
						<button onclick="location.href='<%= request.getContextPath() %>/AdminNoticeList.nr?nCurrentPage=<%= nn %>'" class=p_link><%= nn %></button>
						</li>
						<% } %>
					<% } %>
					<li class=n_pagingnum>
					<button onclick="location.href='<%= request.getContextPath() %>/AdminNoticeList.nr?nCurrentPage=<%= np.getCurrentPage() + 1 %>'" id="afterN" class=p_link>&gt;</button>
					</li>
					<li class=n_pagingnum>
					<button onclick="location.href='<%= request.getContextPath() %>/AdminNoticeList.nr?nCurrentPage=<%= np.getMaxPage() %>'" class=p_link>&gt;&gt;</button>
					</li>
				</ul>
				</div>
			
			</div>
	       
	    	<script>
	    	// 페이징
			if(<%= np.getCurrentPage() <= 1 %>){
			var before = $("#beforeN");
			before.attr("disabled", "true");
			}	

			if(<%= np.getCurrentPage() <= np.getEndPage() %>){
				var after = $("#afterN");
				
				after.attr('disabled', 'true');
			}
	    	
	    	// 공지글 들어가기
	    	$("#notice td").mouseenter(function(){
	    		$(this).parent().children("td").css({"background":"lightgray","cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().children("td").css("background","none");
			}).click(function(){
				var nNo = $(this).parent().children("td").children("input").val();
				
				console.log("위에꺼 : " + typeof nNo);
				location.href="<%= request.getContextPath() %>/AdminNoticeDetail.nr?nNo="+nNo;
			});
	    	
	    	
	    	// 공지사항등록
	    	function submit_n(){
	    		
	    		window.name = "AdminList.bu";
	    		
	    		window.open("AdminNWriter.bu", "공지사항 게시물등록","width=1250, height=850");
	    	}
	    	

			$(function(){
				// 체크박스 전체선택
				$("#n_checkAll").click(function(){
					if($("#n_checkAll").prop("checked")){
						$(".n_check").prop("checked",true);
					} else {
						$(".n_check").prop("checked", false);
					}
				});
				  
				// 체크박스 하나라도 풀리면 전체도 풀리게
		 		$(".n_check").click(function(){
					if($("input[class=n_check]:checked").length == 1){
						$("#n_checkAll").prop("checked", false);
					} else {
						$("#n_checkAll").prop("checked", true);
					}
				});
				
				
			// 선택삭제
			$("#n_delete").click(function(){
				console.log("length : " + $("input[class=n_check]:checked").length);
				
				// 체크된 체크박스 가져오기
				var checkbox = $("input[class=n_check]:checked").length;
				var nList = new Array();
				var checked = confirm("삭제하시겠습니까?");
				
				
				var i = 0;
				for(i = 0; i<checkbox; i++){
					var num = $("input[name=n_check]:checked").eq(i);
					nList[i] = $(num).val();
				}
				
				
				
				if(checked == true){
					jQuery.ajaxSettings.traditional = true;
					$.ajax({
						url: "AdminNDelete.nr",
						type: "post",
						data: {nList:nList},
						success: function(data){
							alert("공지가 삭제되었습니다.");
							location.reload();
						}
					});
				} else {
					alert("취소하셨습니다");
				}
			});
	 			
	 			
	 		});
			
			
			
			
			
			
			// 탭누르면 이동
	 		$(".tab2").click(function(){
	 			 $.ajax({
	 				url: "AdminNoticeList.bu",
	 				success: function(data){
	 					location.href='<%= request.getContextPath() %>/AdminNoticeList.nr';
	 				}
	 			}); 
	 		});	 
	 		
	 		$(".tab1").click(function(){
	 			 $.ajax({
	 				url: "AdminList.bu",
	 				success: function(data){
	 					location.href='<%= request.getContextPath() %>/AdminList.bu';
	 				}
	 			 });
	 		});
			
			
	    </script>       
		</div><!-- 공지사항div -->
		
		<!-- 검색창 -->
      <div id="research">
      	
      	<input type="text" id="r_text" name="r_text">
      	<input type="button" id="r_button" value="검색">
      
      </div>
		
	<script>
		// 검색기능
		$("#r_button").click(function(){
			var text = $("#r_text").val();
			
			console.log(text);
			
			$.ajax({
				url: "AdminNoticeList.nr",
				data: {text:text},
				dataType : "json",
				success: function(data){
					
					
					$(".n_contentList2").html("");
					
					
					
					// 검색한 글자가 없으면
					if(text.length == 0){
						
						$(".searchNotice").html("");
						
						tr = $("<tr class=searchNotice>");
						td = $("<td colspan=6>").html("검색된 게시글이 없습니다").css({"padding-top":"10px","padding-bottom":"10px","height":"40px","background":"rgb(255, 255, 255)"});
						$(tr).append(td);
						$("#notice").append(tr);
						


					} else {
						
						$(".searchNotice").html("");
						
						console.log(data[0]);
						console.log(data[0].noticeTitle);
						
						
						for(var i = 0; i < data.length; i++){
							
							tr = $("<tr class=searchNotice>");
							checkbox = $("<th>").append($("<input type=checkbox>")).css({"padding-top":"10px","padding-bottom":"10px","height":"40px","background":"rgb(255, 255, 255)"});
							no = $("<td id=n_No>").html(data[i].noticeNo);
							title = $("<td>").html(data[i].noticeTitle);
							member = $("<td>").html("관리자");
							date = $("<td>").html(data[i].noticeDate);
							count = $("<td>").html(data[i].noticeCount);
							
							
							$(tr).append(checkbox);
							$(tr).append(no);
							$(tr).append(title);
							$(tr).append(member);
							$(tr).append(date);
							$(tr).append(count);
							$("#notice").append(tr);
						
						}
						
						$(".searchNotice").mouseenter(function(){
				    		$(this).children("td").css({"background":"lightgray","cursor":"pointer"});
						}).mouseout(function(){
							$(this).children("td").css("background","none");
						}).click(function(){		
							
							var nNo = $("#n_No").html();
							
							
							location.href="<%= request.getContextPath() %>/AdminNoticeDetail.nr?nNo=" + nNo;
						});
						
						
						
					}
					
				}
			});
		});
	</script>
		
		
		</div> 
		<!-- section 전체 div -->

         
         
         
		
	</section>





   <!-- 좌측 메뉴바 -->
	<aside>
	<div id='menu' class='menuDiv'>
		<ul class='menuList'>
			<li><a href='#'>관리자페이지</a></li>
			<li><img src="image/줄.PNG"></li>
			<br>
			<li><a href='<%= request.getContextPath() %>/adminSList.sc' class='mypageMenu'>학사일정관리</a></li>
			<br>
			<li><a href='#' class='mypageMenu'>스쿨버스관리</a></li>
			<br>
			<li><a href='#' class='mypageMenu'>학식관리</a></li>
			<br>
			<li><a href='<%= request.getContextPath() %>/AdminList.bu' class='mypageMenu'>게시판관리</a></li>
			<br>
		</ul>
	</div>
	</aside>
	
	<footer>
	<%@ include file = "../common/foot.jsp" %>
	</footer>
	
</body>
</html>