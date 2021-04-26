<%@page contentType="text/html; charset=EUC-KR"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/commons.css">

<title>Main Page</title>
</head>
<body>
	<center>
		<div class="page">
			<h2 class="index">게시판 프로그램</h2>
			<c:if test="${empty sessionScope.user.id}">
				<td><a class="index" href="login.jsp">로그인</a></td>
				<a class="index" href="createUser.jsp">회원가입</a>
				<a class="index" href="getId.jsp">아이디찾기</a>
				<a class="index" href="getPw.jsp">암호찾기</a>
			</c:if>
			<br>
			<c:if test="${!empty sessionScope.user.id}">
				<h3 class="index">${user.id}님 환영합니다!</h3>
				<a class="index" href="getBoardList.do">게시판리스트</a>
				<a class="index" href="updateUser.jsp">정보수정</a>
				<a class="index" href="logout.do">로그아웃</a>
			</c:if>
		</div>
	</center>
</body>
</html>