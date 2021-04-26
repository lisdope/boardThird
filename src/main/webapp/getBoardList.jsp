<%@page contentType="text/html; charset=EUC-KR"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/commons.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/js/bootstrap.min.js">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<style type="text/css">
li {
	list-style: none;
	float: left;
	padding: 6px;
	text-align: center;
}
</style>


<title>�� ���</title>
</head>
<body>
	<center>
		<h1 class="index">�� ���</h1>
		<h3 class="index">
			${user.name}��! ȯ���մϴ�.<a href="logout.do">Log-out</a>
		</h3>
		<div class="container">
			<div class="row">
				<!-- �˻� ���� -->
			<form action="getBoardList.do" method="post">
			<table border="1" cellpadding="0" cellspacing="0" width="700" class="table table-hover fw-bold">
				<thead class="table-dark">
					<tr align="right">
						<td>
							<select name="searchCondition">
								<option value="TITLE">����
								<option value="CONTENT">����
							</select> 
							<input name="searchKeyword" type="text" /> 
							<input type="submit" value="�˻�" />
						</td> 
					</tr>
				</thead>	
			</table>
			</form>
			<!-- �˻� ���� -->
				<table border="1" cellpadding="0" cellspacing="0" width="700"
					class="table table-hover fw-bold">
					<thead class="table-dark">
						<tr>
							<th width="50">��ȣ</th>
							<th width="200" style="text-align: center;">����</th>
							<th width="50">�����</th>
							<th width="50">���</th>
						</tr>
					</thead>
					<tbody class="table-dark">
						<c:forEach items="${boardList_n}" var="board">
							<tr>
								<td>${board.boardNo}</td>
								<td align="left"><a
									href="getBoard.do?boardNo=${board.boardNo}">
										${board.boardTitle}</a></td>
								<td>${board.boardDate}</td>
								<td>${board.grade}</td>
							</tr>
						</c:forEach>
					</tbody>

					<tbody class="table-dark">
						<c:forEach items="${boardList}" var="board">
							<tr>
								<td>${board.boardNo}</td>
								<td align="left"><a
									href="getBoard.do?boardNo=${board.boardNo}">
										${board.boardTitle}</a></td>
								<td>${board.boardDate}</td>
								<td>${board.grade}</td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td></td>
							<td align="center"><a href="insertBoard.jsp">���� ���</a></td>
							<td></td>
							<td></td>
						</tr>
						<c:if test="${sessionScope.user.grade eq 'ADMIN'}">
							<tr>
								<td>${user.grade}</td>
								<td align="center"><a href="insertBoard_n.jsp">�������� ���</a></td>
								<td></td>
							</tr>
						</c:if>
					</tfoot>
				</table>
			</div>
		</div>
		<div class="row">
			<nav aria-label="Page navigation example">
			<ul class="pagination" style="width: 500px;">
				<c:if test="${pageMaker.prev}">
					<li class="page-item"><a class="page-link"
						aria-label="Previous"
						href="getBoardList.do${pageMaker.makeQuery(pageMaker.startPage - 1)}"><span
							aria-hidden="true">&laquo;</span></a></li>
				</c:if>

				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
					var="idx">
					<li class="page-item"><a class="page-link"
						href="getBoardList.do${pageMaker.makeQuery(idx)}">${idx}</a></li>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a class="page-link" aria-label="Next"
						href="getBoardList.do${pageMaker.makeQuery(pageMaker.endPage + 1)}"><span
							aria-hidden="true">&raquo;</span></a></li>
				</c:if>
			</ul>
			</nav>
		</div>
	</center>
</body>
</html>