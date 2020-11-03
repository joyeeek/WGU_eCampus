<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="wgu.member.model.vo.Member"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style>

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
   left: 1150px;
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

.cinema-wrap *{box-sizing:border-box;}
.cinema-wrap{border:1px solid white;position:relative}
.cinema-wrap>.cinema-screen{width:60%;border:1px solid gray;text-align:center;color:gray;padding:1rem;margin:auto}
@media screen and (max-width:640px){.cinema-wrap>.cinema-screen{width:90%;font-size:.75rem}}
.cinema-wrap>.cinema-seat-area{position:relative;padding:1rem!important;width:100%;margin:auto}
.cinema-wrap>.cinema-seat-area::after{content:"";display:block;clear:both}
.cinema-wrap>.cinema-seat-area>.cinema-seat{float:left;background-repeat:no-repeat;background-size:100%}
.cinema-wrap>.cinema-seat-area>.cinema-seat:not(.empty){background-image:url(http://www.sysout.co.kr/file/image/285)}
.cinema-wrap>.cinema-seat-area>.cinema-seat.active:not(.empty){background-image:url(http://www.sysout.co.kr/file/image/283)}
.cinema-wrap>.cinema-seat-area>.cinema-seat.disabled:not(.empty){background-image:url(http://www.sysout.co.kr/file/image/284)}


#title{background-color: rgb(56, 103, 166); width: 600px; height: 100px; border-radius: 10px;
margin: 50px; font-size: 50px; font-family: "맑은 고딕"; text-align: center; padding-top: 30px; font-weight: 900;
}
#booking{margin-left: 50px; font-size: 50px; font-family: "맑은 고딕"; font-weight: 600;}
#seat{margin-left:800px; margin-top: -600px;]} /* margin-top -로 좌석 위치조정 */
#head{
	background-color: rgb(56, 103, 166);
	width: 1300px;
	height: 50px;
}
#foot{
	background-color: rgb(56, 103, 166);
	width: 1300px; /* 윗 머리말 여백과 높이 */
	height: 50px;
	margin-top: -20px;
}
#holder {
	height: 300px;
	width: 600px;
	background-color: white;
	margin: 30px;
}



        .float-box > div{
            float:left;
            width:50%;
        }
        .float-box::after{
            content:"";
            display: block;
            clear:both;
        }
        







#seatDescription{
	margin-top: 30px;
}

#seatDescription li {
	verticle-align: middle;
	list-style: none outside none;
	padding-left: 35px;
	height: 35px;
	float: left;
}

 #btnShow{ 
 	background-color: rgb(135, 181, 212);
 	width: 200px; 
 	height: 50px; 
 	border-radius: 20px;
 	font-size: 25px;
 } 
 
 #nosun, #date, #busno{
 	width: 320px;
 	height: 50px;
 }
 
 #h2h2{margin-left: 20px;}
 
 #priceShow{
 	text-align: center;
  	background-color: rgb(135, 181, 212);
 	width: 200px; 
 	height: 50px; 
 	border-radius: 20px;
 	font-size: 25px;
 }
 
 #won{
 	color: blue;
 	font-size: 25px;
 }


</style>

