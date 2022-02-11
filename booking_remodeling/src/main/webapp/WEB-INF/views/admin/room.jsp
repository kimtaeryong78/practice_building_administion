<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<style type="text/css">
.img {
	width: 100%;
	height: 300px;
	object-fit: fill;
}
.img-responsive{
	width:200px;
	height:150px;
	object-fit: fill;
}
.image-checkbox {
	cursor: pointer;
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	border: 4px solid transparent;
	margin-bottom: 0;
	outline: 0;
}
.image-checkbox input[type="checkbox"] {
	display: none;
}
.image-checkbox-checked {
	border-color: #4783B0;
}
</style>
</head>
<body>
	<div class="modal fade" id="roomModal" tabindex="-1">
		<div class="modal-dialog modal-xl modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">登録<br><small>登録フォームです</small></h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body row g-2">
					<div class="col-md">
						<div class="input-group mb-3">
							<input type="file" class="form-control" id="file_name" multiple="multiple">
							<button id="addFile" data-no="${room.no}" class="btn btn-outline-secondary" type="button">追加</button>	
						</div>
					</div>
					<hr class="mb-3">
					<div class="col-3 mb-3">
						<div class="input-group">
							<label class="input-group-text" for="room-num">ルーム番号</label>
							<select class="form-select" id="room-num">
								<c:forEach items="${roomList}" var="dropRoom">
								    <option 
									<c:if test="${dropRoom.room_num eq room.room_num}">
										selected
									</c:if>
									>${dropRoom.room_num}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="col-3 mb-3">
						<div class="input-group">
							<label for="inputTitle" class="input-group-text">タイトル</label>
  								<input type="text" class="form-control" id="inputTitle" placeholder="タイトルを入力してください">
						</div>
					</div>
					<div class="col-3 mb-3">
						<label for="colorInput" class="input-group-text float-start col">ルーム色</label>
						<input type="color" class="form-control form-control-color" id="colorInput" title="Choose your color">
					</div>
					<div class="row mb-3">
						<label class="form-label">人数・料金</label>
						<div class="col-sm input-group">
							<label for="max" class="input-group-text">最大</label>
							<input type="text" class="spinnerPerson form-control" id="max" value="0">
							<input type="range" class="form-range" min="0", max="10" id="max_bar" value="0">
						</div>
						<div class="col-sm input-group">
							<label for="adult_cost" class="input-group-text">大人料金</label>
							<input type="text" class="spinnerCost form-control" id="adult_cost" value="0">
							<input type="range" class="form-range" min="0", max="10000" id="adult_cost_bar" value="0">
						</div>
						<div class="col-sm input-group">
							<label for="child_cost" class="input-group-text">子供料金</label>
							<input type="text" class="spinnerCost form-control" id="child_cost" value="0">
							<input type="range" class="form-range" min="0", max="10000" id="child_cost_bar" value="0">
						</div>
						<p class="room_modify_summernote">${room.explanation}</p>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger float-end me-2 roomDelete">削除</button>
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
					<c:if test="${fn:length(roomList) lt 5}">
						<button type="button" class="btn btn-outline-secondary roomWrite" data-bs-toggle="modal" data-bs-target="#roomModal">掲載</button>
					</c:if>
				</div>
			</div>
		</div>
		<c:forEach items="${roomList}" var="room">
			<div class="card mb-3">
				<div class="row g-0">
					<div class="col-md-4 ">
						<div id="room${room.room_num}" class="carousel slide" data-bs-ride="carousel">
							<div class="carousel-indicators">
								<button type="button" data-bs-target="#room${room.room_num}"
									data-bs-slide-to="0" class="active" aria-current="true"
									aria-label="Slide 1"></button>
								<button type="button" data-bs-target="#room${room.room_num}"
									data-bs-slide-to="1" aria-label="Slide 2"></button>
								<button type="button" data-bs-target="#room${room.room_num}"
									data-bs-slide-to="2" aria-label="Slide 3"></button>
							</div>
							<div class="carousel-inner">
								<c:forEach items="${roomImageMap[room.room_num]}" var="image"
									varStatus="s">
								<c:if test="${s.index eq 0}">
									<div class="carousel-item active">
								</c:if>
								<c:if test="${s.index ne 0}">
									<div class="carousel-item">
								</c:if>
										<img src="${image}" class="d-block img" alt="${room.room_num}">
									</div>
								</c:forEach>
							</div>
							<button class="carousel-control-prev" type="button"
								data-bs-target="#room${room.room_num}" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
									class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button"
								data-bs-target="#room${room.room_num}" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
									class="visually-hidden">Next</span>
							</button>
						</div>
						<!-- carousel end -->
					</div>
					<!-- image area -->
					<div class="col-md-8" style="border:2px solid ${room.color_code};" data-bs-toggle="collapse" data-bs-target="#modifyRoom${room.room_num}" aria-expanded="false" aria-controls="modifyRoom${room.room_num}">
						<div class="card-body">
							<p class="card-text"><small class="text-muted">ルーム番号 : ${room.room_num}</small></p>
							<h1 class="card-title"> ${room.room_title}</h1>
							<p class="card-text"><small class="text-muted">成人 : ${room.adult_cost}円 ・ 子供 : ${room.child_cost}円</small></p>
							<hr>
							<p class="card-text"> 説明 : ${room.explanation}</p>
						</div>
					</div>
				</div>
				<div class="collapse" id="modifyRoom${room.room_num}">
					<div class="card-body">
						<h4 class="card-title">修正</h4>
						<h7 class="card-subtitle mb-2 text-muted">修正フォームです</h7>
						<hr>
						<small>削除するファイルを選択してください。<button class="btn btn-ms btn-danger float-end imageDelete" data-no="${room.no}" >削除</button></small>
						<form class="row m-0 w-100">
							<div>
							<c:forEach items="${roomImageMap[room.room_num]}" var="image">
								<div class="col-xs-4 col-sm-3 col-md-2 px-0 me-3 mb-3 float-start" style="width: 200px;height: 150px;">
									<label class="image-checkbox">
										<img class="img-responsive" src="${image}" />
										<input type="checkbox"/>
									</label>
								</div>
							</c:forEach>
							</div>
							<div class="mb-3">
								<div class="input-group mb-3">
									<input type="file" class="form-control" id="file_name">
									<button id="addFile" data-no="${room.no}" class="btn btn-outline-secondary" type="button">追加</button>	
								</div> 
							</div>
							<div class="col-3 mb-3">
								<div class="input-group">
									<label for="inputTitle" class="input-group-text">タイトル</label>
    								<input type="text" class="form-control" id="inputTitle" value="${room.room_title}">
								</div>
							</div>
							<div class="col-3 mb-3">
								<label for="colorInput" class="input-group-text float-start col">ルーム色</label>
								<input type="color" class="form-control form-control-color" id="colorInput" value="${room.color_code}" title="Choose your color">
							</div>
							<div class="row mb-3">
								<label class="form-label">人数・料金</label>
								<div class="col-sm input-group">
									<label for="max" class="input-group-text">最大</label>
									<input type="text" class="spinnerPerson form-control" id="max" value="${room.max}">
									<input type="range" class="form-range" min="0", max="10" id="max_bar" value="${room.max}">
								</div>
								<div class="col-sm input-group">
									<label for="adult_cost" class="input-group-text">大人料金</label>
									<input type="text" class="spinnerCost form-control" id="adult_cost" value="${room.adult_cost}">
									<input type="range" class="form-range" min="0", max="10000" id="adult_cost_bar" value="${room.adult_cost}" >
								</div>
								<div class="col-sm input-group">
									<label for="child_cost" class="input-group-text">子供料金</label>
									<input type="text" class="spinnerCost form-control" id="child_cost" value="${room.child_cost}">
									<input type="range" class="form-range" min="0", max="10000" id="child_cost_bar" value="${room.child_cost}">
								</div>
								<p class="room_modify_summernote">${room.explanation}</p>
								<div class="mt-3">
									<button type="button" data-no="${room.no}" class="btn btn-primary float-end roomModify">修正</button>
									<button type="button" data-no="${room.no}" class="btn btn-danger float-end me-2 roomDelete">削除</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div> 
			<!-- card end -->
		</c:forEach>
	</main>
	</div>
	</div>
