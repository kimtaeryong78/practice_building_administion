<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>input</title>
</head>
<body>
<div id="boxWrapp">
	<section class="page" id="contact">
		<!-- end gmap -->
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-lg-12 hidding animated"
					data-animated="bounceInUp">
					<div class="build contact">
						<h1>お問い合わせ</h3>
					</div>
					<!-- end build -->
				</div>
				<!-- end col -->
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
					<!-- end build -->
				</div>
				<!-- end col -->
			</div>
			<!-- end row -->
		</div>
		<!-- end container -->
	</section>
	</div>
</body>
</html>