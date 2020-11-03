<!-- 강의평가 확인 (교수페이지) -->
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
<title>여성시대학교 - 강의평가</title>
<script src='https://code.jquery.com/jquery-3.5.1.min.js'></script>
<style>
/* 섹션시작 : 문구 */
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
    top : 59.7px;
    left : 830px;
    width : 200px;
    height : 20px;
    text-align : center;
}



/* 강의목록 */
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

.openDiv2Span1{
    position: absolute;
    top : 5px;
    left : 810px;
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

.td1{
    width : 100px;
    border : 0.5px solid white;
    background-color : rgb(176,199,217);
    color : white;
    height : 25px;
    text-align : center;
}

.td2{
    width : 200px;
    border : 0.5px solid white;
    background-color : rgb(176,199,217);
    color : white;
    height : 25px;
    text-align : center;
}

.td3{
    width : 150px;
    border : 0.5px solid white;
    background-color : rgb(176,199,217);
    color : white;
    height : 25px;
    text-align : center;
}

.td4{
    width : 100px;
    border : 0.5px solid white;
    background-color : rgb(176,199,217);
    color : white;
    height : 25px;
    text-align : center;
}

.td5{
    width : 150px;
    border : 0.5px solid white;
    background-color : rgb(176,199,217);
    color : white;
    height : 25px;
    text-align : center;
}

.td6{
    width : 100px;
    border : 0.5px solid white;
    background-color : rgb(176,199,217);
    color : white;
    height : 25px;
    text-align : center;
}

.td7{
    width : 100px;
    border : 0.5px solid white;
    background-color : rgb(176,199,217);
    color : white;
    height : 25px;
    text-align : center;
}

.td8{
    width : 100px;
    border : 0.5px solid white;
    background-color : rgb(176,199,217);
    color : white;
    height : 25px;
    text-align : center;
}

.td9{
    width : 150px;
    border : 0.5px solid white;
    background-color : rgb(176,199,217);
    color : white;
    height : 25px;
    text-align : center;
}

.td10{
    width : 150px;
    border : 0.5px solid white;
    background-color : rgb(176,199,217);
    color : white;
    height : 25px;
    text-align : center;
}

.evalBtn{
    background: rgb(246,246,246);
    border: 1px solid lightgray;
    padding: 1px 7px;
}

button.evalBtn:hover{
  background-color: rgb(176, 199, 217);
  color: black;
  -webkit-transition: all 0.4s;
    -moz-transition: all 0.4s;
    transition: all 0.4s;
}


/* 강의평가 */
.openDiv3{
    position : absolute;
    top : 640px;
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
    height : 600px;
    border : 1px solid lightgray;
    overflow : scroll; 
    overflow-x: hidden;
}

.openDiv3Table1{
    position: absolute;
    top : 40px;
    left : 50px;
    width : 1000px;
    height : 30px;
    color : black;
    background-color : white;
}

.openDiv3Table2{
    position: absolute;
    top : 110px;
    left : 50px;
    width : 1000px;
    height : 50px;
    color : black;
}

.td2_1{
    width : 200px;
    border : 0.5px solid lightgray;
    background-color : white;
    color : black;
    height : 30px;
    text-align : center;
}

.td2_2{
    width : 200px;
    border : 0.5px solid lightgray;
    background-color : white;
    color : black;
    height : 30px;
    text-align : center;
}

.td2_3{
    width : 200px;
    border : 0.5px solid lightgray;
    background-color : white;
    color : black;
    height : 30px;
    text-align : center;
}

.td2_4{
    width : 200px;
    border : 0.5px solid lightgray;
    background-color : white;
    color : black;
    height : 30px;
    text-align : center;
}
.td2_5{
    width : 200px;
    border : 0.5px solid lightgray;
    background-color : white;
    color : black;
    height : 30px;
    text-align : center;
}
.td2_6{
    width : 200px;
    border : 0.5px solid lightgray;
    background-color : white;
    color : black;
    height : 30px;
    text-align : center;
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

.tabletbody {
	border: 0.5px solid white;
	background-color: rgb(235, 247, 255); 
	color: black;
	height: 25px;
	text-align: center;
}

.thmemo{
    background-color: rgb(189, 189, 189); 
    height : 50px;
}

.list{ 
    text-align: center;
    border: 0.1px solid gray;
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

#menuimg {
   width: 150px;
   height: 80px;
}

a {
   text-decoration: none;
   color: black;
}

.mypageMenu {
   font-size: 18px;
}


/* 섹터, 풋터 */
section {
   position: absolute;
   top: 700px;
   left: 300px;
   background: white;
   width: 1200px;
   height: 1500px;
}

footer{
	display: inline-block;
    position : absolute;
    left : 0px;
    top : 2200px;
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
			<p class='mypage'>강의평가</p>
		</div>
		<br>
		<hr class="hr1">
		</div>
   
   
      <div class = "openDiv1">      
      <label class = "openLabel1">학년도</label>
      <select name = "seperate" class = "seperate">
              <option value = "2020">2020</option>
      </select>
      
      <label class = "openLabel2">학기</label>
      <select name = "seperate2" class = "seperate2">
              <option value = "1">1</option>
      </select>
      
      <label class = "openLabel3">이름</label>
      <input type = "text" class = "textInput1" value = <%= loginUser.getMemberName() %> readonly="readonly">
      
      </div>
      
      <div class = "openDiv2">
           <img src = "./image/수강신청아이콘1.JPG" class = "openImg1">
           <label class = "openDiv2Label1">개설과목 목록</label>
           <span class = "openDiv2Span1">*해당 과목을 선택하면 강의 평가 출력됨!</span>
           <div class = "openDiv2_1">
                <table class = "openDiv2Table1">
                <thead>
                       <tr>
                            <td class="td1">전공/교양</td>
                            <td class="td2">과목명</td>
                            <td class="td3">학과</td>
                            <td class="td4">학점</td>
                            <td class="td5">강의시간</td>
                            <td class="td7">정원</td>
                            <td class="td8">학년</td>
                            <td class="td9">과목코드</td>
                            <td class="td10">강의평가</td>
                       </tr>
                       </thead>
                       <tbody id="tabletbody" class="tabletbody">
                       <% if(list.isEmpty()){ %>
                       <tr>
                           <td colspan="9">현재 강의중인 과목이 없습니다.</td>
                       </tr>
                       <% }else { 
                       for(Subject subject : list){%>
                       <tr>
                           <td><%= subject.getSubjectType() %></td>
                           <td><%= subject.getSubjectName()%></td>
                           <td><%= subject.getSubjectMajor()%></td>
                           <td><%= subject.getSubjectCredit()%></td>
                           <td><%= subject.getSubjectTime()%></td>
                           <td><%= subject.getSubjectLimit()%></td>
                           <td><%= subject.getSubjectGrade()%></td>
                           <td><%= subject.getSubjectNo()%></td>
                           <td><button id="evalBtn" class="evalBtn" value="<%= loginUser.getMemberName() %>">평가확인</button></td>
                       </tr>
                       <% } %>
                       <% } %>
                       </tbody>
                </table>
           </div>
      </div>
      
      <div class = "openDiv3">
           <img src = "./image/수강신청아이콘1.JPG" class = "openImg2">
           <label class = "openDiv2Label1">강의평가내용</label>
           <div class = "openDiv3_1">
                 <table class = "openDiv3Table1" id="openDiv3Table1">                
                 </table>
                 
                 <table class = "openDiv3Table2" id="openDiv3Table2">
                  
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
            <li><br><a href="<%= request.getContextPath() %>/insertEvaluation.ev" class='mypageMenu'>강의평가</a><br><br></li>
			<li><a href="<%= request.getContextPath() %>/selectEvaluation.ev" class='mypageMenu'>평가확인</a></li>
         </ul>
      </div>
   </aside>
   
   	<footer>       
<%@ include file = "../common/foot.jsp" %>
</footer>
   
   <script>
   $(document).on("click","#evalBtn", function(){
	  memberName = $('#evalBtn').val(); // 교수이름
	  
	  var tdArr = new Array();
	  var checkBtn = $(this);
	  var tr = checkBtn.parent().parent();
	  var td = tr.children();
	  
	  subjectNo =td.eq(7).text();
	  subjectName=td.eq(1).text();
	  
	  td.each(function(i){
		 tdArr.push(td.eq(i).text()); 
	  });
	  
	  $.ajax({
		  url : 'selectEvalList.ev',
		  type : 'post',
		  dataType : 'json',
		  data : {subjectNo:subjectNo},
		  success : function(response){
			  console.log(response);
			  console.log("서버 성공");
			  
			  $('#openDiv3Table1').empty();
			  $('#openDiv3Table2').empty();
			  var str = '<tr>';
			  str += '<th id="thmemo" class="thmemo">No</th>';
			  str += '<th id="thmemo" class="thmemo">교수님께 하고싶은 말</th></tr>'
			  $.each(response, function(i){
				 str += '<tr><td id="list" class="list">' + (i+1) + '</td><td id="list" class="list">' + response[i].quememo + '</td></tr>';  
			  });			
			  
			  var info = '<tr>';
              info += '<td  class = "td2_1">교과목명</td>';
              info += '<td class = "td2_2">' + subjectName + '</td>';
              info += '<td class = "td2_3">교과목번호</td>';
              info += '<td class = "td2_4">' + subjectNo + '</td>';
              info += '<td class = "td2_5">담당교수명</td>';
              info += '<td class = "td2_6">' + memberName + '</td></tr>';
          
              $('#openDiv3Table1').append(info);
              $('#openDiv3Table2').append(str);
              
		  },
		  error : function(data){
			  console.log("서버 실패");
			  alert("조회에 실패하였습니다");
		  }
	  });
	   
   });
   
   </script>
</body>
</html>