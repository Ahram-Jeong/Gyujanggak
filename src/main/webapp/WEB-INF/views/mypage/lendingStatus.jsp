<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대출현황</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/style.css" />

<style>
.sidebar{
	float: left;
	width: 25%;
}
.mainContent {
	margin-left: 15%;
	margin-right: 15%;
	margint-bottom: 15%;
	vertical-align: middle;
	justify-content: center;
	width : 85%;
	display: grid;
}
#mainTitle{
	color : #656379;
	text-align : center;
}
#book-count{
	border-bottom : 1px solid gray;
	font-size : 1.1em;
}
.card{
	width : 700px;
	/*height : 250px;*/
	border-bottom : 1px solid;
}
.photo{
	width : 25%;
	float: left;
	border : 0.5px solid;
	margin : 2%;
}
.description{
	width : 65%;
	float: left;
	margin-left : 2%;
	margin-top : 2%;
}
.btn-area{
	text-align : right;
}

.review{
	margin : 1%;
}
#review{
	float : right;;
}
.starRev{
	float : right;
	margin : 1%;
}
.starR1{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -52px 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR2{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR1.on{background-position:0 0;}
.starR2.on{background-position:-15px 0;}

</style>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
	<section>
		<!-- 사이드메뉴 -->
		<aside class="sidebar">
			
		</aside>

		<!-- 내용 -->
		<article class="mainContent">
			<!-- 타이틀 --><br>
			<h2 id="mainTitle">
				<b>대출 현황</b>
			</h2>
			<br><br><br>
			<div id="book-count">
				<p><span>4</span> 권의 책이 있습니다.</p>
			</div>
			
			<!-- 본문 -->
			<br> <br>
			<div class="card">
				<div class="photo">
					<img src="https://s-media-cache-ak0.pinimg.com/236x/3b/36/ca/3b36ca3afe0fa0fd4984b9eee2e154bb.jpg" width="160px" height="220px">
				</div>
				<div class="description">
					<h3>달러구트 꿈 백화점</h3>
					<p><span>팩토리나인</span>&nbsp;|&nbsp;<span>이미예</span>&nbsp;|&nbsp;<span>2021.07.27</span></p>
					<br>	
					<p>대출일 : 2021-10-20</p>
					<p>반납예정일 : 2021-10-20</p>
					<br>
						<div class="btn-area">
							<button class="btn btn-success ">연장하기</button>
<!-- 						<button class="btn btn-info">서평보기</button>
							<button class="btn btn-info">서평쓰기</button> -->
					</div>
				</div>
				<div class="review">
					<textarea id="review" rows="7" cols="92" placeholder="내용을 입력해주세요"></textarea>
					<div class="starRev">
						<span class="starR1 on">별1_왼쪽</span> <span class="starR2">별1_오른쪽</span>
						<span class="starR1">별2_왼쪽</span> <span class="starR2">별2_오른쪽</span>
						<span class="starR1">별3_왼쪽</span> <span class="starR2">별3_오른쪽</span>
						<span class="starR1">별4_왼쪽</span> <span class="starR2">별4_오른쪽</span>
						<span class="starR1">별5_왼쪽</span> <span class="starR2">별5_오른쪽</span>
						 <br> <br>
						<div class="btn-area">
							<button class="btn btn-info btn-sm">등록</button>
						</div>	
					</div>
			</div>
			</div>

		</article>

		<br>
		<br>

	</section>

<jsp:include page="../common/footer.jsp"></jsp:include>

<script>
$('.starRev span').click(function(){
	  $(this).parent().children('span').removeClass('on');
	  $(this).addClass('on').prevAll('span').addClass('on');
	  return false;
	});
</script>
</body>
</html>