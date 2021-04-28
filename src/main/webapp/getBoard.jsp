<%@page contentType="text/html; charset=EUC-KR"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
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
 
.size{
    height:30px;
    width:70px;
}
.reply{
border : 0px solid;}


</style>
</head>
<body>
	<center>
		<div class="container">
		<h1>게시판</h1>
		<p class="logout" align="right">
		<a href="logout.do">Log-out</a></p>
		  	
				<table class="table table-bordered" border="1">
				<tbody>
					<tr>
						<th bgcolor="#dfefff">번호</th>
						<td colspan="1" align="left">${board.boardNo }</td>
						<th bgcolor="#dfefff">제목</th>
						<td colspan="5" align="left">${board.boardTitle }</td>
					</tr>
					<tr>	
						<th bgcolor="#dfefff">아이디</th>
						<td colspan="1" align="left">${user.id }</td>
						<th bgcolor="#dfefff">등급</th>
						<td colspan="1" align="left">${board.grade }</td>
						<th bgcolor="#dfefff">조회수</th>
						<td colspan="1" align="left">${board.boardHits }</td>
						<th bgcolor="#dfefff">등록일</th>
						<td colspan="1" align="left">${board.boardDate }</td>
						<th bgcolor="#dfefff">좋아요</th>
						<td align="left">${board.boardRatingLike }</td>
						<th bgcolor="#dfefff">싫어요</th>
						<td align="left">${board.boardRatingHate }</td>				
						</tr>
					</tbody>
					<tfoot>
					<tr>
						<th bgcolor="#dfefff">내용</th>
						<td colspan="9" align="left">${board.boardContents}</td>
					</tr>
					</tfoot>
				</table>
		</div>
		<c:if test="${(sessionScope.user.grade eq 'ADMIN') || (sessionScope.user.grade eq 'USER' && sessionScope.board.grade eq 'USER')}">
		<a class="btn btn-primary" href="updateBoard.jsp">글수정</a>&nbsp;&nbsp;&nbsp; 
		</c:if>					
		<c:if test="${(sessionScope.user.grade eq 'ADMIN') || (sessionScope.user.grade eq 'USER' && sessionScope.board.grade eq 'USER')}">
		<a href="deleteBoard.do?boardNo=${board.boardNo }"><button type="button" class="btn btn-primary">글삭제</button></a>&nbsp;&nbsp;&nbsp; 
		</c:if>
		
		<a href="insertBoard.jsp"><button type="button" class="btn btn-primary">글등록</button></a>&nbsp;&nbsp;&nbsp; 
		<a href="getBoardList.do"><button type="button" class="btn btn-primary">글목록</button></a>&nbsp;&nbsp;&nbsp; 
		<br><br>
		
		<form class="Rating" action="updateBoardRatingLike.do" method="get">		
		<input type="text" name="boardNo" style="display: none" value="${board.boardNo}" />
		<input type="text" name="userCode" style="display: none" value="${user.userCode}" />
		<input type="text" name="boardRatingLike"  style="display: none" value="${board.boardRatingLike}" />
		<button type="submit" style="font-size:12px">좋어요 <i class="fa fa-thumbs-o-up"></i></button>
		</form>&nbsp;&nbsp;
		
		<form class="Rating" action="updateBoardRatingHate.do" method="get">
		<input type="text" name="boardNo"  style="display: none" value="${board.boardNo}" />
		<input type="text" name="userCode"  style="display: none" value="${user.userCode}" />
		<input type="text" name="boardRatingHate" style="display: none" value="${board.boardRatingHate}" />
		<button type="submit" style="font-size:12px">싫어요 <i class="fa fa-thumbs-o-down"></i></button>
		</form>
	</center>
		<hr>
	<br>
<div class="container">	
	<form action="insertReply.do" method="post">
		<input type="text" name="userCode" style="display: none"  value="${user.userCode}"/>
		<input type="text" name="boardNo" style="display: none"  value="${board.boardNo}"/>
		<!--  	<table class="table table-bordered" border="1" cellpadding="0" cellspacing="0" >
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
				</table>-->
				<input type="hidden" name="id" align="left" value="${user.userCode}"/>
				<input type="text" class="form-control" name="userReply" placeholder="댓글을 입력해주세요"/>
				<p align="right"><button type="submit" type="button" class="btn btn-default"> 댓글 등록</button></p>
		</form>
		</div>
	<div class="container">	
		<form action="getReplyList.do" method="post">
				
		<p align="right">
			<button class="btn btn-warning" onclick="getReply.do?userReplyNo=${Reply.userReplyNo}">댓글보기</button></p>
			<table class="table table-bordered">
				<tr>
						<th colspan="2" bgcolor="#dfefff" width="100">댓글</th>
						<th bgcolor="#dfefff" width="200">수정/삭제</th>
					</tr>
				<c:forEach items="${ReplyList}" var="reply">
					<input type="text" name="userCode" style="display: none"  value="${user.userCode}"/>
					<input type="text" name="boardNo" style="display: none"  value="${board.boardNo}"/>
					<input type="text" name="userReplyNo" style="display: none"  value="${reply.userReplyNo}"/>
					<tr>
					<td colspan="2">
					<!-- <td align="left"><input type="hidden" name="id" align="left" value="${reply.userCode}" readonly/><br>-->
					<p><b>${reply.userCode}</b><br>
					${reply.userReply}</p>
					<td align="center">
					<c:if test="${reply.userCode == user.userCode}">
						<button class="size" type="button" onclick="location.href='getReply.do?userReplyNo=${reply.userReplyNo}'">수정</button><br>
						<button class="size" type="button" onclick="location.href='deleteReply.do?userReplyNo=${reply.userReplyNo}'">삭제</button>
 						</c:if>
					</td>
					</tr>
					</c:forEach>
				
			</table>
			</form>
			</div>
</body>
</html>
