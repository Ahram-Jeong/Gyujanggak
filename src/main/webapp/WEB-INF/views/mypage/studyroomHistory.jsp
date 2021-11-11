<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디룸 이용 내역</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/style.css" />
<link href="resources/css/popupStyle.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<style>
*{
	margin:0;
	padding : 0;
}

#beforeLogin{
	margin-top : 5%;
	margin-bottom : 10%;
}

.sideMenu{
	float: left;
	width: 25%;
}
.mainContent {
	margin-left: 15%;
	margin-right: 15%;
	margint-bottom: 15%;
	vertical-align: middle;
	justify-content: center;
	width : 95%;
	display: grid;
	text-align : center;
	position: relative;
}
#mainTitle{
	color : #656379;
	text-align : center;
}
.table th{
	text-align : center;
}

.table td{
	text-align : left;
}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
	<c:if test="${sessionScope.userId eq null }">
	<section>
		<article class="mainContent" id="beforeLogin">
			<h3 style='text-align:center;'>로그인 후 이용 가능합니다</h3><br>
			<div class="btn-area" style="text-align:center;">
				<br>	
				<a href="loginView.do" ><button style="text-align:center;" type="button" class="btn btn-primary" id="login-btn">로그인 하러 가기</button></a>
			</div>
		</article>
	</section>
	</c:if>
		
	<c:if test="${sessionScope.userId ne null}">
	<section>
		<!-- 사이드메뉴 -->
		<aside class="sideMenu">
			
		</aside>

		<!-- 내용 -->
		<article class="mainContent">
			<!-- 타이틀 --><br>
			<h2 id="mainTitle">
				<b>스터디룸 예약 조회</b>
			</h2>

			<!-- 본문 -->
			<br> <br><br>
			<table class="table">
				<colgroup>
						<col width="80px">
						<col width="250px">
						<col width="250px">
						<col width="100px">
				</colgroup>
				<thead>
					<tr>
						<th scope="col"  style="vertical-align : middle; text-align : center;">예약번호</th>
						<th scope="col" colspan="3">예약내역</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty sList }">
						<tr>
							<td colspan="6" align="center" style="vertical-align : middle; text-align : center;"> 스터디룸 이용 내역이 없습니다. </td>
						</tr>
					</c:if>
					<c:if test="${not empty sList }">
						<c:forEach items="${sList }" var="sList">
							<tr>
								<th scope="row"  style="vertical-align : middle; text-align : center;" >${sList.sReservationNo}</th>
								<td>
									예약날짜 : ${sList.sReservationDate } <br> 
									예약시간 : <c:if test="${sList.sReservationTime eq 'A'}">9:00 ~ 12:00</c:if>
											<c:if test="${sList.sReservationTime eq 'B'}">12:00 ~ 15:00</c:if>
											<c:if test="${sList.sReservationTime eq 'C'}">15:00 ~ 18:00</c:if>
											<c:if test="${sList.sReservationTime eq 'D'}">18:00 ~ 21:00</c:if>
									<input type="hidden" value="${sList.userId}" name="userId">
								</td>
								<td>
									사용인원 : ${sList.personnel } <br>
									사용목적 : ${sList.purpose }
								</td>
								<td style="vertical-align : middle; text-align : center; font-size:0.9em;">
 									<jsp:useBean id="now" class="java.util.Date" />
									<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="today" />
									<fmt:parseNumber value="${today}" integerOnly="true" var="nowTime" scope="request"/>
									<fmt:parseDate  value="${sList.sReservationDate}" pattern="yyyy/MM/dd" var="booking"/>
									<fmt:formatDate value="${booking}" pattern="yyyyMMdd" var="formatbooking" />
									<fmt:parseNumber value="${formatbooking}" integerOnly="true" var="bookingTime" scope="page"/> 
									<c:set value="${bookingTime - nowTime }" var="dateDiff"/>
									<%-- <c:out value="${dateDiff }"/> <c:out value="${bookingTime }"/> --%>
									<c:if test="${dateDiff >= 1}">
										<a href="#layer${sList.sReservationNo}" class="check-btn"><button class="btn btn-danger btn-sm" id="withdraw-btn">예약취소</button></a>
									</c:if>
									<c:if test="${dateDiff < 1}">취소 불가 </c:if>
								</td>
							</tr>
							<div id="layer${sList.sReservationNo}" class="pop-layer">
								<!-- 예약취소 경고창 -->
								<div class="pop-container">
									<div class="pop-conts">
										<!-- 내용 -->
										<h4 class="ctxt mb20"><b>정말로 취소하시겠습니까?</b></h4>${sList.sReservationNo}
										<div class="btn-r">
											<a href="#" class="btn-submit"><button class="btn btn-danger" onclick="location.href='cancelStudyRoom.do?sReservationNo=${sList.sReservationNo }';">확인</button></a> <a
												href="#" class="btn-layerClose"><button class="btn btn-secondary" >취소</button></a>
										</div>
										<!--  // 내용 끝 -->
									</div>
								</div>
							</div>							
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</article>
		<br>
		<br>
	</section>
	</c:if>
<jsp:include page="../common/chat.jsp"></jsp:include>
<jsp:include page="../common/footer.jsp"></jsp:include>

	<script>
	$(".check-btn").click(function(){
        var $href = $(this).attr("href");
        layer_popup($href);
    });
    function layer_popup(el){

        var $el = $(el);    //레이어의 id를 $el 변수에 저장
        var isDim = $el.prev().hasClass("dimBg"); //dimmed 레이어를 감지하기 위한 boolean 변수

        isDim ? $(".dim-layer").fadeIn() : $el.fadeIn();

        var $elWidth = ~~($el.outerWidth()),
            $elHeight = ~~($el.outerHeight()),
            docWidth = $(document).width(),
            docHeight = $(document).height();

        // 화면의 중앙에 레이어를 띄운다.
        if ($elHeight < docHeight || $elWidth < docWidth) {
            $el.css({
                marginTop: -$elHeight /2,
                marginLeft: -$elWidth/2
            })
        } else {
            $el.css({top: 0, left: 0});
        }

        $el.find("a.btn-layerClose").click(function(){
            isDim ? $(".dim-layer").fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
            return false;
        });
        
        $el.find("btn-submit").click(function(){
			
        }); 
 
        $(".layer .dimBg").click(function(){
            $(".dim-layer").fadeOut();
            return false;
        });

    }

	</script>
</body>
</html>