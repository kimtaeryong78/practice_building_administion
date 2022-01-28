<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Swiper -->
    <div class="swiper mainSwiper">
      <div class="swiper-wrapper">
      	<c:forEach items="${sliderList}" var="slider">
	        <div class="swiper-slide mainSwiper-slide">
	        	<img src="${slider.file_name}">
	        </div>
      	</c:forEach>
      </div>
    </div>
    <!-- Initialize Swiper -->
    <script>
      var swiper = new Swiper(".mainSwiper", {
    	effect : 'fade',
        autoplay: 3000,
        loop: true,
      });
    </script>
