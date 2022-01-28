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
				<form role="form" action="/news/write" method="get" enctype="multipart/form-data" data-no="${notice.no}">
					<div class="row mb-3">
						<div class="form-floating mb-3">
							<input type="text" name="title" class="form-control " id="title" placeholder="タイトルを入力してください。" value="${notice.title}" style="padding-top: 30px;"> 
							<label style="padding-left: 30px;"  for="title">タイトル</label>
						</div>
						<div class="form-floating">
							<textarea name="contents" id="contents" class="form-control h-25 summernote"
								placeholder="内容を入力してください。" maxlength="2000"
								style="height: 300px !important; resize: none;">${notice.contents}</textarea>
							<label style="padding-left: 30px;" for="contents" class="form-label">内容</label>
						</div>
					</div>
					<hr>
					<div class="form-group">
						<div class="col-sm-12 text-center">
								<button type="button" class="btn btn-outline-secondary" onclick="history.go(-1);" >前へ</button>
								<button type="button" class="btn btn-outline-info noticeModify">修正</button>
								<button type="button" class="btn btn-secondary emptyFormBtn" hidden="true">空っぽに</button>
								<button type="submit" class="btn btn-success conFirmBtn">確認</button>
								<button type="button" class="btn btn-outline-warning removeBtn" hidden="true">削除</button>
								<button type="button" class="btn btn-primary modify toMain">メインへ</button>
 						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>