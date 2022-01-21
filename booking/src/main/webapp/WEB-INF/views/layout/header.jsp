<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>T.R</title>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="/"> 
					<img src="/img/logo.png" width="65" height="30" alt="sitename" />
				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
					aria-controls="navbarCollapse" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarCollapse">
					<ul class="navbar-nav me-auto mb-2 mb-md-0 ms-auto">
						<li class="nav-item"><a class="nav-link active" aria-current="page" href="/">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="/#news">お知らせ</a></li>
						<li class="nav-item"><a class="nav-link" href="/#map">位置</a></li>
						<li class="nav-item"><a class="nav-link" href="/board">掲示板</a></li>
						<li class="nav-item"><a class="nav-link" href="/booking">予約</a></li>
						<li class="nav-item"><a class="nav-link" href="/room">ルーム</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<main role="main">
		<div class="jumbotron">
			<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#myCarousel"
						data-bs-slide-to="0" class="active" aria-current="true"
						aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#myCarousel"
						data-bs-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#myCarousel"
						data-bs-slide-to="2" aria-label="Slide 3"></button>
				</div>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="/img/main01.jpg" class="img-fluid d-block w-100" style="filter: blur(4px); height: 300px; object-fit: cover;" alt="...">
					</div>
					<div class="carousel-item">
						<img src="/img/main02.jpg" class="img-fluid d-block w-100" style="filter: blur(4px); height: 300px; object-fit: cover;" alt="...">
					</div>
					<div class="carousel-item">
						<img src="/img/main03.jpg" class="img-fluid d-block w-100" style="filter: blur(4px); height: 300px; object-fit: cover;" alt="...">
					</div>
					<div class="carousel-caption shadow-lg text-start text-black" style="text-shadow: 0px 2px 2px rgba(0, 0, 0, 0.4); background: rgba(255, 255, 255, .3); padding: 30px;">
						<h1>一層</h1>
						<p>一層担当のキム・テリョンと申します。</p>
						<p>どうぞよろしくお願いいたします。</p>
					</div>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#myCarousel" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#myCarousel" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
</body>
</html>