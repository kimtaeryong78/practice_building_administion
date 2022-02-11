<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="modal fade" id="noticeModal" tabindex="-1">
		<div class="modal-dialog modal-xl modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title"></h5>
					<input type="hidden" class="noticeNo">
					<div class="form-floating">
						<input type="text" class="form-control noticeTitle"
							id="floatingInputGrid" name="title" placeholder="題目"> <label
							for="floatingInputGrid">題目</label>
					</div>

					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body row g-2">
					<p class="notice_summernote"></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">消す</button>
					<button type="button" class="btn btn-primary noticeInsert">登録</button>
					<button type="button" class="btn btn-primary noticeModify"
						hidden="true">修正</button>
					<button type="button" class="btn btn-danger noticeDelete"
						hidden="true">削除</button>
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
					<button type="button" class="btn btn-outline-secondary noticeWrite" data-bs-toggle="modal" data-bs-target="#noticeModal">掲載</button>
				</div>
			</div>
		</div>
		<table class="table table-striped">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col-16">title</th>
					<th scope="col">time</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${noticeList}" var="notice">
					<tr>
						<th scope="row">${notice.no}</th>
						<td>${notice.title}</td>
						<td>${notice.updated_at}</td>
						<td>
						<a type="button" data-no="${notice.no}" class="btn btn-sm btn-outline-secondary showNotice" data-bs-toggle="modal" data-bs-target="#noticeModal">修正</a>
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
	$('.notice_summernote').summernote({
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
		$('.noticeInsert').on('click',function(){
			var title = $('.noticeTitle').val();
			var lock_flag = (passwd.length != 0)? '1':'0';
			var contents = $($('.notice_summernote').summernote('code')).text();
			var data = {"title" :title, "lock_flag":lock_flag, "contents":contents};
			writenotice(data);
		});
		$('.showNotice').on('click',function(){
			var no = $(this).data('no');
			var data = getNotice(no);
			$(".modal-title").attr('data-no',no);
			$(".noticeTitle").val(data.title);
			$('.notice_summernote').summernote('insertText', data.contents);
			$('.noticeInsert').prop('hidden',true);
			$('.noticeModify').prop('hidden',false);
			$('.noticeDelete').prop('hidden',false);
		});
		$('.noticeModify').on('click',function(){
			var no = $(".modal-title").data('no');
			var title = $('.noticeTitle').val();
			var lock_flag = (passwd.length != 0)? '1':'0'
			var contents = $($('.notice_summernote').summernote('code')).text();
			var data = {"no" : no,"title" :title, "lock_flag":lock_flag, "contents":contents};
			modifynotice(data);
		});
		$('.noticeDelete').on('click',function(){
			var no = $(".modal-title").data('no');
			var data = {"no" : no,"delete_flag":'1'};
			modifyNotice(data);
		});
		document.getElementById('noticeModal').addEventListener('hidden.bs.modal', function (event) {
			$('.noticeInsert').prop('hidden',false);
			$('.noticeModify').prop('hidden',true);
			$('.noticeDelete').prop('hidden',true);
			$(".modal-title").removeAttr('data-no');
			$(".noticeTitle").val('');
			$('.notice_summernote').summernote('reset');
		})
	});
	function writeNotice(data){
		$.ajax({ 
			type: "POST", 
			url: "/admin/ajax/insertNotice", 
			data: data, 
			success: function(data) { 
				alert("確認");
				location.replace('/admin/notice');
			} 
		});
	}

	function getNotice(no){
		var notice;
		$.ajax({ 
			url: "/admin/ajax/getNotice/"+no+".json",
			dataType:"json",
			type: "GET", 
			async:false,
			success: function(data) {
				notice = data.notice;
			} 
		});
		return notice;
	}

	function modifyNotice(data){
		$.ajax({ 
			type: "POST", 
			url: "/admin/ajax/modifyNotice", 
			data: data, 
			success: function(data) { 
				alert("確認");
				location.replace('/admin/Notice');
			} 
		});
	}
</script>
</html>