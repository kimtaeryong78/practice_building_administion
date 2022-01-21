<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<span class="text-primary">総コスト</span> <span
					class="badge bg-primary rounded-pill">3</span>
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
				<li class="list-group-item d-flex justify-content-between">
				<span>Total</span> <strong id="total"></strong></li>
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
							<input type="text" class="form-control" id="username" placeholder="Username" required>
							<div class="invalid-feedback">Your username is required.</div>
						</div>
					</div>
					<div class="col-sm-4">
						<label for="phone" class="form-label">&nbsp;</label>
						<div class="input-group has-validation">
							<input type="text" class="form-control" id="username" placeholder="Username" required>
							<div class="invalid-feedback">Your username is required.</div>
						</div>
					</div>
					<div class="col-sm-4">
						<label for="phone" class="form-label">&nbsp;</label>
						<div class="input-group has-validation">
							<input type="text" class="form-control" id="username" placeholder="Username" required>
							<div class="invalid-feedback">Your username is required.</div>
						</div>
					</div>
					<!--  -->					
					<div class="col-12">
						<label for="email" class="form-label">Email <span
							class="text-muted">(Optional)</span></label> <input type="email"
							class="form-control" id="email" placeholder="you@example.com">
						<div class="invalid-feedback">Please enter a valid email
							address for shipping updates.</div>
					</div>

					<div class="col-12">
						<label for="address" class="form-label">Address</label> <input
							type="text" class="form-control" id="address"
							placeholder="1234 Main St" required>
						<div class="invalid-feedback">Please enter your shipping
							address.</div>
					</div>

					<div class="col-12">
						<label for="address2" class="form-label">Address 2 <span
							class="text-muted">(Optional)</span></label> <input type="text"
							class="form-control" id="address2"
							placeholder="Apartment or suite">
					</div>

					<div class="col-md-5">
						<label for="country" class="form-label">Country</label> <select
							class="form-select" id="country" required>
							<option value="">Choose...</option>
							<option>United States</option>
						</select>
						<div class="invalid-feedback">Please select a valid country.
						</div>
					</div>

					<div class="col-md-4">
						<label for="state" class="form-label">State</label> <select
							class="form-select" id="state" required>
							<option value="">Choose...</option>
							<option>California</option>
						</select>
						<div class="invalid-feedback">Please provide a valid state.
						</div>
					</div>

					<div class="col-md-3">
						<label for="zip" class="form-label">Zip</label> <input type="text"
							class="form-control" id="zip" placeholder="" required>
						<div class="invalid-feedback">Zip code required.</div>
					</div>
				</div>

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
						<div class="invalid-feedback">Credit card number is required
						</div>
					</div>

					<div class="col-md-3">
						<label for="cc-expiration" class="form-label">Expiration</label> <input
							type="text" class="form-control" id="cc-expiration"
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
	</main>
	<!-- 
<div id="boxWrapp">
	<section class="page" id="contact">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-lg-12 hidding animated"
					data-animated="bounceInUp">
					<div class="build contact">
						<h1>予約</h1>
					</div>
				</div>
				<div class="col-md-6 col-lg-12 animated delay2"
					data-animated="bounceInUp">
					<div class="build">
						<form role="form">
							<div class="form-group">
								<label for="room_num">ご希望エリア</label>
								<select class="form-control">
								  <option selected>部屋番号</option>
								  <option value="101">101</option>
								  <option value="102">102</option>
								  <option value="103">103</option>
								  <option value="104">104</option>
								  <option value="105">105</option>
								</select>
							</div>
							<div class="form-group">
								<label for="room_title">タイトル</label> 
								<input type="text" class="form-control" id="room_title" name="room_title" pattern="^.{1,25}$">
							</div>
							<label for="max">最大人数</label> 
							<div class="form-group">
								<div class="checkbox-inline pt-1">
								  <input class="form-check-input" type="radio" name="max" id="max1" value="option1">
								  <label class="form-check-label" for="inlineRadio1">1</label>
								</div>
								<div class="checkbox-inline mt-1">
								  <input class="form-check-input" type="radio" name="max" id="max2" value="option2">
								  <label class="form-check-label" for="inlineRadio2">2</label>
								</div>
								<div class="checkbox-inline">
								  <input class="form-check-input" type="radio" name="max" id="max3" value="option3">
								  <label class="form-check-label" for="inlineRadio3">3</label>
								</div>
								<div class="checkbox-inline">
								  <input class="form-check-input" type="radio" name="max" id="max4" value="option4">
								  <label class="form-check-label" for="inlineRadio4">4</label>
								</div>
								<div class="checkbox-inline">
								  <input class="form-check-input" type="radio" name="max" id="max5" value="option5">
								  <label class="form-check-label" for="inlineRadio5">5</label>
								</div>
								<div class="checkbox-inline">
								  <input class="form-check-input" type="radio" name="max" id="max6" value="option6">
								  <label class="form-check-label" for="inlineRadio6">6</label>
								</div>
								<div class="checkbox-inline">
								  <input class="form-check-input" type="radio" name="max" id="max7" value="option7">
								  <label class="form-check-label" for="inlineRadio7">7</label>
								</div>
								<div class="checkbox-inline">
								  <input class="form-check-input" type="radio" name="max" id="max8" value="option8">
								  <label class="form-check-label" for="inlineRadio8">8</label>
								</div>
								<div class="checkbox-inline">
								  <input class="form-check-input" type="radio" name="max" id="max9" value="option9">
								  <label class="form-check-label" for="inlineRadio9">9</label>
								</div>
							</div>
							<div class="form-group">
								<label for="InputName">カラーコード</label> 
								<input type="text" value="ffffff" name="border-color" class="pick-a-color form-control">
							</div>
							<div class="form-group">
								<label for="adult_cost">大人コスト</label> 
								<input type="email" name="adult_cost" class="form-control" id="adult_cost">
							</div>
							<div class="form-group">
								<label for="child_cost">子供コスト</label> 
								<input type="email" name="child_cost" class="form-control" id="child_cost">
							</div>
							<div class="custom-file">
								<label for="nputEmail">イメージファイル</label> 
							  <input type="file" class="custom-file-input" id="customFile">
							  <label class="custom-file-label" for="customFile">Choose file</label>
							</div>
							
							<label for="InputMessage">説明</label>
							<textarea class="form-control" rows="8" minlength="1" maxlength="2000" placeholder="入力してください" ></textarea>
							
							<button type="submit" name="save" class="btn btn-success">SAVE</button>
							<button type="submit" name="" class="btn btn-primary">UPDATE</button>
							<button type="submit" name="" class="btn btn-warning">RECOVERY</button>
							<button type="submit" name="" class="btn btn-danger">DELETE</button>
						</form>
					</div>
					end build
				</div>
				end col
			</div>
			end row
		</div>
		end container
	</section>
	</div> -->
</body>
<script type="text/javascript">
	// Example starter JavaScript for disabling form submissions if there are invalid fields
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
	})()
</script>
</html>