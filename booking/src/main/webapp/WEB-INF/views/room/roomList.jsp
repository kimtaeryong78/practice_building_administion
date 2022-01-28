<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<link href="../css/product.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<!-- Demo styles -->
<style>
html, body {
	position: relative;
	height: 100%;
}

body {
	background: #eee;
	font-size: 14px;
	color: #000;
	margin: 0;
	padding: 0;
}

.swiper {
	width: 100%;
	height: 100%;
}

#room_slide {
	width: 100%;
	height: 100%;
}

#swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}

#swiper-slide img {
	display: block;
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.swiper-pagination-bullet {
	display: block;
	color: white;
	padding: 5px 10px;
	border-radius: 0;
	width: auto;
	height: 30px;
}

.swiper-pagination-bullet-active {
	color: #fff;
	background: #007aff;
}
</style>
</head>
<body>
	<div id="room_slide" class="swiper">
		<div class="swiper-wrapper">
			<c:forEach items="${roomList}" var="room" varStatus="status">
				<div id="swiper-slide" class="swiper-slide"
					data-name="${room.room_num}">
					<div class="container col-xxl-8 px-4 py-5">
						<div class="row flex-lg-row-reverse align-items-center g-5 py-5">
							<div class="col-10 col-sm-8 col-lg-6">
								<div
									class="swiper mySwiper">
									<div class="swiper-wrapper">
										<c:forEach items="${imageMap[room.room_num]}" var="url">
											<div class="swiper-slide">
												<img src="${url}" ></img>
											</div>
										</c:forEach>	
									</div>
									<c:if test="${fn:length(imageMap[room.room_num]) > 1}">
										<div class="swiper-button-next"></div>
	      								<div class="swiper-button-prev"></div>
									</c:if>
								</div>
							</div>
							<div class="col-lg-6">
								<h1 class="display-5 fw-bold lh-1 mb-3">${room.room_title}</h1>
								<p class="lead">${room.explanation}</p>
								<div class="gantt"></div>
								<div class="d-grid gap-2 d-md-flex justify-content-center">
									<button type="button"
										class="btn btn-primary btn-lg yoyaku"
										data-no="${room.no}">予約</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<ul>
			<div id="swiper-pagination" class="swiper-pagination"></div>
		</ul>
	</div>
</body>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
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
<script type="text/javascript">
	const slide = new Swiper('#room_slide', {
		direction : "vertical",
		pagination : {
			el : ".swiper-pagination",
			clickable : true,
			renderBullet : function(index, className) {
				return '<span class="' + className + '">10' + (index + 1)
						+ '号</span>';
			},
		},
		mousewheel : {
			sensitivity : 1,
		},
		keyboard : {
			enabled : true,
		},
	});
     
     var image = new Swiper(".mySwiper", {
       loop: true,
       navigation: {
           nextEl: ".swiper-button-next",
           prevEl: ".swiper-button-prev",
         },
         pagination : {
        	 clickable : true,
         },
     });

	$(".yoyaku").on("click", function() {
		location.href = "/booking/reservation/" + $(this).data('no');
	});
	
</script>
</html>