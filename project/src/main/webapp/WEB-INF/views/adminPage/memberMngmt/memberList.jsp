<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/HEADER.jsp"%>
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
                <h3 class="font18">사용자 관리 > 사용자 목록</h3>                
            </div>
            <div class="btn-wrap flex flex-justify">
                <div class="btns">
                    <button type="button" class="btn-on" >사용자추가</button>
                    <button type="button" class="btn-off">선택삭제</button>
                </div>
                <div class="search-box">
                    <form name="search-frm" class="search-frm" method="post" 
                    action="${pageContext.request.contextPath}/memberList">
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
            <div>전체 회원 수 : ${count} 명</div>
            <div class="member-tbl">
                <table>
                    <tr class="center">
                        <td class="td-3"><input type="checkbox" onClick="chkAll();" id="chkAll" data-uid="${mem.num}" /></td>
                        <td class="td-5">번호</td>
                        <td class="td-8">부서명</td>
                        <td class="td-8">직급명</td>
                        <td class="td-8">사원번호</td>
                        <td class="td-8">사원명</td>
                        <td class="td-8">아이디</td>
                        <td class="td-8">성별</td>
                        <td class="td-8">입사일</td>
                        <td class="td-8">가입일</td>
                        <td class="td-8">권한</td>
                        <td class="td-8">승인</td>
                        <td class="td-10">관리</td>
                    </tr>
                    <c:forEach items="${list}" var="mem">
	                    <tr class="center">
	                        <td><input type="checkbox" name="chk" data-uid="${mem.num}" /></td>
	                        <td>${mem.num}</td>
	                        <td>${mem.memBuseoName}</td>
	                        <td>${mem.memGradeName}</td>
	                        <td>${mem.memNum}</td>
	                        <td>${mem.memName}</td>
	                        <td>${mem.memID}</td>
	                        <td>
	                        	<select onChange="changeGender(this.value,'${mem.num}');" class="sel-100">
									<option value="M" <c:if test="${mem.memGender eq 'M'}">selected</c:if> >남자</option>
									<option value="F" <c:if test="${mem.memGender eq 'F'}">selected</c:if> >여자</option>
								</select>
	                        </td>
	                        <td>${mem.memEntdate}</td>
	                        <td>${mem.memRegdate}</td>
	                        <td>
	                        	<select class="sel-100">
									<option value="1" <c:if test="${mem.memLevel eq '1'}">selected</c:if> >협력업체</option>
									<option value="2" <c:if test="${mem.memLevel eq '2'}">selected</c:if> >사원</option>
									<option value="3" <c:if test="${mem.memLevel eq '3'}">selected</c:if>>부서장</option>
									<option value="4" <c:if test="${mem.memLevel eq '4'}">selected</c:if>>임원</option>
									<option value="10" <c:if test="${mem.memLevel eq '10'}">selected</c:if>>관리자</option>
								</select>
							</td>
	                        <td >
	                        	<select class="sel-100">
									<option value="N"  <c:if test="${mem.memConfirm eq 'N'}">selected</c:if> >미승인</option>
									<option value="Y"  <c:if test="${mem.memConfirm eq 'Y'}">selected</c:if> >승인</option>
								</select>
	                        </td>
	                        <td>
	                            <button type="button" class="s-btn-on">수정</button>
	                            <button type="button" class="s-btn-off">삭제</button>
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

	function changeGender(memGender, num){
        var msg = "선택하신 사원의 성별을 변경합니다.\n변경하시겠습니까?";
        if( confirm(msg) ){
            var genderValue;
            if(memGender == 'M'){
                genderValue = 'F';
            }else{
                genderValue = 'M';
            }

            var formData = {
                memGender : genderValue,
                num :   num
            };

            $.ajax({
                url : "${pageContext.request.contextPath}/changeGender",
                type : "POST",
                data : formData,
                success : function(resData){
                    if( resData == "success" ){
						alert("성별 설정이 성공적으로 변경되었습니다.");
                    }                    
                },
                error : function(){
                    alert("성별 설정 변경에 실패하였습니다.");
                },
                complete : function(){
                    window.location.reload();
                }
            });
        }
    }
</script>
</html>