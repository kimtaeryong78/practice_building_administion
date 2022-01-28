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
<link href="/css/main.css" rel="stylesheet">
<link href="/css/map.css" rel="stylesheet">
<link href="/css/template.css" rel="stylesheet">
 <link rel="stylesheet" href="https://releases.jquery.com/git/ui/jquery-ui-git.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.css">
<link
      rel="stylesheet"
      href="https://unpkg.com/swiper/swiper-bundle.min.css"
    />

<!-- Script -->
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
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<title>T.R</title>
</head>
<body>
	<div class="swiper navSwiper position-relative">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<tiles:insertAttribute name="main" />
			</div>
			<div class="swiper-slide">
				<tiles:insertAttribute name="room" />
			</div>
			<div class="swiper-slide">
				<tiles:insertAttribute name="consultation" />
			</div>
			<div class="swiper-slide">
				<tiles:insertAttribute name="booking" />
			</div>
			<div class="swiper-slide">
				<tiles:insertAttribute name="notice" />
			</div>
			<div class="swiper-slide">
				<tiles:insertAttribute name="map" />
			</div>
		</div>
		<div class="logo position-absolute top-0 end-100">
			<img src="/img/logo.png" width="65" height="30" alt="sitename" />
		</div>
		<div class="swiper-pagination"></div>
	</div>
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
var navs = ["メイン","ルーム","相談","予約","お知らせ","位置"];

var swiper1 = new Swiper('.navSwiper', {
	direction: "vertical",
	slidesPerView: 1,
	mousewheel: true,
	autoplayDisableOnInteraction: false,
    pagination: {
        el: '.swiper-pagination',
        clickable : true,
   		renderBullet: function (index, className) {
	    	return '<span class="' + className + '">' + (navs[index]) + '</span>';
		},
	},
});
</script>
</html>