<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Transparent Login Form</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
   <script src="https://kit.fontawesome.com/a076d05399.js"></script>
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/loginPage/css/login.css"/>
  </head>
  <body>
  <script>
  	$(function(){
		$("#findBtn").click(function(){
			$.ajax({
				url : "findPw.do",
				type : "POST",
				data : {
					"userId" : $("#userId").val(),
					"userEmail" : $("#userEmail").val()
				},
				success : function(result) {
					alert(result);
				},
			})
		});
	})
  </script>

    <div class="bg-img">
      <div class="content">
        <header>비밀번호 찾기</header>


        <form>
            <div class="field space">
                <input type="text" class="pass-key" required placeholder="ID" id="userId" name="userId">
            </div>
            <div class="field space">
                <input type="text" class="pass-key" required placeholder="EMAIL" id="userEmail" name="userEmail">
            </div>
            <div class="field space">
                <button id="findBtn" >비밀번호 찾기</button>
            </div>
          </form>

        
        <div>

        </div>

        </div>
      </div>
    
  </body>
</html>