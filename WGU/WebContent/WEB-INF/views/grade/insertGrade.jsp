<!-- 성적입력 (교수페이지) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="wgu.subject.model.vo.*, java.util.ArrayList, wgu.member.model.vo.Member"%>
<%
    ArrayList<Subject> list = (ArrayList<Subject>)request.getAttribute("list");
    String msg = (String)session.getAttribute("msg");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여성시대학교 - 과목개설</title>
<script src='https://code.jquery.com/jquery-3.5.1.min.js'></script>
<style>

/* 섹션시작 : 수강신청문구 */
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
            width : 250px;
	font-weight: 800;
	font-size: 48px;
}

.hr1 {
	position: absolute;
	top: 575px;
	left: 300px;
	width: 1150px;
	border: 0.5px solid lightgray;
}


/* 과목리스트 테이블 */
.openDiv2 {
	position: absolute;
	top: -50px;
	left: 10px;
	width: 1130px;
	height: 400px;
	border: none;
}

.openImg1 {
	position: absolute;
	top: 0px;
	left: 20px;
	width: 25px;
	height: 25px;
}

.openDiv2_1 {
	position: absolute;
	top: 40px;
	left: 0px;
	width: 1130px;
	height: 400px;
	border: 1px solid lightgray;
	overflow: scroll;
	overflow-x: hidden;
}

.openDiv2Span1 {
	position: absolute;
	top: 5px;
	left: 790px;
}

.openDiv2Label1 {
	position: absolute;
	top: 0px;
	left: 50px;
}

.subjectInfoTable {
	position: absolute;
	top: 500px;
	left: 500px;
}

thead {
	border: 0.5px solid white;
	background-color: rgb(176, 199, 217);
	color: white;
	height: 25px;
	text-align: center;
}

tbody {
	border: 0.5px solid white;
	background-color: rgb(235, 247, 255);
	color: black;
	height: 25px;
	text-align: center;
}

.td1 {
	width: 100px;
}

.td2 {
	width: 200px;
}

.td3 {
	width: 150px;
}

.td4 {
	width: 100px;
}

.td5 {
	width: 150px;
}

.td6 {
	width: 100px;
}

.td7 {
	width: 100px;
}

.td8 {
	width: 100px;
}

.td9 {
	width: 150px;
}

.td10 {
	width: 150px;
}

.stuBtn {
    background: rgb(246,246,246);
    border: 1px solid lightgray;
    padding: 1px 7px;
}

button.stuBtn:hover{
  background-color: rgb(176, 199, 217);
  color: black;
  -webkit-transition: all 0.4s;
    -moz-transition: all 0.4s;
    transition: all 0.4s;
}




/* 수강생 목록 테이블 */
.openDiv3{
    position : absolute;
    top : 450px;
    left : 10px;
    width : 1130px;
    height : 400px;
    border : none;
}

.openImg2{
    position : absolute;
    top : 0px;
    left : 20px;
    width : 25px;
    height : 25px;
}

.openDiv3_1{
    position : absolute;
    top : 40px;
    left : 0px;
    width : 1130px;
    height : 400px;
    border : 1px solid lightgray;
    overflow : scroll; 
    overflow-x: hidden;
}



.openImg2 {
	position: absolute;
	top: 0px;
	left: 20px;
	width: 25px;
	height: 25px;
}

.td2_1 {
	width: 180px;
}

.td2_2 {
	width: 180px;
}

.td2_3 {
	width: 150px;
}

.seperate{
    width : 60px;
    text-align: center;
}


.btnInsert {
    background: rgb(246,246,246);
    border: 1px solid lightgray;
    padding: 1px 7px;
}

button.btnInsert:hover{
  background-color: rgb(176, 199, 217);
  color: black;
  -webkit-transition: all 0.4s;
    -moz-transition: all 0.4s;
    transition: all 0.4s;
}




