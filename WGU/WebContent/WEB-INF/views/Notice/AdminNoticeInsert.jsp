<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="wgu.member.model.vo.*" %>
<%  
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지 - 공지사항작성</title>
<script src='https://code.jquery.com/jquery-3.5.1.min.js'></script>
<style>
@media screen and (min-width: 480px) {
background-color: lightgreen;
}
	#notic_table{width: 1150px; height: 750px; position: relative; left: 2px; 
	padding-left: 35px; padding-top: 45px; padding-right: 15px;
	border: 5px solid rgba(205,205,205,0.8); border-radius: 8px; }
	
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
	
	
	
	/* 등록 / 취소버튼 */
	#n_button{position: relative; left: 950px; top: 40px;}
	
	#yes_button{height: 35px; width: 80px; text-align: center;
	background: gray; color: white; border-radius: 5px;
	border: none;}
	
	#no_button{height: 35px; width: 75px; text-align: center;
	background: gray; color: white; border-radius: 5px;
	border: none;}
				
	#contentLine2{margin-top: 45px; border: 1px solid lightgray;}
	
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
	<div></div>

	<div id = 'content'>
		<form action='<%= request.getContextPath() %>/AdminNInsert.bu' encType="multipart/form-data" method='post' target="AdminList.bu">
			<div id=notic_table>
			<table id=notic>
				<!-- 작성자 -->
				<tr class=n_content>
					<th id=n_writer>작성자</th>
					<td id=n_admin>관리자<input type="hidden" name="n_writer" value="<%= loginUser.getMemberNo() %>"></td>
				</tr>
				<!-- 첨부파일 -->
				<tr class=n_content>
					<th id=n_file>첨부파일</th>
					<td>
						<input type='file' name=upload1><br>
						<input type='file' name=upload2><br>
					</td>
				</tr>
				<!-- 제목 -->
				<tr class=n_content>
					<th id=n_title1>제목</th>
					<td><input type='text' name="title" id=n_title2 placeholder='제목을 입력하세요'></td>
				</tr>
				<!-- 내용 -->
				<tr class=n_content>
					<th id=n_con>내용</th>
					<td><textarea id=n_text name="content" placeholder="내용을 입력해주세요" ></textarea></td>
				</tr>
			</table>
			
			<!-- 등록과 취소버튼 -->
			<div id=n_button>
				<span>
					<input type="submit" value="등록하기" id=yes_button onclick="insert();">
					<input type="button" value="취소" id=no_button onclick="window.close();">				
				</span>
			</div>
			
			</div>
		
		</form>
	</div>
	<script>
	
		function popupClose(form){
			form.target = opener.name;
			
			form.submit();
			
			if(opener!=null){
				opener.insert=null;
				
				opener.location.reload();
				
			}
		}
		
		function insert(){
			alert("등록되었습니다");
			window.close();
		}
		 
		
	</script>
	
	<footer>
	<%@ include file = "../common/foot.jsp" %>
	</footer>
	
</body>
</html>