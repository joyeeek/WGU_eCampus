<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="wgu.cafeteria.model.vo.Cafeteria"%>
<%@ page import = "java.util.*"%>
<% 
   ArrayList<Cafeteria> cList = (ArrayList<Cafeteria>)request.getAttribute("cList");
   Cafeteria cafeteria = (Cafeteria)request.getAttribute("cafeteria");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여성시대학교 - 관리자(학식관리)</title>
<script src="js/jquery-3.5.1.min.js"></script>
<style>

/* 로고이미지 */

.bannerTxt{
position : absolute;
top : -700px;
left : -300px;
}

/* 배너 밑 글씨 div */
.mypageDiv{ 
position : absolute;
top : 5px;
left : 10px;
width : 300px;
}

/* 배너 밑 글씨 조금 큰 부분 */
.mypage { 
   position: absolute;
   top: 435px;
   left: 310px;
   width : 500px;
   font-weight: 800;
   font-size: 48px;
}
/* 배너 밑 글씨 작은 부분 */
.mypageP1 { 
   position: absolute;
   top: 540px;
   left: 320px;
   line-height: 10px;
   font-size: 15px;
}

/* 배너 */
#banner { 
   position: absolute;
   top: 160px;
   left: 0px;
   width: 1519.5px;
   height: 240px;
   display: inline-block;
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


/* 좌측 메뉴바 div */
   #menu {
   width: 200px;
   height: 100%;
   padding-right: 10px;
   font-size: 22px;
   }


/* 좌측 메뉴바 리스트 */
   .menuList {
   list-style: none;
   text-align: center;
   }
   

/* 좌측 메뉴바 리스트 정보 */
.mypageMenu {
   font-size: 18px;
}

a {
   text-decoration: none;
   color: black;
}


/* 각자 구현 내용*/
section {
   position: absolute;
   top: 700px;
   left: 300px;
   background: white;
   width: 1200px;
   height: 1000px;
}

#contentLine { /* hr선 색 수정 : background-color, height, border */
   margin-top: -17px;
   background-color: rgba(0, 0, 0, 0.3);
   height: 1px;
   border: 0;
   margin-left: 415px;
}

/* 큰 탭 부분 : 식당, 고정메뉴, 오늘의 메뉴 */
.tab {
   list-style: none;
   margin-top: -80px;
   margin-left: -30px;
}

/* 탭의 리스트 */
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

/* 탭 리스트를 눌렀을 때 나오는 div */
.tab-content {
   display: none;
}

/* 탭 리스트 첫번째 */
#hak {
   background: white;
   border-bottom-color: white;
}

/* 식당 수정/삭제 */
.tab-content.current {
   display: inherit;
}

.cafeTabs {
   list-style: none;
}
.cafeTabs2 {
   list-style: none;
}

/* 첫번째 탭 리스트 */
.cafeTabs>li {
   display: inline-block;
   background: rgb(236, 236, 236);
   width: 150px;
   height: 40px;
   text-align: center;
   line-height: 40px;
   border: 1px solid rgba(158, 158, 158, 0.4);
   border-radius: 5px;
   margin-left: -6px;
   cursor: pointer;
}

/* 두번째 탭 리스트 */
.cafeTabs2>li {
   display: inline-block;
   background: rgb(236, 236, 236);
   width: 150px;
   height: 40px;
   text-align: center;
   line-height: 40px;
   border: 1px solid rgba(158, 158, 158, 0.4);
   border-radius: 5px;
   margin-left: -6px;
   cursor: pointer;
}

/* 두번째 탭 */
#tabs2 {
   width: 1000px;
}

/* +,- 버튼이 있는 div */
.btnDiv {
   float: right;
   margin-top: -40px;
   margin-right: -200px;
   height: 30px;
}

#tableInf{
   padding-left: 34px;
   font-size: 10px;
}

