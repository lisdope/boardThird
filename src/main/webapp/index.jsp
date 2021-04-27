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
			<h2 class="index">�Խ��� ���α׷�</h2>
			<c:if test="${empty sessionScope.user.id}">
				<td><a class="index" href="login.jsp">�α���</a></td>
				<a class="index" href="createUser.jsp">ȸ������</a>
				<a class="index" href="getId.jsp">���̵�ã��</a>
				<a class="index" href="getPw.jsp">��ȣã��</a>
			</c:if>
			<br>
			<c:if test="${!empty sessionScope.user.id}">
				<h3 class="index">${user.id}�� ȯ���մϴ�!</h3>
				<a class="index" href="getBoardList.do">�Խ��Ǹ���Ʈ</a>
				<a class="index" href="updateUser.jsp">��������</a>
				<a class="index" href="logout.do">�α׾ƿ�</a>
			</c:if>
		</div>
	</center>
</body>
</html>