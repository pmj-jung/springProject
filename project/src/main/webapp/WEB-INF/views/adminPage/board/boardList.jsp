<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/ADMIN_HEADER.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board.css">
<script src="${pageContext.request.contextPath}/js/table.js"></script>
</head>
<style>
    .board-list tr:first-child {
        background-color: #005AA7;
        color: #fff;
    }
    .tr-even {
        background-color:#eff3f9;
    }
    td {
        border: 1px solid #d6dce7;
    }
</style>
<body>
    <%@ include file="/WEB-INF/views/include/ADMIN_LOGOnINFO.jsp" %>
    <main>
        <%@ include file="/WEB-INF/views/include/ADMIN_MENU.jsp" %>
        <div class="mainContent">
            <div class="page-main-wrap">
                <div class="contentHead">
                    <h3 class="font18">게시판 > 게시판 등록</h3>
                </div>
                <div class="board-maker">
                    <form method="post" id="frm" >
                        <table>
                            <tr class="center">
                                <td class="bg-gray td-10">게시판그룹</td>
                                <td class="td-15 p-lr3">
                                    <select name="boardGrp" id="boardGrp" class="sel-100">
		                    		</select>
                                </td>
                                <td class="bg-gray td-10">게시판코드</td>
                                <td class="td-15 p-lr3">
                                    <input onBlur="chkBoardCode();" type="text" name="boardCode" id="boardCode" class="input-100" placeholder="영어로 입력" required />
                                </td>
                                <td class="bg-gray td-10">게시판색상</td>
                                <td class="td-15 p-lr3">
                                    <select class="sel-100" name="boardColor" id="boardColor">
                                    	<option value="#005AA7">#005AA7</option>
                                        <option value="#2A9FBA">#2A9FBA</option>
                                        <option value="#5CCEC4">#5CCEC4</option>
                                        <option value="#A70017">#A70017</option>
                                        <option value="#CE5CA9">#CE5CA9</option>
                                    </select>
                                    <span class="color"></span>
                                </td>
                                <td class="bg-gray td-10">게시판 관리자</td>
                                <td class="td-15 p-lr3">
                                	<input type="text" class="input-100" name="boardMaker" id="boardMaker" value="${sessionScope.memName}" readonly/>
                                </td>
                            </tr>
                            <tr class="center">
                                <td class="bg-gray td-10">게시판제목</td>
                                <td colspan="5" class="td-90 p-lr3">
                                    <input type="text" name="boardTitle" id="boardTitle"  class="input-100" />
                                </td>
                                <td class="bg-gray td-10">게시판타입</td>
                                <td colspan="2" class="td-15 p-lr3">
                                    <select name="boardType" class="sel-100">
                                        <option value="1">답변형 게시판</option>
                                        <option value="2">공지사항 게시판</option>
                                        <option value="3">자유 게시판</option>
                                        <option value="4">익명 게시판</option>
                                    </select>
                                    <span class="color"></span>
                                </td>
                            </tr>
                            <tr class="center">
                                <td class="bg-gray td-10">읽기권한</td>
                                <td class="td-15 p-lr3">
                                    <select class="sel-100" name="boardRead">
                                        <option value="0">모두</option>
                                        <option value="1">직원만</option>
                                    </select>
                                </td>
                                <td class="bg-gray td-10">쓰기권한</td>
                                <td class="td-15 p-lr3">
                                    <select class="sel-100" name="boardWrite">
                                        <option value="0">모두</option>
                                        <option value="1">직원만</option>
                                    </select>
                                </td>
                                <td class="bg-gray td-10">댓글권한</td>
                                <td class="td-15 p-lr3">
                                    <select class="sel-100" name="boardReply">
                                        <option value="0">모두</option>
                                        <option value="1">직원만</option>
                                    </select>
                                </td>
                                <td class="bg-gray td-10">다운권한</td>
                                <td class="td-15 p-lr3">
                                    <select class="sel-100" name="boardDownload">
                                        <option value="0">모두</option>
                                        <option value="1">직원만</option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                        <div class="btn-grp center m-t10">
                            <button class="btn-on" type="button" id="btn">게시판생성</button>
                            <button class="btn-off" type="reset">취소하기</button>
                        </div>
                    </form>
                </div>
                <div class="contentHead">
                    <h3 class="font18">게시판 > 게시판 목록</h3>
                </div>
                <div class="m-b5" style="text-align:right;">검색된 게시판 수 : ${count} 개 ( ${curPage} of ${totalPage} pages )</div>
                <div class="flex flex-justify">
					<div class="btns">
	                    <button class="btn-off m-b5" id="deleteAll">선택삭제</button>
	                </div>
	                <div class="search-box">
	                    <form name="search-frm" class="search-frm" method="post" 
	                    action="${pageContext.request.contextPath}/board/boardList">
	                        <select name="searchOpt" class="sel">
	                            <option value="boardCode" <c:if test="${searchOpt eq 'boardCode'}">selected</c:if> >게시판코드</option>
	                            <option value="boardTitle" <c:if test="${searchOpt eq 'boardTitle'}">selected</c:if> >게시판제목</option>
	                            <option value="all" <c:if test="${searchOpt eq 'all'}">selected</c:if> >전체검색</option>
	                        </select>
	                        <input value="${words}" type="text" name="words" class="input p-lr5" maxlength="20" tabindex="1" />
	                        <button type="submit" class="search-btn" tabindex="2">검색</button>
	                    </form>
	                </div>
	            </div>
                <div class="board-list">
                    <table>
                        <tr class="center font14" id="rowColor">
                            <td class="td-5"><input type="checkbox" onClick="chkAll();" id="chkAll" data-uid="${board.boardCode}" /></td>
                            <td class="td-5">번호</td>
                            <td class="td-10">게시판그룹</td>
                            <td class="td-10">게시판코드</td>
                            <td class="td-10">게시판색상</td>
                            <td>게시판제목</td>
                            <td class="td-5">읽기권한</td>
                            <td class="td-5">쓰기권한</td>
                            <td class="td-5">댓글권한</td>
                            <td class="td-5">다운권한</td>
                            <td class="td-10">게시판관리</td>
                        </tr>
                        <c:if test="${count == 0}">
							<tr>
								<td colspan="13" style="height:200px;" class="center weight700">검색된 게시판이 없습니다.</td>
							</tr>
						</c:if>
                        <c:forEach items="${list}" var="board" varStatus="status">
	                        <tr class="center font14 trHover">
	                            <td><input type="checkbox" name="chk" class="chk" data-uid="${board.boardCode}" /></td>
	                            <td>${(count - status.index) - ( (curPage - 1) * end )}</td>
	                            <td>${board.buseo_name}</td>
	                            <td>${board.boardCode}</td>
	                            <td>${board.boardColor}</td>
	                            <td>
	                            	<a href="${pageContext.request.contextPath}/article/article_list?boardCode=${board.boardCode}"  target="_blank" class="under">
	                            	${board.boardTitle}</a>
	                            </td>
	                            <td>${board.boardRead}</td>
	                            <td>${board.boardWrite}</td>
	                            <td>${board.boardReply}</td>
	                            <td>${board.boardDownload}</td>
	                            <td>
	                                <button class="s-btn-on">수정</button>
	                                <button class="s-btn-off" onClick="boardDel('${board.boardCode}');">삭제</button>
	                            </td>
	                        </tr>
                        </c:forEach>
                    </table>
                    
                </div>
            </div>

            <!-- 페이징 UI 시작 -->
			<c:if test="${count > 0}">
				<div class="page-grp center m-t10">
					<c:choose>
						<c:when test="${curPage > 1}">
							<a href="${pageContext.request.contextPath}/board/boardList?curPage=1&searchOpt=${searchOpt}&words=${words}">
								<span class="page">
									<i class="fas fa-angle-double-left"></i>
								</span>
							</a>
						</c:when>
						<c:otherwise>
							<span class="page">
								<i class="fas fa-angle-double-left"></i>
							</span>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${curPage > 1}">
							<a href="${pageContext.request.contextPath}/board/boardList?curPage=${curPage-1}&searchOpt=${searchOpt}&words=${words}">
								<span class="page">
									<i class="fas fa-angle-left"></i>
								</span>
							</a>
						</c:when>
						<c:otherwise>
							<span class="page">
								<i class="fas fa-angle-left"></i>
							</span>
						</c:otherwise>
					</c:choose>
				
					<!-- 페이지 번호 출력 -->
					<c:forEach begin = "${blockBegin}" end="${blockEnd}" var="num">
						<c:if test="${ selected == num }">
							<span class="page active">
								<a href="#" style="color:#fff;">${num}</a>
							</span>
						</c:if>
						
						<c:if test="${ selected != num }">
							<a href="${pageContext.request.contextPath}/board/boardList?curPage=${num}&searchOpt=${searchOpt}&words=${words}">
								<span class="page">
									${num}
								</span>
							</a>
						</c:if>	
					</c:forEach>
					
					<c:choose>
						<c:when test="${curPage != totalPage}">
							<a href="${pageContext.request.contextPath}/board/boardList?curPage=${curPage+1}&searchOpt=${searchOpt}&words=${words}">
								<span class="page">
									<i class="fas fa-angle-right"></i>
								</span>
							</a>
						</c:when>
						<c:otherwise>
							<span class="page">
								<i class="fas fa-angle-right"></i>
							</span>
						</c:otherwise>
					</c:choose>
					
					<c:choose>
						<c:when test="${curPage >= 1}">
							<a href="${pageContext.request.contextPath}/board/boardList?curPage=${totalPage}&searchOpt=${searchOpt}&words=${words}">
								<span class="page">
									<i class="fas fa-angle-double-right"></i>
								</span>
							</a>
						</c:when>
						<c:otherwise>
							<span class="page">
								<i class="fas fa-angle-double-right"></i>
							</span>
						</c:otherwise>
					</c:choose>
				</div>
			</c:if>
			<!-- 페이징 UI 끝-->

        </div>
    </main>
