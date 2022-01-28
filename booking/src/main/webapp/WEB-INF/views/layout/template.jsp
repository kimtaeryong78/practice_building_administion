<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<!-- meta tag -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="building site practice">
<meta name="author" content="taeryong">
<!-- favicon -->
<link rel="shortcut icon" href="#" />

<!-- CSS -->
 <link rel="stylesheet" href="https://releases.jquery.com/git/ui/jquery-ui-git.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<link rel="stylesheet" href="/css/pick-a-color-1.2.3.min.css">
<link rel="stylesheet" href="/css/navbar-top-fixed.css">
<link rel="stylesheet" href="/css/style.css">
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.css">

<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
	integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://releases.jquery.com/git/ui/jquery-ui-git.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-mousewheel/3.1.13/jquery.mousewheel.min.js" integrity="sha512-rCjfoab9CVKOH/w/T6GbBxnAH5Azhy4+q1EXW5XEURefHbIkRbQ++ZR+GBClo3/d3q583X/gO4FKmOFuhkKrdA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/lang/summernote-ja-JP.min.js"
	integrity="sha512-hpUqToD3dE5r5L85PTHtgEJCOjWhYUoFoih5BQLcwU9yfqb4K8cFTgj7Prd28oRGAGmFR/FqJoePYM/vnKz/0Q=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.js"></script>
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

body {
	padding-top: 3.5rem;
}

.jumbotron {
	margin-bottom: 2rem;
}

.selector-for-some-widget {
	box-sizing: content-box;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
</head>
<body>
	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="body" />
	<tiles:insertAttribute name="footer" />
	<!-- modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">登録完了</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">登録しました。閉じてください。</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- modal end -->
	<!-- search & amount tag -->
	<form action="/board" id="pagingProp" method="get">
		<input type="hidden" name="pageNum" id="pageNum"
			value="${pageProp.cri.pageNum}"> <input type="hidden"
			name="amount" id="amount" value="${pageProp.cri.amount}"> <input
			type="hidden" id="keyword">
	</form>
</body>
<script type="text/javascript">
	'use strict'
	
	//after page readied
	$(document).ready(function() {
		//summer note setting
		$('.summernote').summernote({
			 lang: 'ja-JP',
		 placeholder: '内容を入力してください。',
	        tabsize: 2,
	        height: 200,
	        toolbar: [
	          ['style', ['style']],
	          ['font', ['bold', 'underline', 'clear']],
	          ['color', ['color']],
	          ['para', ['ul', 'ol', 'paragraph']],
	          ['table', ['table']],
	          ['insert', ['link', 'picture', 'video']],
	          ['view', ['fullscreen', 'codeview', 'help']]
	        ],
		});
		//modal setting
		var modal = new bootstrap.Modal($('#staticBackdrop'));
		
		showModal("${result}");
		history.replaceState({},null,null);
		
		function showModal(result){
			if(result =='' || history.state){
				return;
			}
			if(parseInt(result) > 0){
				$('.modal-body').html('掲示文' + result+'番が登録されました。');
			}
			modal.show();
		}
		//config title
		if("${title}" != ""){
			$(".headerText").find("h1").html("${title}");
			$(".headerText").find("p").html("&nbsp;");
			$(".headerText").find("pre").html("${text}");
		}
		
		////////////////////////////////////////consultation////////////////////////////////////////
		///////////////////////////////////////write
		$("#lock_flag").change(function() {
			if (this.checked) {
				$('#passwdInput').prev().addClass('me-3');
				$('#passwdInput').prop('hidden', '');
				$('#passwd').focus();
			}
			if (!this.checked) {
				$('#passwdInput').prev().removeClass('me-3');
				$('#passwdInput').prop('hidden', 'hidden');
				$('#passwd').val('').blur();
			}
		}); //lock flag-event
		
		/////////////////////////////////////consultation password confirm
		$('.board').on('click', 'tr', function(e) {
			if ($(this).data("lock") == '1') {
				e.preventDefault();
				var toastElList = [].slice.call($('.toast'));
				var toastList = toastElList.map(function(toastEl) {
					return new bootstrap.Toast(toastEl)
				});
				toastList.forEach(toast => toast.show());
			} else if ($(this).data("lock") == '0') {
				location.href = '/' + $(this).data('type') + '/read/' + $(this).data('no');
			}
		});
		
		///////////////////////////////////modify button event
		$('.boardModify').on('click', function() {
			$(this).attr('hidden', true);
			$('input').attr('readonly', false);
			$('textarea').attr('readonly', false);
			$('.emptyFormBtn').attr('hidden',false);
			$('form').prop('action', '/board/modify/' + $('form').data('no'));
		});//modify button event
		
		///////////////////////////////////empty button event
		$('.emptyFormBtn').on('click',function(){
			$('form').find('input').val('');
			$('form').find('textarea').val('');
		});
		
		$(".toMain").on("click", function() {
			location.href = "/";
		});
		
		
		if (('${not empty room_Info}')) {
			$('option[value="${room_Info.room_num}"]').prop('selected', true).attr('data-roomNo', '${room_Info.no}');

		};//booking setting
		
		///////////////////////////consultation paging click event
		$(".pageNum").on('click',function(){
			$("#pageNum").val($(this).data("val"));
			$('#pagingProp').submit();
		});
		
		$('.amount').change(function(){
			$("#amount").val($(this).val());
			$('#pagingProp').submit();		
		});
		
		$('.search').change(function(){
			$("#keyword").attr("name",$(this).val());
		});
		
		$('#searchBtn').on('click',function(){
			$('#keyword').val($("#searchWord").val());
			$('#pagingProp').submit();
		});
		
		$('option[value="${pageProp.cri.amount}"]').prop('selected', true);
		
		//////////////////////////////////////read
		if (${not empty board} || ${not empty notice}) {
			$('#name, #passwd, #title, #contents').attr('readonly', true);
			if ("${board.lock_flag}" == '1') {
				$("#lock_flag").attr('checked', true);
				$('#passwdInput').prev().addClass('me-3');
				$('#passwdInput').prop('hidden', '');
			} else if ("${board.lock_flag}" == '0') {
				$('#passwdInput').prop('hidden', 'hidden');
				$('#passwdInput').prev().removeClass('me-3');
				$("#lock_flag").attr('checked', false);
				$('#passwd').val('').blur();
			}
		}; //if lock_flag is setted at 1, show the password input window 
		
		////////////////////////////////////////notice////////////////////////////////////////
		////////////////////main click
		$("article").on("click",function(){
			console.log($(this).data("notice-no"));
			location.href = '/news/read/'+$(this).data("notice-no");
		});
		
		$(".newsList").on('click', function() {
			location.href = '/news'
		});
		
		$('.news').on("click","tr",function(){
			location.href = '/news/read/'+$(this).data("no");
		});
		
		$('.noticeModify').on('click',function(){
			$(this).attr('hidden', true);
			$('input').attr('readonly', false);
			$('textarea').attr('readonly', false);
			$('.emptyFormBtn').attr('hidden',false);
			$('.conFirmBtn').attr('hidden',false);
			$('.removeBtn').attr('hidden',false);
			$('form').prop('action', '/news/modify/' + $('form').data('no'));
		});
		
		$('.removeBtn').on('click',function(){
			var temp = confirm('削除しますか？');
			if(temp){
				$('form').prop('action', '/news/remove/' + $('form').data('no'));
				$('form').submit();
			}
		});
	});
</script>
</html>