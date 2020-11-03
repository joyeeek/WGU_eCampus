<!-- 성적조회 (학생페이지) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="wgu.grade.model.vo.*, java.util.ArrayList, wgu.member.model.vo.Member"%>
<%
    ArrayList<GradeInfo> list = (ArrayList<GradeInfo>)request.getAttribute("list");
    ArrayList<GradeAvg> avgList = (ArrayList<GradeAvg>)request.getAttribute("avgList");
    String msg = (String)session.getAttribute("msg");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여성시대학교 - 성적조회</title>
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


/* 멤버정보 */
.openDiv1{
    border: 2px solid lightgray;
	background : rgb(246,246,246);
    position : absolute;
    top : -70px;
    left : 10px;
    width : 1130px;
    height : 150px;
    font-size: 13px;
}

.seperate{
    position: absolute;
    top : 59px;
    left : 170px;
    width : 170px;
    height : 27px;
    text-align: center;
}

.openLabel1{
    position: absolute;
    top : 60px;
    left : 70px;
    background-color: lightgray;
    width : 90px;
    height : 20px;
    text-align: center;
    padding: 3px 0px;
}

.seperate2{
    position: absolute;
    top : 59px;
    left : 500px;
    width : 170px;
    height : 27px;
    text-align: center;
}

.openLabel2{
    position: absolute;
    top : 60px;
    left : 400px;
    background-color: lightgray;
    width : 90px;
    height : 20px;
    text-align: center;
    padding: 3px 0px;
}

.openLabel3{
    position: absolute;
    top : 60px;
    left : 730px;
    background-color: lightgray;
    width : 90px;
    height : 20px;
    text-align: center;
    padding: 3px 0px;
}

.textInput1{
    position: absolute;
    top : 59px;
    left : 830px;
    width : 200px;
    height : 20px;
    text-align : center;
}


/* 수강중인 과목 리스트 */
.openDiv2{
    position : absolute;
    top : 150px;
    left : 10px;
    width : 1130px;
    height : 400px;
    border : none;
}

.openImg1{
    position : absolute;
    top : 0px;
    left : 20px;
    width : 25px;
    height : 25px;
}

.openDiv2_1{
    position : absolute;
    top : 40px;
    left : 0px;
    width : 1130px;
    height : 400px;
    border : 1px solid lightgray;
    overflow : scroll; 
    overflow-x: hidden;
}

.openDiv2Label1{
    position : absolute;
    top : 0px;
    left : 50px;
}

.openDiv2Table1{
    position: absolute;
    top : 0px;
    left : 0px;
}

th{
    border : 0.5px solid white;
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

.td1{
    width : 180px;
    border : 0.5px solid white;
    background-color : rgb(176,199,217);
    color : white;
    height : 25px;
    text-align : center;
}

.td2{
    width : 280px;
    border : 0.5px solid white;
    background-color : rgb(176,199,217);
    color : white;
    height : 25px;
    text-align : center;
}

.td3{
    width : 230px;
    border : 0.5px solid white;
    background-color : rgb(176,199,217);
    color : white;
    height : 25px;
    text-align : center;
}

.td4{
    width : 230px;
    border : 0.5px solid white;
    background-color : rgb(176,199,217);
    color : white;
    height : 25px;
    text-align : center;
}

.td5{
    width : 180px;
    border : 0.5px solid white;
    background-color : rgb(176,199,217);
    color : white;
    height : 25px;
    text-align : center;
}

.resultTable {
    position : absolute;
    background-color: rgb(176, 199, 217);
    top : 590px;
    left : 10px;
    width : 1132px;
    height : 30px;
}

.t1 {
width : 180px;
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
    top : 1500px;
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
			<p class='mypage'>성적조회</p>
		</div>
		<br>
		<hr class="hr1">
		</div>

	<!-- 각자 구현부분 -->

      <div class = "openDiv1">      
      <label class = "openLabel1">학년도</label>
      <select name = "seperate" class = "seperate">
              <option value = "2020">2020</option>
      </select>
      
      <label class = "openLabel2">학기</label>
      <select name = "seperate2" class = "seperate2">
              <option value = "month1">1</option>
      </select>
      
      <label class = "openLabel3">이름</label>
      <input type = "text" class = "textInput1" value = <%= loginUser.getMemberName()  %> readonly="readonly">
      <input type="hidden" id="memberNo" class="memberNo" name="memberNo" value="<%= loginUser.getMemberNo() %>">
      
      </div>
      
      <div class = "openDiv2">
           <img src = "./image/수강신청아이콘1.JPG" class = "openImg1">
           <label class = "openDiv2Label1">수강과목</label>
           <div class = "openDiv2_1">
                <table class = "openDiv2Table1" id="openDiv2Table1">
                       <thead>
                       <tr>                       
                            <td class="td1">전공구분</td>
                            <td class="td2">학과</td>
                            <td class="td2">과목명</td>
                            <td class="td1">학점</td>
                            <td class="td3">강의시간</td>
                            <td class="td4">과목코드</td>
                            <td class="td5">성적</td>
                       </tr>
                       </thead>
                       
                       <tbody>			
					 <% if(list.isEmpty()){ %>
					 <tr>
					     <td colspan="6">현재 수강하는 과목이 없습니다.</td>
					 </tr>
					<% } else { 
                  for(GradeInfo grade : list) {%> 
					<tr>
						<td><%= grade.getSubjectType() %></td>
						<td><%= grade.getSubjectMajor() %></td>
						<td><%= grade.getSubjectName() %></td>
						<td><%= grade.getSubjectCredit() %></td>
						<td><%= grade.getSubjectTime() %></td>
						<td><%= grade.getSubjectNo() %></td>
						<td><%= grade.getMemberResult() %></td>
					</tr>
					<% }
                 } %> 
                 </tbody>
                </table>
           </div>
      </div>
      <div>
          <table id="resultTable" class="resultTable">
               <% if(avgList.isEmpty()){ %>
					 <tr>
					     <td colspan="6">현재 수강하는 과목이 없습니다.</td>
					 </tr>
					<% } else { 
                  for(GradeAvg result : avgList) {%> 
                <tr>
                    <th id="t1" class="t1">수강과목수</th>
                    <td id="t1" class="t1"><%= result.getSumSubject() %>개</td>
                    <th id="t1" class="t1">신청학점</th>
                    <td id="t1" class="t1"><%= result.getSumCredit() %>학점</td>
                    <th id="t1" class="t1">전체평균</th>
                    <td id="t1" class="t1"><%= result.getAvgResult() %></td>
                </tr>
                <% } 
                } %>
          </table>
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

	
</body>
</html>