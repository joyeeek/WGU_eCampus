<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="wgu.member.model.vo.Member"%>

<%@ page import="java.util.ArrayList, wgu.bus.model.vo.Bus" %>
<% ArrayList<Bus> list = (ArrayList<Bus>)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지-내정보수정</title>
<script src="js/jquery-3.5.1.min.js"></script>
<style>

.divMain0_0{
display: inline-block;
position : absolute;
 width : 5%; 
 height : 50px;
}

.divMain0_1{
display: inline-block;
position : absolute;
 width : 5%; 
 height : 400px;
}

/* 1 */
#loginInform {
   display: inline-block;
   position: absolute;
   left: 0px;
   width: 1519.5px;
   height: 50px;
   background: #3867A6;
   color: white;
}

.mypageLogout1 {
   position: absolute;
   top: 20px;
   left: 1140px;
   color: white;
}

.mypageLogout2 {
   color: white;
   cursor: pointer;
}




/* 2 */
#banner {
   position: absolute;
   top: 160px;
   left: 0px;
   width: 1520px;
   height: 240px;
   display: inline-block;
}


.fine {
   position: absolute;
   top: 435px;
   left: 310px;
   font-weight: 800;
   font-size: 48px;
}

#infoLine{
   position: absolute;
   top: 533px;
   left: 320px;
 font-size: 20px;
}


/* ---------------- 각자 구현부분 ---------------------- */

section {
   position: absolute;
   top: 700px;
   left: 300px;
   background: white;
   width: 1200px;
   height: 300px;
}


/* 탭 */
.tab {
   list-style: none;
   margin-top: -80px;
   margin-left: -30px;
}

.tab>li {
   display: inline-block;
   background: rgb(236, 236, 236);
   font-family: '맑은 고딕';
   font-size: 15px;
   width: 200px;
   height: 50px;
   text-align: center;
   display: table-cell;
   vertical-align: middle;
   border: 1px solid rgba(0, 0, 0, 0.3);
   cursor: pointer;
}


#fine {
   background: white;
   border-bottom-color: white;
}

/* 라인 */
#contentLine { /* hr선 색 수정 : background-color, height, border */
   margin-top: -17px;
   background-color: rgba(0, 0, 0, 0.3);
   height: 1px;
   border: 0;
   margin-left: 615px;
}


/* 탭안에 내용 넣는 영역  */
.tab-content.current {display: inherit;
					   width:1000px; height:400px;
   						position:absolute;
    		 			font-size: large;}

#tab-1{left: 170px;}
#tab-2 {width: 1230px;}
.tab-content {display: none;}


/* 내정보 수정하기 CSS */
#userInfo{font-size: 35px; 
  		font-weight: 800;
		 font-family: "맑은 고딕";
		 margin-top: 120px;}
		 
#userInfoMsg{font-size: 20px;
			color: rgb(93, 93, 93);
			margin-bottom: 80px;
			margin-top: -20px;}		 

form{margin-left: 160px;}

sup{color: red;}

/* 텍스트간격 */
form>label{line-height: 35px;} 	 

	
section button{background-color: rgb(56, 103, 166);
					color: white; border: none;
					width: 100px; height: 30px;
					font-size: 12px;
					border-radius: 5px;
					cursor: pointer;}
					
					
.birth{cursor: pointer;}			
#gender{cursor: pointer;}
#department{cursor: pointer;}
#choice{cursor: pointer;}


#click{margin-left: 70px;
		display: inline-block;}

#userModify{background-color: rgb(56, 103, 166);
			color: white;
			border: none;
			width: 220px; height: 50px;
			font-size: 21px;
			margin-top: 50px;
			border-radius: 5px;
			cursor: pointer;
			margin-left: 30px; }
		
#userDrop{background-color:rgba(56, 103, 166, 0.75);
			  color: white;
			  border: none;
			  width: 220px; height: 50px;
			  font-size: 21px;
			  margin-top: 50px;
			  border-radius: 5px;
			  cursor: pointer;
		      margin-left: 30px; }


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

/* 좌측 메뉴바 */
aside {
   position: absolute;
   top: 470px;
   width: 230px;
   height: 350px;
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

#contentLine{
	width: 610px;
}


