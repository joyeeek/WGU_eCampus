<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="wgu.member.model.vo.Member"%>
   
<!DOCTYPE html>
<html lang = "ko">
<head>
<meta charset="UTF-8">
<title>여성시대학교 홈페이지에 오신 것을 환영합니다.</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet"> 
<style>

/* 배너부분 */
.main_1_0 {
    position : absolute; 
    left : 10px; 
    top : 154px;
    width : 1498px; 
    height : 400px;
}
              
.main_1_1 {
    display: inline-block;
    width : 120px;
    height : 400px;
    padding: 5px 10px;
    background-color: white;
    position : absolute;  
    top : -160px;
    opacity : 0.8;
}

.main_1_2 {
    display: inline-block;
    width : 120px;
    height : 400px;
    padding: 5px 10px;
    background-color: white;
    position : absolute; right: -1220px; top : -160px;
    opacity : 0.8;
}

 .main_1_4 {
    display: inline-block;
    padding: 5px 10px;
    position : absolute; right: 280px; top: -320px;
} 

.main_1_5 {
    display: inline-block;
    padding: 5px 10px;
    position : absolute; right: -1000px; top: -320px;
}


/* 섹션 : 퀵메뉴 */
.display1{display: inline-block;
    width : 170px;
}

.display21{display: inline-block;
    width : 160px;
    height : 150px;
    border : 1px solid #ECECEC;
    position : absolute;
    top : 625px;
    left : 180px;
}

.display22{display: inline-block;
    width : 160px;
    height : 150px;
    border : 1px solid #ECECEC;
    position : absolute;
    top : 625px;
    left : 350px;
}

.display23{display: inline-block;
    width : 160px;
    height : 150px;
    border : 1px solid #ECECEC;
    position : absolute;
    top : 625px;
    left : 520px;
}

.display24{display: inline-block;
    width : 160px;
    height : 150px;
    border : 1px solid #ECECEC;
    position : absolute;
    top : 790px;
    left : 180px;
}

.display25{display: inline-block;
    width : 160px;
    height : 150px;
    border : 1px solid #ECECEC;
    position : absolute;
    top : 790px;
    left : 350px;
}

.display26{display: inline-block;
    width : 160px;
    height : 150px;
    border : 1px solid #ECECEC;
    position : absolute;
    top : 790px;
    left : 520px;
}

.quickLabel1{
    position : absolute;
    left : 3px;
    width : 100px;
    height : 30px;
    padding : 100px 46px;
    font-weight : bold;
}

.quickLabel2{
    position : absolute;
    width : 100px;
    height : 30px;
    padding : 100px 46px;
    font-weight : bold;
}

.quickLabel3{
    position : absolute;
    width : 100px;
    height : 30px;
    padding : 100px 46px;
    font-weight : bold;
}

.quickLabel4{
    position : absolute;
    width : 100px;
    height : 30px;
    padding : 100px 46px;
    font-weight : bold;
}

.quickLabel5{
    position : absolute;
    width : 100px;
    height : 30px;
    padding : 100px 46px;
    font-weight : bold;
}

.quickLabel6{
    position : absolute;
    width : 100px;
    height : 30px;
    padding : 100px 46px;
    font-weight : bold;
}

.quickMenu1{
    position : absolute;
    width : 80px;
    height : 80px;
    padding : 20px 40px;
}

.quickMenu2{
    position : absolute;
    width : 80px;
    height : 80px;
    padding : 20px 40px;
}

.quickMenu3{
    position : absolute;
    width : 80px;
    height : 80px;
    padding : 20px 40px;
}

.quickMenu4{
    position : absolute;
    top : 15px;
    width : 75px;
    height : 55px;
    padding : 20px 40px;
}

.quickMenu5{
    position : absolute;
    width : 80px;
    height : 80px;
    padding : 20px 40px;
}

.quickMenu6{
    position : absolute;
    width : 80px;
    height : 80px;
    padding : 20px 40px;
}





/* 섹션 : 공지사항 */
.div10 {
    position : absolute; 
    top : 622px;
    left : 750px;
    border : 2px solid #ECECEC;
    width : 615px;
    height : 320px;
} 

.info1{
    position : absolute;
    font-size : 20px;
    text-color : gray;
    font-weight : bold;
}

.info2{
    position : absolute;
    top : 30px;
    left : 360px;
    font-size : 30px;
    text-color : gray;
    border : none;
    background-color : white;
    margin : 0px 200px; 
}

.infoLabel1{
    position : absolute;
    top : 50px;
}

/* 공지사항 목록가져오기 */
#notice{position: relative; top: 50px; height: 225px;}
.noticelist{position: relative; left: 0px; list-style: none; }
.n_title{height: 25px; position: relative; left: -10px; overflow: hidden; text-overflow:ellipsis;}
.n_hr{width: 550px; position: relative; top: 0px; left: -25px; border-color:rgb(224, 224, 224, 0.5);}






