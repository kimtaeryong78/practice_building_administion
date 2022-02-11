<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header
		class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
		<a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="/admin/main">T.R
			building</a>
		<button class="navbar-toggler position-absolute d-md-none collapsed"
			type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu"
			aria-controls="sidebarMenu" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="form-control form-control-dark w-100" type="text"
			placeholder="Search" aria-label="Search"></div>
		<div class="navbar-nav">
			<div class="nav-item text-nowrap">
				<a class="nav-link px-3" href="/admin/logout">Sign out</a>
			</div>
		</div>
	</header>
	<div class="container-fluid">
		<div class="row">
			<nav id="sidebarMenu"
				class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
				<div class="position-sticky pt-3">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="/admin/main"> <span
								data-feather="home"></span> Home
						</a></li>
						<li class="nav-item"><a class="nav-link" href="/admin/consultation"> <span 
								data-feather="file"></span> 掲示板管理
						</a></li>
						<li class="nav-item"><a class="nav-link" href="/admin/book"> <span
								data-feather="file"></span> 予約情報管理
						</a></li>
						<li class="nav-item"><a class="nav-link" href="/admin/room"> <span
								data-feather="file"></span> 部屋管理
						</a></li>
						<li class="nav-item"><a class="nav-link" href="/admin/notice"> <span
								data-feather="file"></span> お知らせ管理
						</a></li>
						<li class="nav-item"><a class="nav-link" href="/admin/slider"> <span
								data-feather="file"></span> スライドイメージ管理
						</a></li>
						<li class="nav-item"><a class="nav-link" href="/admin/options"> <span
								data-feather="file"></span> オプション管理
						</a></li>
					</ul>
				</div>
			</nav>
</body>
</html>