/* + 버튼 */
.btn1 {
   cursor: pointer;
   background: rgb(176, 199, 217);
   border: 1px solid rgb(176, 199, 217);
   width: 50px;
   height: 24px;
   font-size: 18px;
   color: white;
   font-weight: bold;
   margin-left: -200px;
}

/* - 버튼 */
#minusBtn {
   margin-left: -140px;
}

table {
   margin-left: 33px;
}

/* 식당 테이블 - 정보 */
.cafe-place {
   padding : 30px 0px 0px 10px; 
   width: 790px;
   height: 70px;
   resize: none;
}

/* 식당 테이블 - 컬럼 */
.cafe-imform {
   background: rgb(236, 236, 236);
   width: 300px;
}

/* 첫번째 테이블 입력/저장 버튼 */
.cafeBtn {
   position: absolute;
   top: 200;
   right: 61px;
   width: 100px;
   height: 35px;
   color: white;
   background: rgb(56, 103, 166);
   border: 1px solid rgb(56, 103, 166);
}

/* 첫번째 테이블 입력 버튼 */
#update {
   position: absolute;
   right: 170px;
}

/* 오늘의메뉴-요일 */
.fixFood {
   background: rgb(236, 236, 236);
   width: 300px;
}

/* 오늘의메뉴-정보 */
.todayMenu {
   padding : 0px 0px 0px 10px; 
   width: 800px;
   height: 80px;
}

/* 두번째 탭 버튼 */
.cafeBtn2 {
   position: absolute;
   top: 200;
   right: 61px;
   width: 100px;
   height: 35px;
   color: white;
   background: rgb(56, 103, 166);
   border: 1px solid rgb(56, 103, 166);
}

/* 두번째 탭 입력 */
#fixInput {
   position: absolute;
   right: 170px;
}

footer {
   display: inline-block;
    position : absolute;
    left : 0px;
   top: 1845px;
   width : 100%;
   height : 150px;
   background : #3867A6;
   color : white;
   text-align: center;
   }

