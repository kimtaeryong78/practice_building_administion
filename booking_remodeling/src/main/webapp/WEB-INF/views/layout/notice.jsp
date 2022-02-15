<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<div class="container maincontainer position-absolute top-50 d-flex align-items-center translate-middle shadow-lg"
		style="z-index: 900; height: 95%">
		<h1 class="visually-hidden">T.R 建物</h1>
		<div class="px-4 py-5 my-5 text-center w-100 h-100">
			<div class="d-flex flex-column shadow p-4">
				<section class="rb-bbs rb-bbs-list">
					<div class="rb-bbs-title my-4">
						<h1>お知らせ</h1>
					</div>
					<hr>
					<div class="rb-bbs-body">
						<table class="table news table-hover">
							<colgroup>
								<col class="col-2">
								<col class="col-11">
							</colgroup>
							<thead>
								<tr>
									<th class="rb-time">作成時間</th>
									<th class="rb-title">タイトル</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${noticeList}" var="notice">
									<tr data-type="news" data-no="${notice.no}" data-bs-toggle="modal" data-bs-target="#noticeModal" class="showNotice">
										<fmt:formatDate var="noticeDate" value="${notice.updated_at}"
											pattern="yyyy-MM-dd" />
										<fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd" />
										<c:if test="${noticeDate == today}">
											<fmt:formatDate var="noticeDate" value="${notice.updated_at}"
												pattern="HH : mm" />
										</c:if>
										<th class="rb-time">${noticeDate}</th>
										<td class="rb-title">${notice.title}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="rb-bbs-footer">
						<div class="rb-actions row">
							<nav aria-label="Page navigation d-inline">
								<ul class="pagination justify-content-center">
									<c:if test="${noticePageProp.prev}">
										<li class="page-item"><a class="page-link" href="#"
												aria-label="Previous"> <span
													aria-hidden="true">&laquo;</span>
											</a></li>
									</c:if>
									<c:forEach var="n" begin="${noticePageProp.startPage}"
										end="${noticePageProp.endPage}">
										<c:choose>
											<c:when test="${n eq noticePageProp.cri.pageNum}">
												<li class="page-item active disable">
													<a class="page-link">${n}</a>
												</li>
											</c:when>
											<c:otherwise>
												<li class="page-item">
													<a class="page-link pageNum" data-val="${n}" data-type="pageNum">${n}</a>
												</li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:if test="${noticePageProp.next}">
										<li class="page-item">
											<a class="page-link" href="#" aria-label="Next"> 
												<span aria-hidden="true">&raquo;</span>
											</a>
										</li>
									</c:if>
								</ul>
							</nav>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	$('.showNotice').on('click',function(){
		$('.notice_summernote').summernote('reset');
		var no = $(this).data('no');
		var data = getNotice(no);
		$(".modal-title").attr('data-no',no);
		$(".noticeTitle").val(data.title);
		$('.notice_summernote').summernote('insertText', data.contents);
	});
	document.getElementById('noticeModal').addEventListener('hidden.bs.modal', function (event) {
		$(".modal-title").removeAttr('data-no');
		$(".noticeTitle").val('');
		$('.notice_summernote').summernote('reset');
	})
});
function getNotice(no){
	var notice;
	$.ajax({ 
		url: "/ajax/getNotice/"+no+".json",
		dataType:"json",
		type: "GET", 
		async:false,
		success: function(data) {
			notice = data.notice;
		} 
	});
	return notice;
}
</script>
</html>