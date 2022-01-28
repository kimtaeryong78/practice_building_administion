<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="d-flex flex-column shadow p-4">
				<form id="boardForm" role="form" action="/board/write" method="post"
					enctype="multipart/form-data" data-no="${board.no}">
					<div class="row mb-3">
						<div class="col form-floating">
							<input type="text" name="name" class="form-control " id="name"
								placeholder="名前" autofocus="autofocus" value="${board.name}">
							<label for="name">名前を入力してください。</label>
						</div>
						<div id="passwdInput" class="col form-floating" hidden='hidden'>
							<input type="text" name="passwd" class="form-control" id="passwd"
								placeholder="暗証番号" value="${board.passwd}"> <label
								for="passwd">暗証番号を入力してください。</label>
						</div>
					</div>
					<div class="row mb-3">
						<div class="form-floating mb-3">
							<input type="text" name="title" class="form-control " id="title"
								placeholder="タイトルを入力してください。" value="${board.title}"> <label
								for="title">タイトルを入力してください。</label>
						</div>
						<div class="form-floating">
							<textarea name="contents" id="contents" class="form-control h-25 summernote"
								placeholder="内容を入力してください。" maxlength="2000">${board.contents}</textarea>
						</div>
					</div>
					<hr>
					<div class="form-group">
						<div class="form-check form-check-inline col-2">
							<input class="form-check-input" type="checkbox" id="lock_flag"
								value="lock" name="lock_flag"> <label
								class="form-check-label"> 秘密</label>

						</div>
						<div class="col-sm-12 text-center">
							<c:if test="${not empty board}">
								<button type="button" class="btn btn-primary boardModify">修正</button>
							</c:if>
							<button type="submit" class="btn btn-success confirm">確認</button>
							<button type="button" class="btn btn-secondary emptyForm"
								hidden="true">空っぽに</button>
							<button type="button" class="btn btn-danger">キャンセル</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<form action="/board" id="pagingProp" method="get">
		<input type="hidden" name="pageNum" id="pageNum"
			value="${pageProp.cri.pageNum}"> 
		<input type="hidden"
			name="amount" id="amount" value="${pageProp.cri.amount}">
	</form>
</body>
</html>