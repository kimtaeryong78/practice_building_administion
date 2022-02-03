<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
		<div
			class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
			<h1 class="h2">${title}</h1>
			<div class="btn-toolbar mb-2 mb-md-0">
				<div class="btn-group me-2">
					総投稿数 :
					<c:out value="${boardCount}"></c:out>
				</div>
				<div class="btn-group me-2">
					<button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
					<button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
				</div>
				<button type="button"
					class="btn btn-sm btn-outline-secondary dropdown-toggle">
					<span data-feather="calendar"></span> This week
				</button>
			</div>
		</div>
		<table class="table table-striped">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">title</th>
					<th scope="col">name</th>
					<th scope="col">time</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${boardList}" var="board">
					<tr data-no="${board.no}">
						<th scope="row"><c:if test="${board.depth ne 0}">
								<c:choose>
									<c:when test="${board.depth eq 1}">
										<i class="bi bi-arrow-return-right"></i>
									</c:when>
									<c:otherwise>
										<c:forEach var="i" begin="1" end="${board.depth}">
											<pre>	</pre>
										</c:forEach>
										<i class="bi bi-arrow-return-right"></i>
									</c:otherwise>
								</c:choose>
							</c:if>${board.grno}</th>
						<td>${board.title}</td>
						<td>${board.name}</td>
						<td>${board.updated_at}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</main>
	</div>
	</div>
	<div class="modal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Modal title</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>Modal body text goes here.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	$('.table').on('click','tr',function(){
		/* var no = $(this).data('no');
		getBoard(no); */
		$('.modal').show();
	})
	$('#delete').on('click',function(){
		deleteBoard();
	});
});

function getBoard(no){
	$.ajax({ 
		type: "GET", 
		url: "/admin/ajax/getBoard/"+no+".json", 
		success: function(data) {
			console.log(data);
			$("#title").html(data.title);
			$('.modal').show();
		} 
	});
}

function deleteBoard(){
	$.ajax({ 
		type: "POST", 
		url: "/admin/ajax/modifyBoard", 
		data: data, 
		success: function(data) { 
			console.log(data); 
		} 
	});
}

</script>
</html>