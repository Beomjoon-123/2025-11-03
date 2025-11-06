<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="회원가입" />

<%@ include file="/view/usr/common/header.jsp"%>
<section class="mt-8">
	<div class="joincontainer mx-auto">
		<form action="/usr/member/doJoin" method="post">
			<div class="join-box">
				<table class="w-1/3">
					<tr>
						<th>이름</th>
						<td><input class="border w-full" name="name" type="text" /></td>
					</tr>
					<tr>
						<th>아이디</th>
						<td><input class="border w-full" name="loginId" type="text" /></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input class="border w-full" name="loginPw"
							type="password" /></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td><input class="border w-full" name="loginPwChk"
							type="password" /></td>
					</tr>
					<tr>
						<td colspan="2">
							<button class="submitBtn w-32">회원가입</button>
						</td>
					</tr>
				</table>
			</div>
		</form>
		<div class="btns mt-3 text-sm">
			<div>
				<button onclick="history.back();">뒤로가기</button>
			</div>
		</div>
	</div>
</section>

<%@ include file="/view/usr/common/footer.jsp"%>