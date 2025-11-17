<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- 폰트어썸 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" integrity="sha512-2SwdPD6INVrV/lHTZbO2nodKhrnDdJK9/kg2XD1r9uGqPo1cUbujc+IYdlYdEErWNu69gVcYgdxlmVmzTWnetw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- 테일윈드, daisyUI -->
<script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
<link href="https://cdn.jsdelivr.net/npm/daisyui@5" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="/resource/css/common.css" />
<script src="/resource/js/common.js"></script>
<meta charset="UTF-8">
<title>${pageTitle }</title>
</head>
<body>
<div class="navbar bg-base-200">
  <div class="ps-4">
    <a href="/"class="text-lg font-bold"><i class="fa-brands fa-figma"></i></a>   
  </div>
   <div class="main-title">SHieeettt</div>
  <div class="flex grow justify-end px-2">
    <div class="flex items-stretch">
   	 <c:if test="${req.getLoginedMember().getId() == 0 }">
      <a href="/usr/member/join" class="btn btn-ghost rounded-field">Join</a>
      <a href="/usr/member/login" class="btn btn-ghost rounded-field">Login</a>
     </c:if>
     <c:if test="${req.getLoginedMember().getId() != 0 }">
     	 <a href="/usr/member/logout" class="btn btn-ghost rounded-field">Logout</a>
     	 <a href="/usr/article/write?boardId=2" class="btn btn-ghost rounded-field">Post</a>
     </c:if>
      <div class="dropdown dropdown-end">
       	<div tabindex="0" role="button" class="btn btn-ghost rounded-field">List</div>
      	 <ul tabindex="-1" class="menu dropdown-content bg-base-200 rounded-box z-1 mt-4 w-35 p-2 shadow-sm">
          <li><a href="/usr/article/list?boardId=1">Announcement</a></li>
          <li><a href="/usr/article/list?boardId=2">Bulletin</a></li>
          <li><a href="/usr/article/list?boardId=3">Q & A</a></li>
        </ul>
      </div>
    </div>
  </div>
</div>
	
	
	
	
	