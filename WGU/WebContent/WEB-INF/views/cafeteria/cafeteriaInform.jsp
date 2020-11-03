<%@page import="wgu.cafeteriamenu.todayMenu.model.vo.TodayMenu"%>
<%@page import="wgu.cafeteria.model.vo.Cafeteria"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<% 
   Cafeteria cafeteria = (Cafeteria)request.getAttribute("cafeteria");
   ArrayList<Cafeteria> cList = (ArrayList<Cafeteria>)request.getAttribute("cList");
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여성시대학교 - 학식</title>
<script src="js/jquery-3.5.1.min.js"></script>
<style>

/* 배너사진 */
#banner2 { 
   position: absolute;
   top: 160px;
   left: 0px;
   width: 1519.5px;
   height: 240px;
   display: inline-block;
}

/* 배너 밑 글귀 */
.mypage2 {
   position: absolute;
   top: 435px;
   left: 310px;
   font-weight: 800;
   font-size: 48px;
}

#mypage3{
   font-size: 15px;
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

/* 좌측 메뉴바 리스트 */
.menuList {
   list-style: none;
   text-align: center;
}

a {
   text-decoration: none;
   color: black;
}

/* 좌측 메뉴바 리스트 안 내용 */
.mypageMenu {
   font-size: 18px;
}



/* 각자 구현 내용*/
section {
   position: absolute;
   top: 550px;
   left: 300px;
   background: white;
   width: 1200px;
   height: 800px;
}

/* 식당 리스트 */
.cafeTabs {
   list-style: none;
}

/* 식당 리스트 내용 */
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

/* 식당 정보 테이블 */
#cafe{
   margin-left : 35px;
   width : 1000px;
   font-size : 15px;
}

#cafe th{
   font-weight: 700;
}

/* 식당 정보 테이블-정보 */
.cafeTableInfrom{
   border : 1px solid rgb(236, 236, 236);
   background : rgba(242, 255, 237, 0.1);
}

/* 식당 정보 테이블-컬럼명 */
.cafeTable{
   height : 70px;
   width : 300px;
   background : rgb(236, 236, 236);
}

/* 오늘의 식단 전체 div */
#tableMove{
   margin-left: 32px;
}

/* 오늘의 식단 리스트 */
#todayFoodList{
   font-size : 16px;
   font-weight: 800; 
   margin-left: 30px;
}

/* 오늘의 식단 테이블 */
#menu {
   width: 200px;
   height: 100%;
   padding-right: 10px;
   font-size: 22px;
}
.menu th{
   height : 200px;
   border : 1px solid rgb(236, 236, 236);
}

/* 오늘의 식단 테이블 - 요일 */
.day{
   margin-top : -8px;
   font-size : 13px;
}

/* 오늘의 식단 테이블 - 요일별 메뉴 */
.dayMenu{
   width : 160px;
   height : 160px;
   font-size : 13px;
   font-weight: 100;
}

/* 오늘의 식단 div */
.todayMenu{
   cursor: pointer;
}

