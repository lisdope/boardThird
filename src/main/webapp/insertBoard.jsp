<%@page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>새글등록</title>
</head>
<body>
	<center>
		<h1>글 등록</h1>
		<a href="logout.do">Log-out</a>
		<hr>
		<form action="insertBoard.do" method="post">
		<input type="text" name="userCode" style="display: none" value="${user.userCode}"/>
		
		<input type="text" name="grade" style="display: none" value="${user.grade}"/>
			<table border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td bgcolor="orange" width="70">제목</td>
					<td align="left"><input type="text" name="boardTitle" /></td>
				</tr>
				<tr>
					<td bgcolor="orange" width="70">글등록날짜</td>
					<td align="left"><input type="text" name="boardDate" /></td>
				</tr>
				<tr>
					<td bgcolor="orange" width="70">조회수</td>
					<td align="left"><input type="text" name="boardHits" /></td>
				</tr>
				<tr>
					<td bgcolor="orange" width="70">좋아요</td>
					<td align="left"><input type="text" name="boardRating" /></td>
				</tr>
				<tr>
					<td bgcolor="orange">내용</td>
					<td align="left"><textarea name="boardContents" cols="40" rows="10"></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value=" 새글 등록 " /></td>
				</tr>
			</table>
		</form>
		<hr>
		<a href="getBoardList.do">글 목록 가기</a>
	</center>
</body>
</html>