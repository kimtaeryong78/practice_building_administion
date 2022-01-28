<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:useBean id="now" class="java.util.Date" />
<body>
	<div class="container">
		<div class="d-flex flex-column shadow p-4">
			<section class="rb-bbs rb-bbs-list">
				<div class="rb-bbs-body">
					<table class="table news">
						<colgroup>
							<col class="col-2">
							<col class="col-11">
						</colgroup>
						<thead>
							<tr>
								<th class="rb-time">作成時間</th>
								<th class="rb-title">タイトル</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${noticeList}" var="notice">
								<tr data-type="news" data-no="${notice.no}">
									<fmt:formatDate var="noticeDate" value="${notice.updated_at}"
										pattern="yyyy-MM-dd" />
									<fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd" />
									<c:if test="${noticeDate == today}">
										<fmt:formatDate var="noticeDate" value="${notice.updated_at}"
											pattern="HH : mm" />
									</c:if>
									<th class="rb-time">${noticeDate}</th>
									<td class="rb-title">${notice.title}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="rb-bbs-footer">
					<div class="rb-actions row">
						<nav aria-label="Page navigation d-inline">
							<ul class="pagination justify-content-center">
								<c:if test="${pageProp.prev}">
									<li class="page-item"><a class="page-link" href="#"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
											<!-- << -->
									</a></li>
								</c:if>
								<c:forEach var="n" begin="${pageProp.startPage}"
									end="${pageProp.endPage}">
									<c:choose>
										<c:when test="${n eq pageProp.cri.pageNum}">
											<li class="page-item active disable"><a
												class="page-link">${n}</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link pageNum"
												data-val="${n}" data-type="pageNum">${n}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${pageProp.next}">
									<li class="page-item"><a class="page-link" href="#"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
											<!-- >> -->
									</a></li>
								</c:if>
							</ul>
							<div class="btn btn-secondary float-end">
								<a href="news/write" class="btn btn-default btn-sm text-white">お知らせを書く</a>
							</div>
						</nav>
					</div>
					<div class="rb-search row">
						<div class="col-xs-12 col-sm-6 col-sm-offset-3">
							<form>
								<div class="input-group input-group-sm">
									<select class="selectpicker bs-select-hidden" title="掲示板検索">
										<option class="bs-title-option" value="">掲示板検索</option>
										<option>タイトル</option>
										<option>内容</option>
										<option>ID</option>
										<option>登録日</option>
										<option>全体</option>
										<option data-divider="true"></option>
									</select> <input type="text" class="form-control" name="x"
										placeholder="ここに入力してください"> <span
										class="input-group-btn">
										<button class="btn btn-default" type="submit">
											<span class="glyphicon glyphicon-search"></span>
										</button>
									</span>
								</div>
							</form>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</body>
</html>