table {
	margin-top: 10px;
  margin-left: 10px;
  border-collapse: collapse;
  width: 1190px;
}

th, td {
  text-align: left;
  padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
  background-color: #3867A6;
  color: white;
}

#notice{
	margin-left: 650px;
	font-family : '맑은 고딕';
	font-weight: 1000;
}
#tel{
	color: red;
}


</style>
</head>
<body>

   <!-- 헤더 -->
   <header>
    	<%@ include file="../common/menubar.jsp" %>
	<!-- 2 -->
      <img id='banner' src="image/5.png">
         <p class='fine'>마이페이지</p>
         <p id = infoLine><%=loginUser.getMemberName() %>님의 마이페이지입니다.<br>조회하실 정보를 선택해주세요.</p>
   </header>



   <!-- 각자 구현부분 -->
   <section>     
      <!-- 탭 -->
         <ul class='tab'>
            <li class='tab-link' data-tab='tab-1'>내정보 수정하기</li>
            <li class='tab-link current' data-tab='tab-2' id='fine'>스쿨버스예약현황</li>
            <li class='tab-link' data-tab='tab-3'>학식예약현황</li>
         </ul>

		<!-- 라인 -->
         <hr id='contentLine'>

     
         <!-- 탭안에 내용 넣는 영역 -->
         <!-- 내정보 수정하기 CSS-->
         <div id="tab-1" class="tab-content">
   		 <p align="center" id="userInfo">등록된 정보</p> 
   		 <p align="center" id="userInfoMsg">회원님의 현재 등록된 정보입니다.<br>수정하기 버튼을 누르시면 수정이 가능합니다.</p>
   		
   		 <sup>*</sup>은 필수 입력 항목입니다.
	<br><br>
		<form>
			<label>아이디</label><br>
			<%= loginUser.getMemberId() %>
			<input type="hidden" name = "userid" size="50"  maxlength="10" style="height:30px" value="<%= loginUser.getMemberId() %>" >
			<br><br>
			<label><sup>*</sup>비밀번호</label><br> 
			<input type="password" name = "userpassword" size="50" placeholder="8~16자이내의 영소문자, 숫자,특수문자(!@#$%^&*)허용" maxlength="16" style="height:30px">
			<br><br>
			<label><sup>*</sup>비밀번호 재확인</label><br>
			<input type="password" name = "userpasswordconfirm" size="50" placeholder="위의 입력한 비밀번호와 동일하게 입력해 주세요."  maxlength="16" style="height:30px">
			<br><br>
			<label><sup>*</sup>이름</label><br>
			<%= loginUser.getMemberName() %>
			<input type="hidden" name = "username" size="50" style="height:30px">
			<br><br>
			<label><sup>*</sup>생년월일</label><br>
			<select class = "birth" id="years" style="height:40px; width:110px; margin-right: 10px;">
			<option value ="none">년도</option></select>
			<select class = "birth" id="month" style="height:40px; width:110px; margin-right: 10px;">
			<option value ="none">월</option></select>
			<select class = "birth" id="days" style="height:40px; width:110px;">
			<option value ="none">일</option></select>
			<script>
				$(function() {
			   	 //년도
			    	for (i = new Date().getFullYear(); i > 1900; i--){
			       		 $('#years').append($('<option />').val(i).html(i));
			   		 }
					//월
			    	for (i = 1; i < 13; i++){
			        	$('#month').append($('<option />').val(i).html(i));
			   		 }
			   		 //일
			    	for (i = 1; i <= 31; i++){
			       		 $('#days').append($('<option />').val(i).html(i));
			   		 }
				});
			</script>
			<br><br>
			<label><sup>*</sup>성별</label><br>
			<select id="gender"  style="height:40px; width:360px;">
			<option value ="none">== 선택 ==</option>
			<option value="female">여자</option>
			<option value="male">남자</option>
			</select>
			<br><br>
			<label><sup>*</sup>이메일</label><br>
			<input type="email" name = "useremail" size="50" placeholder="<%= loginUser.getEmail() %>" style="height:30px">
			<br><br>
			<label>주소</label><br>
			<input type="text" name = "useraddress" size="50" style="height:30px">
			<br><br>
			<label><sup>*</sup>본인확인 휴대폰번호</label><br>
			<input type="tel" name = "userphone" size="50" style="height:30px">&nbsp;<button>인증번호 받기</button>
			<br><br>
			<label>학과</label><br>
			<input type="text" id="department" size="50" style="height:30px">
			<br><br>
			<label>회원구분</label><br>
			<%= loginUser.getMemberGroup() %>
			<input type="hidden" id="choice" size="50" style="height:30px">
			
			<br><br>
			<label>교수코드 & 학번</label><br>
			<%= loginUser.getMemberNo() %>
			<input type="hidden" id = "usernumber" size="50" style="height:30px" value="<%= loginUser.getMemberNo() %>">
			<br><br>
		</form>
		
		<div id = "click">
		<button id = "userModify">수정하기</button>
		<button id = "userDrop">회원탈퇴하기</button>

		</div>
   		</div>

         <div id="tab-2" class="tab-content current">
         	<input type="hidden">
            <div id='tableDiv' style="overflow: scroll; height: 400px; overflow-x: hidden;">
					<table id="mealTable">
						<tr>
							<th width="100px" style="text-align: center">버스 번호</th>
							<th width="100px" style="text-align: center">이용 날짜</th>
							<th width="100px" style="text-align: center">노선</th>
							<th width="100px" style="text-align: center">결제 금액</th>
							<th width="100px" style="text-align: center">선택한 좌석</th>
						</tr>
						<% if(list.isEmpty()){ %>
						<tr>
							<td colspan="5">존재하는 버스 예약이 없습니다.</td>
						</tr>
						<% } else {
  								for(Bus b : list){ %>
						<tr>
							<td width="100px" style="text-align: center"><%= b.getBusNo() %></td>
							<td width="100px" style="text-align: center"><%= b.getBusDate() %></td>
							<td width="100px" style="text-align: center"><%= b.getBusLine() %></td>
							<td width="100px" style="text-align: center"><%= b.getBusPrice() %></td>
							<td width="100px" style="text-align: center"><%= b.getBusSeat() %></td>
						</tr>
						<% 		} 
  						   } %>
						
					</table>

            </div>
            <div id="notice"><%= loginUser.getMemberName() %>님의 예약 현황입니다. 취소는 <label id="tel">02-0000-0000</label>으로 문의주세요.</div>
