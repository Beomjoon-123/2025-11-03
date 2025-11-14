<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="pageTitle" value="작성"/>

<%@ include file="/view/usr/common/header.jsp" %>

	<section class="mt-8">
		<div class="container mx-auto">	
			<form action="/usr/article/doWrite" method="post" onsubmit="return submitFormChk(this);">
				<div class="table-box">
					<table class="w-1/2 mx-auto">
   						<label for="boardId">게시판 선택</label>
   					 	<select name="boardId" id="boardId">
        					<c:forEach var="board" items="${boards}">
           						<option value="${board.id}">${board.name}</option>
           					</c:forEach>
    					</select>
						<tr>
							<th>제목</th>
							<td><input name="title" type="text" class="input w-full" placeholder="Type here" /></td>
						</tr>
						<tr>
							<th>내용</th>
  							<td><textarea name="content" class="textarea w-full" placeholder="Type here"></textarea></td>
						</tr>
						<tr>
							<td colspan="2"><button class="submitBtn w-32">작성</button></td>
						</tr>
					</table>
				</div>
			</form>
			<div class="btns mt-3 text-sm">
				<div><button onclick="history.back();">뒤로가기</button></div>
			</div>
		</div>
	</section>
	
<%@ include file="/view/usr/common/footer.jsp" %>