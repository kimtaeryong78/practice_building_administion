<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div id="bookModal" class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
		<div class="modal-dialog modal-xl modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">追加</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="container row" style="transition: all 200ms ease-in-out 50ms;">
					<div class="modal-body col-8">
						<form>
							<div class="row mb-3 position-relative">
								<div class="mb-3 col-6 name">
									<div class="input-group">
										<span class="input-group-text">名前</span>
										<input type="text" id="name" name="name" aria-label="name" class="form-control">
									</div>
								</div>
								<div class="mb-3 col">
								    <div class="input-group">
										<button class="btn btn-outline-secondary dropdown-toggle modal_room_num_button"
											type="button" data-bs-toggle="dropdown" aria-expanded="false">ルーム番号</button>
										<ul class="dropdown-menu modal_room_num_drop">
											<c:forEach items="${roomList}" var="room">
												<li><a class="dropdown-item" data-no="${room.no}">${room.room_num}</a></li>
											</c:forEach>
										</ul>
										<input type="number" class="form-control modal_room_num_input"
											aria-label="Text input with dropdown button">
									</div>
								</div>
							    <div class="float-end col-2">
								    <div class="form-check form-switch">
										<span>入金Flag</span><input class="form-check-input form-control" type="checkbox" id="payment_flag" checked="checked">
									</div>
								</div>
						    </div>
						    <div class="row mb-3">
								<label for="phone" class="form-label">携帯電話</label>
							    <div class="input-group mb-3">
									<input type="text" class="form-control" id="phone_1" name="phone_1" placeholder="010" aria-label="phone1">
									<span class="input-group-text">-</span>
									<input type="text" class="form-control" id="phone_2" name="phone_2" placeholder="1234" aria-label="phone2">
									<span class="input-group-text">-</span>
									<input type="text" class="form-control" id="phone_3" name="phone_3" placeholder="1234" aria-label="phone3">
								</div>
							</div>
						    <div class="row mb-3">
						    	<div class="input-group">
									<span class="input-group-text">開始日・終了日</span>
									<input type="date" id="start_date" name="start_date" aria-label="start_date" class="form-control">
									<input type="date" id="end_date" name="end_date" aria-label="end_date" class="form-control">
								</div>
						    </div>
							<div class="row mb-3">
								<div class="col-sm-4">
									<div class="input-group mb-3">
										<button class="btn btn-outline-secondary dropdown-toggle adult_headCount"
											type="button" data-bs-toggle="dropdown" aria-expanded="false">大人</button>
										<ul class="dropdown-menu adult_headCount_drop">
											<li><a class="dropdown-item adult_headCount" href="#">0</a></li>
										</ul>
										<input type="number" class="form-control adult_headCount"
											id="adult_headCount" aria-label="Text input with dropdown button">
									</div>
								</div>
								<div class="col-sm-4">
									<div class="input-group mb-3">
										<button class="btn btn-outline-secondary dropdown-toggle child_headCount"
											type="button" data-bs-toggle="dropdown" aria-expanded="false">子供</button>
										<ul class="dropdown-menu child_headCount_drop">
											<li><a class="dropdown-item child_headCount" href="#">0</a></li>
										</ul>
										<input type="number" class="form-control child_headCount" id="child_headCount"
											aria-label="Text input with dropdown button">
									</div>
								</div>
								<div class="col-sm-4">
									<div class="input-group">
										<span class="input-group-text">総コスト</span>
										<input type="number" id="total_cost" name="total_cost" aria-label="total-cost" class="form-control">
									</div>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-body col-4 payment-body" style="display: block;">
						<form>
							<div class="mb-3">
							    <label for="bank_name" class="form-label">銀行名</label>
							    <input type="text" class="form-control" id="bank_name" name="bank_name">
							</div>
							<div class="mb-3">
							    <label for="bank_branch_code" class="form-label">支店番号</label>
							    <input type="text" class="form-control" id="bank_branch_code" name="bank_branch_code">
							</div>
							<div class="mb-3">
							    <label for="bank_account_number" class="form-label">口座番号</label>
							    <input type="text" class="form-control" id="bank_account_number" name="bank_account_number">
							</div>
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">閉じる</button>
					<button type="button" class="btn btn-outline-primary bookInsert">登録</button>
					<button type="button" class="btn btn-outline-primary readyBookModify" style="display: none">修正</button>
					<button type="button" class="btn btn-outline-primary bookModify" style="display: none">修正</button>
					<button type="button" class="btn btn-outline-danger bookRemove" style="display: none">削除</button>
				</div>
			</div>
		</div>
	</div>
	<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
		<div
			class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
			<h1 class="h2">${title}</h1>
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
				<div class="dropdown">
					<button type="button"
						class="btn btn-outline-secondary dropdown-toggle" id="roomList"
						data-bs-toggle="dropdown" aria-expanded="false">ルーム番号</button>
					<ul class="dropdown-menu" aria-labelledby="roomList">
						<li><a class="dropdown-item" data-no="">全体</a></li>
						<c:forEach items="${roomList}" var="room">
							<li><a class="dropdown-item room_num room_num_drop" data-no="${room.no}">${room.room_title}</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<div id="book_calendar"></div>
	</main>
	</div>
	</div>
