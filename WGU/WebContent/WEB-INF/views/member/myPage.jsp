<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="wgu.member.model.vo.Member"%>
<%@ page import="java.util.ArrayList, wgu.cafeteriamenu.ticket.model.vo.CafeteriaTicket, wgu.cafeteria.model.vo.Cafeteria 
               , wgu.bus.model.vo.Bus" %>
 <%
    ArrayList<CafeteriaTicket> cafeList = (ArrayList<CafeteriaTicket>)request.getAttribute("cafeList");
    ArrayList<Bus> busList = (ArrayList<Bus>)request.getAttribute("busList");
  %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여성시대학교 - 회원정보수정</title>
<script src="js/jquery-3.5.1.min.js"></script>
<style>

/* 헤더 */
header {
   font-family: '맑은 고딕';
   width: 1200px;
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



.btn1 {
   position : absolute;
   left : 280px;
   border : none;
   background-color : #3867A6;
   color : white;
   cursor: pointer;
}

/* 로고이미지 */
.logoImg {
   position: absolute;
   top: 70px;
   left: 170px;
}

.logoDiv {
   display: inline-block;
   font-size: 27px;
   text-color: gray;
   font-weight: bold;
   position: absolute;
   top: 87px;
   left: 245px;
}



.main_menu > li {
float : left;
}

.main_menu > li > a {
font-size : 20px;
color : black;
text-align : center;
text-decoration : none;
letter-spacing : 0.05em;
display : block;
padding : 12px 36px;
}

/* .main_menu> li: hover .sub_menu {opacity : 0.8; visibility: visible; }
 */
.drop_down {
  display: inline-block;
  font-size : 20px;
  background-color : white;
  border : none;
  position : absolute;
  top : 85px;
  left : 540px;
}

.main_menu{
margin : 0px;
padding : 0px;
list-style-type : none;
}

.sub_menu1{
margin : 0px;
padding : 0px;
list-style-type : none;
position : absolute;
/* left : -402px;
top : 59px; */
left : -540px;
top : 59px;
background : white;
/* width : 1239.5px; */
width : 1519px;
height : 50px;
font-size : 12px;
text-align : center;
border-top : 1px solid lightgray;
/* border-left : 1px solid lightgray;
border-right : 1px solid lightgray; */
visibility: hidden;
}

.sub_menu2{
margin : 0px;
padding : 0px;
list-style-type : none;
position : absolute;
/* left : -402px;
top : 59px; */
left : -540px;
top : 59px;
background : white;
/* width : 1239.5px; */
width : 1519px;
height : 50px;
font-size : 12px;
text-align : center;
border-top : 1px solid lightgray;
/* border-left : 1px solid lightgray;
border-right : 1px solid lightgray; */
visibility: hidden;
}

.sub_menu3{
margin : 0px;
padding : 0px;
list-style-type : none;
position : absolute;
/* left : -402px;
top : 59px; */
left : -540px;
top : 59px;
background : white;
/* width : 1239.5px; */
width : 1519px;
height : 50px;
font-size : 12px;
text-align : center;
border-top : 1px solid lightgray;
/* border-left : 1px solid lightgray;
border-right : 1px solid lightgray; */
visibility: hidden;
}

.sub_menu4{
margin : 0px;
padding : 0px;
list-style-type : none;
position : absolute;
/* left : -402px;
top : 59px; */
left : -540px;
top : 59px;
background : white;
/* width : 1239.5px; */
width : 1519px;
height : 50px;
font-size : 12px;
text-align : center;
border-top : 1px solid lightgray;
/* border-left : 1px solid lightgray;
border-right : 1px solid lightgray; */
visibility: hidden;
}

.sub_menu5{
margin : 0px;
padding : 0px;
list-style-type : none;
position : absolute;
/* left : -402px;
top : 59px; */
left : -540px;
top : 59px;
background : white;
/* width : 1239.5px; */
width : 1519px;
height : 50px;
font-size : 12px;
text-align : center;
border-top : 1px solid lightgray;
/* border-left : 1px solid lightgray;
border-right : 1px solid lightgray; */
visibility: hidden;
}

.sub11{
font-size : 14px;
position : absolute;
left : 595px;
top : -4px;
}

.sub12{
font-size : 14px;
text-color : #3867A6;
position : absolute;
left : 750px;
top : -4px;
}

.sub21{
font-size : 14px;
position : absolute;
left : 555px;
top : -4px;
}

.sub22{
font-size : 14px;
text-color : #3867A6;
position : absolute;
left : 727px;
top : -4px;
}

.sub31{
font-size : 14px;
position : absolute;
left : 588px;
top : -4px;
}

.sub32{
font-size : 14px;
text-color : #3867A6;
position : absolute;
left : 730px;
top : -4px;
}

.sub41{
font-size : 14px;
position : absolute;
left : 588px;
top : -4px;
}

.sub42{
font-size : 14px;
text-color : #3867A6;
position : absolute;
left : 758px;
top : -4px;
}

.sub51{
font-size : 14px;
position : absolute;
left : 580px;
top : -4px;
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
   width: 1000px;
   height: 1000px;
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
                  width:1000px; height:1000px;
                     position:absolute;
                    font-size: large;}

#tab-1{left: 100px;}
#tab-2 {width: 1230px;}
#tab-3 {width: 1230px;}

/* 정보 수정 입력div */
#inputSignUpFrom{ margin-top: -40px;
              margin-left: 310px;}

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


