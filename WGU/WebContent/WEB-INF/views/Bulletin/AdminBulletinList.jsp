<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, wgu.bulletin.model.vo.*, wgu.member.model.vo.*" %>
<%
   ArrayList<Bulletin> bList = (ArrayList<Bulletin>)request.getAttribute("bList");
   PageNum bp = (PageNum)request.getAttribute("bp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여성시대학교 - 관리자(익명게시판관리)</title>
<script src="js/jquery-3.5.1.min.js"></script>
<style>
@media screen and (min-width: 480px) {
background-color: lightgreen;
}
   
   #banner{
   position: absolute;
   top: 160px;
   left: 0px;
   width: 1519.5px;
   height: 240px;
   display: inline-block;
   }
   
   .mypage{
   position: absolute;
   top: 435px;
   left: 310px;
   font-weight: 800;
   font-size: 48px;
   width: 500px;
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
      
   /* 세션시작 */
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
   
   
   /* 각자 구현 내용*/
   section {
   position: absolute;
   top: 700px;
   left: 300px;
   background: white;
   height: 1000px;
   }
   
   #contentLine { 
   margin-top: -17px;
   background-color: rgba(0, 0, 0, 0.3);
   height: 1px;
   border: 0;
   margin-left: 413px;
   } 
   
   
   /* 게시판관리 - 전체게시판탭 */
   .tab-content.current {
   /* 상위 요소의 display속성을 받는다 */
   display: inherit;
   }
   
   /* 전체게시판 보기 */
   #board{
   border-bottom: 1px solid black;
   border-collapse: collapse; /* th,tr,td하고 table간격하고 없애기(한줄만들기) */
   width: 95%;
   margin-left: 29px;
   }
   
   #board>th,tr,td{
   border-bottom: 2px solid rgb(224, 224, 224);
   text-align: center;
   }
   
   .b_th{
   padding-left: 10px;
   padding-top: 5px;
   padding-bottom: 5px;
   height: 50px;   
   background: lightgray;/* 수정해야함 */
   border-bottom: 2px solid rgb(224, 224, 224);
   }
   
   #b_box{ padding-left: 6px; }
   
   .b_td{
   padding-top: 10px;
   padding-bottom: 10px;
   height: 40px;
   background: rgb(255, 255, 255);   
   }
   
   #b_num{
   padding-right: 25px;
   padding-left: 25px;
   }
   
   /* 제목 */
   #b_title{padding-right: 200px; padding-left: 200px;}
   /* 작성자 */
   #b_writer{padding-right: 50px; padding-left: 50px;}
   /* 작성일 */
   #b_date{padding-right: 30px; padding-left: 30px;}
   /* 조회수 */
   #b_see{padding-right: 25px; padding-left: 25px;}
   
   /* 전체 버튼 */
   #b_button{position: relative; left: 20px;}
   
   /* 게시글 삭제 */
   #delete_b{
   margin-left: 10px; margin-top: 10px;
   padding-left: 10px; padding-right: 10px; 
   padding-top: 5px; padding-bottom: 5px; 
   border: none; background: rgb(94, 94, 94);
   border-radius: 6px; color: white;}
      
   /* 게시글쓰기 */
   #writer_b{
   margin-left: 950px;
   padding-left: 10px; padding-right: 10px; 
   padding-top: 5px; padding-bottom: 5px; 
   border: none; background: rgb(94, 94, 94);
   border-radius: 6px; color: white;}
   
   
   /* 페이지 갯수 */
   .b_paging{
   list-style: none; position: relative; left: 430px; top: 15px; width : 300px;}
   
   .b_pagingnum{
   display: inline-block; margin-right: 4px;
   width: 30px; height: 25px; text-align: center;
   padding-top: 3px; padding-bottom: 3px;
   border-radius: 6px; background: rgb(236,236,236);/* 선택되면 rgba(56,103,166,0.56) */}
   
   .link{border:none; display: inline-block; margin-right: 4px;
   width: 30px; height: 30px; text-align: center;
   padding-top: 3px; padding-bottom: 3px;
   border-radius: 6px; background: rgb(236,236,236);}
   
   
   #research{position: relative; top: 50px; left: 450px; width : 500px;}
   #r_text{width: 290px; height: 25px; border: 1px solid gray; border-radius: 4px;}
   #r_button{width: 53px; height: 30px; 
   background: rgb(94, 94, 94); color: white; border: none;
   border-radius: 4px; position: relative; top: 1px;}
   
   
   
   /* 큰 탭 부분 : 전체게시판, 공지사항등록 */
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
   
   .tab-content {display: none;}
   
   #hak { background: white; border-bottom-color: white; }
   
   footer {
   display: inline-block;
    position : absolute;
    left : 0px;
   top: 1845px;
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
        <img id='banner' src="image/6.jpg">
      <div id='mypageDiv' class="mypageDiv">
         <p class='mypage'>익명게시판 관리페이지</p>
      </div>
      <br>
      </div>
      <div id = 'content'>
      
      <ul class='tab'>
         <li class='tab1' id='hak' onclick="">익명게시판</li>
         <li class='tab2'>공지사항</li>
      </ul>
   
      <hr id='contentLine'>
   
      <!-- 익명게시판 -->
      <div id="tab-1" >
      <br>
         <!-- 전체게시판탭 안에 div -->
         <div>
         
         
         <form>
            <div id=b_button>
               <input type="button" name=b_delete id=delete_b value="삭제하기" style="cursor: pointer;">
               <input type="button" id="writer_b" value="게시글 쓰기" onclick="location.href='<%= request.getContextPath() %>/BulletinWriter.bu'" style="cursor: pointer;">   
            </div>
            
            <br>
            
            <div>
            <table id=board>
               <tr>
                  <th id=b_check class=b_th><input name="b_checkAll" id="b_checkAll" type="checkbox"></th>
                  <th id=b_num class=b_th>번호</th>
                  <th id=b_title class=b_th>제목</th>
                  <th id=b_writer class=b_th>작성자</th>
                  <th id=b_date class=b_th>작성일</th>
                  <th id=b_see class=b_th>조회수</th>
               <tr>
               <% if(bList.isEmpty()) { %>
               <tr>
               <td class=b_td colspan="6">등록된 게시물이 없습니다.</td>
               </tr>
               <% } else { %>
                  <% for(int i =0; i<bList.size(); i++) { %>
                  <tr class="b_contentList2">
                     <th id=b_box><input class="check_b" name="bNo" type="checkbox" value="<%= bList.get(i).getBulletinNo() %>"></th>
                     <td class=b_td><input type="hidden" class="bNo" id="bNo" value="<%= bList.get(i).getBulletinNo() %>"><%= bList.get(i).getBulletinNo() %></td>
                     <td class=b_td style="overflow: hidden; text-overflow:ellipsis;"><%= bList.get(i).getBulletinTitle() %></td>
                     <td class=b_td><input type="hidden" value="<%= bList.get(i).getMemberNo() %>">익명</td>
                     <td class=b_td><%= bList.get(i).getBulletinDate() %></td>
                     <td class=b_td><%= bList.get(i).getBulletinCount() %></td>
                  </tr>
                  <% } %>
               <% } %>
            </table>
               
            <br>
            
            </div>
            
            </form>
         
         
         
            <!-- 페이지갯수넘버링 -->
            <div id='b_paging'>
            <ul class="b_paging">
               <li class=b_pagingnum>
               <button onclick="location.href='<%= request.getContextPath() %>/AdminList.bu?bCurrentPage=1'" class=link>&lt;&lt;</button>
               </li>
               <li class=b_pagingnum>
               <button onclick="location.href='<%= request.getContextPath() %>/AdminList.bu?bCurrentPage=<%= bp.getCurrentPage() - 1 %>'" id= "beforeB" class=link>&lt;</button>
               </li>
               <% for(int bn = bp.getStartPage(); bn<=bp.getEndPage(); bn++ ) { %>
               <% if(bn == bp.getCurrentPage()) { %>
               <li class=b_pagingnum>
               <button class="link" disabled style="background: rgba(56,103,166,0.56); color:white;"><%= bn %></button>
               </li>
               <% } else { %>
               <li class=b_pagingnum>
               <button class="link" onclick="location.href='<%= request.getContextPath() %>/AdminList.bu?bCurrentPage=<%= bn %>'"><%= bn %></button>
               </li>
               <% } %>
               <% } %>
               <li class=b_pagingnum>
               <button onclick="location.href='<%= request.getContextPath() %>/AdminList.bu?bCurrentPage=<%= bp.getCurrentPage() + 1 %>'" id="afterB" class=link>&gt;</button>
               </li>
               <li class=b_pagingnum>
               <button onclick="location.href='<%= request.getContextPath() %>/AdminList.bu?bCurrentPage=<%= bp.getMaxPage() %>'" class=link>&gt;&gt;</button>
               </li>
            </ul>
            </div>
         </div>
      
      <!-- 익명게시판script -->
      <script>
      
      // 페이징
      if(<%= bp.getCurrentPage() <= 1 %>){
      var before = $("#beforeB");
      before.attr("disabled", "true");
      }   

      if(<%= bp.getCurrentPage() <= bp.getMaxPage() %>){
         var after = $("#afterB");
         
         after.attr('disabled', 'true');
      }
      

      // 익명게시물들어가기
      $("#board td").mouseenter(function(){
         $(this).parent().children("td").css({"background":"lightgray","cursor":"pointer"});
      }).mouseout(function(){
         $(this).parent().children("td").css("background","none");
      }).click(function(){
         var bNo = $(this).parent().children("td").children("input").val();
         
         
         location.href="<%= request.getContextPath() %>/AdminBulletinDetail.bu?bNo="+bNo;
      });

      
      
      
      $(function(){
         
         // 체크박스 전체선택
         $("#b_checkAll").click(function(){
            if($("#b_checkAll").prop("checked")){
               $(".check_b").prop("checked", true);
            } else {
               $(".check_b").prop("checked", false);
            }
         });
   
   
         // 체크박스 하나라도 풀리면 전체도 풀리게
          $(".check_b").click(function(){
            if($("input[class=check_b]:checked").length < 5){
               $("#b_checkAll").prop("checked", false);
            } else {
               $("#b_checkAll").prop("checked", true);
            }
         });
         
         
         
         
         
         
          // 선택삭제
         $("#delete_b").click(function(){
            console.log("length : " + $("input[class=check_b]:checked").length);
                        
            
             // 체크된 체크박스에서 값가져오기
            var checkbox = $("input[class=check_b]:checked").length;
            var bList = new Array();
            
            var checked = confirm("삭제하시겠습니까?");
            
            var i = 0;
            for(i = 0; i<checkbox; i++){
               var num = $("input[class=check_b]:checked").eq(i);
               bList[i] = $(num).val();
               
            }
                     
            if(checked == true){
               jQuery.ajaxSettings.traditional = true;
               $.ajax({
                  url: "AdminBDelete.bu",
                  data:{bList:bList},
                  type: "post",
                  success: function(data){
                     alert("게시글이 삭제되었습니다");
                     location.reload();
                  }
                  
               });
            } else {
               alert("취소하셨습니다");
            }
         });
            
          
          
       
      });
      
      
      
      
      
      // 탭누르면 이동
       $(".tab2").click(function(){
           $.ajax({
             url: "AdminNoticeList.nr",
             success: function(data){
                location.href='<%= request.getContextPath() %>/AdminNoticeList.nr';
             }
          });
       });    
       
       $(".tab1").click(function(){
           $.ajax({
             url: "AdminList.bu",
             success: function(data){
                location.href='<%= request.getContextPath() %>/AdminList.bu';
             }
          });
          
          
       });
      
         
      </script>
      
      <!-- 검색창 -->
      <div id="research">
         
         <input type="text" id="r_text" name="r_text">
         <input type="button" id="r_button" value="검색">
      
      </div>
      
         
      </div><!-- 익명게시판 div -->
      
      <script>
         // 검색기능
         $("#r_button").click(function(){
            var text = $("#r_text").val();
            
            console.log(text);
            
            $.ajax({
               url: "AdminList.bu",
               data: {text:text},
               dataType : "json",
               success: function(data){
                  
                  
                  $(".b_contentList2").html("");
                  
                  
                  
                  // 검색한 글자가 없으면
                  if(text.length == 0){
                     
                     $(".searchBulletin").html("");
                     
                     tr = $("<tr class=searchBulletin>");
                     td = $("<td colspan=6>").html("검색된 게시글이 없습니다").css({"padding-top":"10px","padding-bottom":"10px","height":"40px","background":"rgb(255, 255, 255)"});
                     $(tr).append(td);
                     $("#board").append(tr);
                     
   
   
                  } else {
                     
                     $(".searchBulletin").html("");
                     
                     
                     
                     for(var i = 0; i < data.length; i++){
                        
                        console.log(data[i].bulletinTitle);
                        
                        tr = $("<tr class=searchBulletin>");
                        checkbox = $("<th>").append($("<input type=checkbox>")).css({"padding-top":"10px","padding-bottom":"10px","height":"40px","background":"rgb(255, 255, 255)"});
                        no = $("<td id=b_No>").html(data[i].bulletinNo);
                        title = $("<td>").html(data[i].bulletinTitle);
                        member = $("<td>").html("익명");
                        date = $("<td>").html(data[i].bulletinDate);
                        count = $("<td>").html(data[i].bulletinCount);
                        
                        
                        $(tr).append(checkbox);
                        $(tr).append(no);
                        $(tr).append(title);
                        $(tr).append(member);
                        $(tr).append(date);
                        $(tr).append(count);
                        $("#board").append(tr);
                     
                     }
                     
                     $(".searchBulletin").mouseenter(function(){
                         $(this).children("td").css({"background":"lightgray","cursor":"pointer"});
                     }).mouseout(function(){
                        $(this).children("td").css("background","none");
                     }).click(function(){      
                        
                        var bNo = $("#b_No").html();
                        console.log(bNo);
                        
                        
                        location.href="<%= request.getContextPath() %>/AdminBulletinDetail.bu?bNo="+bNo;
                     });
                     
                     
                     
                  }
                  
               }
            });
         });
      </script>
   
   
   
   
      
      
      </div> 
      <!-- section 전체 div -->

         
         
         
      <!-- 각 탭에 script -->
      
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