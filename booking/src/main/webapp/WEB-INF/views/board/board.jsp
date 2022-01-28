<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<jsp:useBean id="now" class="java.util.Date" />
<body>
	<div class="container">
		<div class="d-flex flex-column shadow p-4">
			<section class="rb-bbs rb-bbs-list">
				<div class="rb-bbs-heading">
					<div class="rb-search-result">
						総投稿数 :
						<c:out value="${boardCount}"></c:out>
					</div>
				</div>
				<div class="rb-bbs-body">
					<!-- toast -->
					<div aria-live="polite" aria-atomic="true"
						class="bg-dark position-relative" style="z-index: 1">
						<div class="toast-container position-absolute p-3"
							id="toastPlacement">
							<div class="toast" role="alert" aria-live="assertive"
								aria-atomic="true" data-bs-autohide="false">
								<div class="toast-header">
									<strong class="me-auto">暗証番号確認</strong>
									<button type="button" class="btn-close" data-bs-dismiss="toast"
										aria-label="Close"></button>
								</div>
								<div class="toast-body">
									<p>秘密文です。暗証番号を入力してください。</p>
									<div class="row mb-3">
										<div class="col">
											<label>Password</label> <input type="password"
												class="form-control" 　placeholder="Password">
										</div>
										<div class="col position-relative bottom-0 start-0">
											<button type="submit"
												class="btn btn-sm btn-primary position-absolute bottom-0 start-0 passwordConfirm">確認</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- toast -->
					<table class="table board">
						<colgroup>
							<col width="50">
							<col>
							<col width="120">
							<col width="120">
						</colgroup>
						<thead>
							<tr>
								<th class="rb-num">番号</th>
								<th class="rb-title">タイトル</th>
								<th class="rb-user">ID</th>
								<th class="rb-time">作成時間</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${boardList}" var="board">
								<tr data-type="board" data-no="${board.no}"
									data-lock="${board.lock_flag}">
									<th class="rb-num" scope="row">${board.grno}</th>

									<td class="rb-title">
										<c:if test="${board.depth ne 0}">
											<c:choose>
												<c:when test="${board.depth eq 1}">
													<i class="bi bi-arrow-return-right"></i>
												</c:when>
												<c:otherwise>
													<c:forEach var="i" begin="1" end="${board.depth}">
														<pre>	</pre>
													</c:forEach>
													<i class="bi bi-arrow-return-right"></i>
												</c:otherwise>
											</c:choose>
										</c:if>
										<!-- lock --> 
										<c:choose>
											<c:when test="${board.lock_flag == '1'}">
												秘密です
												<i class="bi bi-file-lock"></i>
											</c:when>
											<c:otherwise>
												${board.title}
											</c:otherwise>
										</c:choose>
									</td>
									<td class="rb-user">${board.name}</td>
									<fmt:formatDate var="boardDate" value="${board.updated_at}"
										pattern="yyyy-MM-dd" />
									<fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd" />
									<c:if test="${boardDate == today}">
										<fmt:formatDate var="boardDate" value="${board.updated_at}"
											pattern="HH : mm" />
									</c:if>
									<td class="rb-time">${boardDate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="mt-2 row">
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
										<li class="page-item active disable"><a class="page-link">${n}</a></li>
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
							<a href="board/write" class="btn btn-default btn-sm text-white">相談する</a>
						</div>
					</nav>
				</div>
				<div class="row">
					<form>
						<div class="input-group input-group-sm">
							<div class="col-2">
								<select class="form-select form-select-sm amount">
									<option value="20">20個ずつ見る</option>
									<option value="30">30個ずつ見る</option>
									<option value="40">40個ずつ見る</option>
									<option value="50">50個ずつ見る</option>
								</select>
							</div>
							<div class="col-2">
								<select class="form-select form-select-sm search">
									<option class="bs-title-option">掲示板検索</option>
									<option value="title">タイトル</option>
									<option value="contents">内容</option>
									<option value="name">名前</option>
								</select>
							</div>
							<div class="col-3">
								<input type="text" class="form-control form-control-sm" id="searchWord" placeholder="検索語を入力してください。">
							</div>
							<div class="col-auto">
								<button class="btn btn-sm btn-outline-secondary" type="button" id="searchBtn">検索</button>
							</div>
						</div>
					</form>
				</div>
			</section>
		</div>
	</div>
</body>
</html>