<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="building site practice">
    <meta name="author" content="taeryong">

    <title>BUILDING</title>
	
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <link href="../css/bootstrap.css" rel="stylesheet">
    <link href="../component/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="../component/jqBootstrapValidation-1.3.7/bootstrapValidator.css" rel="stylesheet">
    <link href="../component/flexslider/flexslider.css" rel="stylesheet">
    <link href="../component/animate/animate.min.css" rel="stylesheet">
    <!-- Add custom CSS here -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"　rel="stylesheet">
	<link rel="stylesheet" href="../css/pick-a-color-1.2.3.min.css">
	 
    <link href="../css/style.css" rel="stylesheet">
		<!--[if lt IE 9]><script src="assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	  <div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
		  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		  </button>
		  <a class="navbar-brand" href="/"><img src="../img/logo.png" style="width: 100px" alt="sitename" /></a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		  <ul class="nav navbar-nav navbar-right">
			<li class="current"><a href="/">HOME</a></li>
			<li><a href="/#about">お知らせ</a></li>
			<li><a href="/#map">位置</a></li>
			<li><a href="/#board">掲示板</a></li>
			<li><a href="/room/roomWriting">ルーム情報入力・編集</a></li>
			<li><a href="/consultation">お問い合わせ</a></li>
		  </ul>
		</div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav><!-- end nav -->
	<div id="boxWrapp">
	<!-- content -->
	<header>
		<div class="main-head h-100" style="background:rgba(255,255,255,.3)">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="text-center font-weight-bold" data-animated-in="fadeInRight" data-animated-out="fadeOutRight">
						○○ビル
						<script type="text/javascript">
							var path = window.location.pathname;
							alert(path);
							/* if(path=='/consultation') */
						</script>
						</h1>
					</div><!-- end col -->
				</div><!-- end row -->
			</div><!-- end container -->
			</div><!--end main slider-->
		</div><!-- end main head -->
	</header>
	<!-- end content -->
	
</body>
</html>