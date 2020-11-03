<!-- 수강 신청 (학생페이지) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="wgu.subject.model.vo.*, java.util.ArrayList, wgu.member.model.vo.Member"%>
<%
    ArrayList<OkSubject> okList = (ArrayList<OkSubject>)request.getAttribute("okList");
    ArrayList<Subject> list = (ArrayList<Subject>)request.getAttribute("list");
    String msg = (String)session.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여성시대학교 - 수강신청</title>
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




/* 과목 검색 */
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

.openLabel1 {
	position: absolute;
	top: 70px;
	left: 90px;
	background-color: lightgray;
	width: 90px;
	height: 20px;
	text-align: center;
	padding: 3px 0px;
}

.openDivInput1 {
	position: absolute;
	top: 70px;
	left: 190px;
	width: 160px;
	height: 20px;
}

.openLabel2 {
	position: absolute;
	top: 70px;
	left: 420px;
	background-color: lightgray;
	width: 90px;
	height: 20px;
	text-align: center;
	padding: 3px 0px;
}

.openDivInput2 {
	position: absolute;
	top: 70px;
	left: 520px;
	width: 160px;
	height: 20px;
}

.openLabelName {
	position: absolute;
	top: 70px;
	left: 750px;
	background-color: lightgray;
	width: 90px;
	height: 20px;
	text-align: center;
	padding: 3px 0px;
}

.openDivInput3 {
	position: absolute;
	top: 70px;
	left: 850px;
	width: 160px;
	height: 20px;
}

.openLabel3 {
	position: absolute;
	top: 125px;
	left: 270px;
	background-color: lightgray;
	width: 90px;
	height: 20px;
	text-align: center;
	padding: 3px 0px;
}

.seperate1 {
	position: absolute;
	top: 125px;
	left: 190px;
	width: 169px;
	height: 27px;
	text-align: center;
}

.openLabel4 {
	position: absolute;
	top: 125px;
	left: 90px;
	background-color: lightgray;
	width: 90px;
	height: 20px;
	text-align: center;
	padding: 3px 0px;
}

.seperate2 {
	position: absolute;
	top: 125px;
	left: 520px;
	width: 169px;
	height: 27px;
	text-align: center;
}

.openLabel6 {
	position: absolute;
	top: 125px;
	left: 420px;
	background-color: lightgray;
	width: 90px;
	height: 20px;
	text-align: center;
	padding: 3px 0px;
}

.subName {
	position: absolute;
	top: 124px;
	left: 850px;
	width: 162px;
	height: 20px;
}

.openLabel7 {
	position: absolute;
	top: 125px;
	left: 750px;
	background-color: lightgray;
	width: 90px;
	height: 20px;
	text-align: center;
	padding: 3px 0px;
}

.div1Btn {
	position: absolute;
	top: 175px;
	left: 938px;
	background-color: rgb(176, 199, 217);
	width: 80px;
	height: 25px;
	border: none;	
}





/* 수강신청 테이블 */
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

.openDiv2Label1 {
	position: absolute;
	top: 0px;
	left: 50px;
}

