<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
</head>
<body>
	<div class="modal fade" id="boardModal" tabindex="-1">
		<div class="modal-dialog modal-xl modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title"></h5>
					<input type="hidden" class="boardNo">
					<input type="hidden" class="boardGrno">
					<input type="hidden" class="boardDepth">
					<div class="form-floating">
						<input type="text" class="form-control boardTitle" id="floatingInputGrid"  name="title" placeholder="題目">
						<label for="floatingInputGrid">題目</label>
					</div>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body row g-2">
					<div class="col-md">
						<div class="form-floating">
							<input type="text" class="form-control boardName" id="floatingInputGrid"  name="name" placeholder="名前">
							<label for="floatingInputGrid">名前</label>
						</div>
					</div>
					<div class="col-md">
						<div class="form-floating">
							<input type="text" class="form-control boardPwd" id="floatingInputGrid"  name="password" placeholder="暗号"> 
							<label for="floatingInputGrid">暗号</label>
						</div>
					</div>
					<p class="board_summernote"></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">消す</button>
					<button type="button" class="btn btn-primary boardInsert">登録</button>
					<button type="button" class="btn btn-primary applyInsert" hidden="true">登録</button>
					<button type="button" class="btn btn-primary boardModify" hidden="true">修正</button>
					<button type="button" class="btn btn-danger boardDelete" hidden="true">削除</button>
				</div>
			</div>
		</div>
	</div>
	<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
		<div
			class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
			<h1 class="h2">${title}</h1>
			<div class="btn-toolbar mb-2 mb-md-0">
				<div class="btn-group me-2">
					総投稿数 :
					<c:out value="${boardCount}"></c:out>
				</div>
				<div class="btn-group me-2">
					<button type="button" class="btn btn-outline-secondary boardWrite" data-bs-toggle="modal" data-bs-target="#boardModal">掲載</button>
				</div>
			</div>
		</div>
		<table class="table table-striped">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col-16">title</th>
					<th scope="col">name</th>
					<th scope="col">time</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${boardList}" var="board">
					<tr style="position: relative; left: ${board.depth*30}px;">
						<th scope="row">
							<c:if test="${board.depth ne 0}">
								<i class="bi bi-arrow-return-right"></i>
							</c:if>
							<c:if test="${board.depth eq 0}">
								${board.grno}
							</c:if>
						</th>
						<td>${board.title}</td>
						<td>${board.name}</td>
						<td>${board.updated_at}</td>
						<td>
						<a type="button" data-no="${board.no}" class="btn btn-sm btn-outline-secondary showBoard" data-bs-toggle="modal" data-bs-target="#boardModal">修正</a>
						<a type="button" data-no="${board.no}" class="btn btn-sm btn-outline-secondary applyModal" data-bs-toggle="modal" data-bs-target="#boardModal">書き込み</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</main>
	</div>
	</div>
</body>
<script type="text/javascript">
	$('.board_summernote').summernote({
        tabsize: 2,
        height: 300,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });
$(document).ready(function(){
	$('.boardInsert').on('click',function(){
		var title = $('.boardTitle').val();
		var name = $('.boardName').val();
		var passwd = $('.boardPwd').val();
		var lock_flag = (passwd.length != 0)? '1':'0';
		var contents = $($('.board_summernote').summernote('code')).text();
		var data = {"title" :title,"name":name, "passwd":passwd, "lock_flag":lock_flag, "contents":contents};
		writeBoard(data);
	});
	$('.applyModal').on('click',function(){
		var no = $(this).data('no');
		var data = getBoard(no);
		$(".boardNo").val(no);
		$(".boardGrno").val(data.grno);
		$(".boardDepth").val(data.depth);
		$('.boardInsert').prop('hidden',true);
		$('.applyInsert').prop('hidden',false);
	});
	$('.applyInsert').on('click',function(){
		var grno = $(".boardGrno").val();
		var depth = Number($(".boardDepth").val()) + 1;
		var title = $('.boardTitle').val();
		var name = $('.boardName').val();
		var passwd = $('.boardPwd').val();
		var lock_flag = (passwd.length != 0)? '1':'0';
		var contents = $($('.board_summernote').summernote('code')).text();
		var data = {"grno":grno, "depth":depth, "title" :title,"name":name, "passwd":passwd, "lock_flag":lock_flag, "contents":contents};
		writeBoard(data);
	});
	$('.showBoard').on('click',function(){
		var no = $(this).data('no');
		var data = getBoard(no);
		$(".modal-title").attr('data-no',no);
		$(".boardTitle").val(data.title);
		$(".boardName").val(data.name);
		$(".boardPwd").val(data.passwd);
		$('.board_summernote').summernote('insertText', data.contents);
		$('.boardInsert').prop('hidden',true);
		$('.boardModify').prop('hidden',false);
		$('.boardDelete').prop('hidden',false);
	});
	$('.boardModify').on('click',function(){
		var no = $(".modal-title").data('no');
		var title = $('.boardTitle').val();
		var name = $('.boardName').val();
		var passwd = $('.boardPwd').val();
		var lock_flag = (passwd.length != 0)? '1':'0'
		var contents = $($('.board_summernote').summernote('code')).text();
		var data = {"no" : no,"title" :title,"name":name, "passwd":passwd, "lock_flag":lock_flag, "contents":contents};
		modifyBoard(data);
	});
	$('.boardDelete').on('click',function(){
		var no = $(".modal-title").data('no');
		var data = {"no" : no,"delete_flag":'1'};
		modifyBoard(data);
	});
	document.getElementById('boardModal').addEventListener('hidden.bs.modal', function (event) {
		$('.boardInsert').prop('hidden',false);
		$('.applyInsert').prop('hidden',true);
		$('.boardModify').prop('hidden',true);
		$('.boardDelete').prop('hidden',true);
		$(".modal-title").removeAttr('data-no');
		$(".boardTitle").val('');
		$(".boardName").val('');
		$(".boardPwd").val('');
		$('.board_summernote').summernote('reset');
	})
});
function writeBoard(data){
	$.ajax({ 
		type: "POST", 
		url: "/admin/ajax/insertBoard", 
		data: data, 
		success: function(data) { 
			alert("確認");
			location.replace('/admin/consultation');
		} 
	});
}

function getBoard(no){
	var board;
	
	$.ajax({ 
		url: "/admin/ajax/getBoard/"+no+".json",
		dataType:"json",
		type: "GET", 
		async:false,
		success: function(data) {
			board = data.board;
		} 
	});
	return board;
}

function modifyBoard(data){
	$.ajax({ 
		type: "POST", 
		url: "/admin/ajax/modifyBoard", 
		data: data, 
		success: function(data) { 
			alert("確認");
			location.replace('/admin/consultation');
		} 
	});
}

</script>
</html>