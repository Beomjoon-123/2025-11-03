<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>리스트</div>
	<table>
		<colgroup>
			<col width="100" />
			<col width="100" />
			<col width="150" />
		</colgroup>
		<tr>번호</tr>
		<tr>제목</tr>
		<tr>작성일</tr>
		<c:forEach items="${articles }" var="article">
			<tr>
				<td>${article.getId() }</td>
				<td>${article.getTitle() }</td>
				<td>${article.getRegDate() }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>