<!--             <div id='cancleDiv'> -->
<!--                <button id='reservationCancle2'>예약취소</button> -->
<!--             </div>    -->
<br>
		</div>

         <!-- 비밀번호 찾기 고정메뉴 탭을 눌렀을 때 나오는 내용 -->
         <div id="tab-2" class="tab-content">
         
   
		</div>

      <!-- 각 탭을 를 눌렀을 때 해당하는 탭에 대한 정보가 나오는 곳 -->
      <script>
      
     	var memberNo = $('#usernumber').val();
		function listBus(){
			location.href = "<%= request.getContextPath() %>/listBus.wgu?memberNo=" + memberNo;
		}
      
		
         $(document).ready(function() {

            $('ul.tab li').click(function() {
               var tab_id = $(this).attr('data-tab');

               $('ul.tab li').removeClass('current');
               $('.tab-content').removeClass('current');
               $('ul.tab li').css({
                  'background' : 'rgb(236, 236, 236)',
                  'border-bottom-color' : 'rgba(0, 0, 0, 0.3)'
               });

               $(this).addClass('current');
               $(this).css({
                  'border-bottom-color' : 'white',
                  'background' : 'white'
               });
               $("#" + tab_id).addClass('current');
            })

         })
      </script>
   </section>



   <!-- 좌측 메뉴바 -->
   <aside>
      <div id='menu' class='menuDiv'>
         <ul class='menuList'>
            <li><a href='#'>회원 페이지</a></li>
            <li><img src="image/줄.PNG"></li>
           <li><br><a href="<%= request.getContextPath() %>/bus.wgu" class='mypageMenu'>스쿨버스</a><br><br></li>
             <li><a href="<%= request.getContextPath() %>/list.cafe" class='mypageMenu'>학식</a></li>
         </ul>
      </div>
   </aside>

</body>
</html>