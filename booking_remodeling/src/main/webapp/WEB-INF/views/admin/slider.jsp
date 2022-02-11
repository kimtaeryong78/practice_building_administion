<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class="modal fade" id="sliderModal" tabindex="-1">
		<div class="modal-dialog modal-xl modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">スライドイメージ登録</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body row g-2">
					<div class="card mb-3">
						<div class="card-body">
							<input type="file" id="file_name" name="file_name">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">消す</button>
					<button type="button" class="btn btn-primary sliderInsert">登録</button>
					<button type="button" class="btn btn-primary sliderModify" hidden="true">修正</button>
					<button type="button" class="btn btn-danger sliderDelete" hidden="true">削除</button>
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
					<button type="button" class="btn btn-outline-secondary SliderWrite"
						data-bs-toggle="modal" data-bs-target="#sliderModal">登録</button>
				</div>
			</div>
		</div>
		<div id="sortable">
			<c:forEach items="${sliderList}" var="slider">
				<div class="card mb-3" id="sort-${slider.no}">
					<div class="col-1">
						<img src="${slider.file_name}" class="card-img-top img-thumbnail">
					</div>
					<div class="card-body">
						<h5 class="card-title">${slider.file_name}</h5>
						<p class="card-text">sort no : ${slider.sort_no}</p>
						<div class="form-check form-switch">
							<input class="form-check-input activity" data-no="${slider.no}" type="checkbox"
								role="switch"
								<c:if test="${slider.activity eq 0}">checked</c:if>>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</main>
	</div>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		var origin_sort = new Array();
		<c:forEach items="${sliderList}" var="slider">
			var slide = {'no':Number("${slider.no}"),'sort_no':"${slider.sort_no}"};
			origin_sort.push(slide);
		</c:forEach>
		$("#sortable").sortable();
		$( "#sortable" ).on( "sortbeforestop", function( event, ui ) {
			var sort = $("#sortable").sortable("serialize");
			var sorted_no =  serializeList(sort);
			var sorted = [];
			var origin = [];
			sorted_no.forEach(function(element,index,array){
				var data = {'no':Number(element),'sort_no':String(1000000001+index)}
				if(JSON.stringify(origin_sort[index])!=JSON.stringify(data)){
					origin.push(origin_sort[index]);
					sorted.push(data);
				}
			});
			if(origin.length!=0){
				sorted.forEach((data,index) => modifySlider({'no':data.no,'sort_no':'temp'+index}))
				sorted.forEach(data => modifySlider(data));
				$('#bodyContents').children().load(window.location.href="/admin/slider");
			}
		} );
		
		$('.sliderInsert').on('click',function(){
			var formData = new FormData();
			var file = $('#file_name')[0].files[0];
			formData.append("file",file);
			writeSlider(formData);
		});
		
		$('.activity').change(function(){
			var activity;
			if($(this).is(':checked')){
				activity = '0';
			}else{
				activity = '1';
			}
			var no = $(this).data("no");
			var data = {'no':no,'activity':activity};
			modifySlider(data);
		});
	});
	function serializeList(sort) {
		var sortList = sort.split(/sort\[\]=([0-9]+)&?/).filter(function(item) {
			  return item !== null && item !== undefined && item !== '';
		});
		return sortList;
	}
	
	function writeSlider(formData){
		$.ajax({
			url:'/admin/ajax/insertSilder',
			processData:false,
			contentType:false,
			data: formData,
			type: 'POST',
			success:function(result){
				alert(result);
				location.replace('/admin/slider');
			}
		});
	}
	
	function modifySlider(data){
		$.ajax({ 
			type: "POST", 
			url: "/admin/ajax/modifySlider", 
			data: data, 
			success: function(data) { 
				console.log(data);
			}, errer : function(e){
				console.log(e);
			} 
		});
	}
</script>
</html>