#click{margin-left: -70px;
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
                           


/* 좌측 메뉴바 */
aside {
   position: absolute;
   top: 470px;
   width: 230px;
   height: 1200px;
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
   margin-left: 530px;
   font-family : '맑은 고딕';
   font-weight: 1000;
}
#tel{
   color: red;
}


/* 다정부분-학식 */
#foodTicketUse{
   background : rgb(56, 103, 166);
   color : white;
   margin-top : 20px;
   margin-left: 950px;
   width : 130px;
   height : 40px;
   font-size: 15px;
   font-weight: bold;
}
#showCafeTicket{
   position: absolute;
   left : -160px;
}
#mealTable2{
   width : 1000px;
   margin-left: 100px;
}


/* footer_CSS */
footer {
   position: absolute;
   display: inline-block;
   left : 0px;
   margin-top: 1000px;
   width : 100%;
   height : 150px;
   background : #3867A6;
   color : white;
   text-align: center;
   }
   
#logoimg{
      width: 60px;
      height: 60px;
      position: relative;
      top: 60px;
      left: -400px;
   }
   
   #copyright{
      position: relative;
   }


</style>
</head>
<body>
   <%@ include file="../common/menubar.jsp" %>
   
   <!-- 헤더 -->
   <header>
   <!-- 2 -->
      <img id='banner' src="image/5.png">
         <p class='fine'>마이페이지</p>
         <p id = infoLine><%=loginUser.getMemberName() %>님의 마이페이지입니다.<br>조회하실 정보를 선택해주세요.</p>
   </header>
   <!-- 각자 구현부분 -->
   <section>     
      <!-- 탭 -->
         <ul class='tab'>
            <li class='tab-link current' data-tab='tab-1' id='fine'>내정보 수정하기</li>
            <li class='tab-link' data-tab='tab-2'>스쿨버스예약현황</li>
            <li class='tab-link' data-tab='tab-3'>학식예약현황</li>
         </ul>

      <!-- 라인 -->
         <hr id='contentLine'>

     
     <!-- 탭안에 내용 넣는 영역 -->
     <!-- 영실 - 정보 수정하기 -->
        <div id="tab-1" class="tab-content current"  style="overflow: scroll; height: 700px; overflow-x: hidden;">
          <p align="center" id="userInfo">등록된 정보</p> 
          <p align="center" id="userInfoMsg">회원님의 현재 등록된 정보입니다.<br>수정하고 싶은 정보를 입력하신 후<br>수정하기 버튼을 누르시면 수정이 완료됩니다.<br> <sup id="mainSup">*</sup>은 필수 입력 항목입니다.</p>
   <br><br>
      <form name = "inputSignUpForm" id="inputSignUpFrom" action ="<%=request.getContextPath() %>/update.me" method="post" onsubmit="return checkSubmit();">
         <label>아이디</label><br>
         <input type="text" name = "userId" size="50"  maxlength="10" style="height:30px; background:whitesmoke;" value="<%= loginUser.getMemberId() %>" readonly="readonly" >
         <br><br>
         <label><sup>*</sup>비밀번호</label><br> 
         <input type="password" id="userPwd" name="userPwd" size="50" placeholder="8~16자이내의 영소문자, 숫자,특수문자(!@#$%^&*)허용" maxlength="16" style="height:30px" required pattern="^[a-z0-9!@#$%^&*]{8,16}$">
         <div class="check_font" id="pwdFont"></div>
         <br>
         <label><sup>*</sup>비밀번호 재확인</label><br>
         <input type="password" id="userPwdConfirm" name="userPwdConfirm" size="50" placeholder="위의 입력한 비밀번호와 동일하게 입력해 주세요."  maxlength="16" style="height:30px" required pattern="^[a-z0-9!@#$%^&*]{8,16}$">
         <div class="check_font" id="pwdConfirmFont"></div>
         <br>
         <label>이름</label><br>
         <input type="text" id="userName" name="userName" size="50" value = "<%= loginUser.getMemberName() %>" style="height:30px; background:whitesmoke;" readonly="readonly">
         <br><br>
         <label><sup>*</sup>생년월일</label><br>
         <select class = "userBirtYear" id="years" name="years" style="height:40px; width:110px; margin-right: 10px;">
         <option value ="">년도</option></select>
         <select class = "userBirthMonth" id="month" name="month" style="height:40px; width:110px; margin-right: 10px;">
         <option value ="">월</option></select>
         <select class = "userBirthDay" id="days" name="days" style="height:40px; width:110px;">
         <option value ="">일</option></select>
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
         <select id="gender" name="gender" style="height:40px; width:360px;" >
         <option value ="">== 선택 ==</option>
         <option value="여자">여자</option>
         <option value="남자">남자</option>
         </select>
         <br><br>
         <label><sup>*</sup>이메일</label><br>
         <input type="email" name="userEmail" value="<%= loginUser.getEmail() %>" size="50" style="height:30px" required pattern="^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-z-A-Z]([-_.]?[0-9a-zA-Z])*.[a-z]{2,3}$">
         <div class="check_font" id="emailFont"></div>
         <br>
         <label>주소</label><br>
         <input type="text" name="userAddress" value="<%= loginUser.getAddress() == null ? "" : loginUser.getAddress() %>" size="50" style="height:30px">
         <br><br>
         <label><sup>*</sup>본인확인 휴대폰번호</label><br>
         <input type="tel" name="userPhone" value="<%= loginUser.getPhone() %>" size="50" style="height:30px" placeholder=" -를 제외하고 입력해주세요." required pattern="(010)([1-9]{1}[0-9]{2,3})([0-9]{4})$">
         <div class="check_font" id="phoneFont"></div>
         <br>
         <label>학과</label><br>
         <input type="text" name="department"  id="department"  value="<%= loginUser.getMajorName() %>" size="50" style="height:30px; background:whitesmoke;" readonly="readonly">
         <br><br>
         <label>회원구분</label><br>
         <input type="text" id="choice" name="userGroup" value="<%= loginUser.getMemberGroup() %>" size="50" style="height:30px; background:whitesmoke;" readonly="readonly">   
         <br><br>
         <label>학년</label><br>
         <input type="text" name="userGrade" id="userGrade" value="<%= loginUser.getMemberGrade() %>" size="50" style="height:30px; background:whitesmoke;" readonly="readonly">
         <br><br>
         <label>교수코드 & 학번</label><br>
         <input type="text" name="userNo" id="userNo" value="<%= loginUser.getMemberNo() %>" size="50" style="height:30px; background:whitesmoke;" readonly="readonly">
         <br><br>
      
      <div id = "click">
      <input type="submit" id="userModify" value="수정하기">
      <input type="button" id ="userDrop" value= "회원탈퇴하기" onclick="userDelete();">
      </div>
      </form>
         </div>
         <script>
         //생일, 성별, db에 있는값으로 자동 선택
         $("#years, #month, #days").val("<%= loginUser.getBirthDay() %>").prop("selected", true);
      $("#gender").val("<%= loginUser.getGender() %>").prop("selected", true);
      
            function userDelete(){
               location.href="<%= request.getContextPath() %>/deleteForm.me";
            }
            
            
            //유효성 검사 정규식
            //비밀번호 8~16자이내의 영소문자, 숫자,특수문자(!@#$%^&*)허용"
         var pwdJ=/^[a-z0-9!@#$%^&*]{8,16}$/;
         //이메일 검사
         var emailJ=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-z-A-Z]([-_.]?[0-9a-zA-Z])*.[a-z]{2,3}$/i;
         //전화번호 -를 뺀 010으로시작하는 12자리
         var phoneJ=/(010)([1-9]{1}[0-9]{2,3})([0-9]{4})$/;
            
         //비밀번호 확인
         $("#userPwd").blur(function(){
            if(pwdJ.test($(this).val())){
               //콘솔창에 확인하기
               console.log('true');
               $('#pwdFont').text('사용가능한 비밀번호입니다.');
               $('#pwdFont').css({'color':'mediumblue','font-size':'small'});
               } else {
                  $('#pwdFont').text('8~16자 영문 소문자, 숫자, 특수문자(!@#$%^&*)를 허용합니다.');
                  $('#pwdFont').css({'color':'red','font-size':'small'});
               }   
            });
         
         //비밀번호 일치 확인
         $("#userPwdConfirm").blur(function(){
            if($('#userPwd').val() == $(this).val()){
               $('#pwdConfirmFont').text('비밀번호가 일치합니다.');
               $('#pwdConfirmFont').css({'color':'mediumblue','font-size':'small'});
               } else {
                  $('#pwdConfirmFont').text('비밀번호가 일치하지 않습니다.');
                  $('#pwdConfirmFont').css({'color':'red','font-size':'small'});
                  $('#userModify').attr("disabled",true);
               }
            });
         
         //이메일 주소확인
         $("#userEmail").blur(function(){
            if(emailJ.test($(this).val())){
               //콘솔창에 확인하기
               console.log(emailJ.test($(this).val()));
               $("#userEmail").text('');
               $('#emailFont').text('');
            } else {
               $('#emailFont').text('올바른 이메일 주소가 아닙니다.');
               $('#emailFont').css({'color':'red','font-size':'small'});
            }
         });
         
         //onsubmit : 공백확인
         function checkSubmit(){   
            if($('#userPwd').val()==''){
               alert("비밀번호를 입력하지 않았습니다.");
               $('#userPwd').focus();
               return false;
               }
            
            if($('#userPwdConfirm').val()==''){
               alert("비밀번호를  재확인을 입력하지 않았습니다.");
               $('#userPwdConfirm').focus();
               return false;
               }
            
            if($('#years').val()==''|| $('#month').val()==''|| $('#days').val() ==''){
               alert("생일을 선택하지 않았습니다.");
               $('#years').focus();
               return false;
               }
            
            if($('#gender').val()==''){
               alert("성별을 선택하지 않았습니다.");
               $('#gender').focus();
               return false;
               }
            
            if($('#userEmail').val()==''){
               alert("이메일을 입력하지 않았습니다.");
               $('#userEmail').focus();
               return false;
               }
            
            if($('#userPhone').val()==''){
               alert("휴대폰번호를 입력하지 않았습니다.");
               $('#userPhone').focus();
               return false;
               }
         }
         
            //가져온 학생일때 학년이 보이게
         </script>


      <!-- 스쿨버스 탭 -->
             <div id="tab-2" class="tab-content">
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
                  
                  <tr>
                     <td colspan="5">존재하는 버스 예약이 없습니다.</td>
                  </tr>
                  
                  <tr>
                     <td width="100px" style="text-align: center"></td>
                     <td width="100px" style="text-align: center"></td>
                     <td width="100px" style="text-align: center"></td>
                     <td width="100px" style="text-align: center"></td>
                     <td width="100px" style="text-align: center"></td>
                  </tr>
                  
                  
               </table>

            </div>
            <div id="notice"><%= loginUser.getMemberName() %>님의 예약 현황입니다. 취소는 <label id="tel">02-0000-0000</label>으로 문의주세요.</div>
      <br>
      </div>
      
      <!-- 학식 탭 내용 -->
      <div id="tab-3" class="tab-content">
      <form id = 'showCafeTicket' name = 'showCafeTicket'>
            <input type="hidden" name = 'cafeTicketUse' id = 'cafeTicketUse'>
            <input type="hidden" name = 'ynUse' id = 'ynUse'>
            <div id='tableDiv' style="overflow: scroll; height: 700px; overflow-x: hidden;">
               <table id="mealTable2">
                  <tr>
                     <th width="100px" style="text-align: center">예약번호</th>
                     <th width="100px" style="text-align: center">식당위치</th>
                     <th width="100px" style="text-align: center">사용여부</th>
                  </tr>
                  <% if(cafeList.isEmpty()){ %>
                  <tr>
                     <td colspan="5">존재하는 학식 예약이 없습니다.</td>
                  </tr>
                  <% } else {
                          for(CafeteriaTicket c : cafeList){ %>
                  <tr>
                     <td width="100px" style="text-align: center">
                        <input type = 'checkbox' class = 'foodcheck' name= 'aaa' onclick="doOpenCheck(this);" value= '<%= c.getUseYN() %>' >
                        <label><%= c.getTicketNo() %></label>
                     </td>
                     <td width="100px" style="text-align: center"><%= c.getTodayMenuTitle() %></td>
                     <td width="100px" style="text-align: center"><%= c.getUseYN() %></td>
                  </tr>
                  <%       } 
                    }  %>
               </table>

            </div>
            <div id="notice"><%= loginUser.getMemberName() %>님의 예약 현황입니다. 취소는 <label id="tel">02-0000-0000</label>으로 문의주세요.</div>
         <button id = 'foodTicketUse' type = 'submit'>사용</button>
         <script>
            function doOpenCheck(chk){
                var obj = document.getElementsByName("aaa");
                for(var i=0; i<obj.length; i++){
                       if(obj[i] != chk){
                     obj[i].checked = false;
                 }
             }
         }

            $('#foodTicketUse').click(function(){
               var check = $('input[name="aaa"]:checked').val();
                    $('#cafeTicketUse').val(check);
               
               var useYn2 = $("input[name=aaa]:checked").parent("td").children("label").text()
               $('#ynUse').val(useYn2);
               
               window.open("use.food", "ticketFoodUseha", "width = 500, height = 400");
            })
         </script>
      </form>
      </div>
   
      <!-- 각 탭을 를 눌렀을 때 해당하는 탭에 대한 정보가 나오는 곳 -->
      <script>
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
            <li>회원 페이지</li>
            <li><img src="image/줄.PNG"></li>
            <li><br><a onclick="subjectBtn();" class='mypageMenu' style="cursor: pointer;">수강신청하기</a><br><br></li>
            <li><a onclick="busBtn();" class='mypageMenu' style="cursor: pointer;" >스쿨버스예약하기</a><br><br></li>
            <li><a onclick="mealBtn();" class='mypageMenu' style="cursor: pointer;">학식예약하기</a><br><br></li>
         </ul>
      </div>
   </aside>
   <script>
   function subjectBtn(){
      location.href="<%= request.getContextPath() %>/applySubject.su";   
   }
   
   function busBtn(){
      location.href="<%= request.getContextPath() %>/bus.wgu";
   }
   
   function mealBtn(){
      location.href="<%= request.getContextPath() %>/list.cafe";
   }
   </script>
</body>
<footer>
   <div id=logo>
      <img id="logoimg" src = "image/로고.jpg">
   </div>
   <div id="copyright">
      01234 서울시 강남구 강남구 테헤란로14길 6 남도빌딩 | TEL. (02)1234-0000 | FAX.(02)0000-1234<br>
      COPYRIGHT(C) 2020 WOMEN GENERATION UNIVERSITY. ALL RIGHTS RESERVED.
   </div>
 </footer>
</html>