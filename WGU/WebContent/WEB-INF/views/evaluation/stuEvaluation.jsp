<!-- 강의평가 (학생페이지) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="wgu.subject.model.vo.*, java.util.ArrayList, wgu.member.model.vo.Member"%>
<%
    ArrayList<OkSubject> evalList = (ArrayList<OkSubject>)request.getAttribute("evalList");
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

.openDiv2Span1{
    position: absolute;
    top : 5px;
    left : 780px;
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


.evalBtn {
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


/* 강의평가 항목 */
.openDiv3{
    position : absolute;
    top : 640px;
    left : 10px;
    width : 1130px;
    height : 400px;
    border : none;
}

.openDiv4{
    position : absolute;
    top : 1290px;
    left : 500px;
    width : 100px;
    height : 50px;
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
    top : 30px;
    left : 50px;
    width : 1000px;
    height : 30px;
    color : black;
    background-color : white;
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
    top : 2150px;
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
              <option value = "month1">1</option>
      </select>
      
      <label class = "openLabel3">이름</label>
      <input type = "text" class = "textInput1" value = <%= loginUser.getMemberName()  %> readonly="readonly">
      <input type="hidden" id="memberNo" class="memberNo" name="memberNo" value="<%= loginUser.getMemberNo() %>">
      
      </div>
      
      <div class = "openDiv2">
           <img src = "./image/수강신청아이콘1.JPG" class = "openImg1">
           <label class = "openDiv2Label1">수강과목</label>
           <span class = "openDiv2Span1">*해당 버튼을 선택하면 강의 평가 작성이 가능!</span>
           <div class = "openDiv2_1">
                <table class = "openDiv2Table1" id="openDiv2Table1">
                       <thead>
                       <tr>                       
                            <td class="td1">전공구분</td>
                            <td class="td2">학과</td>
                            <td class="td2">과목명</td>
                            <td class="td3">강의시간</td>
                            <td class="td4">과목코드</td>
                            <td class="td5">강의평가여부</td>
                            <td class="td5">강의평가</td>
                       </tr>
                       </thead>
                       <tbody>
                       <% if(evalList.isEmpty()){ %>
					<tr>
					    <td colspan="7">현재 수강중인 과목이 없습니다.</td>					           
					</tr>
					<% } else { 
                  for(OkSubject subject : evalList) {%>
					<tr>
						<td><%= subject.getSubjectType() %></td>
						<td><%= subject.getSubjectMajor() %></td>
						<td><%= subject.getSubjectName() %></td>
						<td><%= subject.getSubjectTime() %></td>
						<td><%= subject.getSubjectNo() %></td>
						<td><%= subject.getStatus() %></td>
						<td><button id="evalBtn" class="evalBtn" value=<%= subject.getSubjectNo() %>>강의평가</button></td>
					</tr>
					<% }
                 } %> 
                       </tbody>
                </table>
           </div>
      </div>
      
      <div class = "openDiv3">
           <img src = "./image/수강신청아이콘1.JPG" class = "openImg2">
           <label class = "openDiv2Label1">강의평가항목</label>
           <div class = "openDiv3_1" id = "openDiv3_1">
                 <table class = "openDiv3Table1" id="openDiv3Table1">
                 <tbody></tbody>
                 </table>
                 
                 <table class = "divMemoTable" id="divMemoTable">             
                 </table>
           </div>
      </div>
      <div class = "openDiv4" id="openDiv4">
      
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
   // 강의평가 버튼
   $(document).on("click","#evalBtn", function(){
	   var tdArr = new Array();
	   var checkBtn = $(this);
	   var tr = checkBtn.parent().parent();
	   var td = tr.children();
	   
	  var memberNo = document.getElementById("memberNo").value;
	  var subjectNo = td.eq(4).text();
	  var status = td.eq(5).text();
	   
	  td.each(function(i){
		 tdArr.push(td.eq(i).text()); 
	  });
	  
	  $.ajax({
		 url : 'evalList.ev', 
		 type : 'post',
		 dataType : 'json',
		 data : {subjectNo:subjectNo, status:status},
		 success : function(response){
			console.log(response);
			console.log("서버 성공");
			
			$('#openDiv4').empty();
			$('#divMemoTable').empty();
			// 과목설명 테이블
			$('#openDiv3Table1 tbody').empty();
			var str = '<tr>';           
            var submitBtn = '';
			$.each(response, function(i){
				str += '<td class = "td2_1">교과목명</td><td class = "td2_2">' + response[i].subjectName + 
				'</td><td class = "td2_3">과목코드</td><td class = "td2_4">' + response[i].subjectNo + 
				'</td><td class = "td2_5">교수명</td><td class = "td2_6">' + response[i].memberName + '</td>';
				str += '</tr>';
			});
			$('#openDiv3Table1 tbody').append(str);
			
			var listDiv = '<label style="position: absolute; top: 100px; left: 60px;">1. 수업계획서는 체계적으로 작성되었고, 수업계획서대로 진행하였다.</label>';
            listDiv += '<div style = "position: absolute; top : 135px; left : 70px;">';
            listDiv += '<label><input type="radio" id="1" name="1" value="매우그렇다"> 매우 그렇다 &nbsp;&nbsp;</label>';
            listDiv += '<label><input type="radio" id="1" name="1" value="그렇다"> 그렇다 &nbsp;&nbsp;</label>';
            listDiv += '<label><input type="radio" id="1" name="1" value="보통이다"> 보통이다 &nbsp;&nbsp;</label>';
            listDiv += '<label><input type="radio" id="1" name="1" value="아니다"> 아니다 &nbsp;&nbsp;</label>';
            listDiv += '<label><input type="radio" id="1" name="1" value="전혀그렇지않다"> 전혀 그렇지않다 &nbsp;&nbsp;</label>';
            listDiv += '</div>'
            
            listDiv += '<label style="position: absolute; top: 190px; left: 60px;">2. 담당 교수는 성적 평가에 대해 안내하였고, 공정한 성적 평가가 이루어졌다.</label>';
            listDiv += '<div style = "position: absolute; top : 225px; left : 70px;">';
            listDiv += '<label><input type="radio" id="2" name="2" value="매우그렇다"> 매우 그렇다 &nbsp;&nbsp;</label>';
            listDiv += '<label><input type="radio" id="2" name="2" value="그렇다"> 그렇다 &nbsp;&nbsp;</label>';
            listDiv += '<label><input type="radio" id="2" name="2" value="보통이다"> 보통이다 &nbsp;&nbsp;</label>';
            listDiv += '<label><input type="radio" id="2" name="2" value="아니다"> 아니다 &nbsp;&nbsp;</label>';
            listDiv += '<label><input type="radio" id="2" name="2" value="전혀그렇지않다"> 전혀 그렇지않다 &nbsp;&nbsp;</label>';
            listDiv += '</div>'; 
            
            listDiv += '<label style="position: absolute; top: 280px; left: 60px;">3. 담당 교수는 강의 시간을 준수하였고, 휴강 발생 시 보강이 잘 이루어졌다.</label>';
            listDiv += '<div style = "position: absolute; top : 315px; left : 70px;">';
            listDiv += '<label><input type="radio" id="3" name="3" value="매우그렇다"> 매우 그렇다 &nbsp;&nbsp;</label>';
            listDiv += '<label><input type="radio" id="3" name="3" value="그렇다"> 그렇다 &nbsp;&nbsp;</label>';
            listDiv += '<label><input type="radio" id="3" name="3" value="보통이다"> 보통이다 &nbsp;&nbsp;</label>';
            listDiv += '<label><input type="radio" id="3" name="3" value="아니다"> 아니다 &nbsp;&nbsp;</label>';
            listDiv += '<label><input type="radio" id="3" name="3" value="전혀그렇지않다"> 전혀 그렇지않다 &nbsp;&nbsp;</label>';
            listDiv += '</div>'; 
            
            listDiv += '<label style="position: absolute; top: 370px; left: 60px;">4. 나는 이 수업에 적극적으로 참여하였고, 복습을 철저히 하였다.</label>';
            listDiv += '<div style = "position: absolute; top : 405px; left : 70px;">';
            listDiv += '<label><input type="radio" id="4" name="4" value="매우그렇다"> 매우 그렇다 &nbsp;&nbsp;</label>';
            listDiv += '<label><input type="radio" id="4" name="4" value="그렇다"> 그렇다 &nbsp;&nbsp;</label>';
            listDiv += '<label><input type="radio" id="4" name="4" value="보통이다"> 보통이다 &nbsp;&nbsp;</label>';
            listDiv += '<label><input type="radio" id="4" name="4" value="아니다"> 아니다 &nbsp;&nbsp;</label>';
            listDiv += '<label><input type="radio" id="4" name="4" value="전혀그렇지않다"> 전혀 그렇지않다 &nbsp;&nbsp;</label>';
            listDiv += '</div>'; 
            
            listDiv += '<label style="position: absolute; top: 460px; left: 60px;">5. 나는 전반적으로, 이 강의에 대해 만족한다.</label>';
            listDiv += '<div style = "position: absolute; top : 495px; left : 70px;">';
            listDiv += '<label><input type="radio" id="5" name="5" value="매우그렇다"> 매우 그렇다 &nbsp;&nbsp;</label>';
            listDiv += '<label><input type="radio" id="5" name="5" value="그렇다"> 그렇다 &nbsp;&nbsp;</label>';
            listDiv += '<label><input type="radio" id="5" name="5" value="보통이다"> 보통이다 &nbsp;&nbsp;</label>';
            listDiv += '<label><input type="radio" id="5" name="5" value="아니다"> 아니다 &nbsp;&nbsp;</label>';
            listDiv += '<label><input type="radio" id="5" name="5" value="전혀그렇지않다"> 전혀 그렇지않다 &nbsp;&nbsp;</label>';
            listDiv += '</div>';
            
            listDiv += '<label style="position: absolute; top: 550px; left: 60px;">6. 교수님께 하고싶은 말</label>';
            listDiv += '<tr>';
            listDiv += '<td><textArea name="textMemo" id="textMemo" rows="10" style="position: absolute; top: 590px; left: 60px; width:600px; resize:none;"></textArea></td>';
            listDiv += '</tr>';
            
            submitBtn += '<button id="memoBtn" class="memoBtn" value=' + subjectNo + '>제출하기</button>';
            		
			// 강의평가 항목
			$('#divMemoTable').append(listDiv);
			$('#openDiv4').append(submitBtn);
		 },
		 error : function(data){
			 console.log("서버 실패");
			 alert("이미 강의평가가 완료된 과목입니다.");
		 }
	  });
	   
   });
   
   // 등록 버튼을 누르면 db에 1.member_no와 subject_no와 질문5개와 memo가 insert됨.
   //                 2. subjectApply 테이블의 status가 Y로 업데이트됨
   $(document).on("click","#memoBtn",function(){
	  // console.log("과목 코드 : " + this.value); 
	  var subjectNo = this.value;
	  var memberNo = document.getElementById("memberNo").value;
	  var queone = $('input[name="1"]:checked').val();
	  var quetwo = $('input[name="2"]:checked').val();
	  var quethree = $('input[name="3"]:checked').val();
	  var quefour = $('input[name="4"]:checked').val();
	  var quefive = $('input[name="5"]:checked').val();
	  var quememo = $("textarea#textMemo").val();
	  
	  $.ajax({
		 url : 'evalSub.ev',
		 type : 'post',
		 dataType : 'json',
		 data : {subjectNo:subjectNo,memberNo:memberNo,queone:queone,
	             quetwo:quetwo,quethree:quethree,quefour:quefour,
	             quefive:quefive,quememo:quememo},
	     success : function(response){
	    	 console.log(response);
	    	 console.log("서버 성공");
	    	 alert("제출이 완료되었습니다.");
	    	 
	    	 $('#openDiv4').empty();
			 $('#divMemoTable').empty();
			 $('#openDiv3Table1 tbody').empty();			
	    	 $('#openDiv2Table1 tbody').empty();
	    	 
	    	 var tdArr = new Array();
	    	 var tr = $('#openDiv2Table1 tbody').children();
	    	 var td = tr.children();
	    	 
	    	 var str = '<tr>';
	    	 $.each(response, function(i){
	    		str += '<td>' + response[i].subjectType + '</td><td>' + response[i].subjectMajor + '</td><td>' +
	    		response[i].subjectName + '</td><td>' + response[i].subjectTime + '</td><td>' +
	    		response[i].subjectNo + '</td><td>' + response[i].status + '</td><td>' +
	    		'<button id="evalBtn" class="evalBtn" value=' + response[i].subjectNo +'>강의평가</button></td>';
	    		str +='</tr>';
	    	 });
	    	 $('#openDiv2Table1 tbody').append(str);
	    	 
	     } ,
	     error : function(data){
	    	 console.log("서버 실패");
	    	 alert("모든 항목을 채워주세요");
	     }
	  });
   });
 
   </script>
</body>
</html>