</body>
<script type="text/javascript">
	var calendar;
	
	var bookModel= new bootstrap.Modal(document.getElementById('bookModal'));
	
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
	function listHtml(room_no,current){
		var html = "";
		for(var i=0; i<=getAllRoom()[room_no].max-current; i++){
			html += '<li><a class="dropdown-item room_num room_num_drop" data-no="'+ room_no +'">'+ i +'</a></li>';
		}
		return html;
	}
	
	
	function radioHtml(max, current){
		var html = "";
		for(var i=0; i<=max; i++){
			if(i == current){
				html += '<option selected="selected">'+ i +'</option>';
			} else {
				html += '<option>'+ i +'</option>';
			}
		}
		return html;	
	}
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('book_calendar');
		calendar = new FullCalendar.Calendar(calendarEl, {
			themeSystem: 'bootstrap5',
			locale:"ja",
			customButtons:{
				insert: {
					text:'予約',
					click:function(){
						$(".modal-title").html("追加");
						$(".name").show();
						bookModel.show();
					},
				}
			},
			headerToolbar:{
				center: "insert"
			},
			initialView : 'dayGridMonth',
			events: getDateAtRoom(),
			eventClick: function(info) {
				$("#payment_flag,.form-control,.child_headCount,.adult_headCount,.modal_room_num_button").attr("disabled","disabled");
				$(".readyBookModify, .bookRemove").show();
				$(".bookInsert,.name").hide();
				var book = getBooking(info.event.id);
			    $(".modal-title").html(book.name+'さんの予約情報');
			    $("#bookModal").data("no",book.no);
			    $(".modal-title").data("no",book.room_no);
			    $(".modal_room_num_input").val(getAllRoom()[book.room_no].room_num);
			    $("#name").val(book.name);
			    $("input[name='phone_1']").val(book.phone.substring(0,3));
			    $("input[name='phone_2']").val(book.phone.substring(3,7));
			    $("input[name='phone_3']").val(book.phone.substring(7,12));
			    $("input[name='start_date']").val(book.start_date.substring(0,4)+'-'+book.start_date.substring(4,6)+'-'+book.start_date.substring(6,8));
			    $("input[name='end_date']").val(book.end_date.substring(0,4)+'-'+book.end_date.substring(4,6)+'-'+book.end_date.substring(6,8));
			    $("input[name='total_cost']").val(book.total_cost);
			    $(".adult_headCount").eq(2).val(book.adult);
			    $(".child_headCount").eq(2).val(book.child);
			    if(book.payment_flag == '1'){
			    	$("input[name='bank_name']").val(book.bank_name);
			    	$("input[name='bank_branch_code']").val(book.bank_branch_code);
			    	$("input[name='bank_account_number']").val(book.bank_account_number);
			    	$("#payment_flag").prop("checked",true);
			    	$(".payment-body").show();
			    }else{
			    	$("input[name='bank_name']").val("");
			    	$("input[name='bank_branch_code']").val("");
			    	$("input[name='bank_account_number']").val("");
			    	$("#payment_flag").prop("checked",false);
			    	$(".payment-body").hide();
			    }
			    bookModel.show();
			},
		});
		calendar.render();	
	});
	$('#bookModal').on('hidden.bs.modal', function (event) {
		$(".modal-title").html("追加");
		$(".bookModify,.readyBookModify,.bookRemove").hide();
		$(".bookInsert,.payment-body,.name").show();
		$("#payment_flag").prop("checked",true);
		$(".form-control").val("");
		$(".form-control,.modal_room_num_button,.child_headCount,.adult_headCount").removeAttr("disabled");
	});
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
		
		$('.room_num,.modal_room_num_drop > li').on("click",function(){
			calendar.removeAllEvents();
			calendar.addEventSource(getDateAtRoom($(this).data("no")));
			calendar.render();
			
		});
		$('.modal_room_num_drop > li').on("click",function(){
			$(".modal_room_num_input").val($(this).find('a').html());
			 $(".modal-title").data("no",$(this).find('a').data("no"));
		})
		$('#payment_flag').change(function(){
			if($("#payment_flag").is(":checked")){
				$(".payment-body").show("slow");
			} else {
				$(".payment-body").hide("slow");
				$("input[name='bank_name']").val('');
				$("input[name='bank_branch_code']").val('');
				$("input[name='bank_account_number']").val('');
			}
		})
		$(".readyBookModify").on("click",function(e){
			e.preventDefault();
			$(this).hide();
		    $(".bookModify").show();
		    $("#payment_flag,.form-control,.child_headCount,.adult_headCount,.modal_room_num_button").removeAttr("disabled");
			var no = getBooking($(".modal-title").data("no")).room_no;
			var adult = $("select.adult_headCount").val();
			var child = $("select.child_headCount").val();
			
			$(".modal-title").removeAttr("disabled");
			$(".form-control").removeAttr("disabled");
			$(".adult_headCount_drop").html(listHtml(no,0));
		    $(".child_headCount_drop").html(listHtml(no,0));
		})
		$('.adult_headCount').change(function(){
			console.log(typeof($(this).find("option:selected").html()));
			var currentHead = $(this).find("option:selected").html();
			var child = $("select.child_headCount").val();
			var no = $(".modal-title").data("no");
			no = getAllRoom()[getBooking(no).room_no].max;
			$("select.child_headCount").html(radioHtml(no-currentHead,child));
		})
		$('.child_headCount').change(function(){
			console.log(typeof($(this).find("option:selected").html()));
			var currentHead = $(this).find("option:selected").html();
			var adult = $("select.adult_headCount").val();
			var no = $(".modal-title").data("	no");
			no = getAllRoom()[getBooking(no).room_no].max;
			$("select.child_headCount").html(radioHtml(no-currentHead,adult));
		});
		$(".bookInsert").on("click",function(){
			console.log($("#payment_flag").is(":checked"));
			var data = {
			"room_no": $(".modal-title").data("no")
		    , "name": $("#name").val()
		    , "phone": $("#phone_1").val()+$("#phone_2").val()+$("#phone_3").val()
		    , "adult":$("#adult_headCount").val()
		    , "child":$("#child_headCount").val()
		    , "start_date": $("#start_date").val().substring(0,4) + $("#start_date").val().substring(5,7) + $("#start_date").val().substring(8,10)
		    , "end_date": $("#end_date").val().substring(0,4) + $("#end_date").val().substring(5,7) + $("#end_date").val().substring(8,10)
		    , "options": ""
		    , "payment_flag":($("#payment_flag").is(":checked"))? "1":"0"
		    , "total_cost": $("#total_cost").val()
		    , "bank_name": $("#bank_name").val()
		    , "bank_branch_code":$("#bank_branch_code").val()
		    , "bank_account_number":$("#bank_account_number").val()
		    };
			writeBooking(data);
		});
		$(".bookModify").on("click",function(){
			var data = {
			"no": $("#bookModal").data("no")
			,"room_no": $(".modal-title").data("no")
		    , "name": $("#name").val()
		    , "phone": $("#phone_1").val()+$("#phone_2").val()+$("#phone_3").val()
		    , "adult":$("#adult_headCount").val()
		    , "child":$("#child_headCount").val()
		    , "start_date": $("#start_date").val().substring(0,4) + $("#start_date").val().substring(5,7) + $("#start_date").val().substring(8,10)
		    , "end_date": $("#end_date").val().substring(0,4) + $("#end_date").val().substring(5,7) + $("#end_date").val().substring(8,10)
		    , "options": ""
		    , "payment_flag":($("#payment_flag").is(":checked"))? "1":"0"
		    , "total_cost": $("#total_cost").val()
		    , "bank_name": $("#bank_name").val()
		    , "bank_branch_code":$("#bank_branch_code").val()
		    , "bank_account_number":$("#bank_account_number").val()
		    };
			console.log(data);
			modifyBooking(data);
		});
		
		
		
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
		var booking;
		
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
	function writeBooking(data){
		$.ajax({ 
			type: "POST", 
			url: "/admin/ajax/writeBooking", 
			data: data, 
			success: function(data) { 
				alert(data);
				location.replace('/admin/book');
			} 
		});	
	}
	function modifyBooking(data){
		$.ajax({ 
			type: "POST", 
			url: "/admin/ajax/modifyBooking", 
			data: data, 
			success: function(data) { 
				alert(data);
				location.replace('/admin/book');
			} 
		});
	}
</script>
</html>