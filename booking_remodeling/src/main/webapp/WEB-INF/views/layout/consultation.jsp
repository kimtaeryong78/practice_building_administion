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
        <div class="px-4 py-5 my-5 text-center w-100 h-100 overflow-auto position-relative">
        	<div class="table-header">
        		<h1>相談掲示板</h1>
        		<p class="float-end">総投稿数 :<c:out value="${boardCount}個"></c:out></p>
        	</div>
            <table class="table table-striped table-hover overflow-hidden">
                <thead>
                    <tr>
                        <th>番号</th>
                        <th>title</th>
                        <th>name</th>
                        <th>time</th>
                    </tr>
                </thead>
                <tbody id="board">
                    <c:forEach items="${boardList}" var="board">
                        <tr style="position: relative; left: ${board.depth*30}px;" data-type="board"
                            data-no="${board.no}" data-lock="${board.lock_flag}" class="showBoard">
                            <th scope="row">
                                <c:if test="${board.depth ne 0}">
                                    <i class="bi bi-arrow-return-right"></i>
                                </c:if>
                                <c:if test="${board.depth eq 0}">
                                    ${board.grno}
                                </c:if>
                            </th>
                            <td>
                                <c:choose>
                                    <c:when test="${board.lock_flag == '1'}">
                                       		 秘密です
                                        <i class="bi bi-file-lock"></i>
                                    </c:when>
                                    <c:otherwise>
                                        ${board.title}
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${board.name}</td>
                            <fmt:formatDate var="boardDate" value="${board.updated_at}"
                                pattern="yyyy-MM-dd" />
                            <fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd" />
                            <c:if test="${boardDate == today}">
                                <fmt:formatDate var="boardDate" value="${board.updated_at}"
                                    pattern="HH : mm" />
                            </c:if>
                            <td>${boardDate}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
           	<div class="mt-2 row position-absolute bottom-0 start-50 translate-middle">
				<nav aria-label="boardPage navigation d-inline">
					<ul class="pagination justify-content-center">
						<c:if test="${pageProp.prev}">
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									<!-- << -->
							</a></li>
						</c:if>
						<c:forEach var="n" begin="${pageProp.startPage}"
							end="${pageProp.endPage}">
							<c:choose>
								<c:when test="${n eq pageProp.cri.pageNum}">
									<li class="page-item active disable"><a class="page-link">${n}</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link boardPageNum"
										data-val="${n}" data-type="pageNum">${n}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${pageProp.next}">
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									<!-- >> -->
							</a></li>
						</c:if>
					</ul>
				</nav>
			</div>
			<div class="btn-group position-absolute" style="right:4%; bottom:7%;">
				<button class="btn btn-outline-secondary boardWrite" data-bs-toggle="modal" data-bs-target="#boardModal">相談する</button>
			</div>
			<div class="row position-absolute" style="bottom:4%">
				<form>
					<div class="input-group input-group-sm">
						<div class="col-3">
							<select class="form-select form-select-sm amount">
								<option value="10">10個ずつ見る</option>
								<option value="20">20個ずつ見る</option>
								<option value="30">30個ずつ見る</option>
								<option value="40">40個ずつ見る</option>
								<option value="50">50個ずつ見る</option>
							</select>
						</div>
						<div class="col-3">
							<select class="form-select form-select-sm search">
								<option class="bs-title-option">掲示板検索</option>
								<option value="title">タイトル</option>
								<option value="contents">内容</option>
								<option value="name">名前</option>
							</select>
						</div>
						<div class="col-4">
							<input type="text" class="form-control form-control-sm" id="searchWord" placeholder="検索語を入力してください。">
						</div>
						<div class="col-auto">
							<button class="btn btn-sm btn-outline-secondary" type="button" id="searchBtn">検索</button>
						</div>
					</div>
				</form>
			</div>
			<input type="hidden" name="pageNum" id="boardPageNum" value="${pageProp.cri.pageNum}"> 
			<input type="hidden" name="amount" id="boardAmount" value="${pageProp.cri.amount}"> 
			<input type="hidden" name="boartTotal" id="boardTotal" value="${boardCount})"> 
			<input type="hidden" id="boardKeyword">
        </div>
    </div>