</head>
<body>

	<header>
		<div id=head>
		
		       		   <sup class='mypageLogout1'><%= loginUser.getMemberName() %>님 환영합니다.&nbsp;&nbsp;
         </sup>
         
         
		</div>
		<div id=title><img src="image/bus3.png" width=100 height=60>&nbsp;&nbsp;스쿨버스 예약</div>
		
		
	</header>
	<br><br>
	

	<section>
		<form action="<%= request.getContextPath() %>/insert.wgu" method="post" id="joinForm" name="joinForm">
			<article id=booking>
				이용 날짜 : <input type="date" name="date" id="date" required/> 
				<br><br>
				탑승 노선 : <input type="text" name="nosun" id="nosun" class="booking" list="list1" required>
				<br><br>
				버스 번호 : <input type="text" name="busno" id="busno" list="list2" required>
			</article>
			<article id=seat>
				<h2 id="h2h2">좌석을 선택해주세요.</h2>


			<div class="float-box">
				<div>
					<div id="cinema1" class="cinema-wrap" data-name="seat">
						<div class="cinema-seat-area" data-rowsize="7" data-colsize="4" data-mode="auto"></div>
					</div>
				</div>
			</div>



				<div style="float: left;">
					<ul id="seatDescription">
						<li style="background: white; width:2.5px; height: 30px; border-radius: 20px; border: 1px solid black;">
							</li>&nbsp;좌석<br><br>

						<li style="background: #c19a6b; width:2.5px; height: 30px; border-radius: 20px;">
							</li>&nbsp;선택한 좌석
							<br>
					</ul>
					<br>
					&nbsp;&nbsp;&nbsp;<input type="text" name="priceShow" id="priceShow" value="총 결제 가격" readonly="readonly" required/><label id="won">\</label>
					&nbsp;&nbsp;&nbsp;<input type="submit" id="btnShow" value="예약하기" />
					<br><br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="hidden" id="choice" name="choice" type="text" value="선택한 좌석" readonly="readonly" required>
					<input type="hidden" id="memberNo" name="memberNo" type="text" value="<%= loginUser.getMemberNo() %>" readonly="readonly" required>
				</div>
				
				<div style="clear: both; width: 1000px;">
				</div>
				<br><br><br>
			</article>
		</form>
	</section>
	<footer>
		<div id=foot></div>
	</footer>

	<script>
	    window.addEventListener("load", function(){
	        var cinema = new Hacademy.Reservation("#cinema1");
	    });
	    
	    var price = 0;
	    
	    (function(w){
	        w.Hacademy = w.Hacademy || {};
	        w.Hacademy.util = w.Hacademy.util || {};
	        var str = [];
	        
			$('#btnShow').click(
					function() {
						$("#choice").attr("value", str.join(','));
			})
	       
	        
	        function SeatLeftClickHandler(){
	            var checkbox = this.querySelector("input[type=checkbox]");
	            if(checkbox.checked){
	                checkbox.checked = false;
	                this.classList.remove("active");
	                price-=3800;
	                $("#priceShow").attr("value", price);
	                alert(this.dataset.sendName + "번 좌석 선택이 취소되었습니다.");
	                
	            }
	            else{
	                checkbox.checked = true;
	                this.classList.add("active");
	                price+=3800;
	                $("#priceShow").attr("value", price);
	                alert(this.dataset.sendName + "번 좌석이 선택되었습니다.");
	                str.push(this.dataset.sendName);
	            }
	        }
	        function SeatRightClickHandler(e){
	            e.preventDefault();
	            switch(e.target.dataset.direction){
	                case 'up': e.target.dataset.direction = 'right'; break;
	                case 'right': e.target.dataset.direction = 'down'; break;
	                case 'down': e.target.dataset.direction = 'left'; break;
	                case 'left': e.target.dataset.direction = 'up'; break;
	            }
	        }

	        w.Hacademy.Reservation = function(area, callback){
	            if(!area) 
	                throw "영역이 정의되지 않았습니다";

	            if(typeof area === 'string')
	                area = document.querySelector(area);

	            var seatArea = area.querySelector(".cinema-seat-area");
	            if(!seatArea){
	                throw "좌석 영역이 지정되지 않았습니다(class='cinema-seat-area')";
	            }

	            var rowsize = seatArea.dataset.rowsize;
	            if(!rowsize){
	                throw "줄의 크기를 올바르게 설정하십시오";
	            }
	            var colsize = seatArea.dataset.colsize;
	            if(!colsize){
	                throw "칸의 크기를 올바르게 설정하십시오";
	            }

	            var seatAreaWidth = calculateInnerWidth(seatArea);

	            var unitSize = parseInt(seatAreaWidth / colsize);

	            var mode = seatArea.dataset.mode || 'auto';

	            var sendName = area.dataset.name || 'seat';
	            
	            var direction = area.dataset.direction || 'up';

	            this.options = {
	                area:area,
	                seatArea:seatArea,
	                rowsize:rowsize,
	                colsize:colsize,
	                seatAreaWidth:seatAreaWidth,
	                unitSize:unitSize,
	                mode:mode,
	                sendName:sendName,
	                direction:direction
	            };

	            if(mode === 'auto'){
	                this.automaticFillProcess();
	            }
	            else{
	                this.manualFillProcess();
	            }

	            var app = this;
	            w.addEventListener("resize", function(){
	                app.resize();
	            });

	            app.resize();
	        };

	        w.Hacademy.Reservation.prototype.automaticFillProcess = function(){
	            for(var i=0; i < this.options.rowsize; i++){
	                for(var j=0; j < this.options.colsize; j++){
	                    var value = i + "-" + j + "-" + this.options.direction;
	                    var seat = this.createUnit("normal");
	                    seat.dataset.direction = this.options.direction;
	                    seat.dataset.sendName = i + j * this.options.rowsize + 1;
	                    seat.setValue(value);
	                    this.options.seatArea.appendChild(seat);
	                }
	            }
	        };
	        
	        
	        w.Hacademy.Reservation.prototype.manualFillProcess = function(){
	            var rowsize = this.options.rowsize;
	            var colsize = this.options.colsize;
	            var seatArea = this.options.seatArea;
	            var cloneSeatArea = seatArea.cloneNode(true);

	            this.options.seatArea.innerHTML = "";
	            for(var i=1; i <= rowsize; i++){
	                for(var j=1; j <= colsize; j++){
	                    var findElement = cloneSeatArea.querySelector(".cinema-seat[data-row='"+i+"'][data-col='"+j+"']");
	                    if(findElement){
	                        var value = i + "-" + j;
	                        var state = findElement.dataset.state || "normal";
	                        var seat = this.createUnit(state);
	                        if(seat.setValue){
	                            seat.setValue(value);
	                        }
	                        seatArea.appendChild(seat);
	                    }
	                    else {
	                        var seat = this.createUnit("empty");
	                        seatArea.appendChild(seat);
	                    }
	                }
	            }
	        };
	        w.Hacademy.Reservation.prototype.createUnit = function(v){
	            if(v === 'empty'){
	                var seat = this.createUnit();
	                seat.classList.add("empty");
	                return seat;
	            }
	            else if(v === 'active'){
	                var seat = this.createUnit();
	                var checkbox = this.createCheckbox(true);
	                seat.appendChild(checkbox);
	                seat.classList.add("active");
	                seat.addEventListener("click", SeatLeftClickHandler);
	                seat.addEventListener("contextmenu", SeatRightClickHandler);
	                seat.setValue = function(value){
	                    var checkbox = this.querySelector("input[type=checkbox]");
	                    checkbox.value = value;
	                };
	                return seat;
	            }
	            else if(v === 'normal'){
	                var seat = this.createUnit();
	                var checkbox = this.createCheckbox();
	                seat.appendChild(checkbox);
	                seat.addEventListener("click", SeatLeftClickHandler);
	                seat.addEventListener("contextmenu", SeatRightClickHandler);
	                seat.setValue = function(value){
	                    var checkbox = this.querySelector("input[type=checkbox]");
	                    checkbox.value = value;
	                };
	                return seat;
	            }
	            else if(v === 'disabled'){
	                var seat = this.createUnit();
	                seat.classList.add("disabled");
	                return seat;
	            }
	            else{
	                var seat = document.createElement("div");
	                seat.classList.add("cinema-seat");
	                seat.style.width = this.options.unitSize+"px";
	                seat.style.height = this.options.unitSize+"px";
	                return seat;
	            }
	        };
	        
	        

	        w.Hacademy.Reservation.prototype.createCheckbox = function(check){
	            var checkbox = document.createElement("input");
	            checkbox.setAttribute("type", "checkbox");
	            checkbox.setAttribute("name", this.options.sendName);
	            checkbox.style.display = "none";
	            checkbox.checked = !!check;
	            return checkbox;
	        };

	        w.Hacademy.Reservation.prototype.resize = function(){
	            this.options.seatAreaWidth = calculateInnerWidth(this.options.seatArea);
	            this.options.unitSize = parseInt(this.options.seatAreaWidth / this.options.colsize);
	            
	            var seatList = this.options.seatArea.querySelectorAll(".cinema-seat");
	            for(var i=0; i < seatList.length; i++){
	                seatList[i].style.width = this.options.unitSize + "px";
	                seatList[i].style.height = this.options.unitSize + "px";
	            }            
	        };

	        function calculateInnerWidth(tag){
	            var style = window.getComputedStyle(tag, null);
	            var fix = 0;
	            if(style.boxSizing === 'border-box'){
	                return parseFloat(style.width) - parseFloat(style.paddingLeft) - parseFloat(style.paddingRight) - parseFloat(style.borderLeftWidth) - parseFloat(style.borderRightWidth) - fix;
	            }
	            else{
	                return parseFloat(style.width) - fix;
	            }
	        }
	    })(window);
	
	    
	</script>
</body>
</html>