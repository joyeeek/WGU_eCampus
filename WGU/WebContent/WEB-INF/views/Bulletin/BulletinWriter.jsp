<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.util.ArrayList, wgu.member.model.vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여성시대학교 - 익명게시판(글쓰기)</title>
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
	#bulletin_table{width: 1080px; height: 750px; position: relative; left: 2px; 
	padding-left: 25px; padding-top: 45px; padding-right: 25px; top: -20px;
	border: 5px solid rgba(205,205,205,0.8); border-radius: 8px;}
	
	#bulletin{height: 290px; border-collapse: collapse;}
	
	.b_content>th{text-align:right; padding-right: 20px; background: gray; 
	color: white; border-bottom: 1px solid white;
	border-radius: 4px; width: 170px; font-size: 18px; height: 55px;}
	
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
	
	
	
	/* 등록 / 취소버튼 */
	#b_button{position: relative; left: 910px; top: 40px;}
	
	#yes_button{height: 35px; width: 80px; text-align: center;
	background: gray; color: white; border-radius: 5px; border: none;}
	
	#no_button{height: 35px; width: 75px; text-align: center;
	background: gray; color: white; border-radius: 5px; border: none;}
				
	#contentLine2{margin-top: 45px; position:relative; left: -30px; 
	width: 1150px;border: 0.5px solid lightgray;}
	
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
         <p class='mypage'>게시글작성</p>
      </div>
      <br>
      <hr class="hr1">
      </div>
      <div id = 'content'>
		<form action='<%= request.getContextPath() %>/insert.bu' method='post' onsubmit="return check();" encType="multipart/form-data">
			<div id=bulletin_table>
			<table id=bulletin>
				<!-- 작성자 -->
				<tr class=b_content>
					<th id=b_writer>작성자</th>
					<td id=b_secret>익명<input type="hidden" name="b_writer" value="<%= loginUser.getMemberNo() %>"></td>
				</tr>
				<!-- 첨부파일 -->
				<tr class=b_content>
					<th id=b_file>첨부파일</th>
					<td>
					<input type='file' name=upload1><br>
					<input type='file' name=upload2><br>
					</td>
				</tr>
				<!-- 제목 -->
				<tr class=b_content>
					<th id=b_title1>제목</th>
					<td><input type='text' id=b_title2 name="title" placeholder='제목을 입력하세요'></td>
				</tr>
				<!-- 내용 -->
				<tr class=b_content>
					<th id=b_con>내용</th>
					<td><textarea id=b_text name="content" placeholder="내용을 입력해주세요" ></textarea></td>
				</tr>
			</table>
			
			
			<!-- 등록과 취소버튼 -->
			<div id=b_button>
				<span>
					<input type="submit" id=yes_button value="등록하기">
					<input type="button" id=no_button value="취소" onclick="cancel();">
				</span>
			</div>
			
			</div>
		
		</form>
	</div>
	
	
	<script>
	// 값을 안넣었을때 못넘어가게하기
	function check(){
		var text = document.getElementById("b_text").value;
		var title = document.getElementById("b_title2").value;
		
		
		
		if(title == ""){
			alert("제목을 입력하세요");
			$("#b_title2").focus();
			return false;
		} else if(text == "") {
			alert("내용을 입력하세요");
			$("#b_text").focus();
			return false;
		} else {
			alert("게시글이 등록되었습니다");
			return true;
		}
	}
	
		function cancel(){
			alert("취소하셨습니다");
			location.href="<%= request.getContextPath() %>/BulletinList.bu";
		}
	</script>
		
		<div>
		<hr id = 'contentLine2'>
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
   
 	<footer>
	<%@ include file = "../common/foot.jsp" %>
	</footer>
   
</body>
</html>