</body>

<script type="text/javascript">
$(document).ready(function(){
	$(document).on('click',".boardPageNum",function(){
		$("#boardPageNum").val($(this).data("val"));
		
		board =getAllBoard()
		$('#board').hide("slow", function(){
			$('#board').html(boardHtml(board.boardList))
				.promise().done($('#board').show("slow"))
		});
		$(".pagination").hide("fade",function(){
			$(".pagination").html(pageNavHtml(board.pageProp))
			.promise().done($(".pagination").show("fade"))
		});
	});
	
	$(document).on('click','.boardInsert',function(){
		var title = $('.boardTitle').val();
		var name = $('.boardName').val();
		var passwd = $('.boardPwd').val();
		var lock_flag = (passwd.length != 0)? '1':'0';
		var contents = $($('.board_summernote').summernote('code')).text();
		var data = {"title" :title,"name":name, "passwd":passwd, "lock_flag":lock_flag, "contents":contents};
		writeBoard(data);
		board =getAllBoard();
		$('#boardModal').hide("fast",function(){
			$('#board').hide("slow", function(){
				$('#board').html(boardHtml(board.boardList))
					.promise().done($('#board').show("slow",function(){
						$(".modal-backdrop").remove()
					}))
			});
		});
		$(".pagination").hide("fade",function(){
			$(".pagination").html(pageNavHtml(board.pageProp))
			.promise().done($(".pagination").show("fade"))
		});
	});
	$(document).on('click','.applyModal',function(){
		var no = $(".modal-title").data('no');
		var title = $(".boardTitle").val();
		$('#boardModal').hide("slow",function(){
			var data = getBoard(no);
			$(".boardTitle").val('[re]'+$(".boardTitle").val());
			$(".boardNo").val(no);
			$(".boardGrno").val(data.grno);
			$(".boardDepth").val(data.depth);
			$('.boardName').val('');
			$('.boardPwd').val('');
			$('.boardInsert,.applyModal,.boardModifyReady').hide();
			$('.applyInsert').show();
			$('.form-control').removeAttr("disabled");
			$('.board_summernote').summernote('reset');
			$('.board_summernote').summernote('enable');
		}).promise().done($('#boardModal').show("slow"));
	});
	$(document).on('click','.applyInsert',function(){
		var grno = $(".boardGrno").val();
		var depth = Number($(".boardDepth").val()) + 1;
		var title = $('.boardTitle').val();
		var name = $('.boardName').val();
		var passwd = $('.boardPwd').val();
		var lock_flag = (passwd.length != 0)? '1':'0';
		var contents = $($('.board_summernote').summernote('code')).text();
		var data = {"grno":grno, "depth":depth, "title" :title,"name":name, "passwd":passwd, "lock_flag":lock_flag, "contents":contents};
		writeBoard(data);
		board =getAllBoard();
		$('#board').hide("slow", function(){
			$('#board').html(boardHtml(board.boardList))
				.promise().done($('#board').show("slow"))
		});
		$(".pagination").hide("fade",function(){
			$(".pagination").html(pageNavHtml(board.pageProp))
			.promise().done($(".pagination").show("fade"))
		});
	});
	$(document).on('click','.showBoard',function(e){
		var no = $(this).data('no');
		var data = getBoard(no);
		$(".toast-header").data("no",no);
		if($(this).data("lock") == 1){
			 var toast = new bootstrap.Toast(document.querySelector(".toast"),{
				 autohide:false
			 });
			 document.querySelector(".toast").addEventListener("show.bs.toast",function(){
			 	$(".consultation").find(".container").attr('style','display:none !important');
			 	$(".consultation").css({
					 	"background-color":"rgba(0,0,0,0.6)",
					 	"transition":"background-color ease 2s 0s"
				});
			 })
			 toast.show();
		}else {
			$(".form-control").prop("disabled","disabled");
			$('.board_summernote').summernote('disable');
			$(".modal-title").data('no',no);
			$(".boardTitle").val(data.title);
			$(".boardName").val(data.name);
			$(".boardPwd").val(data.passwd);
			$('.board_summernote').summernote('insertText', data.contents);
			$(".applyModal,.boardModifyReady").show();
			$('.boardInsert,.boardModify').hide();
			$("#boardModal").modal("show");
		}
	});
	$(document).on("click","#passwdCheck",function(e){
		e.preventDefault();
		var no = $(".toast-header").data("no");
		var data = getBoard(no);
		if($("#passwdToasts").val()== data.passwd){
			alert("成功");
			$(".form-control").prop("disabled","disabled");
			$('.board_summernote').summernote('disable');
			$(".modal-title").data('no',no);
			$(".boardTitle").val(data.title);
			$(".boardName").val(data.name);
			$(".boardPwd").val(data.passwd);
			$('.board_summernote').summernote('insertText', data.contents);
			$(".applyModal,.boardModifyReady").show();
			$('.boardInsert,.boardModify').hide();
			$("#boardModal").modal("show");
		}else{
			alert("失敗");
		}
	})
	 document.querySelector(".toast").addEventListener("hidden.bs.toast",function(){
		 $(".consultation").find(".container").attr({
				'style':'display:block !important',
				'style':'z-index:900',
				'style':'height:95%'
			});
			 $(".consultation").css({
			 	"background-color":"rgba(0,0,0,0)",
			 	"transition":"background-color ease 2s 0s"
			 });
	 })
	$(document).on("click",".boardModifyReady",function(){
		$('.form-control').removeAttr("disabled");
		$('.board_summernote').summernote('enable');
		$('.boardModifyReady,.applyModal').hide();
		$('.boardModify,.boardDelete').show();
	})
	$(document).on('click','.boardModify',function(){
		var no = $(".modal-title").data('no');
		var title = $('.boardTitle').val();
		var name = $('.boardName').val();
		var passwd = $('.boardPwd').val();
		var lock_flag = (passwd.length != 0)? '1':'0'
		var contents = $($('.board_summernote').summernote('code')).text();
		var data = {"no" : no,"title" :title,"name":name, "passwd":passwd, "lock_flag":lock_flag, "contents":contents};
		modifyBoard(data);
		board =getAllBoard();
		$('#board').hide("slow", function(){
			$('#board').html(boardHtml(board.boardList))
				.promise().done($('#board').show("slow"))
		});
		$(".pagination").hide("fade",function(){
			$(".pagination").html(pageNavHtml(board.pageProp))
			.promise().done($(".pagination").show("fade"))
		});
	});
	$(document).on('click','.boardDelete',function(){
		var no = $(".modal-title").data('no');
		var data = {"no" : no,"delete_flag":'1'};
		modifyBoard(data);
		board =getAllBoard();
		$('#board').hide("slow", function(){
			$('#board').html(boardHtml(board.boardList))
				.promise().done($('#board').show("slow"))
		});
		$(".pagination").hide("fade",function(){
			$(".pagination").html(pageNavHtml(board.pageProp))
			.promise().done($(".pagination").show("fade"))
		});
	});
	document.getElementById('boardModal').addEventListener('hidden.bs.modal', function (event) {
		$(".form-control").removeAttr("disabled");
		$('.boardInsert').show();
		$('.applyInsert,.applyModal,.boardModifyReady,.boardModify').hide();
		$('.boardDelete').prop('hidden',true);
		$(".modal-title").removeAttr('data-no');
		$(".form-control").val('');
		$('.board_summernote').summernote('reset');
		$('.board_summernote').summernote('enable');
		
		var toast = new bootstrap.Toast(document.querySelector(".toast"),{
			 autohide:false
		 });
		toast.hide();
		 $(".consultation").find(".container").attr({
				'style':'display:block !important',
				'style':'z-index:900',
				'style':'height:95%'
			});
		 $(".consultation").css({
		 	"background-color":"rgba(0,0,0,0)",
		 	"transition":"background-color ease 2s 0s"
		 });
		 
	})
	
})
</script>
</html>