</body>
<script type="text/javascript">
	//summernote
	$('.room_modify_summernote').summernote({
		tabsize: 2
		, height: 300
		, toolbar: [
			['style', ['style']],
			['font', ['bold', 'underline', 'clear']],
			['color', ['color']],
			['para', ['ul', 'ol', 'paragraph']],
			['table', ['table']],
			['insert', ['link', 'picture', 'video']],
			['view', ['fullscreen', 'codeview', 'help']]
		],
	});
	//accordion
	$(".selector").accordion({
		collapsible: true,
		active: true,
	});
	// sync the state to the input
	$(".image-checkbox").on("click", function (e) {
		$(this).toggleClass('image-checkbox-checked');
		$(this).find('i').toggleClass('hidden');
		var check = $(this).find('input[type="checkbox"]');
		if(check.attr("checked") == "checked"){
			check.removeAttr("checked");
		} else {
			check.attr("checked","checked");
		}
		
		e.preventDefault();
	});
	
	function insertImage(no, formData){
		$.ajax({
			url:'/admin/ajax/insertRoomImage/'+no,
			processData:false,
			contentType:false,
			data: formData,
			type: 'POST',
			success:function(result){
				alert(result);
				location.replace('/admin/room');
			}
		});
	};
	
	function modifyRoomImage(no, array){
		console.log(array);
		$.ajax({ 
			type: "POST", 
			url: "/admin/ajax/modifyRoomImage/"+no, 
			data: {
				removeImages : array 
			},
			success: function(data) { 
				alert(data);
				location.replace('/admin/room');
			}, errer : function(e){
				console.log(e);
			} 
		});
	}
	
	function modifyRoom(data){
		$.ajax({ 
			type: "POST", 
			url: "/admin/ajax/modifyRoom", 
			data: data,
			success: function(data) { 
				alert(data);
				location.replace('/admin/room');
			}, errer : function(e){
				console.log(e);
			} 
		});
	}
	
	$(document).ready(function(){
		$("input[type='range']").change(function(){
			$(this).prev().find("input").val($(this).val())
		});
		$(".spinnerCost, .spinnerPerson").on("input",function(){
			if($(this).val() != null && $(this).val() != ""){
				console.log($(this).val());
				console.log($(this).parents().next().val($(this).val()));
			}
		})
		$(".spinnerCost, .spinnerPerson").on("mousewheel",function(){
			if($(this).val() != null && $(this).val() != ""){
				console.log($(this).parents().next().val($(this).val()));
			}
		})
		
		//spinner
		////person
		$( ".spinnerPerson" ).spinner({
			spin: function( event, ui ) {
				if ( ui.value > 10 ) {
					$( this ).spinner( "value", 0 );
					return false;
				} else if ( ui.value < 0 ) {
					$( this ).spinner( "value", 10 );
					return false;
				}
			}
		});
		////cost
		$( ".spinnerCost" ).spinner({
			spin: function( event, ui ) {
				if ( ui.value > 10000 ) {
					$( this ).spinner( "value", 0 );
					return false;
				} else if ( ui.value < 0 ) {
					$( this ).spinner( "value", 10 );
					return false;
				}
			}
		});
		
		$('#addFile').on('click',function(){
			var formData = new FormData();
			var file = $('#file_name')[0].files[0];
			var no = $(this).data("no");
			formData.append("file",file);
			insertImage(no,formData);
		});
		$(".imageDelete").on("click",function(){
			var no = $(this).data("no");
			var deleteImages = new Array(); 
			var checkImages = $(this).parents().parents();
			console.log(checkImages.find(".image-checkbox-checked").each(function(){
				deleteImages.push($(this).find(".img-responsive").attr("src").substring(2));
			}));
			modifyRoomImage(no, deleteImages);
		});
		$(".roomModify").on("click",function(){
			
		});
		$(".roomDelete").on("click",function(){
			var no = $(this).data("no");
			var delete_flag = "1";
			var data = {"no":no,"delete_flag":delete_flag};
			modifyRoom(data);
		});
	});
</script>
</html>