</style>
</head>
<body>
   <%@ include file="../common/menubar.jsp" %>

      <img id='banner' src="image/6.jpg">
      <div id='mypageDiv'>
         <p class='mypage'>학식 관리페이지</p>
         <p class='mypageP1'>변경하실 탭을 선택하세요.</p>
      </div>
   <!-- 각자 구현부분 -->
   <section>
      <div class='content'>
         <ul class='tab'>
            <li class='tab-link current' data-tab='tab-1' id='hak'>식당</li>
            <li class='tab-link' data-tab='tab-2'>오늘의메뉴</li>
         </ul>

         <hr id='contentLine'>

         <!-- 식당 div : 식당을 눌렀을 때 나오는 내용 -->
         <div id="tab-1" class="tab-content current">
            <br>
            <!-- 식당 div에 탭을 또 만듦 -->
            <div>
               <form action="<%= request.getContextPath() %>/insertList.cafe" method="post" id="insertForm" name="insertForm">
               <div id=tabs2>
                  <input type = 'hidden' name = 'listName' id = 'listName'>
                  <ul class='cafeTabs' id='add'>
                     <% if(cList.isEmpty()){ %>
                  <li class = 'cafe-link'>+를 통해 식당생성</li>
               <% } else { %>
                  <% for(Cafeteria c : cList){ %>
                     <li class = 'cafe-link'  id = '<%= c.getCafeteriaTitle() %>'><%= c.getCafeteriaTitle() %></li>
                  <% } %>
               <% } %>
                  </ul>
               </div>

               <!-- +, - 버튼이 있는 div -->
               <div class ='btnDiv'>
                    <input type='hidden' value='1' id = 'insertCafeteria' name = 'insertCafeteria'>
                  <input type = 'button' class='btn1' onclick='addList();' id='btnAdd' value = "+">
                  <script>
                     var newLi = ""
                     function addList() {
                        newLi = $('<li class = "cafe-link" id = ></li>')
                              .appendTo('#add')
                              .css({'width' : '200px', 'height' : '40px', 'background' : 'rgb(176, 199, 217)'})
                              .append('<input type = "text" placeholder = "식당 이름을 입력하세요" id = "ca" name= "ca" required>');

                        $('#ca').focus();
                        $('#cafePlace').attr("readonly", false);
                        $('#cafeTime').attr("readonly", false);
                        $('#cafePrice').attr("readonly", false);

                        /* +버튼을 눌렀을 경우 저장하기 빼고 다른 버튼 비활성화 */
                        btnAdd.disabled = 'disabled';
                        update.disabled = 'disabled';
                        $(newLi).siblings().css({'pointer-events' : 'none', "background" : "rgb(236, 236, 236)",
                                           "color" : "black"});
                     }

                     // 식당 이름을 누를경우 해당 식당 배경이 진해지면서 글씨색 하얀색으로 변경
                     $(function() {
                        $('.cafeTabs').children().click(function() {
                           $('.cafeTabs').children().css({ "background" : "rgb(236, 236, 236)", "color" : "black"});
                           $(this).css({ "background" : "rgb(56, 103, 166)", "color" : "white"});
                          
                           $('#listName').val($(this).text());
                           var listName= $('#listName').val(); // listName에 현재 내가 누른 버튼의 입력 값을 저장
                           
                           $.ajax({
                                 url : 'insertList.cafe',
                                type : 'get',
                                data : {listName:listName, insertCafeteria:1},
                                success : function(data) {
                               console.log('업데이트 서버 성공 시 호출되는 함수')
                               console.log("listName : " + data)
                               
                               var locationC = "";
                               var timeC = "";
                               var priceC = "";
                               if(data != null){
                                  locationC = data.cafeteriaLocation;
                                  timeC = data.cafeteriaTime;
                                  priceC = data.cafeteriaPrice;
                                  console.log("locationC : " + locationC)
                                  console.log("timeC : " + timeC)
                                  console.log("priceC : " + priceC)
                                  
                                  $('#cafePlace').text(locationC);
                                  $('#cafeTime').text(timeC);
                                  $('#cafePrice').text(priceC);
                                  
                               } 
                            },
                            error : function(data) {
                               console.log('업데이트 서버 실패 시 호출되는 함수')
                               console.log(listName);
                            }
                           })
                        });
                     });
                     
                     $('#btnAdd').click(function(){
                       var insertCafeteria = $('#insertCafeteria').val(5)
                  $('#cafePlace').val("");
                  $('#cafeTime').val("");
                  $('#cafePrice').val("");
                       
                       $.ajax({
                          url : 'insertList.cafe',
                          type : 'get',
                          data : {insertCafeteria:insertCafeteria},
                          success : function(insertCafeteria) {
                           console.log('서버 성공 시 호출되는 함수')
                           
                        },
                        error : function(data) {
                           console.log('서버 실패 시 호출되는 함수')
                        }
                       })
                       
                     })
                     
                  </script>
                  <input type = 'button' class='btn1' id='minusBtn' onclick='removeList();' value = '-'>
                  <script>
                     function removeList() {
                        var insertCafeteria = $('#insertCafeteria').val(7)
                        
                        $.ajax({
                           url : 'insertList.cafe',
                           type : 'get',
                           data : {insertCafeteria:insertCafeteria},
                           success : function(insertCafeteria) {
                            console.log('서버 성공 시 호출되는 함수')
                            
                         },
                         error : function(data) {
                            console.log('서버 실패 시 호출되는 함수')
                         }
                        })
                     }
                  </script>
               </div>

               <div class='cafeTab-content current'>
                  <table id = 'imformTable'>
                     <tr>
                        <th class='cafe-imform'>위치</th>
                        <th><textarea class='cafe-place' id='cafePlace' name ='cafePlace' placeholder="정확한 위치를 입력하세요" required readonly ></textarea></th>
                     </tr>
                     <tr>
                        <th class='cafe-imform'>운영시간</th>
                        <th><textarea class='cafe-place' id = 'cafeTime' name ='cafeTime' placeholder="정확한 운영시간을 입력하세요" required readonly ></textarea></th>
                     </tr>
                     <tr>
                        <th class='cafe-imform'>가격</th>
                        <th><textarea class='cafe-place' id = 'cafePrice' name ='cafePrice' placeholder="정확한 가격을 입력하세요" required readonly ></textarea></th>
                     </tr>
                  </table>
                  <label id = 'tableInf'>입력을 누르면 수정할 수 있습니다.</label>
                  <br> <br>
                  <input type = 'button' class='cafeBtn' id='update' onclick='updateCafe();' value = '입력'>
                  <script>
                     function updateCafe() {
                       $('#cafePlace').attr("readonly", false).focus();
                        $('#cafeTime').attr("readonly", false);
                        $('#cafePrice').attr("readonly", false);
                        
                        var insertCafeteria = $('#insertCafeteria').val(3);
                        
                        $.ajax({
                           url : 'insertList.cafe',
                           type : 'get',
                           data : {insertCafeteria:3},
                           success : function(insertCafeteria) {
                            console.log('서버 성공 시 호출되는 함수')
                            console.log(data)
                         },
                         error : function(data) {
                            console.log('서버 실패 시 호출되는 함수')
                         }
                        })
                     }
                  </script>
                  <input class='cafeBtn' type="submit" value="저장">
               </div>
               </form>
            </div>
         </div>
         </div>

         <!-- 오늘의메뉴 div : 오늘의메뉴 탭을 눌렀을 때 나오는 내용 -->
         <form action="<%= request.getContextPath() %>/list.todayMenu" method="post" id="listTodayForm" name="listTodayForm">
         <div id="tab-2" class="tab-content">
            <br>
            <!-- 식당 div에 탭을 또 만듦 -->
            <div>
               <div id=tabs2>
                  <input type = 'hidden' name = 'listNameToday' id = 'listNameToday'>
                  <input type='hidden' value='1' id = 'todayMenuCategory' name = 'todayMenuCategory'>
                  <ul class='cafeTabs2' id='add'>
                     <% if(cList.isEmpty()){ %>
                  <li class = 'cafe-link'>식당 탭에서 식당 추가</li>
               <% } else { %>
                  <% for(Cafeteria c : cList){ %>
                     <li class = 'cafe-link'  id = '<%= c.getCafeteriaTitle() %>'><%= c.getCafeteriaTitle() %></li>
                  <% } %>
               <% } %>
                  </ul>
                  <script>
                  $(function() {
                      $('.cafeTabs2').children().click(function() {
                         $('.cafeTabs2').children().css({ "background" : "rgb(236, 236, 236)", "color" : "black"});
                         $(this).css({ "background" : "rgb(56, 103, 166)", "color" : "white"});
                         
                         $('#listNameToday').val($(this).text());
                         var listNameToday= $('#listNameToday').val(); // listName에 현재 내가 누른 리스트의 값을 저장
                         
                         $.ajax({
                               url : 'list.todayMenu',
                              type : 'get',
                              data : {listNameToday:listNameToday, todayMenuCategory:1},
                              success : function(data) {
                                console.log('업데이트 서버 성공 시 호출되는 함수')
                                console.log("리스트이름 : " + listNameToday)
                                console.log("데이터 이름 : " + data)
                             
                           var menuDay = "";
                           var menuName = "";
                           
                           if(data != null){
                                 $('#monT').val(data.monMenu);
                                 $('#tueT').val(data.tueMenu);
                                 $('#wenT').val(data.wenMenu);
                                 $('#thuT').val(data.thuMenu);
                                 $('#friT').val(data.friMenu);
                                 $('#satT').val(data.satMenu);
                           } 
                             },
                             error : function(data) {
                             console.log('업데이트 서버 실패 시 호출되는 함수')
                             console.log(listName);
                          }
                         })
                         
                      });
                  });
                  </script>
               </div>
               <div>
                  <table id = 'fixFoodTable'>
                     <tr>
                        <th class='fixFood'>월요일</th>
                        <th><input type='text' placeholder='메뉴를 입력하세요'class='todayMenu' id='monT' name ='monT' required readonly></th>
                     </tr>
                     <tr>
                        <th class='fixFood'>화요일</th>
                        <th><input type='text' placeholder='메뉴를 입력하세요'class='todayMenu' id = 'tueT' name ='tueT' required readonly></th>
                     </tr>
                     <tr>
                        <th class='fixFood'>수요일</th>
                        <th><input type='text' placeholder='메뉴를 입력하세요'class='todayMenu' id = 'wenT' name = 'wenT' required readonly></th>
                     </tr>
                     <tr>
                        <th class='fixFood'>목요일</th>
                        <th><input type='text' placeholder='메뉴를 입력하세요'class='todayMenu' id = 'thuT'  name = 'thuT' required readonly></th>
                     </tr>
                     <tr>
                        <th class='fixFood'>금요일</th>
                        <th><input type='text' placeholder='메뉴를 입력하세요'class='todayMenu' id = 'friT'  name = 'friT' required readonly></th>
                     </tr>
                     <tr>
                        <th class='fixFood'>토요일</th>
                        <th><input type='text' placeholder='메뉴를 입력하세요'class='todayMenu' id = 'satT' name = 'satT' required readonly></th>
                     </tr>
                  </table>

                  <br>
                  <br>
                  <input type = 'button' class='cafeBtn2' id='fixInput' onclick='fixInputText();' value = '입력'>
                  <script>
                     function fixInputText() {
                        $('.todayMenu').attr("readonly", false);
                        $('#mondayFix').focus();
                        
                        var todayMenuCategory = $('#todayMenuCategory').val(3);
                        
                        $.ajax({
                           url : 'TodayMenuUpdate',
                          type : 'get',
                          data : {todayMenuCategory:3},
                          success : function(data) {
                             console.log("입력완료")
                         },
                         error : function(data) {
                         console.log('입력 실패 시 호출되는 함수')
                         }
                          })
                     }
                  </script>
                  <button class='cafeBtn2' type='submit'>저장</button>
               </div>
            </div>
         </div>
         </form>


         <!-- 각 리스트(식당, 고정메뉴, 오늘의메뉴)를 눌렀을 때 해당하는 탭에 대한 정보가 나오는 곳 -->
         <script>
            $(document).ready(function() {

               $('ul.tab li').click(function() {
                  var tab_id = $(this).attr('data-tab');

                  $('ul.tab li').removeClass('current');
                  $('.tab-content').removeClass('current');
                  $('ul.tab li').css({'background' : 'rgb(236, 236, 236)', 'border-bottom-color' : 'rgba(0, 0, 0, 0.3)'});

                  $(this).addClass('current');
                  $(this).css({'border-bottom-color' : 'white', 'background' : 'white'});
                  $("#" + tab_id).addClass('current');
               });

            });
         </script>
   </section>
   
   <!-- 좌측 메뉴바 -->
   <aside>
      <div id='menu' class='menuDiv'>
         <ul class='menuList'>
            <li><a href='#'>관리자페이지</a></li>
         <li><img src="image/줄.PNG"></li>
         
         <li><br><a href='<%= request.getContextPath() %>/adminSList.sc' class='mypageMenu'>학사일정관리</a><br><br></li>
         <li><a href="<%= request.getContextPath() %>/adminPagebus.wgu" class='mypageMenu'>스쿨버스관리</a><br><br></li>
         <li><a href="<%= request.getContextPath() %>/insert.cafe" class='mypageMenu'>학식관리</a><br><br></li>
         <li><a href='<%= request.getContextPath() %>/AdminList.bu' class='mypageMenu'>게시판관리</a><br><br></li>

      </ul>
   </div>
   </aside>

   
   <footer>
   <%@ include file = "../common/foot.jsp" %>
   </footer>
</body>
</html>