<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="wgu.bus.model.vo.*, java.sql.Date"%>
<%
	Bus bus = (Bus)request.getAttribute("bus");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#head{width: 1000px; height: 50px; background-color: rgb(56, 103, 166);}
	#foot{width: 1000px; height: 50px; background-color: rgb(56, 103, 166);}
	#title{background-color: rgb(56, 103, 166); width: 600px; height: 100px; border-radius: 10px;
margin-top: 50px; margin-left: 190px; font-size: 50px; font-family: "맑은 고딕"; text-align: center; padding-top: 30px; font-weight: 900;
}
	p{margin-left: 350px; font-family: "맑은 고딕"; font-size: 20px; font-weight: 800}
	#go{float: left; margin-left: 150px; font-size: 30px; font-family: "맑은 고딕"; font-weight: 800}

	
	#stamp{margin-top: -80px; margin-left: -100px; height: 200px; width: 200px;}
	
	#buttoon{margin-left: 1000px;}
</style>
</head>
<body>

<header>
	<div id=head></div>
</header>

<section>
	<article>
	<div id=title><img src="image/bus3.png" width=100 height=60>&nbsp;&nbsp;스쿨버스 예약 완료</div>
	<br><br>
	
	<p>버스 번호 : <%= bus.getBusNo() %> </p>
	<br><br>
	
	<p>이용 시간 : <%= bus.getBusDate() %> </p>
	<br><br>
	
	<p>노선 : <%= bus.getBusLine() %></p>
	<br><br>
	
	<p>좌석 : <%= bus.getBusSeat() %></p> 
	<br><br>
	
	<p>가격 : <%= bus.getBusPrice() %></p> 
	<br><br>
	
	<span id='go'>여성시대학교 스쿨버스를 이용해주셔서 감사합니다.</span>
	<img id="stamp" src="image/도장.png">
	<br>
	<br>
	<input type="button" value="메인페이지로 이동하기" onclick="mainpage();">
	<br>
	
	</article>
</section>

<footer>
	<div id=foot></div>
</footer>
<script>
	function mainpage(){
		location.href="<%= request.getContextPath() %>/mainpage.wgu";
	}
</script>

</body>
</html>