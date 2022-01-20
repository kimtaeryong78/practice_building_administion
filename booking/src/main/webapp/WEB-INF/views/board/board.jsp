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
					<!-- popover -->
					<div id="popover" data-bs-toggle="popover" data-bs-trigger="focus" hidden>
						<form></form>
						<div class="arrow"></div>
						<h3 class="popover-title">
							<span class="close pull-right" data-dismiss="popover-x">×</span>
							<i class="fa fa-exclamation-circle fa-lg"></i> 비밀번호 확인
						</h3>
						<div class="popover-content">
							<p>게시물 등록시에 입력했던 비밀번호를 입력해 주세요.</p>
							<div class="form-group">
								<label class="sr-only" for="popover-permCheck-pw">Password</label>
								<input type="password" class="form-control"
									id="popover-permCheck-pw" placeholder="Password">
							</div>
						</div>
						<div class="popover-footer">
							<button type="submit" class="btn btn-sm btn-primary">확인</button>
							<button type="button" class="btn btn-sm btn-default"
								data-dismiss="popover-x">취소</button>
						</div>
					</div>
					<!-- popover -->
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
								<tr data-bs-trigger="click" data-no="${board.no}">
									<th class="rb-num" scope="row">${board.grno}</th>
									<td class="rb-title"> ${board.title}<span class="badge"><%-- ${applyCount} --%></span>
									<c:if test="${board.lock_flag == '1'}">
										<i class="bi bi-file-lock" data-bs-toggle="popover" data-bs-title="title"></i>
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
	</div>
	<div class="modal fade" id="modal-profile" tabindex="-1" role="dialog"
		aria-labelledby="modal-profile">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title">홍길동</h4>
				</div>
				<div class="modal-body">...</div>
			</div>
		</div>
	</div>
</body>
</html>