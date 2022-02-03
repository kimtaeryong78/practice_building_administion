<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div id="room_slide" class="swiper">
	<div class="swiper-wrapper">
		<c:forEach items="${roomList}" var="room" varStatus="status">
			<div id="swiper-slide" class="swiper-slide"
				data-name="${room.room_num}">
				<div class="container col-xxl-8 px-4 py-5">
					<div class="row flex-lg-row-reverse align-items-center g-5 py-5">
						<div class="col-10 col-sm-8 col-lg-6">
							<div class="swiper mySwiper">
								<div class="swiper-wrapper">
									<c:forEach items="${imageMap[room.room_num]}" var="url">
										<div class="swiper-slide">
											<img src="${url}"></img>
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
								<button type="button" class="btn btn-primary btn-lg yoyaku"
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
<script type="text/javascript">
	const slide = new Swiper('#room_slide', {
		pagination : {
			el : ".swiper-pagination",
			clickable : true,
			renderBullet : function(index, className) {
				return '<span class="' + className + '">10' + (index + 1)
						+ '号</span>';
			},
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