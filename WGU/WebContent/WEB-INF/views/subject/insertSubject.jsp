<!-- 과목개설 (교수페이지) -->
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




/* 과목선택 */
.openDiv1 {
	border: 2px solid lightgray;
	background : rgb(246,246,246);
	position: absolute;
	top: -70px;
	left: 10px;
	width: 1130px;
	height: 240px;
	font-size: 13px;
}

.seperate {
	position: absolute;
	top: 49px;
	left: 270px;
	width: 170px;
	height: 27px;
	text-align: center;
}

.openLabel1 {
	position: absolute;
	top: 50px;
	left: 170px;
	background-color: lightgray;
	width: 90px;
	height: 20px;
	text-align: center;
	padding: 3px 0px;
}

.seperate2 {
	position: absolute;
	top: 83px;
	left: 270px;
	width: 170px;
	height: 27px;
	text-align: center;
}

.openLabel2 {
	position: absolute;
	top: 85px;
	left: 170px;
	background-color: lightgray;
	width: 90px;
	height: 20px;
	text-align: center;
	padding: 3px 0px;
}

.seperate3 {
	position: absolute;
	top: 119px;
	left: 270px;
	width: 170px;
	height: 27px;
	text-align: center;
}

.openLabel3 {
	position: absolute;
	top: 120px;
	left: 170px;
	background-color: lightgray;
	width: 90px;
	height: 20px;
	text-align: center;
	padding: 3px 0px;
}

.seperate4 {
	position: absolute;
	top: 154px;
	left: 270px;
	width: 170px;
	height: 27px;
	text-align: center;
}

.openLabel4 {
	position: absolute;
	top: 155px;
	left: 170px;
	background-color: lightgray;
	width: 90px;
	height: 20px;
	text-align: center;
	padding: 3px 0px;
}

.seperate5 {
	position: absolute;
	top: 49px;
	left: 720px;
	width: 170px;
	height: 27px;
	text-align: center;
	overflow-x : hidden;
    overflow-y : scroll;
    padding: 3px 0px;
}

.openLabel5 {
	position: absolute;
	top: 50px;
	left: 620px;
	background-color: lightgray;
	width: 90px;
	height: 20px;
	text-align: center;
	padding: 3px 0px;
}

.seperate6 {
	position: absolute;
	top: 84px;
	left: 720px;
	width: 170px;
	height: 27px;
	text-align: center;
}

.openLabel6 {
	position: absolute;
	top: 85px;
	left: 620px;
	background-color: lightgray;
	width: 90px;
	height: 20px;
	text-align: center;
	padding: 3px 0px;
}

.seperate7 {
	position: absolute;
	top: 119px;
	left: 720px;
	width: 170px;
	height: 27px;
	text-align: center;
}

.openLabel7 {
	position: absolute;
	top: 120px;
	left: 620px;
	background-color: lightgray;
	width: 90px;
	height: 20px;
	text-align: center;
	padding: 3px 0px;
}

.div1Btn {
	position: absolute;
	top: 165px;
	left: 810px;
	background-color: rgb(176, 199, 217);
	width: 80px;
	height: 25px;
	border: none;
}





