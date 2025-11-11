<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/view/usr/common/header.jsp" %>
<head>
  <title>로그인</title>
</head>
<body>
  <h2>로그인</h2>
  <form th:action="@{/login}" method="post">
    아이디: <input type="text" name="id"><br>
    비밀번호: <input type="password" name="password"><br>
    <button type="submit">로그인</button>
  </form>
  <p th:text="${error}"></p>
</body>
</html>
<%@ include file="/view/usr/common/footer.jsp" %>