/* 좌측 메뉴바 */
aside {
	position: absolute;
	top: 470px;
	width: 230px;
	height: 1000px;
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

/* 섹션, 풋터 */
section {
	position: absolute;
	top: 700px;
	left: 300px;
	background: white;
	width: 1200px;	
}

footer{
	display: inline-block;
    position : absolute;
    left : 0px;
    top : 1740px;
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
			<p class='mypage'>성적입력</p>
		</div>
		<br>
		<hr class="hr1">
		</div>

		<div class="openDiv2">
			<img src="./image/수강신청아이콘1.JPG" class="openImg1"> 
			<label class="openDiv2Label1">개설과목 목록</label> 
			<span class="openDiv2Span1">*해당 버튼을 선택하면 수강생 목록이 출력됨!</span>
			<div class="openDiv2_1">
				<table id="subjectInfoTable">
				<thead>
					<tr class="openDiv2Table1">
						<td class="td1">전공/교양</td>
						<td class="td2">과목명</td>
						<td class="td3">학과</td>
						<td class="td4">학점</td>
						<td class="td5">강의시간</td>
						<td class="td7">정원</td>
						<td class="td8">난이도</td>
						<td class="td9">과목코드</td>
						<td class="td10">수강생목록</td>
					</tr>
					</thead>
					<tbody>			
					 <% if(list.isEmpty()){ %>
					 <tr>
					     <td colspan="9">현재 강의중인 과목이 없습니다.</td>
					</tr>
					<% } else { 
                  for(Subject subject : list) {%>
					<tr>
						<td><%= subject.getSubjectType() %></td>
						<td><%= subject.getSubjectName() %></td>
						<td><%= subject.getSubjectMajor() %></td>
						<td><%= subject.getSubjectCredit() %></td>
						<td><%= subject.getSubjectTime() %></td>
						<td><%= subject.getSubjectLimit() %></td>
						<td><%= subject.getSubjectGrade() %>학년</td>
						<td><%= subject.getSubjectNo() %></td>
						<td><button id="stuBtn" class="stuBtn" value=<%= subject.getSubjectNo() %>>수강생목록</button></td>
					</tr>
					<% }
                 } %> 
                 </tbody>
				</table>
			</div>
		</div>
		
		   <div class = "openDiv3">
           <img src = "./image/수강신청아이콘1.JPG" class = "openImg2">
           <label class = "openDiv2Label1">수강생목록</label>
           <div class = "openDiv3_1">
           <table class = "openDiv3Table1" id="openDiv3Table1">
           <thead>
                 <tr>
                      <td class = "td2_1">학과</td>
                      <td class = "td2_2">학번</td>
                      <td class = "td2_3">이름</td>
                      <td class = "td2_3">학년</td>
                      <td class = "td2_3">성적</td>
                      <td class = "td2_3">입력창</td>
                      <td class = "td2_3">확인</td>
                 </tr>
                 </thead>
                 <tbody>
                 </tbody>
                 </table>
           </div>
      </div>

	</section>

	<!-- 좌측 메뉴바 -->
	<aside>
		<div id='menu' class='menuDiv'>
			<ul class='menuList'>
				<li><a href='#'>수강정보</a></li>
				<li><img src="image/줄.PNG"></li>
				<li><br><a href="<%= request.getContextPath() %>/checkStu.gr" class='mypageMenu'>성적조회</a><br><br></li>
			    <li><a href="<%= request.getContextPath() %>//insertPro.gr" class='mypageMenu'>성적입력</a></li>
			</ul>
		</div>
	</aside>
	
		<footer>       
<%@ include file = "../common/foot.jsp" %>
</footer>

	<script>
	         
	$(document).on("click","#stuBtn",function(){
  	  var tdArr = new Array();
  	  var checkBtn = $(this);
  	  var tr = checkBtn.parent().parent();
  	  var td = tr.children();
  	  
  	  var subjectNo = td.eq(7).text(); // 과목코드
  	  
  	  td.each(function(i){
  		 tdArr.push(td.eq(i).text()); 
  	  });
  	  
  	  $.ajax({
  		 url : 'listGrade.gr',
  		 type : 'post',
  		 dataType : 'json',
  		 data : {subjectNo:subjectNo},
  		 success : function(response){
  			 console.log(response);
  			 console.log("서버 성공");
  			 
  			$('#openDiv3Table1 tbody').empty();
  			var str = '<tr>';
  			$.each(response, function(i){
  				str += '<td>' + response[i].subjectMajor + '</td><td>' + response[i].memberNo + '</td><td>' +
  				response[i].memberName + '</td><td>' + response[i].memberGrade + '학년</td><td>' +
  				response[i].memberResult + '</td><td><select name="seperate" class="seperate" id="seperate"> <option value="A+">&nbsp;&nbsp;&nbsp;&nbsp;A+</option>' +
				'<option value="A0">&nbsp;&nbsp;&nbsp;&nbsp;A0</option> <option value="B+">&nbsp;&nbsp;&nbsp;&nbsp;B+</option> <option value="B0">&nbsp;&nbsp;&nbsp;&nbsp;B0</option>' +
				'<option value="C+">&nbsp;&nbsp;&nbsp;&nbsp;C+</option> <option value="C0">&nbsp;&nbsp;&nbsp;&nbsp;C0</option> <option value="F">&nbsp;&nbsp;&nbsp;&nbsp;F</option>' +
			    '</select></td><td><button id="btnInsert" class="btnInsert" value=' + response[i].subjectNo + '>성적입력</button></td>';
  				str += '</tr>';
  			});
  			$('#openDiv3Table1 tbody').append(str);
  			
  		 },
  		 error : function(data){
  			 alert("수강생 목록이 없습니다.");
  			 console.log("서버 실패");
  		 }
  	  });        	   
  	  });
	
	
	$(document).on("click","#btnInsert",function(){
	  var tdArr = new Array();
  	  var checkBtn = $(this);
  	  var tr = checkBtn.parent().parent();
  	  var td = tr.children();
  	  
  	  var subjectNo = checkBtn.val(); // 과목코드
  	  var memberNo = td.eq(1).text();
  	  var memberResult = $('#seperate option:selected').val();  
  	  
  	  td.each(function(i){
  		 tdArr.push(td.eq(i).text()); 
  	  });
  	  
  	  $.ajax({
  		 url : 'updateG.gr',
 		 type : 'post',
 		 dataType : 'json',
 		 data : {subjectNo:subjectNo, memberNo:memberNo, memberResult:memberResult},
 		 success : function(response){
 			 console.log(response);
 			 console.log("서버 성공");
 			 alert("성적이 입력되었습니다");
 			 
 			 // 바뀐 리스트  
 			 $('#openDiv3Table1 tbody').empty();
  			var str = '<tr>';
  			$.each(response, function(i){
  				str += '<td>' + response[i].subjectMajor + '</td><td>' + response[i].memberNo + '</td><td>' +
  				response[i].memberName + '</td><td>' + response[i].memberGrade + '학년</td><td>' +
  				response[i].memberResult + '</td><td><select name="seperate" class="seperate" id="seperate"> <option value="A+">&nbsp;&nbsp;&nbsp;&nbsp;A+</option>' +
				'<option value="A0">&nbsp;&nbsp;&nbsp;&nbsp;A0</option> <option value="B+">&nbsp;&nbsp;&nbsp;&nbsp;B+</option> <option value="B0">&nbsp;&nbsp;&nbsp;&nbsp;B0</option>' +
				'<option value="C+">&nbsp;&nbsp;&nbsp;&nbsp;C+</option> <option value="C0">&nbsp;&nbsp;&nbsp;&nbsp;C0</option> <option value="F">&nbsp;&nbsp;&nbsp;&nbsp;F</option>' +
			    '</select></td><td><button id="btnInsert" class="btnInsert" value=' + response[i].subjectNo + '>성적입력</button></td>';
  				str += '</tr>';
  			});
  			$('#openDiv3Table1 tbody').append(str); 
  			
 		 },
 		 error : function(data){
 			 console.log("서버 실패");
 			 alert("성적 입력에 실패하였습니다.");
 		 }
  	  });
	});
   </script>

</body>
</html>