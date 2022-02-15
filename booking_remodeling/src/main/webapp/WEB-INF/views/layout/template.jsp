<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
            <!DOCTYPE html>
            <html>

            <head>
                <!-- meta tag -->
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <meta name="description" content="building site practice">
                <meta name="author" content="taeryong">
                <!-- favicon -->
                <link rel="shortcut icon" href="#" />
                <!-- CSS -->
                <link href="/css/main.css" rel="stylesheet">
                <link href="/css/map.css" rel="stylesheet">
                <link href="/css/template.css" rel="stylesheet">
                <link href="/css/room.css" rel="stylesheet">
                <link rel="stylesheet" href="https://releases.jquery.com/git/ui/jquery-ui-git.css">
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
                <link rel="stylesheet"
                    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
                <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.css">
                <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
                <!-- Script -->
                <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
                    integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
                    crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
                    integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
                    crossorigin="anonymous"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
                <script src="https://releases.jquery.com/git/ui/jquery-ui-git.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-mousewheel/3.1.13/jquery.mousewheel.min.js"
                    integrity="sha512-rCjfoab9CVKOH/w/T6GbBxnAH5Azhy4+q1EXW5XEURefHbIkRbQ++ZR+GBClo3/d3q583X/gO4FKmOFuhkKrdA=="
                    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
                <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/lang/summernote-ja-JP.min.js"
                    integrity="sha512-hpUqToD3dE5r5L85PTHtgEJCOjWhYUoFoih5BQLcwU9yfqb4K8cFTgj7Prd28oRGAGmFR/FqJoePYM/vnKz/0Q=="
                    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
                <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.js"></script>
                <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
                <script src="https://unpkg.com/@popperjs/core@2.11.2/dist/umd/popper.min.js"></script>
                <title>T.R</title>
            </head>

            <body>
                <div class="swiper navSwiper position-relative">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <tiles:insertAttribute name="main" />
                        </div>
                        <div class="swiper-slide">
                            <tiles:insertAttribute name="room" />
                        </div>
                        <div class="consultation swiper-slide">
                            <tiles:insertAttribute name="consultation" />
                        </div>
                        <div class="swiper-slide">
                            <tiles:insertAttribute name="booking" />
                        </div>
                        <div class="swiper-slide">
                            <tiles:insertAttribute name="notice" />
                        </div>
                        <div class="swiper-slide">
                            <tiles:insertAttribute name="map" />
                        </div>
                    </div>
                    <div class="logo bg-secondary position-absolute top-0 end-0"
                        style="z-index: 20; width: 100px; height: 50px; cursor: pointer;">
                        <img src="/img/logo.png" class="bg-secondary" width="100%" height="auto" alt="sitename"
                            onclick="goMain()" />
                    </div>
                    <hr>
                    <div
                        class="swiper-pagination tempswiper-pagination position-absolute end-0 d-flex align-items-center justify-content-center flex-column">
                    </div>
                    <hr>
                </div>
            </body>
			<div class="modal fade" id="boardModal" tabindex="-1">
                <div class="modal-dialog modal-xl modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title"></h5>
                            <input type="hidden" class="boardNo"> <input type="hidden" class="boardGrno"> <input
                                type="hidden" class="boardDepth">
                            <div class="form-floating">
                                <input type="text" class="form-control boardTitle" id="floatingInputGrid" name="title" placeholder="題目" pattern="[a-zA-Zぁ-んァ-ヶ亜-熙]{0,50}" required> 
                                <label for="floatingInputGrid">題目</label>
                            </div>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                        </div>
                        <div class="modal-body row g-2">
                            <div class="col-md">
                                <div class="form-floating">
                                    <input type="text" class="form-control boardName" id="floatingInputGrid"
                                        name="name" placeholder="名前" required> <label for="floatingInputGrid">名前</label>
                                </div>
                            </div>
                            <div class="col-md">
                                <div class="form-floating">
                                    <input type="text" class="form-control boardPwd" id="floatingInputGrid"
                                        name="password" placeholder="暗号" required>
                                    <label for="floatingInputGrid">暗号</label>
                                </div>
                            </div>
                            <p class="board_summernote"></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">消す</button>
                            <button type="button" class="btn btn-outline-primary boardInsert">登録</button>
                            <button type="button" class="btn btn-outline-secondary applyModal" style="display: none">書き込み</button>
                            <button type="button" class="btn btn-outline-primary applyInsert"  style="display: none">登録</button>
                            <button type="button" class="btn btn-outline-primary boardModifyReady"  style="display: none">修正</button>
                            <button type="button" class="btn btn-outline-primary boardModify"  style="display: none">修正</button>
                            <button type="button" class="btn btn-outline-danger boardDelete"  style="display: none">削除</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="noticeModal" tabindex="-1">
				<div class="modal-dialog modal-xl modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title"></h5>
							<input type="hidden" class="noticeNo">
							<div class="form-floating">
								<input type="text" class="form-control noticeTitle"
									id="floatingInputGrid" name="title" placeholder="題目"> <label
									for="floatingInputGrid">題目</label>
							</div>
		
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body row g-2">
							<p class="notice_summernote"></p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">消す</button>
						</div>
					</div>
				</div>
			</div>
			<div class="position-fixed start-50 top-50 translate-middle p-3" style="z-index: 11">
			    <div class="toast hide" role="alert" aria-live="assertive" aria-atomic="true">
			        <div class="toast-header">
			            <strong class="me-auto">暗証番号確認</strong>
			            <small>暗証番号を入力してください</small>
			            <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
			        </div>
			        <div class="toast-body">
			            <form>
					    	<label for="passwd" class="form-label">入力窓</label>
						    <div class="input-group mb-3 passwd position-relative">
						    	<button type="button" class="btn btn-outline-secondary passwdView">
						    		<i class="bi bi-eye"></i>
                				</button>
    							<input type="password" class="form-control" id="passwdToasts" placeholder="暗証番号を入力してください">
						    </div>
						    <button type="button" class="btn btn-primary" id="passwdCheck">確認</button>
						</form>
			        </div>
			    </div>
			</div>
            <script type="text/javascript">
                var navs = ["メイン", "ルーム", "相談", "予約", "お知らせ", "位置"];
                var swiper1 = new Swiper(
                    '.navSwiper',
                    {
                        direction: "vertical",
                        slidesPerView: 1,
                        keyboard: {
                            enabled: true,
                        },
                        mousewheel: true,
                        autoplayDisableOnInteraction: false,
                        pagination: {
                            el: '.tempswiper-pagination',
                            clickable: true,
                            renderBullet: function (
                                index,
                                className) {
                                return '<span class="' + className + ' w-100">'
                                    + (navs[index])
                                    + '</span>';
                            },
                        },
                    });
                function goMain() {
                    swiper1.slideTo(0, 1000, true);
                }
                $('.board_summernote,.notice_summernote').summernote({
	                tabsize: 2,
	                height: 300,
	                toolbar: [
	                    ['style',['style']],
	                    ['font',['bold','underline','clear']],
	                    ['color',['color']],
	                    ['para',['ul','ol','paragraph']],
	                    ['table',['table']],
	                    ['insert',['link','picture','video']],
	                    ['view',['fullscreen','codeview','help']]
	                ],
                });
                
                function boardHtml(boardList) {
                    let html = "";
                    for (var board in boardList) {
                        html += '<tr style="position: relative; left: ' + boardList[board].depth * 30 + 'px;" data-type="board" data-no="' + boardList[board].no + '" data-lock="' + boardList[board].lock_flag + '" class="showBoard"><th scope="row">';
                        if (boardList[board].depth != 0) {
                            html += '<i class="bi bi-arrow-return-right"></i>';
                        }
                        if (boardList[board].depth == 0) {
                            html += boardList[board].grno;
                        }
                        html += '</th><td>';
                        if (boardList[board].lock_flag == '1') {
                            html += '秘密です<i class="bi bi-file-lock"></i>';
                        } else {
                            html += boardList[board].title
                        }
                        html += '</td><td>' + boardList[board].name + '</td><td>';
                        if (new Date().toLocaleDateString() == new Date(boardList[board].updated_at).toLocaleDateString()) {
                            html += new Date(boardList[board].updated_at).toLocaleTimeString();
                        } else {
                            html += new Date(boardList[board].updated_at).toLocaleDateString();
                        }
                        html += '</td></tr>';
                    }
                    return html;
                }
                function pageNavHtml(pageProp) {
                    let html = ""
                    if (pageProp.prev) {
                        html += '<li class="page-item"><a class="page-link" href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span> </a></li>';
                    }
                    for (let i = pageProp.startPage; i <= pageProp.endPage; i++) {
                        if (i == pageProp.cri.pageNum) {
                            html += '<li class="page-item active disable"><a class="page-link">' + i + '</a></li>';
                        } else {
                            html += '<li class="page-item"><a class="page-link boardPageNum" data-val="' + i + '" data-type="pageNum">' + i + '</a></li>';
                        }
                    }
                    if (pageProp.next) {
                        html += '<li class="page-item"><a class="page-link" href="#"\ aria-label="Next"> <span aria-hidden="true">&raquo;</span> </a></li>'
                    }
                    return html;
                }
                function writeBoard(data) {
                    $
                        .ajax({
                            type: "POST",
                            url: "/ajax/insertBoard",
                            data: data,
                            success: function (
                                data) {
                                alert(data);
                            }
                        });
                }
                function getAllBoard() {
                    var boardList;
                    var data = {cri:{
            			'pageNum':Number($("#boardPageNum").val()),
            			'amount': Number($("#boardAmount").val())},
            		};
                    $.ajax({
                            url: "/ajax/getAllBoard.json",
                            dataType: "json",
                            type: "GET",
                            data: data,
                            async: false,
                            success: function (data) {
                                boardList = data;
                            }
                        });
                    return boardList;
                }
                function getBoard(no) {
                    var board;
                    $.ajax({
                            url: "/ajax/getBoard/" + no + ".json",
                            dataType: "json",
                            type: "GET",
                            async: false,
                            success: function (data) {
                                board = data.board;
                            }
                        });
                    return board;
                }
                function modifyBoard(data) {
                    $
                        .ajax({
                            type: "POST",
                            url: "/ajax/modifyBoard",
                            data: data,
                            success: function (data) {
                                alert(data);
                            }
                        });
                }
                $(document).ready(function(){
                	$(document).on("click",".passwdView",function(){
                		$(this).toggleClass("active");
                		if($(this).hasClass("active")){
                			$(this).find('i').attr("class","bi bi-eye-slash").parents().next("input").attr("type","text");
                		}else{
                			$(this).find('i').attr("class","bi bi-eye").parents().next("input").attr("type","password");
                		}
                	});
                })
            </script>

            </html>