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
				<div class="rb-bbs-body">
					<!-- popover -->
					<div id="popover" data-bs-toggle="popover" data-bs-trigger="focus" hidden>
						<form>
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
						</form>
					</div>
					<!-- popover -->
					<table class="table">
						<colgroup>
							<col width="10">
							<col width="120">
						</colgroup>
						<thead>
							<tr>
								<th class="rb-time">作成時間</th>
								<th class="rb-title">タイトル</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${noticeList}" var="notice">
								<tr data-bs-trigger="click" data-type="news" data-no="${notice.no}">
									<fmt:formatDate var="noticeDate" value="${notice.updated_at}" pattern="yyyy-MM-dd" />
										<c:out value="${noticeDate}"></c:out> 
									<fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd"/>
									<c:if test="${noticeDate == today}">
										<fmt:formatDate var="noticeDate" value="${notice.updated_at}" pattern="HH : mm" />
									</c:if>
									<th class="rb-time">${noticeDate}</th>
									<td class="rb-title"> ${notice.title}<span class="badge"><%-- ${applyCount} --%></span>
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