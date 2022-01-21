<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<!-- meta tag -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="building site practice">
<meta name="author" content="taeryong">
<!-- favicon -->
<link rel="shortcut icon" href="#" />

<!-- CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<link rel="stylesheet" href="/css/pick-a-color-1.2.3.min.css">
<link rel="stylesheet" href="/css/navbar-top-fixed.css">
<link rel="stylesheet" href="/css/style.css">
<!-- user CSS -->
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

body {
	padding-top: 3.5rem;
}

.jumbotron {
	margin-bottom: 2rem;
}

.selector-for-some-widget {
  box-sizing: content-box;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
</head>
<body>
	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="body" />
	<tiles:insertAttribute name="footer" />
</body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	'use strict'
	$(document).ready(function() {
		$("#lock_flag").change(function() {
		    if(this.checked) {
		    	$('#passwdInput').prev().addClass('me-3');
		    	$('#passwdInput').prop('hidden','');
		    	$('#passwd').focus();
		    }
		    if(!this.checked){
		    	$('#passwdInput').prev().removeClass('me-3');
		    	$('#passwdInput').prop('hidden','hidden');
		    	$('#passwd').val('').blur();
		    }
		}); //lock flag event
		
		if("${board}" != null){
			$('input').attr('readonly',true);
			$('textarea').attr('readonly',true);
			if("${board.lock_flag}" == '1'){
				$("#lock_flag").attr('checked',true);
				$('#passwdInput').prev().addClass('me-3');
		    	$('#passwdInput').prop('hidden','');
			}else if("${board.lock_flag}" == '0'){
				$('#passwdInput').prop('hidden','hidden');
				$('#passwdInput').prev().removeClass('me-3');
				$("#lock_flag").attr('checked',false);
				$('#passwd').val('').blur();
			}
		};	//if lock_flag is setted at 1, show the password input window 
		
		$('.table').on('click','tr',function(){
			location.href='/board/read?no='+$(this).data('no');
			/* const customBoundary = $(this); */
			/* if($(this).find('i').length()>0){
				location.href='/board/read?no='+$(this).data('no');
			} else if($(this).find('i').length()<=0){
				location.href='/board/read?no='+$(this).data('no');
			} */
		});
		$('.modify').on('click',function(){
			$(this).attr('hidden',true);
			$('input').attr('readonly',false);
			$('textarea').attr('readonly',false);
			$('form').prop('action','/board/modify/'+$('form').data('no'));
		});
		
		if(('${room_Info}')!=null){
			$('option[value="${room_Info.room_num}"]')
				.prop('selected',true)
				.attr('data-roomNo','${room_Info.no}');
			
		}
	});
	
</script>
</html>