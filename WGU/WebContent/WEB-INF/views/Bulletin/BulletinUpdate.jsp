<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="wgu.bulletin.model.vo.*, java.util.ArrayList, wgu.member.model.vo.*" %>
<%
	Bulletin b = (Bulletin)request.getAttribute("b");
	ArrayList<Attachment> aList = (ArrayList<Attachment>)request.getAttribute("aList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여성시대학교 - 익명게시판(게시글수정)</title>
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

    
	/* 폼전체 */
	#bulletin_table{width: 95%; min-height: 850px; position: relative; left: 2px; 
	top: -50px; padding-left: 35px; padding-top: 45px; 
	padding-right: 15px; border: 5px solid rgba(205,205,205,0.8); 
	border-radius: 8px;}
	
	#bulletin{height: 290px; border-collapse: collapse;}
	
	.b_content>th{text-align:right; padding-right: 20px;
	background: gray; color: white;
	border-bottom: 1px solid white; border-radius: 4px;
	width: 170px; font-size: 18px; height: 55px;}
	
	.b_content>td{padding-left: 20px; text-align: left; 
	border-bottom: 2px solid lightgray; border-left: 2px solid lightgray; 
	background: rgba(245, 245, 245, 0.9); width: 900px;
	border-radius: 16px; border-top: 2px solid lightgray;}
	
	.b_content>th>span{padding-right: 10px;}
	
	#b_title2{width: 800px; height: 30px; padding-left: 10px;
	border-radius: 4px; border: 1px solid rgb(205,205,205);}
	
	#b_text{width: 800px; height: 400px; margin-top: 15px; 
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
	
	
	/* 수정 취소버튼 */
	#b_button2{position: relative; left: 970px; top: 20px; bottom: 20px;}
	
	#modify_button{height: 35px; width: 75px; text-align: center;
	background: gray; color: white; border-radius: 5px;
	border: none;}
	
	#no_button{height: 35px; width: 70px; text-align: center;
	background: gray; color: white; border-radius: 5px;
	border: none;}
				
	#contentLine2{border: 1px solid lightgray;}
	
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
         <p class='mypage'>게시글수정</p>
      </div>
      <br>
      <hr class="hr1">
      </div>
      <div id = 'content'>
	     	<form action='<%= request.getContextPath() %>/B_Update.bu' method='post' encType="multipart/form-data">
			
			<div id=bulletin_table>
			
			<div>
			<table id=bulletin>
				<!-- 작성자 -->
				<tr class=b_content>
					<th id=b_writer>작성자<input type="hidden" id="bNo" name="bNo" value="<%= b.getBulletinNo() %>"></th>
					<td id=b_admin>익명<input type="hidden" value="<%= b.getMemberNo() %>"></td>
				</tr>
				<!-- 첨부파일 -->
				<tr class=b_content>
					<th id=n_file rowspan=2>첨부파일</th>
					<td style="height: 55px;">
					<input type='file' name=file1><br>
					<input type="file" name=file2>
					</td>
				</tr>
				<tr class=b_content id="b_content1">
					<td id="b_fileList">
						<div id="b_file2">
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
				<tr class=b_content>
					<th id=b_title1>제목</th>
					<td><input type='text' id=b_title2 name="b_title" value="<%= b.getBulletinTitle() %>"></td>
				</tr>
				<!-- 내용 -->
				<tr class=b_content>
					<th id=b_con>내용</th>
					<td>
					<input type="text" id=b_text  name="b_content" value="<%= b.getBulletinContent() %>">
					</td>
				</tr>
			</table>
			</div>
			
			<div id=b_button2>
				<button id=modify_button>수정하기</button>	
				<button id=no_button>취소</button>
			</div>
		
			</div>
			
			<br>
		
		</form>
      </div>
		
		<div>
		<hr id = 'contentLine2'>
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
			var bNo = $("#bNo").val();
			
			
			
			$.ajax({
				url: "BulletinAttachmentDelete.at",
				dataType :"json",
				data: {fileId:fileId, changeName:changeName, originName:originName, bNo:bNo},
				success: function(date){
					alert("파일삭제 성공");
					$("input[class=check_b]:checked").parent().remove();
					if($(".filename").length == 0){
						$("#b_file2").html("첨부된 파일이 없습니다");
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
            <li><a href='#'>커뮤니티</a></li>
            <li><img src="image/줄.PNG"></li>
            <br>
            <li><a href="<%= request.getContextPath() %>/BulletinList.bu" class='community'>익명게시판</a></li>
            <br>
            <li><a href="<%= request.getContextPath() %>/NoticeList.nr" class='community'>공지사항</a></li>
         </ul>
      </div>
   </aside>
   
   <footer>
	<%@ include file = "../common/foot.jsp" %>
	</footer>
   
</body>
</html>