footer {
   display: inline-block;
    position : absolute;
    left : 0px;
   top: 1400px;
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
      <img id='banner2' src="image/5.png">
      <p class='mypage2'>식당안내<label id = 'mypage3'> : 식당이름을 클릭하여 메뉴를 확인하세요.</label></p>
      

   <!-- 각자 구현부분 -->
   <section>
      <form id = 'showCafeteria' name = 'showCafeteria'>
         <hr>
         <div id=tabs2>
            <br>
            <input type = 'hidden' name = 'listName' id = 'listName'>
            <ul class='cafeTabs' id='add'>
               <% if(cList.isEmpty()){ %>
                  <li class = 'cafe-link'>조회된 리스트가 없습니다</li>
               <% } else { %>
                  <% for(Cafeteria c : cList){ %>
                     <li class = 'cafe-link'  id = '<%= c.getCafeteriaTitle() %>' value = '<%= c.getCafeteriaTitle() %>'><%= c.getCafeteriaTitle() %></li>
                  <% } %>
               <% } %>
            </ul>
         <input type = 'hidden' name = 'place1' id = 'place1'>
         <input type = 'hidden' name = 'price1' id = 'price1'>
         
         <table id = 'cafe'>
            <tr>
               <th class = 'cafeTable'>위치</th>
               <th class = 'cafeTableInfrom' id = 'cafePlace' name = 'cafePlace'></th>
            </tr>
            <tr>
               <th class = 'cafeTable'>운영시간</th>
               <th class = 'cafeTableInfrom' id = 'cafeTime' name = 'cafeTime'></th>
            </tr>
            <tr>
               <th class = 'cafeTable'>가격</th>
               <th class = 'cafeTableInfrom' id = 'cafePrice' name = 'cafePrice'></th>
            </tr>
         </table>
         <br><br>
         </div>
          <script> 
             $(function() { 
                $('.cafeTabs').children().click(function() {
                $('.cafeTabs').children().css({ "background" : "rgb(236, 236, 236)", "color" : "black"});
                $(this).css({ "background" : "rgb(56, 103, 166)", "color" : "white"}); 
                   
                $('#listName').val($(this).text());
                    var listName= $('#listName').val();
                    
                    $.ajax({
                         url : 'detail.cafe',
                        type : 'get',
                        data : {listName:listName},
                        success : function(data) {
                       var locationC = "";
                       var timeC = "";
                       var priceC = "";
                       if(data != null){
                          locationC = data.cafeteriaLocation;
                          timeC = data.cafeteriaTime;
                          priceC = data.cafeteriaPrice;
                          
                          $('#cafePlace').text(locationC);
                          $('#cafeTime').text(timeC);
                          $('#cafePrice').text(priceC);
                          
                          $('#place1').val(locationC);
                          $('#price1').val(priceC);
                          
                       }
                    },
                    error : function(data) {
                       console.log('업데이트 서버 실패 시 호출되는 함수')
                    }
                   })
                   
                   $.ajax({
                         url : 'datail.todayMenu',
                        type : 'get',
                        data : {listName:listName},
                        success : function(data) {
                       var menuDay = "";
                     var menuName = "";
                  
                     if(data != null){
                        $('#monT').text("준비중");
                        $('#tueT').text("준비중");
                        $('#wenT').text("준비중");
                        $('#thuT').text("준비중");
                        $('#friT').text("준비중");
                        $('#satT').text("준비중");
                        
                           $('#monT').text(data.monMenu);
                           $('#tueT').text(data.tueMenu);
                           $('#wenT').text(data.wenMenu);
                           $('#thuT').text(data.thuMenu);
                           $('#friT').text(data.friMenu);
                           $('#satT').text(data.satMenu);
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
         
         <input type = 'hidden' name = 'dayOfTheWeek' id = 'dayOfTheWeek'>
         <ul id = 'todayFoodList'>
            <li>오늘의 식단 : (클릭하여 식권 구매 가능)</li>
         </ul>
            <br>
               <div id = tableMove>
               <table class = 'menu'>
                  <tr>
                     <th>
                        <div class = 'todayMenu'>
                           <div class = 'day'>
                           <p>월요일</p>
                           </div>
                           <div class = 'dayMenu'>
                           <p id = 'monT' name = 'monT'></p>
                           </div>
                        </div>
                     </th>
                     <th>
                        <div class = 'todayMenu'>
                           <div class = 'day'>
                           <p>화요일</p>
                           </div>
                           <div class = 'dayMenu'>
                           <p id = 'tueT' name = 'tueT'></p>
                           </div>
                        </div>
                     </th>
                     <th>
                        <div class = 'todayMenu'>
                           <div class = 'day'>
                           <p>수요일</p>
                           </div>
                           <div class = 'dayMenu'>
                           <p id = 'wenT' name = 'wenT'></p>
                           </div>
                        </div>
                     </th>
                     <th>
                        <div class = 'todayMenu'>
                           <div class = 'day'>
                           <p>목요일</p>
                           </div>
                           <div class = 'dayMenu'>
                           <p id = 'thuT' name = 'thuT'></p>
                           </div>
                        </div>
                     </th>
                     <th>
                        <div class = 'todayMenu'>
                           <div class = 'day'>
                           <p>금요일</p>
                           </div>
                           <div class = 'dayMenu'>
                           <p id = 'friT' name = 'friT'></p>
                           </div>
                        </div>
                     </th>
                     <th>
                        <div class = 'todayMenu'>
                           <div class = 'day'>
                           <p>토요일</p>
                           </div>
                           <div class = 'dayMenu'>
                           <p id = 'satT' name = 'satT'></p>
                           </div>
                        </div>
                     </th>
                     
                  </tr>
               </table>
               </div>
               <script>
               <% if(loginUser == null){ %>
               
               alert("로그인 필요한 서비스입니다.")
                  
               <% } else { %>
               $('.todayMenu').click(function(){
                  $('#dayOfTheWeek').val($(this).text());
                       var dayOfTheWeek= $('#dayOfTheWeek').val();
                       
                       console.log(dayOfTheWeek);
                       
                       window.open("check.todayMenu", "todayMenuCheck", "width = 500, height = 400");
                       
               })
               <% } %>
                  
               </script>
      </form>
   </section>

   <!-- 좌측 메뉴바 -->
   <aside>
      <div id='menu' class='menuDiv'>
         <ul class='menuList'>
            <li><a href='#'>대학복지</a></li>
            <li><img src="image/줄.PNG"></li>
            <li><br><a href="<%= request.getContextPath() %>/bus.wgu" class='mypageMenu'>스쿨버스</a><br><br></li>
             <li><a href="<%= request.getContextPath() %>/list.cafe" class='mypageMenu'>학식</a></li>
         </ul>
      </div>
   </aside>
   
   <footer>
   <%@ include file = "../common/foot.jsp" %>
   </footer>
   
</body>
</html>