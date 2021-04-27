<%@page contentType="text/html; charset=EUC-KR"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>글 상세</title>
<style type="text/css">
 
 .Rating{
 	display: inline;
 }

</style>
</head>
<body>
	<center>
		<h1>글 상세</h1>
		<a href="logout.do">Log-out</a>
		
			<form action="updateBoard.do" method="post">
				<table border="1" cellpadding="0" cellspacing="0">
					<tr>
						<td bgcolor="orange">번호<td>
						<td align="left">${board.boardNo }</td>
					</tr>
					<tr>
						<td bgcolor="orange">유저코드<td>
						<td align="left">${board.userCode }</td>
					</tr>
					<tr>
						<td bgcolor="orange">유저(권한) 등급<td>
						<td align="left">${board.grade }</td>
					</tr>
					<tr>
						<td bgcolor="orange">제목</td>
						<td align="left">${board.boardTitle }</td>
					</tr>
					<tr>
						<td bgcolor="orange">내용</td>
						<td align="left"><textarea name="boardContents" cols="40" rows="10">${board.boardContents}</textarea></td>
					</tr>
					<tr>
						<td bgcolor="orange">등록일</td>
						<td align="left">${board.boardDate }</td>
					</tr>
					<tr>
						<td bgcolor="orange">조회수</td>
						<td align="left">${board.boardHits }</td>
					</tr>
						<tr>
						<td bgcolor="orange">좋아요</td>
						<td align="left">${board.boardRating }</td>
					</tr>
						<tr>
						<td bgcolor="orange">싫어요</td>
						<td align="left">${board.boardRatingb }</td>
					</tr>
					<c:if test="${(sessionScope.user.grade eq 'ADMIN') || (sessionScope.user.grade eq 'USER' && sessionScope.board.grade eq 'USER')}">
					<tr>
						<td colspan="2" align="center"><input type="submit"
							value="글 수정" /></td>
					</tr>
					</c:if>
				</table>
			</form>
		
		<hr>
		<c:if test="${(sessionScope.user.grade eq 'ADMIN') || (sessionScope.user.grade eq 'USER' && sessionScope.board.grade eq 'USER')}">
		<a href="deleteBoard.do?boardNo=${board.boardNo }">글삭제</a>&nbsp;&nbsp;&nbsp; 
		</c:if>
		<a href="insertBoard.jsp">글등록</a>&nbsp;&nbsp;&nbsp; 
		<a href="getBoardList.do">글목록</a>&nbsp;&nbsp;&nbsp; 
		<form class="Rating" action="updateBoardRating.do" method="get">		
		<input type="text" name="boardNo" style="display: none" value="${board.boardNo}" />
		<input type="text" name="userCode" style="display: none" value="${user.userCode}" />
		<input type="text" name="boardRating"  style="display: none" value="${board.boardRating}" />
		<input type="submit" value="좋아요" />	
		</form>&nbsp;&nbsp;
		<form class="Rating" action="updateBoardRatingb.do" method="get">
		<input type="text" name="boardNo"  style="display: none" value="${board.boardNo}" />
		<input type="text" name="userCode"  style="display: none" value="${user.userCode}" />
		<input type="text" name="boardRatingb" style="display: none" value="${board.boardRatingb}" />
		<input type="submit" value="싫어요" />
		</form>
	</center>
	
	
	<form action="insertReply.do" method="post">
		<input type="text" name="userCode" style="display: none"  value="${user.userCode}"/>
		<input type="text" name="boardNo" style="display: none"  value="${board.boardNo}"/>
			<table border="1" cellpadding="0" cellspacing="0" >
			<tr>
					<td bgcolor="orange">아이디</td>
					<td align="left"><input type="text" name="id" align="left" value="${user.id}" readonly/>
					</td>
			</tr>
			<tr>
					<td bgcolor="orange">유저코드</td>
					<td align="left"><input type="text" name="id" align="left" value="${user.userCode}" readonly/>
					</td>
			</tr>		
			<tr>
					<td bgcolor="orange" width="70">내용</td>
					<td align="left"><input type="text" name="userReply" /></td>
			</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value=" 댓글 등록 " /></td>

				</tr>
			</table>
		</form>
		
		<form action="getReplyList.do" method="post">
				
				<button onclick="getReply.do?userReplyNo=${Reply.userReplyNo}" >댓글보기</button>
				<table border="1" cellpadding="0" cellspacing="0" width="700">
				<thead>
					<tr>
						<th bgcolor="orange" width="100">유저코드</th>
						<th bgcolor="orange" width="200">내용</th>
					</tr>
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
</body>
</html>
