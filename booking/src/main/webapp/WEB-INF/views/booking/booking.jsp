<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>input</title>
<style type="text/css">
.container {
	max-width: 960px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row g-5">
			<div class="col-md-5 col-lg-4 order-md-last">
				<h4 class="d-flex justify-content-between align-items-center mb-3">
					<span class="text-primary">総コスト</span> 
					<span class="badge bg-primary rounded-pill"></span>
				</h4>
				<ul class="list-group mb-3">
					<li class="list-group-item d-flex justify-content-between lh-sm">
						<div>
							<h6 class="my-0">大人コスト</h6>
							<small class="text-muted">大人費用</small>
						</div> <span class="text-muted" id="adult"></span>
					</li>
					<li class="list-group-item d-flex justify-content-between lh-sm">
						<div>
							<h6 class="my-0">小人コスト</h6>
							<small class="text-muted">小人費用</small>
						</div> <span class="text-muted" id="child"></span>
					</li>
					<li class="list-group-item d-flex justify-content-between lh-sm">
						<div>
							<h6 class="my-0">options</h6>
							<small class="text-muted">options</small>
						</div> <span class="text-muted" id="options"></span>
					</li>
					<li class="list-group-item d-flex justify-content-between"><span>Total</span>
						<strong id="total"></strong></li>
				</ul>
			</div>
			<div class="col-md-7 col-lg-8">
				<h4 class="mb-3">予約</h4>
				<form class="needs-validation" novalidate>
					<div class="row g-3">
						<!-- name -->
						<div class="col-12">
							<label for="firstName" class="form-label">名前</label> <input
								type="text" class="form-control" id="firstName" placeholder=""
								value="" required>
							<div class="invalid-feedback">Valid first name is required.
							</div>
						</div>
						<!-- phone -->
						<div class="col-sm-4">
							<label for="phone" class="form-label">携帯電話</label>
							<div class="input-group has-validation">
								<input type="text" class="form-control" id="phone1"
									placeholder="010" required>
								<div class="invalid-feedback">電話番号を入力してください</div>
							</div>
						</div>
						<div class="col-sm-4">
							<label for="phone" class="form-label">&nbsp;</label>
							<div class="input-group has-validation">
								<input type="text" class="form-control" id="phone2"
									placeholder="0000" required>
								<div class="invalid-feedback">電話番号を入力してください</div>
							</div>
						</div>
						<div class="col-sm-4">
							<label for="phone" class="form-label">&nbsp;</label>
							<div class="input-group has-validation">
								<input type="text" class="form-control" id="phone3"
									placeholder="0000" required>
								<div class="invalid-feedback">電話番号を入力してください</div>
							</div>
						</div>
						<div class="col-12 roomRadio d-flex justify-between">
							<c:forEach items="${roomList}" var="room">
								<div class="row">
									<img src="${imageMap[room.room_num][0]}" style="width: 120px">
									<div class="form-check form-check-inline">
										<input name="room" type="radio" class="form-check-input room"
											value="${room.room_num}" data-no="${room.no}" required>
										<label class="form-check-label" for="credit"> <c:out
												value="${room.room_title}"></c:out>
										</label>
									</div>
								</div>
							</c:forEach>
						</div>
						<div class="col-sm-6">
							<label for="spinner">大人:</label> 
							<input class="spinner" name="adult" placeholder="0">
						</div>
						<div class="col-sm-6">
							<label for="spinner">子供:</label>
							<input class="spinner" name="child" placeholder="0">
						</div>
					</div>

					<div id="calendar" class="col mt-2"></div>

					<hr class="my-4">

					<div class="form-check">
						<input type="checkbox" class="form-check-input" id="same-address">
						<label class="form-check-label" for="same-address">Shipping
							address is the same as my billing address</label>
					</div>

					<div class="form-check">
						<input type="checkbox" class="form-check-input" id="save-info">
						<label class="form-check-label" for="save-info">Save this
							information for next time</label>
					</div>
					<hr class="my-4">

					<h4 class="mb-3">Payment</h4>

					<div class="my-3">
						<div class="form-check">
							<input id="credit" name="paymentMethod" type="radio"
								class="form-check-input" checked required> <label
								class="form-check-label" for="credit">Credit card</label>
						</div>
						<div class="form-check">
							<input id="debit" name="paymentMethod" type="radio"
								class="form-check-input" required> <label
								class="form-check-label" for="debit">Debit card</label>
						</div>
						<div class="form-check">
							<input id="paypal" name="paymentMethod" type="radio"
								class="form-check-input" required> <label
								class="form-check-label" for="paypal">PayPal</label>
						</div>
					</div>

					<div class="row gy-3">
						<div class="col-md-6">
							<label for="cc-name" class="form-label">Name on card</label> <input
								type="text" class="form-control" id="cc-name" placeholder=""
								required> <small class="text-muted">Full name as
								displayed on card</small>
							<div class="invalid-feedback">Name on card is required</div>
						</div>

						<div class="col-md-6">
							<label for="cc-number" class="form-label">Credit card
								number</label> <input type="text" class="form-control" id="cc-number"
								placeholder="" required>
							<div class="invalid-feedback">Credit card number is
								required</div>
						</div>

						<div class="col-md-3">
							<label for="cc-expiration" class="form-label">Expiration</label>
							<input type="text" class="form-control" id="cc-expiration"
								placeholder="" required>
							<div class="invalid-feedback">Expiration date required</div>
						</div>

						<div class="col-md-3">
							<label for="cc-cvv" class="form-label">CVV</label> <input
								type="text" class="form-control" id="cc-cvv" placeholder=""
								required>
							<div class="invalid-feedback">Security code required</div>
						</div>
					</div>

					<hr class="my-4">

					<button class="w-100 btn btn-primary btn-lg" type="submit">Continue
						to checkout</button>
				</form>
			</div>
		</div>
	</div>
<script type="text/javascript">
	var child_cost = $('#child').data('cost');
	var adult_cost = $('#adult').data('cost');
	var child_person = $('#child').data('person');
	var adult_person = $('#adult').data('person');
	
	getRoomInfo();

	function getRoomInfo(){
		$.ajax({
			method:"GET",
			url: "/ajax/room.json",
			dataType:"json"
		}).done(function(data){
			console.log(data);
		});
	}
	
	function getRoomInfoToNo(no){
		$.ajax({
			method:"GET",
			url: "/ajax/room/"+ no +".json",
			dataType:"json"
		}).done(function(data){
			adult_cost = data.adult_cost;
			child_cost = data.child_cost;
			console.log(adult_person);
			console.log(child_person);
			$('#adult').attr("data-cost",data.adult_cost).html(data.adult_cost * adult_person);
			$('#child').attr("data-cost",data.child_cost).html(data.child_cost * child_person);
			$('#adult').html(adult_cost * adult_person);
			$('#child').html(child_cost * child_person);
		});
	}
	/////////////////searching All booking at these room_no
	function getBookingIntoRoom(room_no, calendar){
		if(calendar.getEventSources().length != 0){
			calendar.getEventSources()[0].remove();
		};
		calendar.addEventSource({
			url:"/ajax/booking/"+ room_no +".json",
			backgroundColor:"",
		});
		calendar.unselect();
	}
	
	////////////////jquery start
	$(document).ready(function() {
		////////////////////////calendar
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			locale:'ja',
			initialView: 'dayGridMonth',
			selectable:true,
			validRange: {
				start: new Date()
			},
			select:function(date){
				console.log(date.start);
				console.log(date.end);
			},
		});
		
		calendar.render();
	  //////////////////////room radio process
	  /////////////change
		$('.room').change(function(){
			getBookingIntoRoom($(this).data('no'),calendar);
			getRoomInfoToNo($(this).data('no'));
		});
		
	  	if(${not empty room_Info}){
	  		$('input[value="${room_Info.room_num}"]').attr('checked', true);
	  		getBookingIntoRoom('${room_Info.no}', calendar);
	  		getRoomInfoToNo('${room_Info.no}');
	  	};
	  	
	  	//spinner setting
	  	$('.spinner').spinner({
	  		min:0,
	  		spin:function(e,ui){
	  			var ageType = $(this).attr('name');
	  			eval("var " + ageType + "_person = " + ui.value);
	  			$('#'+ageType).attr("data-person",ui.value).html(ui.value * eval(ageType+'_cost'));
	  		}
	  	});
	  	
		/////////////////calculate total cost
		function costCalculate(){
			$('#adult').html("");
			$('#child').html("");
			$('#adult').html($('#adult').data("cost") * $('#adult').data("person"));
			$('#child').html($('#child').data("cost") * $('#child').data("person"));
		}
	  	
	});
	
	function costCalculate(){
		$('#adult').html("");
		$('#child').html("");
		$('#adult').html($('#adult').data("cost") * $('#adult').data("person"));
		$('#child').html($('#child').data("cost") * $('#child').data("person"));
	}
	
	/* // Example starter JavaScript for disabling form submissions if there are invalid fields
	(function() {
		'use strict'

		// Fetch all the forms we want to apply custom Bootstrap validation styles to
		var forms = document.querySelectorAll('.needs-validation')

		// Loop over them and prevent submission
		Array.prototype.slice.call(forms).forEach(function(form) {
			form.addEventListener('submit', function(event) {
				if (!form.checkValidity()) {
					event.preventDefault()
					event.stopPropagation()
				}

				form.classList.add('was-validated')
			}, false)
		})
	})(); */
	
</script>
</html>