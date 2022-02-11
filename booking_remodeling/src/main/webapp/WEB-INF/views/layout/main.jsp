<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Swiper -->
    <div class="swiper mainSwiper position-relative">
      <div class="swiper-wrapper">
      	<c:forEach items="${sliderList}" var="slider">
	        <div class="swiper-slide mainSwiper-slide">
	        	<img src="${slider.file_name}" class="img-fluid">
	        </div>
      	</c:forEach>
      </div>
    </div>
<div class="container maincontainer position-absolute d-flex align-items-center top-50 translate-middle shadow-lg  h-50"
	style="z-index: 9999">
	<div class="container maincontainer w-100 h-75 d-flex justify-content-center">
		<h1 class="visually-hidden">T.R 建物</h1>
		<div class="px-4 py-5 my-5 text-center w-100 h-100">
			<h1 class="display-5 fw-bold">T.R 建物</h1>
			<hr class="mt-5 mb-3">
			<div class="col-lg-6 mx-auto">
				<p class="lead mb-4">綺麗で穏やかな部屋を提供すると心かけて居ります。</p>
			</div>
		</div>
	</div>
</div>
<!-- Initialize Swiper -->
    <script>
      var swiper = new Swiper(".mainSwiper", {
		slidesPerView: 1,
		effect : 'fade',
		grabCursor:true,
        loop: true,
        speed:1500,
        autoplay: {
            delay: 2000,
            disableOnInteraction: false,
        },
      });
    </script>
