(function(){
 "use strict";
 //nav

// $('ul.navbar-nav li a').click(function(e) {
	// e.preventDefault();
	// $("#sidebar-wrapper").toggleClass("active");
// });
$('ul.navbar-nav').onePageNav({
scrollSpeed: 1000,
scrollThreshold: 0.25
});
 $('a.about-more').click(function() {
          if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') 
            || location.hostname == this.hostname) {

            var target = $(this.hash);
            target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
            if (target.length) {
              $('html,body').animate({
                scrollTop: target.offset().top
              }, 1000);
              return false;
            }
          }
        });
 //=========== jquery invew ====================
$('.hidding').bind('inview', function(event, visible) {
var effect = $(this).attr('data-animated');
$(this).addClass(effect);
$(this).addClass('visible');
});
HeadHeight();
folioHOver();
navClick();
valid();
})();
// ===========================================
$(document).ready(function () {
 var size_li = $(".row .mywork").size();
    var x=6;
    $('.row .mywork:lt('+x+')').show();
	
    $('#loadMore').click(function () {
         x= (x+6 <= size_li) ? x+6 : size_li;
        $('.row .mywork:lt('+x+')').show();
         $('#showLess').show();
        if(x == size_li){
            $('#loadMore').hide();
        }
		return false;
    });
    $('#showLess').click(function () {
         x=(x-6<0) ? 6 : x-6;
        $('.row .mywork').not(':lt('+x+')').hide();
        $('#loadMore').show();
         $('#showLess').show();
        if(x == 6){
            $('#showLess').hide();
        }
		return false;
    });
    });
$(window).load(function(){

	  navClick();
});
$(document).delegate('*[data-toggle="lightbox"]', 'click', function(event) {
    event.preventDefault();
    $(this).ekkoLightbox();
    }); 
$(window).resize(function(){
HeadHeight();
navClick();
});
function HeadHeight(){
var wHeight = $(window).height();
$('header').css('height', wHeight);
}
function folioHOver(){
var animIn = $('.onHover').attr('data-animatedin');
var animInCap = $('.onHoverCap').attr('data-animatedin');
var animOut = $('.onHover').attr('data-animatedout');
var animOutCap = $('.onHoverCap').attr('data-animatedout');
 $('.caption, .main-cap').fadeOut();
$('.hcaption').hover(function(){

	$(this).find('.myToggle').fadeIn();
	$(this).find('.attr-icon, .attr-cap').fadeIn();
    $(this).find('.caption').removeClass(animOut).addClass(animIn);
    $(this).find('.main-cap').removeClass(animOutCap).addClass(animInCap);
    //$(this).find('.right').removeClass('bounceOutRight').addClass('bounceInRight');
    $(this).find('.caption, .main-cap').fadeIn();
    

}, function(){
$(this).find('.myToggle').fadeOut();
//$(this).find('.attr-icon').fadeOut();
    $(this).find('.caption').removeClass(animIn).addClass(animOut);
    $(this).find('.main-cap').removeClass(animInCap).addClass(animOutCap);
 //$(this).find('.right').removeClass('bounceInRight').addClass('bounceOutRight');
    $(this).find('.caption, .main-cap').fadeOut();
});
}
 function navClick(){
 
    $('.navbar-default .navbar-nav>li>a').click(function(){
		$('.navbar-collapse').toggleClass('in');
	});
	
 }
 function valid(){
 $("input,select,textarea").not("[type=submit]").jqBootstrapValidation();
}