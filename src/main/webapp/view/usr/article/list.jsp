<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="${boardName } 게시판" />

<%@ include file="/view/usr/common/header.jsp"%>

<section class="mt-8">
	<div class="container mx-auto">
		<div class="ml-8 mb-2">
			<div class="mb-1">
				<span class="text-2xl">${boardName }</span>
			</div>
			<div>
				<span>total : ${articlesCnt }</span>
			</div>
		</div>
		<div class="overflow-x-auto">
			<table class="table table-xs">
				<select class="select select-sm">
  					<option disabled selected>Select</option>
  					<option>Announcement</option>
  					<option>Bulletin</option>
  					<option>Q & A</option>
				</select>
				<label class="input"> 
					<svg class="h-[1rem] opacity-50" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
    					<g stroke-linejoin="round" stroke-linecap="round" stroke-width="2.5" fill="none" stroke="currentColor">
      						<circle cx="11" cy="11" r="8"></circle>
     						 <path d="m21 21-4.3-4.3"></path>
    					</g>
  					</svg> 
  					<input type="search" required placeholder="Search" />
				</label>
				<thead>
					<tr>
						<th></th>
						<th>Title</th>
						<th>Writer</th>
						<th>Date</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${articles }" var="article">
						<tr>
							<th>${article.getId() }</th>
							<td><a href="/usr/article/detail?id=${article.getId() }">${article.getTitle() }</a></td>
							<td>${article.getWriterName() }</td>
							<td>${article.getRegDate() }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="bg-white px-6 pt-6 flex justify-end">
			<c:if test="${req.getLoginedMember().getId() != 0 }">
				<c:choose>
					<c:when test="${req.getLoginedMember().getAuthLevel() == 0 }">
						<div>
							<a class="btn btn-neutral btn-outline btn-xs"
								href="/usr/article/write?boardId=${param.boardId }">글쓰기</a>
						</div>
					</c:when>
					<c:otherwise>
						<c:if test="${param.boardId != 1 }">
							<div>
								<a class="btn btn-neutral btn-outline btn-xs"
									href="/usr/article/write?boardId=${param.boardId }">글쓰기</a>
							</div>
						</c:if>
					</c:otherwise>
				</c:choose>
			</c:if>
		</div>
		<div class="flex justify-center">
			<div class="join">
				<c:set var="queryString" value="?boardId=${param.boardId }" />

				<c:if test="${begin != 1 }">
					<a class="join-item btn btn-sm" href="${queryString }&cPage=1"><i
						class="fa-solid fa-angles-left"></i></a>
					<a class="join-item btn btn-sm"
						href="${queryString }&cPage=${begin - 1 }"><i
						class="fa-solid fa-caret-left"></i></a>
				</c:if>
				<c:forEach begin="${begin }" end="${end }" var="i">
					<a class="join-item btn btn-sm ${cPage == i ? 'btn-active' : '' }"
						href="${queryString }&cPage=${i }">${i }</a>
				</c:forEach>
				<c:if test="${end != totalPagesCnt }">
					<a class="join-item btn btn-sm"
						href="${queryString }&cPage=${end + 1 }"><i
						class="fa-solid fa-caret-right"></i></a>
					<a class="join-item btn btn-sm"
						href="${queryString }&cPage=${totalPagesCnt }"><i
						class="fa-solid fa-angles-right"></i></a>
				</c:if>
			</div>
		</div>
	</div>
</section>
