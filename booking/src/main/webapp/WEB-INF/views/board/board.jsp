<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
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
				<div class="rb-bbs-heading">
					<div class="rb-search-result">総投稿数 : <c:out value="${boardCount}"></c:out> ()</div>
				</div>
				<div class="rb-bbs-body">
					<!-- toast -->
					<div aria-live="polite" aria-atomic="true" class="bg-dark position-relative" style="z-index: 1">
						<div class="toast-container position-absolute p-3" id="toastPlacement">
							<div class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-bs-autohide="false" >
								<div class="toast-header">
									<strong class="me-auto">暗証番号確認</strong>
									<button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
								</div>
								<div class="toast-body">
									<p>秘密文です。暗証番号を入力してください。</p>
									<div class="row mb-3">
										<div class="col">
											<label>Password</label>
											<input type="password" class="form-control"　placeholder="Password">
										</div>
										<div class="col position-relative bottom-0 start-0">
											<button type="submit" class="btn btn-sm btn-primary position-absolute bottom-0 start-0 passwordConfirm">確認</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- toast -->
					<table class="table">
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
								<tr data-type="board" data-no="${board.no}" data-lock="${board.lock_flag}">
									<th class="rb-num" scope="row">${board.grno}</th>
									<c:if test="${board.lock_flag == '1'}">
										<td class="rb-title">秘密です<span class="badge"><%-- ${applyCount} --%></span>
										<i class="bi bi-file-lock"></i>
									</c:if>
									<c:if test="${board.lock_flag == '0'}">
										<td class="rb-title"> ${board.title}<span class="badge"><%-- ${applyCount} --%></span>
									</c:if>
									<td class="rb-user">${board.name}</td>
									<fmt:formatDate var="boardDate" value="${board.updated_at}" pattern="yyyy-MM-dd" />
									<fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd"/>
									<c:if test="${boardDate == today}">
										<fmt:formatDate var="boardDate" value="${board.updated_at}" pattern="HH : mm" />
									</c:if>
									<td class="rb-time">${boardDate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="rb-bbs-footer">
					<div class="rb-actions row">
						<nav aria-label="Page navigation d-inline">
							<ul class="pagination justify-content-center">
								<li class="page-item"><a class="page-link" href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">4</a></li>
								<li class="page-item"><a class="page-link" href="#">5</a></li>
								<li class="page-item"><a class="page-link" href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
							</ul>
							<div class="btn btn-secondary float-end">
								<a href="board/write" class="btn btn-default btn-sm text-white">相談する</a>
							</div>
						</nav>
					</div>
					<div class="rb-search row">
						<div class="col-xs-12 col-sm-6 col-sm-offset-3">
							<form>
								<div class="input-group input-group-sm">
									<select class="selectpicker bs-select-hidden" title="掲示板検索">
										<option	class="bs-title-option" value="">掲示板検索</option>
										<option>タイトル</option>
										<option>内容</option>
										<option>ID</option>
										<option>登録日</option>
										<option>全体</option>
										<option data-divider="true"></option>
									</select>
									<input type="text" class="form-control" name="x" placeholder="ここに入力してください"> 
									<span class="input-group-btn">
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
	<!-- modal -->
	<div class="modal fade" id="modal-profile" tabindex="-1" role="dialog" aria-bs-backdrop="static" data-bs-keyboard="false" aria-labelledby="modal-profile">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">登録完了</h4>
					<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					登録しました。閉じてください。
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"　data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- modal end -->
</body>
</html>