<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
		<div
			class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
			<h1 class="h2">Main</h1><h4><a class="link-dark" href="/admin/book">管理しに行く</a></h4>
			<div class="btn-toolbar mb-2 mb-md-0">
				<div class="btn-group me-2">
					<button type="button" class="btn btn-outline-secondary"
						id="calendar">
						<i class="bi bi-calendar"></i>
					</button>
					<button type="button" class="btn btn-outline-secondary" id="list">
						<i class="bi bi-list-stars"></i>
					</button>
				</div>
				<button type="button"
					class="btn btn-sm btn-outline-secondary dropdown-toggle">
					<span data-feather="calendar"></span> This week
				</button>
			</div>
		</div>
		<div id="main_calendar"></div>
	</main>
	</div>
	</div>
</body>
<script type="text/javascript">
	var calendar;
	
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('main_calendar');
		calendar = new FullCalendar.Calendar(calendarEl, {
			locale:"ja",
			initialView : 'dayGridMonth',
			events: getDateAtRoom(),
		});
		calendar.render();
	});
	
	function getDateAtRoom(no){
		var bookMap = getAllBooking();
		var roomMap = getAllRoom();
		var allArr = new Array();
		for(var arr in bookMap){
			if(arr == no ||no == null||no==""){
				for(var book in bookMap[arr]){
					var tempBook = bookMap[arr][book];
					var temp = {
						id: tempBook.no,
						title: roomMap[tempBook.room_no].room_title,
						start: tempBook.start_date.substring(0,4) + '-' + tempBook.start_date.substring(4,6) + '-' + tempBook.start_date.substring(6,8),
						end:tempBook.end_date.substring(0,4) + '-' + tempBook.end_date.substring(4,6) + '-' + tempBook.end_date.substring(6,8),
						backgroundColor:roomMap[tempBook.room_no].color_code,
					}
					allArr.push(temp);
				}
			}
		}
		return allArr;
	}
	$(document).ready(function(){
		$("#calendar").prop("disabled","disabled");
		$('#calendar').on("click",function(){
			calendar.changeView('dayGridMonth');
			$("#calendar").prop("disabled","disabled");
			$("#list").removeAttr("disabled");
		});
		$("#list").on("click",function(){
			calendar.changeView('listWeek');
			$("#list").prop("disabled","disabled");
			$("#calendar").removeAttr("disabled");
		})
		$('.dropdown-item').on("click",function(){
			calendar.removeAllEvents();
			calendar.addEventSource(getDateAtRoom($(this).data("no")));
			calendar.render();
		})
		$('#payment_flag').change(function(){
			if($(".payment-body").css("display")=="none"){
				$(".payment-body").show("slow");
			} else {
				$(".payment-body").hide("slow");
			}
			console.log('change');
		})
	})
	function getAllRoom(){
		var roomList = new Array();
		$.ajax({ 
			url: "/admin/ajax/getAllRoom.json",
			dataType:"json",
			type: "GET", 
			async:false,
			success: function(data) {
				roomList = data;
			} 
		});
		return roomList;
	}
	
	function getAllBooking(){
		var bookList = new Array();
		$.ajax({ 
			url: "/admin/ajax/getAllBooking.json",
			dataType:"json",
			type: "GET", 
			async:false,
			success: function(data) {
				bookList = data;
			} 
		});
		return bookList;
	}

	function getBooking(no){
		var book;
		
		$.ajax({ 
			url: "/admin/ajax/getBooking/"+no+".json",
			dataType:"json",
			type: "GET", 
			async:false,
			success: function(data) {
				booking = data.booking;
			} 
		});
		return booking;
	}
	
	function modifyBooking(data){
		$.ajax({ 
			type: "POST", 
			url: "/admin/ajax/modifyBooking", 
			data: data, 
			success: function(data) { 
				alert("確認");
				location.replace('/admin/book');
			} 
		});
	}
</script>
</html>