/* 섹션 : 학사일정 */
.calendar_0_1{
    display: inline-block;
    position : absolute;
    width : 50px;
}

.calendar_0_2{
    display: inline-block;
    width : 1185px;
    position : absolute;
    top : 1020px;
    left : 180px;
    height : 450px;
    border : 2px solid #ECECEC;
}

.calendarLabel2{
    position : absolute;
    font-size : 20px;
    text-color : gray;
    font-weight : bold;
}

.infoLabel3{
    position : absolute;
    top : 50px;
}

#beforCList, #nowCList, #afterCList{
    position: absolute; 
    width: 375px; 
    height: 350px; 
    border:2px solid #a5dfec;
    border-radius: 4px; 
    top: 85px;
}

#beforCList{ left: 15px; }
#nowCList{ left: 405px; }
#afterCList{ left: 795px; }
#bMonth, #aMonth{
   font-size: 15px; font-weight: bold;
   height: 30px; text-align: center; padding-top: 10px;
   
}
#nMonth{
   font-size: 20px; font-weight: bold;
   height: 35px; text-align: center; padding-top: 5px;
}
#bMList, #nMList, #aMList{
   border: 1px solid lightgray; width: 365px; height: 300px;
   position: relative; left: 4px; overflow-y:scroll; border-radius: 4px;
}


.list_b,.list_n,.list_a{
   background: rgba(214, 214, 214, 0.7); width: 330px;
   position: absolute; left: 9px; top: 10px; margin-bottom: 10px;
   min-height: 70px; border-radius: 4px;
}

.date_b,.date_n,.date_a{
   background:none; border:none;
   height: 30px; min-width: 150px; 
   font-weight: bold; font-size: 18px;
   position: relative; left: 10px;
}
.title_b,.title_n,.title_a{
   background:none; width: 305px; 
   overflow: hidden; height: 20px; 
   border: none; position: relative; 
   left: 10px; top: 5px;
}





/* 헤더, 섹터, 풋터 */
header {
height : 550px;
}

section {
height : 850px;
}

