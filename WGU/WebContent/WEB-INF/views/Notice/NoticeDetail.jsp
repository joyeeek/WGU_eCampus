<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="wgu.bulletin.model.vo.*, wgu.member.model.vo.*, java.util.ArrayList" %>
<%
	Notice n = (Notice)request.getAttribute("notice");
	ArrayList<Attachment> a =(ArrayList<Attachment>)request.getAttribute("attachment");
	ArrayList<Notice> beforepage = (ArrayList<Notice>)request.getAttribute("beforepage");
	ArrayList<Notice> afterpage = (ArrayList<Notice>)request.getAttribute("afterpage");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여성시대학교 - 공지사항</title>
<script src='https://code.jquery.com/jquery-3.5.1.min.js'></script>
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
	
	.community {
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
		
	.mypage {
	width : 250px;
	}
	
	.hr1 {
	position: absolute;
	top: 575px;
	left: 300px;
	width: 1150px;
	border: 0.5px solid lightgray;
	}



	/* 각자 구현 내용*/
	section{position : absolute; top : 700px; left : 300px;
	background : white; width : 1200px; height : 800px; float : right;}

   
	/* 게시글 보기 */
	#content{display:inline-block; width: 850px; position: relative; left: 30px; bottom: 2px;}
	
	/* 게시글+댓글 전체 */		
	#all{border: 5px solid rgba(234, 234, 234, 0.8); border-radius: 8px;
	padding-left: 27px; padding-right: 27px; padding-top: 35px; 
	padding-bottom: 65px; width: 1080px; margin-left: -26px;
	position: relative; top: -60px; }
	
	/* 상단 삭제 수정 목록보기 버튼 */
	#b_modify{border: none; border-radius: 3px;
	background: gray; color: white;
	width: 50px; height: 30px; 
	position: relative; bottom: 5px; left: 10px;}
					
	#b_delete{border: none; border-radius: 3px;
	background: gray; color: white;
	width: 50px; height: 30px;
	position: relative; bottom: 5px; left: 15px;}
					
	#turnList{border: none; border-radius: 3px;
	background: gray; color: white;
	width: 80px; height: 30px;
	position: relative; left: 880px; bottom: 5px;}
	
	
	   
	/* 게시글 보기 */
	#title>td{font-size: 45px; font-weight: bold; position: relative; left: 10px;}
	#writer{position: relative; left: 50px; font-size: 19px;}
	#writer>img{width: 30px; height:30px; position: relative; left: -10px; top: 3px;}
	#writeDate{font-size: 19px; padding-left: 80px;}
	#writeDate>img{margin-right: 10px; width: 30px; height:30px; position: relative; top: 4px;}
   
	/* 첨부파일 */
	#file{position: relative; left: 20px;}
	#fileimg{width: 30px; height: 30px; position: relative; left: 15px; bottom: 1px;}
	.table{position: relative; left: 25px;}
   
   
	/* 쓴 글 보이는 부분 */
	#read{display: inline-block; position: relative; left: 25px;
	width: 1020px; min-height: 200px; font-size: 17px;
	border: 1px solid gray; border-radius: 5px;
	padding: 5px; margin-top: 15px; margin-bottom: 15px; padding-top: 10px;}
   
	#contentLine2{position: relative; top: 25px;}
	
	/* 이전/다음글 */
   	.nimg{width: 30px; height: 30px;}
   	#nextline1{position:relative; top: 24px;}
   	#nextline2{position:relative; top: 25px;}
   	#afterList{position: relative; top: 25px; left: 20px; vertical-align: text-bottom;}
   	#beforeList{position: relative; top: 27px; left: 20px; vertical-align: text-bottom;}
   	.nextTitle{font-size: 20px; font-weight: bold; 
	position: relative; top: -7px; left: 35px;}
   	.nextContent{font-size: 18px; position: relative; top: -10px; left: 65px;}
   	
   	
   	/* 하단 목록보기 버튼 */
	#bottomList>input{border: none; border-radius: 3px;
	background: gray; color: white;
	width: 80px; height: 30px; margin-bottom: 10px;
	position: relative; left: 990px; top: 40px;}
					
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
        <img id='banner' src="image/5.png">
      <div id='mypageDiv' class="mypageDiv">
         <p class='mypage'>공지사항</p>
      </div>
      <br>
      <hr class="hr1">
      </div>
      <div id = 'content'>
	<div id="tab-2" class="tab-content">
		<br>
		
	       <!-- 게시글보기 시작 -->
			<div id=all>
			<form>
			<hr>
			<table id="table">
			<!-- 게시글  -->
				<tr id="title">
					<td class=table colspan="2" style="overflow: hidden;"><%= n.getNoticeTitle() %></td>
				</tr>
				<tr id="date">
					<td id='writer' class=table><img src="image/사람.png" id="human">관리자<input type="hidden" value=<%= n.getMemberNo() %>></td>
					<td id='writeDate' class=table><img src="image/캘린더.png"><%= n.getNoticeDate() %></td>
				</tr>
			</table>
			
			
			<div>
				<hr>
				<table>
				<% if(a.isEmpty()) { %>
				<tr>
					<td><img src="image/파일.png" id="fileimg"></td>
					<td class=table colspan="2">첨부된 파일이 없습니다.</td>
				</tr>
				<% } else { %>
						<tr>
							<td><img src="image/파일.png" id="fileimg"></td>
							<td id="file" class=table colspan="2">
							<% for(Attachment att : a) { %>
							<a href="<%= request.getContextPath() %>/AttachedFiles/<%= att.getChangeName() %>" download="<%= att.getOriginName() %>">
							<%= att.getOriginName() %>
							</a>
							<% } %>
							</td>
						</tr>
				<% } %>
				</table>
			</div>
			
			<div>
				<hr>
				<table id="write">
				<tr>
					<td class=table id=read colspan="2"><%= n.getNoticeContent() %></td>
				</tr>
				</table>
			</div>
			
			
			
			<hr id='contentLine2'>
			
		</form>
			
		<!-- 이전글과 다음글 -->
		<!-- 다음글 -->
		<div id=afterList>
			<span><img src="image/위.png" class=nimg></span>
			<span class=nextTitle>다음글</span>
			<% for(Notice after : afterpage) { %>
				<% if(after.getNoticeNo().equals("0")) { %>
					<span class=nextContent>다음글이 없습니다.</span>
				<% } else { %>
					<input type="hidden" value="<%= after.getNoticeNo() %>">
					<span class=nextContent><%= after.getNoticeTitle() %></span>
				<% } %>
			<% } %>
		</div>
		<hr id=nextline1>
		<!-- 이전글 -->
		<div id=beforeList>
			<span><img src="image/아래.png" class=nimg></span>
			<span class=nextTitle>이전글</span>
			<% for(Notice before : beforepage) { %>
				<% if(before.getNoticeNo().equals("0")) { %>
					<span class=nextContent>이전글이 없습니다</span>
				<% } else { %>
					<input type="hidden" value="<%= before.getNoticeNo() %>">
					<span class=nextContent><%= before.getNoticeTitle() %></span>
				<% } %>
			<% } %>
		</div>
		<hr id=nextline2>
		
		<div id=bottomList>
			<input type="button" onclick="listGo();" value="목록보기">
		</div>
		
		</div>
		
		
		
		
		
		</div><!-- 공지사항 등록 탭부분 -->
    </div>
    
    
    <script>
    	function listGo(){
    		location.href='<%= request.getContextPath() %>/NoticeList.nr';
    	}
    	
    	// 이전글 다음글 넘어가게 하기
    	$("#beforeList").mouseenter(function(){
    		$(this).css("cursor","pointer");
    	}).click(function(){
    		var nNo = $(this).children("input").val();
    		
    		if(nNo == undefined){
    			alert("이전글이 없습니다");
    		} else {
    			location.href="<%= request.getContextPath() %>/NoticeDetail.nr?nNo=" + nNo;
    		}
    	});
    	
    	$("#afterList").mouseenter(function(){
    		$(this).css("cursor", "pointer");
    	}).click(function(){
    		var nNo = $(this).children("input").val();
    		
    		if(nNo == undefined){
    			alert("다음글이 없습니다");
    		} else {
    			location.href="<%= request.getContextPath() %>/NoticeDetail.nr?nNo=" + nNo;
    		}
    	});
    </script>
    
    
    
   </section>


    <!-- 좌측 메뉴바 -->
   <aside>
      <div id='menu' class='menuDiv'>
         <ul class='menuList'>
            <li><a href='#'>커뮤니티</a></li>
            <li><img src="image/줄.PNG"></li>
            <br>
            <li><a href='<%= request.getContextPath() %>/BulletinList.bu' class='community'>익명게시판</a></li>
            <br>
            <li><a href='<%= request.getContextPath() %>/NoticeList.nr' class='community'>공지사항</a></li>
         </ul>
      </div>
   </aside>
   
   
	<footer>
	<%@ include file = "../common/foot.jsp" %>
	</footer>

</body>
</html>