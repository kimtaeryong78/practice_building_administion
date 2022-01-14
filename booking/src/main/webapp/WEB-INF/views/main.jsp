<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<body id="home">
 
<div id="boxWrapp">
	<!-- content -->
	<section class="page" id="about">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="build title-page hidding animated delay1" data-animated="bounceInUp">
						<h2 class="color-a">お知らせ</h2>
					</div><!-- end build -->
				</div><!-- end col -->
			</div><!-- end row -->
			<div class="row">
				<!-- <div class="col-lg-12 hidding animated delay2" data-animated="bounceInUp">
					<div class="build stuff">
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed nisi metus, tristique ndolor non, ornare sagittis dolor. Nulla vestibulu lacus sed molestie gravida. Crferm entum  quismagna congue, vel sodales arcu vestibulum. Nunc lobortis dui magna, quis lacusullamcorper at. </p>
						<p class="blur">Phasellus sollicitudin ante eros ornare, <strong>sit amet luctus lorem semper</strong>. Suspendisse posuere, quamdictum consectetur, augue metus pharetra tellus, eu feugiatloreg egetnisi. Cras ornare bibendum ante, ut bibendum odio convallis eget. vel sodales arcu vestibulum</p>
					</div>end build
				</div>end col -->
				<div class="col-md-6 col-lg-6 hidding animated delay2" data-animated="bounceInUp">
					<div class="build stuff clearfix">
						<article class="clearfix">
							<div class="goal-number bg-a pull-left">
								01
							</div>
							<div class="goal-desc">
								<h3>${title}title</h3>
								<p>${contents}contents</p>
							</div>
						</article>
						<article class="clearfix">
							<div class="goal-number bg-a pull-left">
								02
							</div>
							<div class="goal-desc">
								<h3>WORKING CLOSELY WITH OUR CLIENT</h3>
								<p>nteger vel lacus non dui ullamcorper venenatis. Aliquam vitae tristique nisi, vitae ullamcorper risus. </p>
							</div>
						</article>
						<article class="clearfix">
							<div class="goal-number bg-a pull-left">
								03
							</div>
							<div class="goal-desc">
								<h3>INCREASE HAPPINESS</h3>
								<p>nteger vel lacus non dui ullamcorper venenatis. Aliquam vitae tristique nisi, vitae ullamcorper risus. </p>
							</div>
						</article>
					</div><!-- end build -->
					
				</div><!-- end col -->
				<div class="col-md-6 col-lg-6 hidding animated delay3" data-animated="bounceInUp">
					<div class="build stuff clearfix">
						<article class="clearfix">
							<div class="goal-number bg-a pull-left">
								04
							</div>
							<div class="goal-desc">
								<h3>${title}title</h3>
								<p>${contents}contents</p>
							</div>
						</article>
						<article class="clearfix">
							<div class="goal-number bg-a pull-left">
								05
							</div>
							<div class="goal-desc">
								<h3>WORKING CLOSELY WITH OUR CLIENT</h3>
								<p>nteger vel lacus non dui ullamcorper venenatis. Aliquam vitae tristique nisi, vitae ullamcorper risus. </p>
							</div>
						</article>
						<article class="clearfix">
							<div class="goal-number bg-a pull-left">
								06
							</div>
							<div class="goal-desc">
								<h3>INCREASE HAPPINESS</h3>
								<p>nteger vel lacus non dui ullamcorper venenatis. Aliquam vitae tristique nisi, vitae ullamcorper risus. </p>
							</div>
						</article>
					</div><!-- end build -->
				</div>
			</div><!-- end row -->
		</div><!-- end container -->
	</section>
	<!-- end content -->

	<!-- content -->
	<section class="page" id="map">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 hidding animated" data-animated="bounceInUp">
					<div class="build title-page text-left">
						<h2 class="color-a">位置のご案内</h2>
					</div>
					<!-- end build -->
				</div>
				<!-- end col -->
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
		<div class="g-map hidding animated" data-animated="bounceInUp">
			<div class="embed-responsive embed-responsive-16by9">
				<iframe class="embed-responsive-item"
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3240.24641437404!2d139.779217315494!3d35.69555333679343!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f1.1!3m3!1m2!1s0x60188eadb8a08eb5%3A0x63227716f6bf7d1f!2sSendzimir%20Japan%20Bldg%2C%202-ch%C5%8Dme-10-14%20Higashikanda%2C%20Chiyoda%20City%2C%20Tokyo%20101-0031%20%EC%9D%BC%EB%B3%B8!5e0!3m2!1sko!2skr!4v1642039968989!5m2!1sja!2sja"></iframe>
			</div>
		</div>
	</section>
	<!-- end content -->
</body>
</html>