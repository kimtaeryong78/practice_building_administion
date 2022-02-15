<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.bookcontainer{
	background: rgba(255,255,255,0.5);
	left:47%!important; 
}

</style>
		<!-- Swiper -->
		<div class="swiper bookSwiper position-relative">
			<div class="swiper-wrapper">
				<c:forEach items="${roomList}" var="room">
					<c:forEach items="${imageMap[room.room_num]}" var="url">
						<div class="swiper-slide mainSwiper-slide">
							<img src="${url}" class="img-fluid">
						</div>
					</c:forEach>
				</c:forEach>
			</div>
			<div class="container bookcontainer position-absolute d-flex align-items-center top-50 translate-middle shadow-lg h-75" style="z-index: 900">
				<div class="container bookcontainer w-100 h-75 d-flex justify-content-center bookChange">
					<h1 class="visually-hidden">T.R 建物</h1>
					<div class="px-4 py-5 my-5 text-center w-100 h-100">
						<div class="d-flex flex-column p-4">
							<h1 class="display-5 fw-bold">利用可能な部屋があるか探してみてください。</h1>
							<hr class="mt-5 mb-3">
							<div class="col-lg-6 mx-auto lead">
								<p class="mb-4">マウスカーソルを上に乗せると予約できます。</p>
							</div>
							<div class="lead_date" style="display: none">
								<div class="input-group mb-3">
									<input type="text" class="form-control datepicker" placeholder="出発日" id="main_start_date" aria-label="start_date" readonly="readonly">
									<span class="input-group-text">~</span>
									<input type="text" class="form-control datepicker" placeholder="到着日" id="main_end_date" aria-label="end_date" readonly="readonly">
									<button class="btn btn-outline-secondary" type="button" id="reservationCheck">検索</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Initialize Swiper -->
		<script>
			var swiper = new Swiper(".bookSwiper", {
				slidesPerView: 1,
				effect: 'fade',
				grabCursor: true,
				loop: true,
				speed: 1500,
				autoplay: {
					delay: 2000,
					disableOnInteraction: false,
				},
			});
			$(document).ready(function(){
				$("#main_start_date").datepicker({
					autoSize: true,
					dateFormat: "yy-mm-dd",
					changeMonth: true,
					showButtonPanel: true,
					closeText: "X",
					gotoCurrent: true,
					currentText: "今月",
					minDate: new Date(),
					onSelect:function(date,inst){
						if($("#main_end_date").val()!="" && $("#main_end_date").val()<date){
							alert("error");
							$("#main_start_date").val('');
							$("#main_start_date").focus();
						}
						console.log("start");
					},
				})
				$("#main_end_date").datepicker({
					autoSize: true,
					dateFormat: "yy-mm-dd",
					changeMonth: true,
					showButtonPanel: true,
					closeText: "X",
					gotoCurrent: true,
					currentText: "今月",
					minDate: new Date(),
					onSelect:function(date,inst){
						if($("#main_start_date").val()!="" && $("#main_start_date").val()>date){
							alert("error");
							$("#main_end_date").val('');
							$("#main_end_date").focus();
						}
					},
				})
				$.datepicker.setDefaults( $.datepicker.regional["ja"] )
				
				
				var main_start_date_for_reservation ;
				var main_end_date_for_reservation ;
				$(document).on("click","#reservationCheck",function(){
					main_start_date_for_reservation = $("#main_start_date").val();
					main_end_date_for_reservation = $("#main_end_date").val();
					if($("#main_start_date").val() != "" && $("#main_end_date").val() != ""){
						let isExist = new Array();
						var bookList = new Array();
						var roomList = new Array();
						bookList = getAllBooking();
						for(var book in bookList){
							var bookTotalList = [];
							roomList.push(book);
							for(var b in bookList[book]){
								for(let i=bookList[book][b].start_date; i<=bookList[book][b].end_date; i++){
									bookTotalList.push(i);
								}
							}
							for(var i= new Date($("#main_start_date").val()); i<=new Date($("#main_end_date").val()); i.setDate(i.getDate()+1)){
								var str = i.getFullYear()+'';
								if(i.getMonth()<9){
									str += "0";
								}
								str += i.getMonth()+1;
								
								if(i.getDate()<10){
									str += "0";
								}
								str += i.getDate();
								
								if(bookTotalList.includes(str)){
									isExist.push(book);
								}
							}
						}
						filteredroomList = roomList.filter(x => !isExist.includes(x));
						console.log("filteredroomList",filteredroomList);
						if(filteredroomList.length<=0){
							alert("nope");
						}else{
							var room_accordion = '<div class="accordion w-100" id="accordionReservation">';
							for(var room in filteredroomList){
								let room_info = getRoomInfo(filteredroomList[room]);
								room_accordion += '<div class="accordion-item"><h2 class="accordion-header" id="heading'+ room +'"><button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse'+room+'" aria-expanded="';
								if(room == 0){
									room_accordion += 'true" aria-controls="collapse'+room+'">';
								}else{
									room_accordion += 'false" aria-controls="collapse'+room+'">';
								}
								room_accordion += room_info.room_title;
								room_accordion += '</button></h2><div id="collapse'+room+'" class="accordion-collapse collapse'; 
								if(room == 0){
									room_accordion += 'show" aria-labelledby="heading'+room+'" data-bs-parent="#accordionReservation"><div class="accordion-body">';
								}else{
									room_accordion += '" aria-labelledby="heading'+room+'" data-bs-parent="#accordionReservation"><div class="accordion-body">';
								}
								room_accordion += room_info.explanation;
								room_accordion += '</div><button type="button" class="btn btn-outline-primary reservation mb-3" data-no="'+room_info.no+'">予約</button></button></div></div>';
							}
							room_accordion += '</div>';
							
							$(".bookChange").hide("slow",function(){
								$(this).html(room_accordion).promise().done(function(){
									$(".bookChange").show("slow")
								})
							});
						}
					}else {
						alert("入力してください");
						$("#main_start_date").focus();
					}
				})
				$(".bookcontainer").hover(function(){
					$(".lead_date").show("slow");
				},function(){});
				
				$(document).on("click",".reservation",function(){
					console.log("reservation");
					console.log(main_start_date_for_reservation);
					console.log(main_end_date_for_reservation);
					let room_info = getRoomInfo($(this).data("no"));
					console.log("${optionsList}");
					
					let str = '<div class="card w-100 text-center"><div class="card-header">予約</div><div class="card-body"><h5 class="card-title"><div class="input-group mb-3"><input type="text" class="form-control" placeholder="出発日" id="main_start_date" aria-label="start_date" readonly="readonly" value="'+ main_start_date_for_reservation +'"><span class="input-group-text">~</span><input type="text" class="form-control" placeholder="到着日" id="main_end_date" aria-label="end_date" readonly="readonly" value="'+main_end_date_for_reservation+'"></div></h5><p class="card-text"> yeah</p><button class="btn btn-primary real_reservation">予約する</button></div></div>';
					$(".bookChange").hide("slow",function(){
						$(this).html(str).promise().done(function(){
							$(".bookChange").show("slow")
						})
					});
				})
				
				
			});
			
			function getAllBooking(){
				var bookList = new Array();
				$.ajax({ 
					url: "/ajax/getAllBooking.json",
					dataType:"json",
					type: "GET", 
					async:false,
					success: function(data) {
						bookList = data;
					} 
				});
				return bookList;
			}
			function getRoomInfo(no){
				var room;
				$.ajax({ 
					url: "/ajax/getRoom/"+no+".json",
					dataType:"json",
					type: "GET", 
					async:false,
					success: function(data) {
						room = data;
					} 
				});
				return room;
			}
			
		</script>
		<script src="https://cdn.jsdelivr.net/gh/jquery/jquery-ui/ui/i18n/datepicker-ja.js"></script>