footer{
   display: inline-block;
    position : absolute;
    left : 0px;
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
             
       <div class="main_1_1" style = "position : relative; z-index : 3;"></div>
       <div class="main_1_2" style = "position : relative; z-index : 3;"></div>
       <img src = "image/왼쪽버튼.png"  class="main_1_4" width = "80px" height = "80px" style = "position : relative;  z-index : 3; cursor: pointer;">
       <img src = "image/오른쪽버튼.png"  class="main_1_5" width = "80px" height = "80px" style = "position : relative; z-index : 3; cursor: pointer;">               
       <img src = "image/1.png" class="main_1_0" id="main_1_0" style = "position : relatice; z-index : 1;"> 
         
         <script>
               var mainImage = document.getElementById('main_1_0');
               var imgArray = ["image/4.png","image/3.png","image/1.png"];
               var imageIndex = 0;
                    
               function changeImage(){
                  mainImage.setAttribute("src",imgArray[imageIndex]);
                  imageIndex++;
                  if(imageIndex >= 3){
                     imageIndex = 0;
                  }
               }
               setInterval(changeImage,4000);
               
                  $('.main_1_4').on('click',function(){
                      imageIndex++;
                      if(imageIndex >= 3){
                    	  imageIndex = 0;
                      }
                     changeImage();
                   });
                  
                 $('.main_1_5').on('click',function(){
                    imageIndex++;                    
                   if(imageIndex >= 3){
                      imageIndex = 0;
                   }
                   changeImage();
                 });
               
         </script>
             
<section>                
<br><br><br>   
       <div id="display1" class = "display1"></div>
       
       <div id = "display21" class = "display21" >
       <img src ="image/수강신청.JPG" class = "quickMenu1" id="quickMenu1" style="cursor:pointer;">
       <label class = "quickLabel1" id="quickLabel1" style="cursor:pointer;">수강신청</label>
       </div>      
       <div id = "display22" class = "display22">
       <img src ="image/성적.JPG" class = "quickMenu2" id="quickMenu2" style="cursor:pointer;">
       <label class = "quickLabel2" id="quickLabel2" style="cursor:pointer;">성적조회</label>
       </div>       
       <div id = "display23" class = "display23">
       <img src ="image/강의평가.JPG" class = "quickMenu3" id="quickMenu3" style="cursor:pointer;">
       <label class = "quickLabel3" id="quickLabel3" style="cursor:pointer;">강의평가</label>
       </div>      
       <br><br>
       <div id="display1" class = "display1"></div>
       <div id = "display24" class = "display24">
       <img src ="image/bus3.png" class = "quickMenu4" style="cursor:pointer;" onclick="goBus();">
       <label class = "quickLabel4" style="cursor:pointer;" onclick="goBus();">스쿨버스</label>
       </div>       
       <div id = "display25" class = "display25">
       <img src ="image/학식.JPG" class = "quickMenu5" style="cursor:pointer;" onclick="goFood();">
       <label class = "quickLabel5" style="cursor:pointer;" onclick="goFood();">학식메뉴</label>
       </div>
       <div id = "display26" class = "display26">
       <img src ="image/커뮤니티.JPG" class = "quickMenu6" style="cursor:pointer;" onclick="goBoard();">
       <label class = "quickLabel6" style="cursor:pointer;" onclick="goBoard();">커뮤니티</label>
       </div>
       
       <div id ="div10" class = "div10">
       <label class="info1"><br>&nbsp;&nbsp;&nbsp;&nbsp;공지사항</label>
       <button class="info2">+</button><br>    
       <label class = "infoLabel1">&nbsp;&nbsp;&nbsp;&nbsp;___________________________________________________________________________________</label>
       <div id=notice>
                <ul class=noticelist>
                   <li>공지사항이 없습니다</li>
                </ul>
             </div>
       </div> 
       <br><br><br><br>
       
       <div id = "calendar" class = "calendar_0_1">
       <label></label>
       </div>
       <div id = "calendar" class = "calendar_0_2">
       <label class = "calendarLabel2"><br>&nbsp;&nbsp;&nbsp;&nbsp;학사일정</label><br>
       <label class = "infoLabel3">&nbsp;&nbsp;&nbsp;&nbsp;_______________________________________________________________________________________________________________________________________________________________________</label>
       <div id="beforCList">
          <div id="bMonth"></div>
          <div id="bMList">
             <div class="list_b">
                <input class="date_b" value="등록된 학사일정이 없습니다" disabled><br>
                <input class="title_b" value="" disabled>
             </div>
          </div>
       </div>
       <div id="nowCList">
        <div id="nMonth"></div>
        <div id="nMList">
             <div class="list_n">
                <input class="date_n" value="등록된 학사일정이 없습니다" disabled><br>
                <input class="title_n" value="" disabled>
             </div>
        </div>
       </div>
       <div id="afterCList">
        <div id="aMonth"></div>
        <div id="aMList">
           <div class="list_a">
              <input class="date_a" value="등록된 학사일정이 없습니다" disabled><br>
                <input class="title_a" value="" disabled>
           </div>
        </div>
       </div>
       </div>
       <br><br><br><br><br><br>
</section>
<footer>       
<%@ include file = "../common/foot.jsp" %>
</footer>
<script>   

$('#quickMenu1').on('click',function(){  
    var app = $('#btn1').val();
    var adm = $('#memberId').val();
	  if(app=="로그인"){
		  alert("수강신청은 로그인 후 이용가능합니다");
	  } else if(adm=="admin"){
		  alert("수강신청은 학생만 이용가능합니다");
	  } else {
		  location.href="<%= request.getContextPath() %>/applySubject.su"; 
	  }        	  
});

$('#quickLabel1').on('click',function(){  
    var app = $('#btn1').val();
    var adm = $('#memberId').val();
	  if(app=="로그인"){
		  alert("수강신청은 로그인 후 이용가능합니다");
	  } else if(adm=="admin"){
		  alert("수강신청은 학생만 이용가능합니다");
	  } else {
		  location.href="<%= request.getContextPath() %>/applySubject.su"; 
	  }        	  
});
   
$('#quickMenu2').on('click',function(){
	  var app = $('#btn1').val();
	  var adm = $('#memberId').val();
	  if(app=="로그인"){
		  alert("성적조회는 로그인 후 이용가능합니다");
	  } else if(adm=="admin"){
		  alert("성적조회는 학생만 이용가능합니다");
	  } else {
		  location.href="<%= request.getContextPath() %>/checkStu.gr"; 
	  }        	  
});

$('#quickLabel2').on('click',function(){
	  var app = $('#btn1').val();
	  var adm = $('#memberId').val();
	  if(app=="로그인"){
		  alert("성적조회는 로그인 후 이용가능합니다");
	  } else if(adm=="admin"){
		  alert("성적조회는 학생만 이용가능합니다");
	  } else {
		  location.href="<%= request.getContextPath() %>/checkStu.gr"; 
	  }        	  
});

$('#quickMenu3').on('click',function(){
	   var app = $('#btn1').val();
	   var adm = $('#memberId').val();
	  if(app=="로그인"){
		  alert("강의평가는 로그인 후 이용가능합니다");
	  } else if(adm=="admin"){
		  alert("강의평가는 학생만 이용가능합니다");
	  } else {
		  location.href="<%= request.getContextPath() %>/insertEvaluation.ev"; 
	  }        	  
});

$('#quickLabel3').on('click',function(){
	   var app = $('#btn1').val();
	   var adm = $('#memberId').val();
	  if(app=="로그인"){
		  alert("강의평가는 로그인 후 이용가능합니다");
	  } else if(adm=="admin"){
		  alert("강의평가는 학생만 이용가능합니다");
	  } else {
		  location.href="<%= request.getContextPath() %>/insertEvaluation.ev"; 
	  }        	  
});

   function goBoard(){
      location.href="<%= request.getContextPath() %>/BulletinList.bu";
   }
   
   function goBus(){
	      location.href="<%= request.getContextPath() %>/bus.wgu";
	}
   
   function goFood(){
	      location.href="<%= request.getContextPath() %>/list.cafe";
	}
   
   // +버튼 누르면 공지사항으로 넘어가기
   $(".info2").click(function(){
      location.href="<%= request.getContextPath() %>/NoticeList.nr";
   });
   
   // 공지사항 가져오기
   var noticelist = $("ul[class=noticelist]");
   
   $.ajax({
      url: "PreviewNotice",
      type: "post",
      dataType: "json",
      success: function(data){
         if(data != null){
            
            $(noticelist).html("");
            
            
            for(var i = 0; i < data.length; i++){
               
               var title = data[i].noticeTitle;
               var nNo = data[i].noticeNo;
               
               var li = $("<li class=n_title>").html(title).css({"width":"540px"});
               var hr = $("<hr class=n_hr>");
               
               $(noticelist).append(li);
               $(noticelist).append(hr);
               
               $(".n_title").mouseenter(function(){
                   $(this).css({"cursor":"pointer"});
               }).click(function(){      
               
                  location.href="<%= request.getContextPath() %>/NoticeDetail.nr?nNo=" + nNo;
                  
               });
               
            }
            
         } else {
            
            var li = $("<li class=n_title>").html("공지사항이 없습니다.");
            
         }
      }
   });
   
   // 일정
   
   //1. 월계산
   
   var date = new Date();
   var year = new Date().getFullYear();
   var nMonth = ("0" + ((date.getMonth()+1)%12 )).slice(-2);// 현재월
   var bMonth = ("0" + ((date.getMonth()+1)%12 - 1)).slice(-2); // 이전월
   var aMonth = ("0" + ((date.getMonth()+1)%12 + 1)).slice(-2); // 다음월
   
   console.log(bMonth);
   console.log(nMonth);
   console.log(aMonth);
   
   $("#bMonth").html(year + "년 " + bMonth + "월");
   $("#nMonth").html(year + "년 " + nMonth + "월 일정");
   $("#aMonth").html(year + "년 " + aMonth + "월");
   
   // 2. 달별로 일정가져오기
   // 2-1. 전달 일정 가져오기
   $.ajax({
      url: "beforeSelectSchedule.sc",
      type: "post",
      dataType: "json",
      data : {bMonth:bMonth, year:year},
      success: function(data){   
         if(data != ""){
            var divList = $("div[id=bMList]");
            $("div [class=list_b]").remove();
            
            for(var i = 0; i < data.length; i++){
               var div = $("<div class=list_b>").css("position","relative");
               var date = $("<input class=date_b disabled>").val(data[i].scheduleDate);
               var title = $("<input class=title_b disabled>").val(data[i].scheduleTitle);
               
               
               div.append(date);
               div.append(title);
               divList.append(div);
            } 
         } 
      }
   });
   
   // 2-2. 이번달 일정 가져오기
   $.ajax({
      url: "nowSelectSchedule.sc",
      type: "post",
      dataType: "json",
      data : {nMonth:nMonth, year:year},
      success: function(data){   
         if(data != ""){
            var divList = $("div[id=nMList]");
            $("div [class=list_n]").remove();
            
            for(var i = 0; i < data.length; i++){
               var div = $("<div class=list_n>").css("position","relative");
               var date = $("<input class=date_n disabled>").val(data[i].scheduleDate);
               var title = $("<input class=title_n disabled>").val(data[i].scheduleTitle);
               
               
               div.append(date);
               div.append(title);
               divList.append(div);
            } 
         } 
      }
   });
   
   // 2-3. 다음달 일정 가져오기
   $.ajax({
      url: "afterSelectSchedule.sc",
      type: "post",
      dataType: "json",
      data : {aMonth:aMonth, year:year},
      success: function(data){   
         if(data != ""){
            var divList = $("div[id=aMList]");
            $("div [class=list_a]").remove();
            
            for(var i = 0; i < data.length; i++){
               var div = $("<div class=list_a>").css("position","relative");
               var date = $("<input class=date_a disabled>").val(data[i].scheduleDate);
               var title = $("<input class=title_a disabled>").val(data[i].scheduleTitle);
               
               
               div.append(date);
               div.append(title);
               divList.append(div);
            } 
         } 
      }
   });
  
   </script>

</body>
</html>