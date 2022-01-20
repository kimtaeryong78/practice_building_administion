<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<body>
	<section class="page" id="news">
		<div class="container">
			<div class="row bg-light pt-4">
				<div class="col-lg-12">
					<h2 class="color-a">お知らせ</h2>
				</div>
			</div>
			<div class="row bg-light pt-4">
				<div class="col-md-6 col-lg-6">
					<c:forEach var="notice" items="${noticeList}" varStatus="status" end="2">
						<article>
							<div class="bg-a pull-left"><c:out value="${status.index}"></c:out></div>
							<h3>${notice.title}</h3>
							<p style="height: 100px; overflow: hidden; text-overflow: ellipsis;">${notice.contents}</p>
						</article>
					</c:forEach>
				</div>
				<div class="col-md-6 col-lg-6">
					<c:forEach var="notice" items="${noticeList}" varStatus="status" begin="3">
						<article>
							<div class="bg-a pull-left"><c:out value="${status.index}"></c:out></div>
							<h3>${notice.title}</h3>
							<p style="height: 100px; overflow: hidden; text-overflow: ellipsis;">${notice.contents}</p>
						</article>
					</c:forEach>
				</div>
			</div>
		<hr>
		</div>
	</section>
	<!-- content -->
	<section class="page" id="map">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="build title-page text-left">
						<h2 class="color-a">位置のご案内</h2>
					</div>
				</div>
			</div>
		<div class="g-map">
			<div class="embed-responsive embed-responsive-16by9">
				<iframe width="100%" height="500" class="embed-responsive-item shadow"
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3240.24641437404!2d139.779217315494!3d35.69555333679343!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f1.1!3m3!1m2!1s0x60188eadb8a08eb5%3A0x63227716f6bf7d1f!2sSendzimir%20Japan%20Bldg%2C%202-ch%C5%8Dme-10-14%20Higashikanda%2C%20Chiyoda%20City%2C%20Tokyo%20101-0031%20%EC%9D%BC%EB%B3%B8!5e0!3m2!1sko!2skr!4v1642039968989!5m2!1sja!2sja"></iframe>
			</div>
		</div>
		</div>
	</section>
	</main>
</body>
</html>