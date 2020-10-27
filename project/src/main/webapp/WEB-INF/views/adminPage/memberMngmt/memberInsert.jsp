<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/HEADER.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${sessionScope.memID == null}">
	<script>
		alert("등록된 사용자가 아닙니다.\n관리자에게 문의하세요");
		location.href="${pageContext.request.contextPath}/login";
	</script>
</c:if>
<c:if test="${sessionScope.memLevel < 2}">
	<script>
		alert("접근권한이 없습니다.\n관리자에게 문의하세요.");
		location.href="${pageContext.request.contextPath}/userhome";
	</script>
</c:if>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/headNmenu.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board.css">
<script src="${pageContext.request.contextPath}/js/menu.js"></script>
<style>
    td {
        border:1px solid #ccc;
        border-radius: 2px;
    }

    td:nth-child(2n+1) {
        background-color: #eff3f9;
    }
    .upperArea {
        width:100%;
    }

    .photoArea {
        width:11%;
        /* height:100%; */
        max-width:192px;
    }

    .photoImg img{
        width:100%;
        height:100%;
        display: inline-block;
    }

    .upperInfoTbl {
        width:88.7%;
        max-width:1728px;
    }
</style>

<body>
    <%@ include file="/WEB-INF/views/include/ADMIN_LOGOnINFO.jsp" %>
    <main>
    	<%@ include file="/WEB-INF/views/include/ADMIN_MENU.jsp" %>
        <div class="mainContent">
            <div class="contentHead">
                <h3 class="font18">사용자 관리 > 사용자 등록</h3>
            </div>
            <div class="member-insert">
                <div class="memberInfo">
                    <form id="frm" method="POST">
                        <div class="upperArea flex flex-justify">
                            <div class="photoArea">
                                <div class="photoImg">
                                    <img src="images/idPhoto2.jpg">
                                </div>
                                <div class="photoBtn center">
                                    <button type="button" class="s-btn-on">등록</button>
                                    <button type="reset" class="s-btn-off">삭제</button>
                                </div>
                            </div>
                            <table class="upperInfoTbl">
                                <tr class="center">
                                    <td class="td-10">이름</td>
                                    <td class="td-15 p-lr5">
                                        <input type="text" name="memName" id="memName" class="input-100" autofocus value="${memOne.memName}"/>
                                    </td>
                                    <td class="td-10">부서</td>
                                    <td class="td-15 p-lr5">
                                        <input type="text" name="memBuseoName" id="memBuseoName" class="input-100" value="${memOne.memBuseoName}"/>
                                    </td>
                                    <td class="td-10">직급</td>
                                    <td class="td-15 p-lr5">
                                        <input type="text" name="memGradeName" id="memGradeName" class="input-100" value="${memOne.memGradeName}"/>
                                    </td>
                                </tr>
                                <tr class="center">
                                    <td>성별</td>
                                    <td class="p-lr5">
                                        <select name="memGender" id="memGender" class="sel-100" >
                                            <option value="m">남자</option>
                                            <option value="f">여자</option>
                                        </select>
                                    </td>
                                    <td>사번</td>
                                    <td class="p-lr5">
                                        <input type="text" name="memNum" id="memNum" class="input-100" autofocus  value="${memOne.memNum}"/>
                                    </td>
                                    <td>내선번호</td>
                                    <td class="p-lr5">
                                        <input type="text" name="memCp" id="memCp" class="input-100"/>
                                    </td>
                                </tr>
                                <tr class="center">
                                    <td>휴대번호</td>
                                    <td colspan="2" class="p-lr5">
                                        <input type="text" name="memTel" id="memTel" class="input-100"/>
                                    </td>
                                    <td>이메일</td>
                                    <td colspan="2" class="p-lr5">
                                        <input type="text" name="memEmail" id="memEmail" class="input-100"/>
                                    </td>
                                </tr>
                                <tr class="center">
                                    <td>생년월일</td>
                                    <td class="flex flex-justify p-lr5">
                                        <input type="text" name="memBirth" id="memBirth" class="input-100"/>
                                    </td>
                                    <td>입사일</td>
                                    <td class="p-lr5">
                                        <input type="text" name="memEntdate" id="memEntdate" class="input-100"  value="${memOne.memEntdate}"/>
                                    </td>
                                    <td>채용형태</td>
                                    <td class="p-lr5">
                                        <select name="memRecruit" id="memRecruit" class="sel-100">
                                            <option value="">인턴</option>
                                            <option value="">임시직</option>
                                            <option value="">정규직</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr class="center">
                                    <td>주소</td>
                                    <td colspan="5" class="p-lr5">
                                        <input type="text" name="memAddr" id="memAddr" class="input-100" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="lowerArea p-tb10">
                            <table class="lowerInfoTbl">
                                <tr class="center">
                                    <td class="td-10">결혼여부</td>
                                    <td class="td-10 p-lr5">
                                        <select name="memMarried" id="memMarried">
                                            <option value="F">미혼</option>
                                            <option value="T">기혼</option>
                                        </select>
                                    </td>
                                    <td class="td-10">병역구분</td>
                                    <td class="td-10 p-lr5">
                                        <select name="memService" id="memService">
                                            <option value="T">필</option>
                                            <option value="F">미필</option>
                                        </select>
                                    </td>
                                    <td class="td-10">취미</td>
                                    <td class="td-10 p-lr5">
                                        <input type="text" name="memHobby" id="memHobby" class="input-100" />
                                    </td>
                                    <td class="td-10">특기</td>
                                    <td class="td-10 p-lr5">
                                        <input type="text" name="memSpeciality" id="memSpeciality" class="input-100" />
                                    </td>
                                </tr>
                                <tr class="center">
                                    <td class="td-10">장애여부</td>
                                    <td class="p-lr5">
                                        <select name="memDisability" id="memDisability">
                                            <option value="F">비장애</option>
                                            <option value="T">장애</option>
                                        </select>
                                    </td>
                                    <td class="td-10">장애등록번호</td>
                                    <td class="p-lr5">
                                        <input type="text" name="memDisabilityNum" id="memDisabilityNum" class="input-100" />
                                    </td>
                                    <td class="td-10">보훈대상여부</td>
                                    <td class="p-lr5">
                                        <select name="memReward" id="memReward">
                                            <option value="F">비대상</option>
                                            <option value="T">대상</option>
                                        </select>
                                    </td>
                                    <td class="td-10">보훈번호</td>
                                    <td class="p-lr5">
                                        <input type="text" name="memRewardNum" id="memRewardNum" class="input-100" />
                                    </td>
                                </tr>
                                <tr class="center">
                                    <td class="td-10">최종학력</td>
                                    <td colspan="2" class="p-lr5">
                                        <input type="text" name="memFinalEdu" id="memFinalEdu" class="input-100" />
                                    </td>
                                    <td class="td-10">키/몸무게</td>
                                    <td colspan="2" class="p-lr5">
                                        <input type="text" name="memHeight" id="memHeight" class="input-40" placeholder="cm"/>
                                        <input type="text" name="memWeight" id="memWeight" class="input-40" placeholder="kg"/>
                                    </td>
                                    <td class="td-10">종교</td>
                                    <td class="p-lr5">
                                        <select name="memReligion" id="memReligion">
                                            <option value="F">무교</option>
                                            <option value="Chr">기독교</option>
                                            <option value="Bud">불교</option>
                                            <option value="Cat">천주교</option>
                                            <option value="T">기타</option>
                                        </select>
                                        <!-- False/Christian/Buddhism/Catholic/True -->
                                    </td>
                                </tr>
                                <tr class="center">
                                    <td>보유자격1</td>
                                    <td class="p-lr5">
                                        <input type="text" name="memLicense1" id="memLicense1" class="input-100" />
                                    </td>
                                    <td>보유자격2</td>
                                    <td class="p-lr5">
                                        <input type="text" name="memLicense2" id="memLicense2" class="input-100" />
                                    </td>
                                    <td>보유자격3</td>
                                    <td class="p-lr5">
                                        <input type="text" name="memLicense3" id="memLicense3" class="input-100" />
                                    </td>
                                    <td>보유자격4</td>
                                    <td class="p-lr5">
                                        <input type="text" name="memLicense4" id="memLicense4" class="input-100" />
                                    </td>
                                </tr>
                                <tr class="center">
                                    <td>어학사항1</td>
                                    <td class="p-lr5">
                                        <input type="text" name="memLang1" id="memLang1" class="input-100" />
                                    </td>
                                    <td>어학사항2</td>
                                    <td class="p-lr5">
                                        <input type="text" name="memLang2" id="memLang2" class="input-100" />
                                    </td>
                                    <td>어학사항3</td>
                                    <td class="p-lr5">
                                        <input type="text" name="memLang3" id="memLang3" class="input-100" />
                                    </td>
                                    <td>어학사항4</td>
                                    <td class="p-lr5">
                                        <input type="text" name="memLang4" id="memLang4" class="input-100" />
                                    </td>
                                </tr>
                                <tr class="center">
                                    <td>비고</td>
                                    <td colspan="7" class="p-lr5">
                                        <input type="text" name="memComment" id="memComment" class="input-100" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="btn-grp center">
                            <button type="submit" class="btn-on">내용저장</button>                        
                            <button type="reset" class="btn-off">새로고침</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
</body>
</html>