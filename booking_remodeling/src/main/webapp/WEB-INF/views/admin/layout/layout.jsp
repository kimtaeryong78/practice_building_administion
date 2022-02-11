<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

body {
	font-size: .875rem;
}

.feather {
	width: 16px;
	height: 16px;
	vertical-align: text-bottom;
}

/*
 * Sidebar
 */
.sidebar {
	position: fixed;
	top: 0;
	/* rtl:raw:
  right: 0;
  */
	bottom: 0;
	/* rtl:remove */
	left: 0;
	z-index: 100; /* Behind the navbar */
	padding: 48px 0 0; /* Height of navbar */
	box-shadow: inset -1px 0 0 rgba(0, 0, 0, .1);
}

@media ( max-width : 767.98px) {
	.sidebar {
		top: 5rem;
	}
}

.sidebar-sticky {
	position: relative;
	top: 0;
	height: calc(100vh - 48px);
	padding-top: .5rem;
	overflow-x: hidden;
	overflow-y: auto;
	/* Scrollable contents if viewport is shorter than content. */
}

.sidebar .nav-link {
	font-weight: 500;
	color: #333;
}

.sidebar .nav-link .feather {
	margin-right: 4px;
	color: #727272;
}

.sidebar .nav-link.active {
	color: #2470dc;
}

.sidebar .nav-link:hover .feather, .sidebar .nav-link.active .feather {
	color: inherit;
}

.sidebar-heading {
	font-size: .75rem;
	text-transform: uppercase;
}

/*
 * Navbar
 */
.navbar-brand {
	padding-top: .75rem;
	padding-bottom: .75rem;
	font-size: 1rem;
	background-color: rgba(0, 0, 0, .25);
	box-shadow: inset -1px 0 0 rgba(0, 0, 0, .25);
}

.navbar .navbar-toggler {
	top: .25rem;
	right: 1rem;
}

.navbar .form-control {
	padding: .75rem 1rem;
	border-width: 0;
	border-radius: 0;
}

.form-control-dark {
	color: #fff;
	background-color: rgba(255, 255, 255, .1);
	border-color: rgba(255, 255, 255, .1);
}

.form-control-dark:focus {
	border-color: transparent;
	box-shadow: 0 0 0 3px rgba(255, 255, 255, .25);
}

@media ( prefers-reduced-motion : reduce) {
	.fade {
		transition: none;
	}
}
</style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-mousewheel/3.1.13/jquery.mousewheel.min.js" integrity="sha512-rCjfoab9CVKOH/w/T6GbBxnAH5Azhy4+q1EXW5XEURefHbIkRbQ++ZR+GBClo3/d3q583X/gO4FKmOFuhkKrdA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<!-- <style type="text/css">
.a, .b, .c {
  position: absolute;
  display: block;
  width: 60px;
  height: 60px;
  border: 3px solid #111;
  border-radius: 100%;
  animation-name: rotate;
  animation-iteration-count: infinite;
  animation-timing-function: linear;
}

.a {
  animation-duration: 1500ms;
}

.b {
  animation-duration: 4500ms;
  transform-origin: 63% 63%;
  width: 40px;
  height: 40px;
}

.c {
  animation-duration: 9000ms;
  transform-origin: 74% 74%;
  width: 20px;
  height: 20px;
}


@keyframes rotate {
  0% {
    transform: rotateZ(0deg);
  }
  100% {
    transform: rotateZ(360deg);
  }
}

.loader {
  position: absolute;
  top: 50%;
  left: 50%;
  margin-top: -33px;
  margin-left: -33px;
}
</style> -->
</head>
<body>
	<tiles:insertAttribute name="header" />
	<!-- <div id="loader">
		<span class="a"> 
			<span class="b"> 
				<span class="c"></span>
			</span>
		</span>
	</div> -->
	<div id="bodyContents">
		<tiles:insertAttribute name="body" />
	</div>
	<tiles:insertAttribute name="footer" />
</body>
<!-- <script type="text/javascript">
	$(window).on("load", function() {
		$('#loader').hide();
		$('#bodyContents').show();
	});
</script> -->
</html>