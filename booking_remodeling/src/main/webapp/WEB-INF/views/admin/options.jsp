<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class="modal fade" id="optionModal" tabindex="-1">
		<div class="modal-dialog modal-xl modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<input type="hidden" id="optionNo">
					<h5 class="modal-title">追加</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body row g-2">
					<div class="col-md">
						<div class="form-floating">
							<input type="text" class="form-control item" id="item"  name="item" placeholder="アイテム名">
							<label for="item">アイテム名</label>
						</div>
					</div>
					<div class="col-md">
						<div class="form-floating">
							<input type="text" class="form-control cost" id="cost"  name="cost" placeholder="0000"> 
							<label for="cost">金額</label>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">消す</button>
					<button type="button" class="btn btn-primary optionInsert">登録</button>
					<button type="button" class="btn btn-primary optionModify" hidden="true">修正</button>
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
					<button type="button" class="btn btn-outline-secondary optionWrite"
						data-bs-toggle="modal" data-bs-target="#optionModal">追加</button>
				</div>
			</div>
		</div>
		<table class="table table-striped">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col-16">item</th>
					<th scope="col">cost</th>
					<th>activity</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				
				<c:forEach items="${optionsList}" var="option">
					<tr>
						<th scope="row">${option.no}</th>
						<td data-bs-toggle="modal" data-bs-target="#boardModal">${option.item}</td>
						<td data-bs-toggle="modal" data-bs-target="#boardModal">${option.cost}</td>
						<td>
							<div class="form-check form-switch">
								<input class="form-check-input activity" type="checkbox" role="switch"
									 <c:if test="${option.activity eq 0}">checked</c:if>>
							</div>
						</td>
						<td>
							<a type="button" data-no="${option.no}" class="btn btn-sm btn-outline-secondary optionModal" data-bs-toggle="modal" data-bs-target="#optionModal">修正</a>
							<input class="btn btn-sm btn-danger" type="button" id="delete" data-no="${option.no}" value="削除">
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</main>
	</div>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function(){
		$('.optionInsert').on('click',function(){
			var item = $('#item').val();
			var cost = Number($('#cost').val());
			var data = {'item':item,'cost':cost};
			writeOption(data);
		});
		$('.optionModal').on('click',function(){
			var no = $(this).data('no');
			var data = getOption(no);
			$('#item').val(data.item);
			$('#cost').val(data.cost);
			$('#optionNo').val(no);
			$('.optionInsert').prop('hidden',true);
			$('.optionModify').prop('hidden',false);
		});
		$('.optionModify').on('click',function(){
			var no = $('#optionNo').val();
			var item = $('#item').val();
			var cost = Number($('#cost').val());
			var data = {'no':no, 'item':item,'cost':cost};
			modifyOption(data);
		});
		$('#delete').on('click',function(){
			var no = $(this).data('no');
			var data = {'no':no, 'delete_flag':'1'};
			modifyOption(data);
		});
		
		$('.activity').change(function(){
			var activity;
			if($(this).is(':checked')){
				activity = '0';
			}else{
				activity = '1';
			}
			var no = Number($(this).parents('tr').find('th').html());
			var data = {'no':no,'activity':activity};
			modifyOption(data);
		});
	});
	
	function writeOption(data){
		$.ajax({ 
			type: "POST", 
			url: "/admin/ajax/insertOption", 
			data: data, 
			success: function(data) { 
				alert(data);
				location.replace('/admin/options');
			} 
		});
	}

	function getOption(no){
		var option;
		
		$.ajax({ 
			url: "/admin/ajax/getOption/"+no+".json",
			dataType:"json",
			type: "GET", 
			async:false,
			success: function(data) {
				option = data;
			} 
		});
		return option;
	}

	function modifyOption(data){
		$.ajax({ 
			type: "POST", 
			url: "/admin/ajax/modifyOption", 
			data: data, 
			success: function(data) { 
				alert(data);
				location.replace('/admin/options');
			} 
		});
	}
</script>
</html>