.openDiv2Table1 {
	position: absolute;
	top: 0px;
	left: 0px;
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
	width: 150px;
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

.td11 {
	width: 150px;
}

.btnAp {
    background: rgb(246,246,246);
    border: 1px solid lightgray;
    padding: 1px 7px;
}

button.btnAp:hover{
  background-color: rgb(176, 199, 217);
  color: black;
  -webkit-transition: all 0.4s;
    -moz-transition: all 0.4s;
    transition: all 0.4s;
}





/* 수강신청 내역 테이블 */
.openDiv3 {
	position: absolute;
	top: 700px;
	left: 10px;
	width: 1130px;
	height: 400px;
	border: none;
}

.openImg2 {
	position: absolute;
	top: 0px;
	left: 20px;
	width: 25px;
	height: 25px;
}

.openDiv3_1 {
	position: absolute;
	top: 40px;
	left: 0px;
	width: 1130px;
	height: 400px;
	border: 1px solid lightgray;
	overflow: scroll;
	overflow-x: hidden;
}

.td2_1 {
	width: 200px;
}

.td2_2 {
	width: 200px;
}

.td2_3 {
	width: 150px;
}

.td2_4 {
	width: 150px;
}

.td2_5 {
	width: 150px;
}

.td2_6 {
	width: 150px;
}

.td2_7 {
	width: 150px;
}

.td2_8 {
	width: 150px;
}

.td2_9 {
	width: 150px;
}

.btnDel {
    background: rgb(246,246,246);
    border: 1px solid lightgray;
    padding: 1px 7px;
}

button.btnDel:hover{
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

/* 헤더, 섹션, 풋터 */
header {
	font-family: '맑은 고딕';
	width: 1200px;
}

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

	<section>
        <div class="bannerTxt" id="bannerTxt">
        <img id='banner' src="image/5.png">
		<div id='mypageDiv' class="mypageDiv">
			<p class='mypage'>수강신청</p>
		</div>
		<br>
		<hr class="hr1">
		</div>

	<!-- 각자 구현부분 -->

		<div class="openDiv1">
			<label class="openLabel1">학과</label> 
			<input type="text" readonly="readonly" value='<%= loginUser.getMajorName() %>' class="openDivInput1">
			
			<label class="openLabel2">학년</label>
			<input type="text" readonly="readonly" value='<%= loginUser.getMemberGrade() %>학년' class="openDivInput2">
			
			<label class="openLabelName">이름</label>
			<input type="text" readonly="readonly" value='<%= loginUser.getMemberName() %>' class="openDivInput3"> 
							

			<label class="openLabel4">전공/교양</label> 
			<select name="seperate1" class="seperate1" id="seperate1">
				<option value="없음"></option>
				<option value="전공필수">전공필수</option>
				<option value="전공선택">전공선택</option>
				<option value="교양필수">교양필수</option>
				<option value="교양선택">교양선택</option>
			</select> 
			<label class="openLabel6">학과</label> 
			<select name="seperate2" class="seperate2" id="seperate2">
				<option value="없음"></option>
				<option value="컴퓨터학과">컴퓨터학과</option>
				<option value="경영학과">경영학과</option>
				<option value="전자공학과">전자공학과</option>
				<option value="경제학과">경제학과</option>
				<option value="실용음악과">실용음악과</option>
				<option value="체육학과">체육학과</option>
				<option value="사회복지학과">사회복지학과</option>
			</select> 
			<label class="openLabel7">과목명</label>
			<input type ="text" class="subName" id="subName" name="subName">			
			<input type="button" class="div1Btn" id="div1Btn" name="div1Btn" value="조회">
            <input type="hidden" class="memberNoIn" id="memberNoIn" name="memberNoIn" value="<%= loginUser.getMemberNo() %>">
		</div>

		<div class="openDiv2" id="openDiv2">
			<img src="./image/수강신청아이콘1.JPG" class="openImg1"> 
			<label class="openDiv2Label1">개설과목 목록</label>
			<div class="openDiv2_1">
				<table class="openDiv2Table1" id="openDiv2Table1">
					<thead>
						<tr>
							<td class="td1">전공/교양</td>
							<td class="td2">과목명</td>
							<td class="td3">학과</td>
							<td class="td4">학점</td>
							<td class="td5">강의시간</td>
							<td class="td6">교수</td>
							<td class="td8">정원</td>
							<td class="td9">난이도</td>
							<td class="td10">과목코드</td>
							<td class="td11">수강하기</td>
						</tr>
					</thead>
					<tbody>
						<% if(list.isEmpty()){ %>
						<tr>
							<td colspan="10">조회된 리스트가 없습니다.</td>
						</tr>
						<% } else { 
                               for(Subject subject : list) {%>
						<tr>
							<td><%= subject.getSubjectType() %></td>
							<td><%= subject.getSubjectName() %></td>
							<td><%= subject.getSubjectMajor() %></td>
							<td><%= subject.getSubjectCredit() %></td>
							<td><%= subject.getSubjectTime() %></td>
							<td><%= subject.getMemberNo() %></td>
							<td><%= subject.getSubjectLimit() %></td>
							<td><%= subject.getSubjectGrade() %>학년</td>
							<td><%= subject.getSubjectNo() %></td>
							<td><button id="btnAp" class="btnAp" value="<%= loginUser.getMemberNo() %>">수강하기</button></td>
						</tr>
						<% }
                 } %>
					</tbody>
				</table>
			</div>
		</div>

		<div class="openDiv3">
			<img src="./image/수강신청아이콘1.JPG" class="openImg2"> 
			<label class="openDiv2Label1">신청내역</label>
			<div class="openDiv3_1">
				<table class="openDiv3Table1" id="openDiv3Table1">
				<thead>
					<tr>
						<td class="td2_1">전공/교양</td>
						<td class="td2_2">과목명</td>
						<td class="td2_2">학과</td>
						<td class="td2_3">학점</td>
						<td class="td2_4">강의시간</td>
						<td class="td2_7">정원</td>
						<td class="td2_8">난이도</td>
	                    <td class="td2_5">과목코드</td>
						<td class="td2_9">수강취소</td>
					</tr>
					</thead>
					<tbody>						
						<% if(okList.isEmpty()){ %>
						<tr>
						</tr>
						<% } else { 
                  for(OkSubject oksubject : okList) {%>
						<tr>
							<td><%= oksubject.getSubjectType() %></td>
							<td><%= oksubject.getSubjectName() %></td>
							<td><%= oksubject.getSubjectMajor() %></td>
							<td><%= oksubject.getSubjectCredit() %></td>
							<td><%= oksubject.getSubjectTime() %></td>
							<td><%= oksubject.getSubjectLimit() %></td>
							<td><%= oksubject.getSubjectGrade() %>학년</td>
							<td><%= oksubject.getSubjectNo() %></td>
							<td><button id="btnDel" class="btnDel" value="<%= loginUser.getMemberNo() %>">수강취소</button></td>
						</tr>
						<% }
                 } %>
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
  
	// 과목 조회 버튼
	   $(document).on("click","#div1Btn",function(){
 	  var subjectType = $('#seperate1 option:selected').val();   
 	  var subjectMajor = $('#seperate2 option:selected').val();
 	  var subjectName = $('#subName').val(); 
 	  
 	  var memNo = $('#memberNoIn').val();
 	  	  
 	 $.ajax({
		  url : 'apply.su',
		  type : 'POST',
		  dataType : 'json',
		  data : {subjectType:subjectType,subjectMajor:subjectMajor,subjectName:subjectName},
	      success : function(response){
	    	  console.log("서버 성공")
	    	  console.log(response);	    	  

   		 $('#openDiv2Table1 tbody').empty();
   		 var str = '<tr>';
   		 $.each(response, function(i){
   			 str += '<td>' + response[i].subjectType + '</td><td>' + response[i].subjectName + 
   			 '</td><td>' + response[i].subjectMajor + '</td><td>' + response[i].subjectCredit + 
   			 '</td><td>' + response[i].subjectTime + '</td><td>교수</td><td>' + 
   			 response[i].subjectLimit + '</td><td>' + response[i].subjectGrade + '학년</td><td>' 
   			 + response[i].subjectNo + '</td><td><button id="btnAp" class="btnAp" value=' + memNo 
   			 + '>수강하기</button></td>';
   			 str += '</tr>';
   		 });
   		 $("#openDiv2Table1 tbody").append(str);
   		alert("조회되었습니다.");
	      },
	      error : function(data){
	    	  alert("항목을 하나 이상 입력해주세요");
	    	  console.log("서버 실패");
	      }
	  });	
 	
   });   
   

	
	// 개설과목 목록 테이블
	   $(document).on("click","#btnAp",function(){
	   $btnValue = $('#btnAp').val();   // 수강신청하는 학생의 학번
	   console.log($btnValue);

	  var tdArr = new Array();
	  var checkBtn = $(this);
	  // checkBtn의 부모는 <td>
	  // checkBtn의 부모의 부모는 <tr>
	  var tr = checkBtn.parent().parent();
	  var td = tr.children();	 
	 
	  var subjectNo = td.eq(8).text();   // 과목번호
	  var memberNo = $btnValue;    // 학번
	  var status = 'N';            // 강의평가 No
	  var subjectTime = td.eq(4).text();
	  var memberResult = '미입력';
	  
	  td.each(function(i){
		  tdArr.push(td.eq(i).text());
	  });
	  
	  $.ajax({
 		  url : 'applyOk.su',
 		  type : 'POST',
 		  dataType : 'json',
 		  data : {subjectNo:subjectNo, memberNo:memberNo, status:status, subjectTime:subjectTime, memberResult:memberResult},
 	      success : function(response){
 	    	  console.log("서버 성공")
 	    	  console.log(response);
 	    	  alert("수강신청되었습니다.");

    		 $('#openDiv3Table1 tbody').empty();
    		 var str = '<tr>';
    		 $.each(response, function(i){
    			 str += '<td>' + response[i].subjectType + '</td><td>' + response[i].subjectName + '</td><td>' + 
    			 response[i].subjectMajor + '</td><td>' + response[i].subjectCredit + '</td><td>' + response[i].subjectTime +
    			 '</td><td>' + response[i].subjectLimit + '</td><td>' + response[i].subjectGrade + '학년</td><td>' +
    			 response[i].subjectNo + '</td><td><button id="btnDel" class="btnDel" value=' + response[i].memberNo
    			 + '>수강취소</button></td>';
    			 str += '</tr>';
    		 });
    		 $("#openDiv3Table1 tbody").append(str);
    		 
 	      },
 	      error : function(data){
 	    	  alert("해당 강의시간에는 하나의 강의만 신청할 수 있습니다 ");
 	    	  console.log("서버 실패");
 	      }
	  });	   
   });
   
   // 수강취소 버튼 클릭 이벤트
	  $(document).on("click","#btnDel",function(){
	   $btnValue = $('#btnDel').val();   // 수강취소하는 학생의 학번

	  var tdArr = new Array();
	  var checkBtn = $(this);
	  var tr = checkBtn.parent().parent();
	  var td = tr.children();	 
	 
	  var subjectNo = td.eq(7).text();   // 과목번호
	  var memberNo = $btnValue;    // 학번
	  
	  td.each(function(i){
		  tdArr.push(td.eq(i).text());
	  });
	  
	  $.ajax({
 		  url : 'applyDel.su',
 		  type : 'POST',
 		  dataType : 'json',
 		  data : {subjectNo:subjectNo, memberNo:memberNo},
 	      success : function(response){
 	    	  console.log("서버 성공")
 	    	  console.log(response);
 	    	  console.log("과목 번호 : " + subjectNo);
 	    	  alert("수강취소되었습니다.");

    		 $('#openDiv3Table1 tbody').empty();
    		 var str = '<tr>';
    		 $.each(response, function(i){
    			 str += '<td>' + response[i].subjectType + '</td><td>' + response[i].subjectName + '</td><td>' + 
    			 response[i].subjectMajor + '</td><td>' + response[i].subjectCredit + '</td><td>' + response[i].subjectTime +
    			 '</td><td>' + response[i].subjectLimit + '</td><td>' + response[i].subjectGrade + '학년</td><td>' +
    			 response[i].subjectNo + '</td><td><button id="btnDel" class="btnDel" value=' + response[i].memberNo + '>수강취소</button></td>';
    			 str += '</tr>';
    		 });
    		 $("#openDiv3Table1 tbody").append(str);
    		 
 	      },
 	      error : function(data){
 	    	  alert("과목 삭제에 실패하였습니다.");
 	    	  console.log("서버 실패");
 	      }
	  });	   
   });
   
   </script>
</body>
</html>