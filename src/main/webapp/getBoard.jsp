<%@page contentType="text/html; charset=EUC-KR"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
 <!-- Bootstrap -->
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
<title>글 상세</title>
<style type="text/css">
 .Rating{
 	display: inline;}
 th,td{border:1px solid; width: 50px; font-size:12px; font-color:blue;padding:5px 5px; }
 h1{font-family: 'Noto Sans KR', sans-serif;}
 p.logout{font-family: 'Noto Sans KR', sans-serif;}
 

</style>
</head>
<body>
	<center>
		<div class="container">
		<h1>글 상세</h1>
		<p class="logout" align="right">
		<a href="logout.do">Log-out</a></p>
			<form action="updateBoard.do" method="post">
				<table class="table table-bordered" border="1">
				<colgroup>
				<col span="4">
				</colgroup>
				<tbody>
					<tr>
						<th bgcolor="#dfefff">번호</th>
						<td colspan="3" align="left">${board.boardNo }</td>
					</tr>
					<tr>
						<th bgcolor="#dfefff">유저코드</th>
						<td colspan="3" align="left">${board.userCode }</td>
					</tr>
					<tr>
						<th bgcolor="#dfefff">유저(권한) 등급</th>
						<td colspan="3" align="left">${board.grade }</td>
					</tr>
					<tr>
						<th bgcolor="#dfefff">제목</th>
						<td colspan="3" align="left">${board.boardTitle }</td>
					</tr>
					<tr>
						<th bgcolor="#dfefff">내용</th>
						<td colspan="3" align="left"><textarea name="boardContents" cols="70%" rows="10">${board.boardContents}</textarea></td>
					</tr>
					<tr>
						<th bgcolor="#dfefff">등록일</th>
						<td colspan="3" align="left">${board.boardDate }</td>
					</tr>
					<tr>
						<th bgcolor="#dfefff">조회수</th>
						<td colspan="3" align="left">${board.boardHits }</td>
					</tr></tbody>
					<tfoot>
						<tr>
						<th bgcolor="#dfefff">좋아요</th>
						<td align="left">${board.boardRating }</td>
						<th bgcolor="#dfefff">싫어요</th>
						<td align="left">${board.boardRatingb }</td>
					</tfoot>
				</table>
					<p align="right">
					<c:if test="${(sessionScope.user.grade eq 'ADMIN') || (sessionScope.user.grade eq 'USER' && sessionScope.board.grade eq 'USER')}">
						<button type="submit" type="button" class="btn btn-warning">글수정</button>
					</c:if></p>
					
			</form>
		</div>
		<c:if test="${(sessionScope.user.grade eq 'ADMIN') || (sessionScope.user.grade eq 'USER' && sessionScope.board.grade eq 'USER')}">
		<a href="deleteBoard.do?boardNo=${board.boardNo }"><button type="button" class="btn btn-primary">글삭제</button></a>&nbsp;&nbsp;&nbsp; 
		</c:if>
		
		<a href="insertBoard.jsp"><button type="button" class="btn btn-primary">글등록</button></a>&nbsp;&nbsp;&nbsp; 
		<a href="getBoardList.do"><button type="button" class="btn btn-primary">글목록</button></a>&nbsp;&nbsp;&nbsp; 
		<br><br>
		
		<form class="Rating" action="updateBoardRating.do" method="get">		
		<input type="text" name="boardNo" style="display: none" value="${board.boardNo}" />
		<input type="text" name="userCode" style="display: none" value="${user.userCode}" />
		<input type="text" name="boardRating"  style="display: none" value="${board.boardRating}" />
		<button type="submit" style="font-size:12px">좋어요 <i class="fa fa-thumbs-o-up"></i></button>
		</form>&nbsp;&nbsp;
		
		<form class="Rating" action="updateBoardRatingb.do" method="get">
		<input type="text" name="boardNo"  style="display: none" value="${board.boardNo}" />
		<input type="text" name="userCode"  style="display: none" value="${user.userCode}" />
		<input type="text" name="boardRatingb" style="display: none" value="${board.boardRatingb}" />
		<button type="submit" style="font-size:12px">싫어요 <i class="fa fa-thumbs-o-down"></i></button>
		</form>
	</center>
		<hr>
	<br>
<div class="container">	
	<form action="insertReply.do" method="post">
		<input type="text" name="userCode" style="display: none"  value="${user.userCode}"/>
		<input type="text" name="boardNo" style="display: none"  value="${board.boardNo}"/>
			<table class="table table-bordered" border="1" cellpadding="0" cellspacing="0" >
			<tr>
					<th bgcolor="#dfefff">아이디</th>
					<td align="left"><input type="text" name="id" align="left" value="${user.id}" readonly/>
					</td>
			</tr>
			<tr>
					<th bgcolor="#dfefff">유저코드</th>
					<td align="left"><input type="text" name="id" align="left" value="${user.userCode}" readonly/>
					</td>
			</tr>		
			<tr>
					<th bgcolor="#dfefff" width="70">내용</th>
					<td align="left"><input type="text" name="userReply" /></td>
			</tr>
				</table>
			
				<center><button type="submit" type="button" class="btn btn-primary"> 댓글 등록</button></center>


			
		</form>
		</div>
	<div class="container">	
		<form action="getReplyList.do" method="post">
				
		<p align="right">
			<button class="btn btn-warning" onclick="getReply.do?userReplyNo=${Reply.userReplyNo}">댓글보기</button></p>
			<table class="table table-bordered" border="1" cellpadding="0" cellspacing="0" width="700">
				<thead>
					<tr>
						<th bgcolor="#dfefff" width="100">유저코드</th>
						<th bgcolor="#dfefff" width="200">내용</th>
					</tr>
					<tr>
					<td colspan="2"></td></tr>
				</thead>
				<tbody>
				
					<c:forEach items="${ReplyList}" var="reply">
					<input type="text" name="userCode" style="display: none"  value="${user.userCode}"/>
					<input type="text" name="boardNo" style="display: none"  value="${board.boardNo}"/>
					<input type="text" name="userReplyNo" style="display: none"  value="${reply.userReplyNo}"/>
					<tr>
						
						<td align="left"><input type="text" name="id" align="left" value="${reply.userCode}" readonly/>
					
						<td>${reply.userReply}</td>
						<td colspan="2" align="center">
						
 						<c:if test="${reply.userCode == user.userCode}">
						<button type="button" onclick="location.href='getReply.do?userReplyNo=${reply.userReplyNo}'">댓글 수정</button>
						<button type="button" onclick="location.href='deleteReply.do?userReplyNo=${reply.userReplyNo}'">댓글 삭제</button>
 						</c:if>
						</td>
					
					</tr>
					</c:forEach>
				</tbody>
			</table>
			</form>
			</div>
</body>
</html>
