<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="room_slide" class="swiper">
	<div class="swiper-wrapper">
		<c:forEach items="${roomList}" var="room" varStatus="status">
			<div id="swiper-slide position-relative" class="swiper-slide" data-name="${room.room_num}">
				<div class="container col-xxl-8 px-4 py-5 w-100 position-relative" style="left: -3%">
					<div class="row flex-lg-row-reverse align-items-center g-5 py-5">
						<div class="col-10 col-sm-8 col-lg-6">
							<div class="swiper shadow" id="mySwiper">
								<div class="swiper-wrapper">
									<c:forEach items="${imageMap[room.room_num]}" var="url">
										<div class="swiper-slide">
											<img src="${url}"
												style="width: 100%; height: 450px; object-fit: cover;"></img>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
						<div class="col-lg-6 shadow d-flex justify-content-center align-items-center"
							style="min-height: 450px;">
							<div>
								<h1 class="display-5 fw-bold lh-1 mb-3">${room.room_title}</h1>
								<p class="lead">${room.explanation}</p>
								<div class="gantt"></div>
								<div class="d-grid gap-2 d-md-flex justify-content-center">
									<button type="button" class="btn btn-primary btn-lg yoyaku"
										data-no="${room.no}">予約</button>
								</div>
							</div>
						</div>
					</div>
					<div class="container">
						<div class="s1_arrow position-absolute bottom-0">
							----------------------
							<div class="scroll-arrow position-absolute"></div>
							<div class="scroll-arrow position-absolute" style="left: 10px"></div>
							<div class="scroll-arrow position-absolute" style="left: 20px"></div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<div id="swiper-pagination" class="d-flex h-auto w-auto bottom-0 swiper-pagination"></div>
</div>
<script type="text/javascript">
	const slide = new Swiper(
		'#room_slide',
		{
			loop: true,
			mousewheel: false,
			pagination: {
				el: ".swiper-pagination",
				clickable: true,
				renderBullet: function (
					index,
					className) {
					return '<span class="' + className + '">10'
						+ (index + 1)
						+ '号</span>';
				},
				modifierClass: 'roomswiper-pagination-',
			},
			keyboard: {
				enabled: true,
			},
		});

	var image = new Swiper(
		"#mySwiper",
		{
			loop: true,
			speed: 1500,
			autoplay: {
				delay: 2000,
				disableOnInteraction: false,
			},
			mousewheel: false,
			effect: 'card',
		});

	$(".yoyaku").on("click", function () {
		swiper1.slideTo(3, 500, true);
	});
</script>