<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="d-flex flex-column shadow p-4">
				<form role="form" action="/board/write" method="post" enctype="multipart/form-data" data-no="${board.no}">
					<div class="row mb-3">
						<div class="col form-floating">
							<input type="text" name="name" class="form-control" id="name" placeholder="名前" autofocus="autofocus" value="${board.name}"> 
							<label for="name">名前を入力してください。</label>
						</div>
 						<div id="passwdInput" class="col form-floating" hidden='hidden'>
							<input type="text" name="passwd" class="form-control" id="passwd" placeholder="暗証番号" value="${board.passwd}"> 
							<label for="passwd">暗証番号を入力してください。</label>
						</div>
					</div>
					<div class="row mb-3">
						<div class="form-floating mb-3">
							<input type="text" name="title" class="form-control " id="title" placeholder="タイトルを入力してください。" value="${board.title}"> 
							<label for="title">タイトルを入力してください。</label>
						</div>
						<div class="form-floating">
							<textarea name="contents" id="contents" class="form-control h-25"
								placeholder="内容を入力してください。" maxlength="2000"
								style="height: 300px !important; resize: none;">${board.contents}</textarea>
							<label for="contents" class="form-label">内容を入力してください。</label>
						</div>
					</div>
					<hr>
					<div class="form-group">
						<div class="form-check form-check-inline col-2">
							<input class="form-check-input" type="checkbox" id="lock_flag" value="lock" name="lock_flag"> 
							<label class="form-check-label"> 秘密</label>
						</div>
						<div class="col-sm-12 text-center">
							<c:if test="${board != null}">
								<button type="button" class="btn btn-primary modify">修正</button>
							</c:if>
							<button type="button" class="btn btn-danger">キャンセル</button>
							<button type="reset" class="btn btn-info">リセット</button>
							<button type="submit" class="btn btn-success">確認</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>