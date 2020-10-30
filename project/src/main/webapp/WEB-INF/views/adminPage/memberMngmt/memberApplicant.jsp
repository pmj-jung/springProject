<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/HEADER.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/headNmenu.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board.css">
<script src="${pageContext.request.contextPath}/js/menu.js"></script>
<script src="${pageContext.request.contextPath}/js/table.js"></script>
<style>
    tr:first-child {
        background-color: #005AA7;
        color: #fff;
    }
    .tr-even {
        background-color:#eff3f9;
    }
</style>

<body>
    <%@ include file="/WEB-INF/views/include/ADMIN_LOGOnINFO.jsp" %>
    <main>
    	<%@ include file="/WEB-INF/views/include/ADMIN_MENU.jsp" %>
        <div class="mainContent">
            <div class="contentHead">
                <h3 class="font18">사용자 관리 > 사용자 신청 목록</h3>
            </div>
            <div class="btn-wrap flex flex-justify">
                <div class="btns">
                    <button type="button" class="btn-on" onClick="chkApproveConfirm();">선택승인</button>
                    <button type="button" class="btn-off">선택거부</button>
                </div>
                <div class="search-box">
                    <form name="search-frm" class="search-frm" method="post" 
                    action="${pageContext.request.contextPath}/memberApplicant">
                        <select name="searchOpt" class="sel">
                            <option value="mem_id" <c:if test="${searchOpt eq 'mem_id'}">selected</c:if> >아이디</option>
                            <option value="mem_name" <c:if test="${searchOpt eq 'mem_name'}">selected</c:if> >신청자명</option>
                            <option value="mem_num" <c:if test="${searchOpt eq 'mem_num'}">selected</c:if> >사원번호</option>
                            <option value="all" <c:if test="${searchOpt eq 'all'}">selected</c:if> >전체검색</option>
                        </select>
                        <input value="${words}" type="text" name="words" class="input" maxlength="20" tabindex="1" />
                        <button type="submit" class="search-btn" tabindex="2">검색</button>
                    </form>
                </div>
            </div>
            <div>승인 대기 회원 수 : ${count} 명</div>
            <div class="member-tbl">
                <table>
                    <tr class="center">
                        <td class="td-3"><input type="checkbox" id="chkAll" data-uid="${mem.num}"/></td>
                        <td class="td-10">신청일</td>
                        <td class="td-12">신청 아이디</td>
                        <td class="td-10">신청자</td>
                        <td class="td-10">사번</td>
                        <td class="td-8">부서</td>
                        <td class="td-8">직급</td>
                        <td class="td-10">입사일</td>
                        <td class="td-15">관리</td>
                    </tr>
                    <c:if test="${count == 0}">
						<tr id="noCss">
							<td colspan="9" style="height:200px;" class="center weight700">승인 대기 회원이 없습니다.</td>
						</tr>
					</c:if>
                    <c:forEach items="${list}" var="mem">
	                    <tr class="center">
	                        <td><input type="checkbox" name="chk" value="${mem.num}" data-uid="${mem.num}"></td>
	                        <td>${mem.memRegdate}</td>
	                        <td>${mem.memID}</td>
	                        <td>${mem.memName}</td>
	                        <td>${mem.memNum}</td>
	                        <td>${mem.memBuseoName}</td>
	                        <td>${mem.memGradeName}</td>
	                        <td>${mem.memEntdate}</td>
	                        <td>
	                            <button onClick="approveConfirm('${mem.num}');" type="button" class="s-btn-on">승인</button>
	                            <button onClick="disapproveConfirm('${mem.num}');" type="button" class="s-btn-off">거부</button>
	                        </td>
	                    </tr>
                    </c:forEach>
                </table>
            </div>

            <div class="page-grp">
                <span class="page"><i class="fas fa-angle-left"></i></span>
                <span class="page"><i class="fas fa-angle-double-left"></i></span>

                <span class="page active">1</span>
                <span class="page">2</span>
                <span class="page">3</span>
                <span class="page">4</span>
                <span class="page">5</span>

                <span class="page"><i class="fas fa-angle-right"></i></span>
                <span class="page"><i class="fas fa-angle-double-right"></i></span>
            </div>

        </div>
        </div>
    </main>
</body>
<script>

	document.getElementById('chkAll').onclick = function(){
	    var chk = document.getElementsByName('chk');
	    for( var checkbox of chk ){
	        checkbox.checked = this.checked;
	    }
	}

	function approveConfirm(num){
	    var msg = "선택하신 회원의 승인여부를 변경합니다.\n변경하시겠습니까?";
	    if( confirm(msg) ){
	        var formData = {
	            num         :   num
	        }
	
	        $.ajax({
	            url     : "${pageContext.request.contextPath}/approveConfirm",
	            type    : "POST",
	            data    :  formData,
	            success :   function(resData){
	                if(resData == "success"){
	                    alert("승인이 처리되었습니다.");
	                }
	            },
	            error   : function(){
	                alert("승인처리에 실패했습니다.");
	            },
	            complete : function(){
	            	window.location.reload();
	            }
	        });
	    }
	}

	function disapproveConfirm(num){
	    var msg = "해당 회원의 승인을 거부합니다.\n거부 시 해당 회원의 정보는 영구삭제됩니다.\n거부하시겠습니까?";
	    if( confirm(msg) ){
	        var formData = {
	            num         :   num
	        }
	
	        $.ajax({
	            url     : "${pageContext.request.contextPath}/disapproveConfirm",
	            type    : "POST",
	            data    :  formData,
	            success :   function(resData){
	                if(resData == "success"){
	                    alert("해당 회원의 정보가 성공적으로 삭제되었습니다.");
	                }
	            },
	            error   : function(){
	                alert("승인거부처리에 실패했습니다.");
	            },
	            complete : function(){
	            	window.location.reload();
	            }
	        });
	    }
	}

	function chkApproveConfirm(){
        
        var msg = "선택된 회원을 승인합니다.\n승인처리 하시겠습니까?";
        if( confirm(msg) ){
            var chkArray = new Array(); //배열생성
            $("input:checkbox[name=chk]:checked").each(function(){
                chkArray.push($(this).value);
            });

            var chkArrayData = {
                "chkArray"    : chkArray
            };

            $.ajax({
	            url : "${pageContext.request.contextPath}/chkApproveConfirm",
	            type : "POST",
	            data : chkArrayData,
	            success : function(resData){
	                if(resData == "success"){
	                    alert("성공");
	                }
	            },
	            error : function(){
	                alert("에러");
	            },
	            complete	: function(){
					window.location.reload();
				}
            });
        }
        
    }
</script>
</html>