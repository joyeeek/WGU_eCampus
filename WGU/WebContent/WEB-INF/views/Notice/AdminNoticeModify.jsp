<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="wgu.bulletin.model.vo.*, wgu.member.model.vo.*, java.util.ArrayList" %>
<%
	Notice n = (Notice)request.getAttribute("Notice");
	ArrayList<Attachment> aList =(ArrayList<Attachment>)request.getAttribute("attachment");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여성시대학교 - 관리자(공지게시판)</title>
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
	margin-top: -70px;
	background-color: rgba(0, 0, 0, 0.3);
	height: 1px;
	border: 0;
	} 
	
	/* 게시글 수정 */
	
	#notic_table{width: 1150px; height: 820px; 
	left: 2px; padding-left: 35px;
	padding-top: 45px; margin-top: 50px; 
	padding-right: 15px; border: 5px solid rgba(205,205,205,0.8); 
	border-radius: 8px;  position: relative;}
	
	#notic{height: 290px; border-collapse: collapse;}
	
	.n_content>th{text-align:right; padding-right: 20px;
	background: gray; color: white;
	border-bottom: 1px solid white;
	border-radius: 4px;
	width: 170px; font-size: 18px; height: 55px;}
	
	.n_content>td{padding-left: 20px; text-align: left; 
	border-bottom: 2px solid lightgray; border-left: 2px solid lightgray; 
	background: rgba(245, 245, 245, 0.9); width: 900px;
	border-radius: 16px; border-top: 2px solid lightgray;}
	
	.n_content>th>span{padding-right: 10px;}
	
	#n_title2{width: 800px; height: 30px; padding-left: 10px;
	border-radius: 4px; border: 1px solid rgb(205,205,205);}
	
	#n_text{width: 800px; height: 400px; margin-top: 15px; 
	margin-bottom: 15px; padding-top: 10px; 
	padding-left: 10px; border-radius: 4px; 
	border: 1px solid rgb(205,205,205); resize: none;}
			
	#n_file{height:150px;}
	#b_file2{list-style: none;}
	
	.filename{padding-bottom: 20px; padding-top: 4px;}
	
	.originNameF{border:0px; background: none; font-size: 16px; min-width: 10px;}
	
	.Xbutton{border: none; background: darkgray; color: white;
	border-radius: 4px; width: 22px; height: 22px;}
			
	#buttonX{height: 40px;}
	
	#Xbutton{border: none; background: #7FB3D5 ; 
	color: white; height: 25px; border-radius: 4px;}
	
	/* 등록 / 취소버튼 */
	#delete_button{height: 35px; width: 80px; text-align: center;
	background: gray; color: white; border-radius: 5px;
	border: none; position: relative; left: 15px; top: 30px;}
				
	#modify_button{height: 35px; width: 80px; text-align: center;
	background: gray; color: white; border-radius: 5px;
	border: none; position: relative; left: 960px; top: 30px;}
				
	#cancel_button{height: 35px; width: 80px; text-align: center;
	background: gray; color: white; border-radius: 5px;
	border: none; position: relative; left: 965px; top: 30px;}

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
         <p class='mypage'>공지사항 수정</p>
      </div>
      <br>
      </div>
      <div id = 'content'>
		
		<hr id='contentLine'>
		
		<form action='<%= request.getContextPath() %>/AdminNUpdate.nr' method='post' encType="multipart/form-data">
			<div id=notic_table>
			<input type="hidden" id=nNo name=nNo value="<%= n.getNoticeNo() %>">
			<table id=notic>
				<!-- 작성자 -->
				<tr class=n_content>
					<th id=n_writer>작성자</th>
					<td id=n_admin>관리자</td>
				</tr>
				<!-- 첨부파일 -->
				<tr class=n_content>
					<th id=n_file rowspan=2>첨부파일</th>
					<td style="height: 55px;">
					<input type='file' name=file1><br>
					<input type="file" name=file2>
					</td>
				</tr>
				<tr class=n_content id="n_content1">
					<td id=n_fileList">
						<div id="n_file2">
							<% if(aList == null) { %>
							<span class="filename">첨부된 파일이 없습니다</span>
							<% } else { %>
							<div id="buttonX">
							<input id="Xbutton" type="button" value="첨부파일 삭제">
							</div>
								<% for(int i = 0; i <aList.size(); i++) { %>
								<span class="filename">
								<input type="checkbox" class="check_b">
								<input type="hidden" class="file_id" value="<%= aList.get(i).getFileId() %>">
								<input type="hidden" class="changeNameF" value="<%= aList.get(i).getChangeName() %>">
								<input type="text" class="originNameF" value="<%= aList.get(i).getOriginName() %>" disabled>
								</span>
								<% } %>
							<% } %>
						</div>
					</td>
				</tr>
				<!-- 제목 -->
				<tr class=n_content>
					<th id=n_title1>제목</th>
					<td><input type='text' id=n_title2 name=title value="<%= n.getNoticeTitle() %>"></td>
				</tr>
				<!-- 내용 -->
				<tr class=n_content>
					<th id=n_con>내용</th>
					<td><input type="text" id=n_text name=content value="<%= n.getNoticeContent() %>"></td>
				</tr>
			</table>
			
			<!-- 등록과 취소버튼 -->
			<div id=n_button>
				<button id=modify_button>수정하기</button>	
				<button id=cancel_button>취소</button>
			</div>
			
			</div>
			
		
		</form>
		
	</div>
    
   </section>
   
   <script>
		// 첨부파일삭제
		$("#Xbutton").click(function(){
			
			var checkbox = $("input[class=check_b]:checked").length;
			var fList = new Array(checkbox);
			var fileId = $("input[class=check_b]:checked").next().val();
			var changeName = $("input[class=check_b]:checked").next().next().val();
			var originName = $("input[class=check_b]:checked").next().next().next().val();
			var nNo = $("#nNo").val();
			
			$.ajax({
				url: "NoticeAttachmentDelete.at",
				dataType :"json",
				data: {fileId:fileId, changeName:changeName, originName:originName, nNo:nNo},
				success: function(date){
					alert("파일삭제 성공");
					$("input[class=check_b]:checked").parent().remove();
					if($(".filename").length == 0){
						$("#n_file2").html("첨부된 파일이 없습니다");
					}
				},
				error: function(data){
					alert("파일삭제에 실패 했습니다.");
				} 
			}); 
		});
	
	
	</script>
   
   
   
   
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