/* 과목개설 테이블 */
.openDiv2 {
	position: absolute;
	top: 220px;
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
    top : 700px;
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

.td2_4 {
	width: 120px;
}

.td2_5 {
	width: 230px;
}

.td2_6 {
	width: 250px;
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
    top : 2000px;
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
			<p class='mypage'>과목개설</p>
		</div>
		<br>
		<hr class="hr1">
		</div>

		<div class="openDiv1">
			<label class="openLabel1">전공/교양</label> 
			<select name="seperate" class="seperate" id="seperate">
				<option value="전공필수">전공필수</option>
				<option value="전공선택">전공선택</option>
				<option value="교양필수">교양필수</option>
				<option value="교양선택">교양선택</option>
			</select> 
			<label class="openLabel2">학과</label> 
			<select name="seperate2" class="seperate2" id="seperate2">
				<option value="컴퓨터학과">컴퓨터학과</option>
				<option value="경영학과">경영학과</option>
				<option value="전자공학과">전자공학과</option>
				<option value="경제학과">경제학과</option>
				<option value="실용음악과">실용음악과</option>
				<option value="체육학과">체육학과</option>
				<option value="사회복지학과">사회복지학과</option>
			</select> 
			<label class="openLabel3">강의시간</label> 
			<select name="seperate3" class="seperate3" id="seperate3">
				<option value="월1-2">월1-2</option>
				<option value="월3-4">월3-4</option>
				<option value="월5-6">월5-6</option>
				<option value="화1-2">화1-2</option>
				<option value="화3-4">화3-4</option>
				<option value="화5-6">화5-6</option>
				<option value="수1-2">수1-2</option>
				<option value="수3-4">수3-4</option>
				<option value="수5-6">수5-6</option>
				<option value="목1-2">목1-2</option>
				<option value="목3-4">목3-4</option>
				<option value="목5-6">목5-6</option>
				<option value="금1-2">금1-2</option>
				<option value="금3-4">금3-4</option>
				<option value="금5-6">금5-6</option>
			</select> 
			<label class="openLabel4">난이도</label> 
			<select name="seperate4" class="seperate4" id="seperate4">
				<option value="공통">공통</option>
				<option value="1">1학년</option>
				<option value="2">2학년</option>
				<option value="3">3학년</option>
				<option value="4">4학년</option>
			</select> 
			<label class="openLabel5">과목명</label> 
			<select name="seperate5" class="seperate5" id="seperate5">
				<option value="서양음악의이해">서양음악의이해</option>
				<option value="자바프로그래밍">자바프로그래밍</option>
				<option value="이산수학">이산수학</option>
				<option value="컴퓨터학개론">컴퓨터학개론</option>
				<option value="뮤지컬이론">뮤지컬이론</option>
				<option value="데이터베이스">데이터베이스</option>
				<option value="그래픽스">그래픽스</option>
				<option value="운영체제">운영체제</option>
				<option value="사물인터넷">사물인터넷</option>
				<option value="인공지능">인공지능</option>
				<option value="서비스와문화">서비스와문화</option>
				<option value="독서와토론">독서와토론</option>
				<option value="생활안전">생활안전</option>
				<option value="실내체육">실내체육</option>
				<option value="마케팅이론">마케팅이론</option>
				<option value="중급회계">중급회계</option>
				<option value="경제학개론">경제학개론</option>
				<option value="사회복지이론">사회복지이론</option>
				<option value="스포츠댄스">스포츠댄스</option>
				<option value="수상스키">수상스키</option>
			</select>
			<label class="openLabel6">학점</label> 
			<select name="seperate6" class="seperate6" id="seperate6">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
			</select> 
			<label class="openLabel7">정원</label> 
			<select name="seperate7" class="seperate7" id="seperate7">
				<option value="20">20</option>
				<option value="30">30</option>
				<option value="50">50</option>
				<option value="100">100</option>
			</select> 
			<input type="button" class="div1Btn" id="div1Btn" value="등록">
			<input type="hidden" id="memberNo" class="memberNo" name="memberNo" value="<%= loginUser.getMemberNo() %>">
			<input type="hidden" id="memberName" class="memberName" name="memberName" value="<%= loginUser.getMemberName() %>">
			<input type = "hidden" value=<%= loginUser.getMemberNo() %> id="memNo" class="memNo" name="memNo">
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
                      <td class = "td2_4">학년</td>
                      <td class = "td2_5">휴대폰번호</td>
                      <td class = "td2_6">이메일</td>
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
				<li><br><a href="<%= request.getContextPath() %>/applySubject.su" class='mypageMenu'>수강신청</a><br><br></li>
				<li><a href="<%= request.getContextPath() %>/insertSubject.su" class='mypageMenu'>과목개설</a></li>
			</ul>
		</div>
	</aside>
	
		<footer>       
<%@ include file = "../common/foot.jsp" %>
</footer>

	<script>
        	  $(document).on("click","#div1Btn",function(){
        		  var tdArr = new Array();
            	  var checkBtn = $(this);
            	  var tr = checkBtn.parent().parent();
            	  var td = tr.children();
            	  
            	  var major = td.eq(2).text();
            	  var subjectNo = td.eq(7).text(); // 과목코드
            	  
            	  td.each(function(i){
            		 tdArr.push(td.eq(i).text()); 
            	  }); 
        	  var memberNo = document.getElementById("memberNo").value;
        	  var memberName = document.getElementById("memberName").value;
        	  var subjectType = $('#seperate option:selected').val();   
        	  var subjectMajor = $('#seperate2 option:selected').val();
        	  var subjectTime = $('#seperate3 option:selected').val(); 
        	  var subjectGrade = $('#seperate4 option:selected').val(); 
        	  var subjectName = $('#seperate5 option:selected').val(); 
        	  var subjectCredit = $('#seperate6 option:selected').val(); 
        	  var subjectLimit = $('#seperate7 option:selected').val();
        	          	  
        	  $.ajax({
        		  url : 'subject.su',
        		  type : 'post',
        		  dataType:"json",
        		  data : {subjectType:subjectType, subjectMajor:subjectMajor, subjectTime:subjectTime,
        			  subjectGrade:subjectGrade, subjectName:subjectName, subjectCredit:subjectCredit,
        			  subjectLimit:subjectLimit, memberNo:memberNo, memberName:memberName},
        	      success : function(response){
        	    	  
        	    	  console.log(response);
        	    	  
        	    	  $('#subjectInfoTable tbody').empty();
        	    	  var str = '<tr>';
        	    	  $.each(response, function(i){
        	    		  str += '<td>' + response[i].subjectType + '</td><td>' + response[i].subjectName + '</td><td>' + 
        	    			 response[i].subjectMajor + '</td><td>' + response[i].subjectCredit + '</td><td>' + response[i].subjectTime +
        	    			 '</td><td>' + response[i].subjectLimit + '</td><td>' + response[i].subjectGrade + '학년</td><td>' +
        	    			 response[i].subjectNo + '</td><td><button id="stuBtn" class="stuBtn" value=' + response[i].subjectNo + '>수강생목록</button></td>';
        	    			 str += '</tr>'; 
        	    	  });
        	    	  $('#subjectInfoTable tbody').append(str);

                		 alert("과목개설에 성공하였습니다.");
                		 console.log('서버 성공');          	    	 
        	      },
        	      error : function(data){
        	    	  console.log('서버 실패');
        	    	  alert("같은 시간에 개설된 과목이 존재합니다.");
        	      }       			  
        	  });
          });
          
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
        		 url : 'applySel.su',
        		 type : 'post',
        		 dataType : 'json',
        		 data : {subjectNo:subjectNo},
        		 success : function(response){
        			 console.log(response);
        			 console.log("서버 성공");
        			 
        			$('#openDiv3Table1 tbody').empty();
        			var str = '<tr>';
        			$.each(response, function(i){
        				str += '<td>' + response[i].majorName + '</td><td>' + response[i].memberNo + '</td><td>' +
        				response[i].memberName + '</td><td>' + response[i].memberGrade + '학년</td><td>' +
        				response[i].phone + '</td><td>' + response[i].email + '</td>';
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
   </script>

</body>
</html>