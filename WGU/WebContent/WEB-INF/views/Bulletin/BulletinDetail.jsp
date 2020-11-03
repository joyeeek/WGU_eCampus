<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,wgu.member.model.vo.*, wgu.bulletin.model.vo.*" %>
<%
	ArrayList<Comments> c = (ArrayList<Comments>)request.getAttribute("comm");
	Bulletin b = (Bulletin)request.getAttribute("bulletin");
	ArrayList<Attachment> aList = (ArrayList<Attachment>)request.getAttribute("Attach");
	ArrayList<Bulletin> bList = (ArrayList<Bulletin>)request.getAttribute("beforepage");
	ArrayList<Bulletin> afterList = (ArrayList<Bulletin>)request.getAttribute("afterpage");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여성시대학교 - 익명게시판(게시글보기)</title>
<script src='https://code.jquery.com/jquery-3.5.1.min.js'></script>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet"> 
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
	/* 게시글+댓글 전체 */
	#all{border: 5px solid rgba(234, 234, 234, 0.8); border-radius: 8px;
	padding-left: 50px; padding-right: 50px; padding-top: 35px; 
	padding-bottom: 65px; width: 1080px; margin-left: -23px;
	margin-top: -60px;}
	
	/* 상단 삭제 수정 목록보기 버튼 */
	#b_modify{border: none; border-radius: 3px;
	background: gray; color: white;
	width: 50px; height: 30px; 
	position: relative; bottom: 5px; left: 10px;}
					
	#b_delete{border: none; border-radius: 3px;
	background: gray; color: white;
	width: 50px; height: 30px;
	position: relative; bottom: 5px; 
	left: 15px; text-align: center;}
					
	#turnList{border: none; border-radius: 3px;
	background: gray; color: white;
	width: 75px; height: 30px;
	position: relative; left: 900px; 
	bottom: 10px; text-align: center;}
	
	
	   
	/* 게시글 보기 */
	#title>td{font-size: 45px; font-weight: bold; position: relative; 
	left: 10px; top: -5px;}
	#b_title{overflow: hidden; text-overflow:ellipsis;}
	#writer{position: relative; left: 50px; font-size: 19px;}
	#writer>img{width: 30px; height:30px; position: relative; 
	left: -10px; top: 3px;}
	#writeDate{font-size: 19px; padding-left: 80px;}
	#writeDate>img{margin-right: 10px; width: 30px; 
	height:30px; position: relative; top: 4px;}
   
	/* 첨부파일 */
	#file{position: relative; left: 20px;}
	#fileimg{width: 30px; height: 30px; position: relative; 
	left: 15px; bottom: 1px;}
	.table{position: relative; left: 25px;}
   
	/* 쓴 글 보이는 부분 */
	#read{display: inline-block; position: relative; left: 25px;
	width: 1020px; min-height: 200px; font-size: 17px;
	border: 1px solid gray; border-radius: 5px;
	padding: 5px; margin-top: 15px; margin-bottom: 15px; padding-top: 10px;}
   
	
	
	/* 댓글 */
	.c_button{position:absolute}
	#no_comment{width: 1050px; position: relative; left: 10px;
	border-radius: 7px; background: lightgray;
	padding: 10px; min-height: 30px;}
	
	#yes_comment{list-style: none; width: 1050px; 
	position: relative; left: 10px;
	border-radius: 7px; background: lightgray;
	padding: 10px; min-height: 130px;}
	
	#no_nick, #yes_nick{font-size: 19px; font-weight: bold; 
	position: absolute; left: 15px; }
	
	#content{display:inline-block; min-height: 25px; 
	width: 850px; position: relative; left: 30px; bottom: 2px;}
	
	.c_textarea{border: none; background:none; resize: none; width: 1030px;
	position: relative; top: 45px; left: -25px; min-height: 70px;}
	
	#c_nick{border: none; background: none; width: 50px; font-size: 19px;}
	.com_content{display: inline;}
   
	/* 댓글페이징 */
	#pagingArea{position: relative; left: 500px; }
	.paging{list-style: none; display: inline-block; width: 27px; 
	height: 27px; text-align: center; border-radius: 3px; 
	background: rgb(224,224,224);}
   
	/* 수정삭제버튼*/
	.button1{position: absolute; left: 940px;}
	.button2{position: absolute; left: 915px;}
   
	.modify_c{width: 40px; height: 30px; border:none; background: none; font-size: 14px;}
	.remove1_c{width: 40px; height: 30px; border:none; background: none; font-size: 14px; position: relative; left: 75px;}
   
	/* 댓글 작성 */
	#commentInput{background: rgba(224,224,224,0.6); width: 1065px; 
	height: 150px; border-radius: 12px; position: relative; left: 10px;}
	#inputA{display: block; position: relative; left: 20px; top: 15px;}		
	#inputName{border: none; border-radius: 4px; height: 25px; width: 230px; position: relative;}
	#inputB{position: relative; left: 30px; top: 3px;}
	#inputComment{height: 80px; width: 900px; border-radius: 6px; border: none; position: relative; top: 4px;}
	#inputButton{width: 80px; height: 80px; 
	position: relative; left: 20px; bottom: 34px;
	border: none; border-radius: 3px;
	background: gray; color:white;}
   				
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
   	
   	
	/* 하단  버튼 */
	#bottomList>button{border: none; border-radius: 3px;
	background: gray; color: white;
	width: 80px; height: 30px; margin-bottom: 10px;
	position: relative; left: 990px; top: 40px;}
		
	#b_turnList{border: none; border-radius: 3px;
	background: gray; color: white;
	width: 75px; height: 30px;
	position: relative; top:35px; left: 1000px; bottom: 5px;
	text-align: center;}
					
	footer {
	display: inline-block;
    position : absolute;
    left : 0px;
	top: 2245px;
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
         <p class='mypage'>익명게시판</p>
      </div>
      <br>
      <hr class="hr1">
      </div>
      <div id = 'content'>
		
		<div id="tab-2" class="tab-content">
		
		
		<br>
		
		<!-- 게시글보기 시작 -->
		<div id=all>
		
		<form action="<%= request.getContextPath() %>/BModify.bu" method="post">
			<!-- 상단 목록보기 버튼 -->
			<div id=topList>
				<% if(loginUser != null && loginUser.getMemberNo().equals(b.getMemberNo())) { %>
				<input type="submit" id=b_modify value="수정">
				<input type="button" id=b_delete value="삭제">
				<% } %>
				<input type="button" id=turnList onclick='location.href="<%= request.getContextPath() %>/BulletinList.bu"' value="목록보기">
			</div>
			
			<br>
			
			<hr>
			
			
			<table id="table">
				
				<!-- 게시글  -->
				<tr id="title">
					<td class=table id=b_title colspan="4"><%= b.getBulletinTitle() %>
					<input type="hidden" name="bId" value=<%= b.getBulletinNo() %>>
					<input type="hidden" name="b_title" value=<%= b.getBulletinTitle() %>>
					</td>
				</tr>
				<tr id="date">
					<td id='writer' class=table><img src="image/사람.png" id="human">익명<input type="hidden" name="b_writer" value="<%= b.getMemberNo() %>"></td>
					<td id='writeDate' class=table><img src="image/캘린더.png"><%= b.getBulletinDate() %><input type="hidden" name="b_date" value="<%= b.getBulletinDate() %>"></td>
				</tr>
			</table>
		
		
			<div>
			<hr>
			<table>
				<% if(aList.isEmpty()) { %>
				<tr>
					<td><img src="image/파일.png" id="fileimg"></td>
					<td class=table colspan="2">첨부된 파일이 없습니다.</td>
				</tr>
				<% } else { %>
						<tr>
							<td><img src="image/파일.png" id="fileimg"></td>
							<td id="file" class=table2 colspan="2">
							<% for(int a = 0; a<aList.size(); a++) { %>
							<a href="<%= request.getContextPath() %>/AttachedFiles/<%= aList.get(a).getChangeName() %>" download="<%= aList.get(a).getOriginName() %>">
							&nbsp;<%= aList.get(a).getOriginName() %></a>
							<input type="hidden" class=file_save name="b_fileId" value="<%= aList.get(a).getFileId() %>">
							<input type="hidden" class=file_save name="b_filePath" value="<%= aList.get(a).getFilePath() %>">
							<input type="hidden" class=file_save name="b_fileCName" value="<%= aList.get(a).getChangeName() %>">
							<input type="hidden" class=file_save name="b_fileOName" value="<%=aList.get(a).getOriginName() %>">
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
					<td class=table id=read colspan="2"><%= b.getBulletinContent() %><input type="hidden" name="b_content" value=<%= b.getBulletinContent() %>></td>
				</tr>
			</table>
			</div>
		
		 </form>
		
			<!-- 댓글 -->
			
			<div id=comment_header>
			<hr>
				
			<h1>댓글</h1>
				
			<hr>
			</div>
			
			<br>
			
			<!-- 댓글 출력부분 -->
			<div id=comment>
			<% if(c.isEmpty()) { %>
				<div id=no_comment>
					<div>등록된 댓글이 없습니다.</div>
				</div>
			<% } else { %>
				<% for(int i = 0; i < c.size(); i++) { %>
					<div id=yes_comment>
					
						<% if(c.get(i).getCommentsNick() == null) { %>
							<span id=no_nick class=com_content>익명</span>
							<% if(loginUser != null && loginUser.getMemberNo().equals(c.get(i).getMemberNo())) { %>
								<div class="c_button">
									<div class=button1 class=com_content>
										<input type="button" class=modify_c value="수정" >
										<input type="hidden" id=cNo class="cNo" value="<%= c.get(i).getCommentsNo() %>">
									</div>
									
									<div class=button2 class=com_content>
										<input type="button" class=remove1_c value="삭제" >
										<input type="hidden" id=cNo class="cNo" value="<%= c.get(i).getCommentsNo() %>">
									</div>
								</div>
							<% } %>
							<div>
								<div id=content class=com_content>
								<input type="text" class="c_textarea" id="c_textarea" value="<%= c.get(i).getComments() %>" disabled>
								</div>
							</div>
						<% } else { %>
							<span id=yes_nick class=com_content><%= c.get(i).getCommentsNick() %></span>
							<input type="hidden" id=cNo class="cNo" value="<%= c.get(i).getCommentsNo() %>">
							<% if(loginUser != null && loginUser.getMemberNo().equals(c.get(i).getMemberNo())) { %>
								<div class="c_button">
									<div class=button1 class=com_content>
									<input type="button" class=modify_c value="수정" >
									<input type="hidden" id=cNo class="cNo" value="<%= c.get(i).getCommentsNo() %>">
									</div>
									
									<div class=button2 class=com_content>
									<input type="button" class=remove1_c value="삭제">
									<input type="hidden" id=cNo class="cNo" value="<%= c.get(i).getCommentsNo() %>">
									</div>
								</div>
							<% } %> 
							<div>
								<div id=content class=com_content>
								<input type="text" class="c_textarea" id="c_textarea" value="<%= c.get(i).getComments() %>" disabled>
								</div>
							</div>
						<% } %>
					</div>
					<br>
				<% } %>
			<% } %>
			</div>
			
			<br>
			<hr>
			<br>
			
			<form>
			
			
			<!-- 댓글 입력부분 -->
			<div id=commentInput>
				<span id="inputA">
				<b>작성자</b>
				<!-- 설정다시하기 >> 입력시 닉네임 저장 / null일경우 익명 -->
				<input type="text" id="inputName" name="inputnick" placeholder="원하는 닉네임을 입력 해 주세요."> &nbsp;
				<span style="font-size: 11px; color: balck;">닉네임을 입력하지 않을경우 익명으로 대체 됩니다.</span>
				<input type="hidden" id="inputmNo" value="<%= loginUser.getMemberNo() %>">
				</span>
				<br>
				<span id="inputB">
				<textarea id="inputComment" placeholder="내용을 입력 해 주세요"></textarea>
				<input type="button" id="inputButton" value="등록하기">
				</span>
			</div>
			
			<hr id='contentLine2'>
			
			</form>
			
			<!-- 이전글과 다음글 -->
			<!-- 다음글 -->
			<div id="afterList">
				<span><img src="image/위.png" class=nimg></span>
				<span class=nextTitle>다음글</span>
				<% for(Bulletin after : afterList) { %>
					<% if(after.getBulletinNo().equals("0")) { %>
						<span class=nextContent>다음글이 없습니다.</span>
					<% } else { %>
						<input type="hidden" value="<%= after.getBulletinNo() %>">
						<span class=nextContent><%= after.getBulletinTitle() %></span>
					<% } %>
				<% } %>
			</div>
			<hr id=nextline1>
			<!-- 이전글 -->
			<div id="beforeList">
				<span><img src="image/아래.png" class=nimg></span>
				<span class=nextTitle>이전글</span>
				<% for(Bulletin before : bList) { %>
					<% if(before.getBulletinNo().equals("0")) { %>
						<span class=nextContent>이전글이 없습니다.</span>
					<% } else { %>
						<input type="hidden" value="<%= before.getBulletinNo() %>">
						<span class=nextContent><%= before.getBulletinTitle() %></span>
					<% } %>
				<% } %>
			</div>
			<hr id=nextline2>
			
			<div id=bottomList>
				<input id=b_turnList onclick='location.href="<%= request.getContextPath() %>/BulletinList.bu"' value="목록보기">
			</div>
		
		</div>
		
		</div><!-- 공지사항 등록 탭부분 -->
	</div>
	</section>
	
	
	
	
	
	
	
	 <!-- 좌측 메뉴바 -->
   <aside>
      <div id='menu' class='menuDiv'>
         <ul class='menuList'>
            <li><a href='#'>커뮤니티</a></li>
            <li><img src="image/줄.PNG"></li>
            <br>
            <li><a href="<%= request.getContextPath() %>/BulletinList.bu" class='community'>익명게시판</a></li>
            <br>
            <li><a href="<%= request.getContextPath() %>/NoticeList.nr" class='community'>공지사항</a></li>
         </ul>
      </div>
   </aside>


	<script>
		// 이전글 다음글 넘어가게하기
		$("#beforeList").mouseenter(function(){
			$(this).css("cursor","pointer");
		}).click(function(){
			var bNo = $(this).children("input").val();
			
			if(bNo == undefined){
				alert("이전글이 없습니다.");
			} else {
				location.href="<%= request.getContextPath() %>/BulletinDetail.bu?bNo=" + bNo;
			}
		});
		
		$("#afterList").mouseenter(function(){
			$(this).css("cursor","pointer");
		}).click(function(){
		var bNo = $(this).children("input").val();
			
			if(bNo == undefined){
				alert("다음글이 없습니다.");
			} else {
				location.href="<%= request.getContextPath() %>/BulletinDetail.bu?bNo=" + bNo;
			}
		});
		
		
		// 게시글 삭제 버튼
		$("#b_delete").click(function(){
			var result = confirm("정말 삭제하시겠습니까?");
			console.log(result);
			
			var bId = "<%= b.getBulletinNo() %>"
			
			if(result == true){
				$.ajax({
					url: "BulletinDelete.bu",
					data : {bId:bId},
					type: "post",
					success: function(date){
						alert("삭제되셨습니다.");
						location.href="<%= request.getContextPath() %>/BulletinList.bu";
					}
				});
				
			} else {
				alert("취소하셨습니다");
			}
		});
		
		
        // 댓글 등록
		$("#inputButton").click(function(){
	       		var writer = "<%= loginUser.getMemberNo() %>"
	       		var bNo = "<%= b.getBulletinNo() %>";
	       		var content = $("#inputComment").val();
	       		var nick = $("#inputName").val();
	       	
	       		
	       		$.ajax({
	       			url: "insertComment.bu",
	       			data : {bNo:bNo, content:content, writer:writer, nick:nick},
	       			type: "post",
	       			success: function(data){
	       				
	       				alert("댓글이 등록되었습니다");
	       				location.reload();
	       				$("#inputName").text("");
       					$("#inputComment").text("");

	       				
	       			}
	       			
	       		});
	       	});
       	
       	
	       	// 댓글 수정 버튼
	   		$(".modify_c").click(function() {
	      		
	      		var textarea = $(this).parent().parent().next().children().children("input[id=c_textarea]");
	       		
	      		
	       		$(textarea).removeAttr("disabled")
	       		.css({"background":"white","border-radius":"8px", "width": "900px"});
	       		
	       		$(".modify_c").unbind("click").click(function(){
	       			var bNo = $("#bId").val();
	       			var content = $(textarea).val();
	       			var cNo = $(this).next("input[class=cNo]").val();
	       			
	       			$.ajax({
	       				url: "CommentUpdate.bu",
	       				type: "post",
	       				data: {bNo:bNo, cNo:cNo, content:content},
	       				success: function(data){
	       					alert("수정되었습니다");
	       					console.log(data);
	       					location.reload();
	       					
	       				}
	       			});
	       		});
	      	}); 
       	
       	
      		// 댓글 삭제(익명)
    		$(".remove1_c").click(function(){
    			var result = confirm("정말 삭제하시겠습니까?");
    			var bNo = "<%= b.getBulletinNo() %>"
    			var cNo = $(this).next("input[class=cNo]").val();
    			
    			if(result == true){
    				$.ajax({
    					url: "deleteComment.bu",
    					data: {bNo:bNo, cNo:cNo},
    					type: "post",
    					success: function(data){
    						alert("삭제되셨습니다.");
    						location.reload();
    					}
    				});
    			} else {
    				alert("취소하셨습니다.");
    			} 
    		});
       	
       	
      
       	
	</script>
	
	<footer>
	<%@ include file = "../common/foot.jsp" %>
	</footer>
	
</body>
</html>