</body>
<script>
	var flag = false; 
	function chkAll() {
		var chk = document.getElementsByName("chk");
		if( flag == false) {
			flag = true;
			for(var i = 0; i < chk.length; i++) {
				chk[i].checked = true;
			}
			
		}else{
			flag = false;
			for(var i = 0; i < chk.length; i++) {
				chk[i].checked = false;
			}
		}
		
	}
</script>
<script>
	function boardMake(){
		if( $.trim($("#boardCode").val()) == '' ) {
			alert("게시판 코드를 입력하세요.");
			$("#boardCode").focus();
			return false;
		}
		
		if( $.trim($("#boardTitle").val()) == '' ) {
			alert("게시판 제목을 입력하세요.");
			$("#boardTitle").focus();
			return false;
		}
	
		$.ajax({
			url		: "${pageContext.request.contextPath}/board/board_create",
			type	: "POST",
			data	: $("#frm").serialize(),
			success	: function(resData) {
				alert( $("#boardCode").val() + "게시판 & 댓글게시판이 생성되었습니다.");
				window.location.href = 	"${pageContext.request.contextPath}/board/boardList";			
			},
			error	:function() {
				alert("시스템 에러");			
			}
		});
	}
	
	$("#btn").click(function() {
		boardMake();
	});
</script>
<script>

	// 게시판 그룹 - 부서 조인
	function loadBuseo(){
	    $.ajax({
	        url			: "${pageContext.request.contextPath}/get_buseo",
	        type		: "POST",
	        data 		: "",
	        contentType : "application/x-www-form-urlencoded; charset=utf-8",
	        dataType    : "json",
	        success     : function(resData){
	            $.each(resData, function(key, value){
	                $("#boardGrp").append(
	                    "<option value=" + value.buseo_id + ">" 
	                    + value.buseo_name + "</option>"
	                );
	            });
	        },
	        error   	: function(){
	            alert("시스템 에러");
	        },
	        complete    : function(){
	
	        }
	    });
	}

	// 게시판코드 중복방지
	function chkBoardCode(){
        var formData = {
            boardCode   : $("#boardCode").val()
        };

        $.ajax({
            url     : "${pageContext.request.contextPath}/board/board_check",
            type    : "POST",
            data    : formData,
            success : function(resData){
                if( resData == "failure" ){
                    alert("사용할 수 없는 코드입니다.");
                    $("#boardCode").val("");
                    $("#boardCode").focus();
                }else{
                    alert("사용할 수 있는 코드입니다.");
                }
            },
            error   : function(){
                alert("시스템 에러");
            },
            complete : function(){
                
            }
        });
    }

	// 게시판 개별 삭제
	function boardDel(boardCode){
        var msg = "삭제 후 복구는 불가능합니다.\n선택하신 게시판&댓글을 삭제하시겠습니까?";
        if( confirm(msg) ){
            var formData = {
                boardCode   : boardCode
            };

            $.ajax({
                url     : "${pageContext.request.contextPath}/board/board_delete",
                type    : "POST",
                data    : formData,
                success : function(resData){
                    if( resData == "success" ){
                        alert("선택하신 게시판과 댓글이 성공적으로 삭제되었습니다.");
                        window.location.reload();
                    }
                },
                error   : function(){
                    alert("시스템 에러");
                },
                complete : function(){
                    
                }
            });
        }
    }

	$(function(){

		loadBuseo();
		
        // 게시판 코드 정규식
        $("#boardCode").keyup(function(){
            $(this).val($(this).val().replace(/[0-9]|[^/!-z]/gi,""));
        });

        // 게시판 색깔 변경
        $("#boardColor").change(function(){
            $("#rowColor").css({
                backgroundColor : this.value
            });
        });
    });
</script>
<script>
	// 체크박스 이용한 다중삭제
	$(function(){
		$("#deleteAll").click(function(){
			var msg = "선택하신 정보의 모든 내용이 삭제됩니다. \n삭제하시겠습니까?";
			if(confirm(msg)){
				var chkArray = new Array();
				$(".chk:checked").each(function(){
					chkArray.push($(this).attr("data-uid"));
				});
	
				$.ajax({
					url		: "${pageContext.request.contextPath}/board/board_delete_all",
					type	: "POST",
					data	: {chkArr : chkArray},
					success	: function(resData){
						alert("선택하신 정보가 삭제되었습니다.");
						window.location.reload();
					},
					error	: function(){
						alert("시스템 에러");
					},
					complete : function(){
					}
				});
			}
		});
	});
</script>
</html>