<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/HEADER.jsp"%>
<link rel="stylesheet" href="css/headNmenu.css">
<link rel="stylesheet" href="css/board.css">
<script src="js/menu.js"></script>
<script src="js/table.js"></script>
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
                    <button type="button" class="btn-on" onclick="location.href='memberInsert.html'">사용자추가</button>
                    <button type="button" class="btn-off">선택삭제</button>
                </div>
                <div class="search-box">
                    <form name="search-frm" class="search-frm" method="post" action="search.do">
                        <select class="sel">
                            <option value="">이름</option>
                            <option value="">휴대전화</option>
                            <option value="">부서명</option>
                        </select>
                        <input name="search" type="search" class="input" maxlength="20" tabindex="1" />
                        <button type="submit" class="search-btn">사원검색</button>
                    </form>
                </div>
            </div>
            <div class="member-tbl">
                <table>
                    <tr class="center">
                        <td class="td-3"><input type="checkbox"></td>
                        <td class="td-5">번호</td>
                        <td class="td-8">사원명</td>
                        <td class="td-5">성별</td>
                        <td class="td-8">부서</td>
                        <td class="td-8">직급</td>
                        <td class="td-22">이메일</td>
                        <td class="td-10">전화번호</td>
                        <td class="td-12">내선번호</td>
                        <td class="td-7">입사일</td>
                        <td class="">관리</td>
                    </tr>
                    <tr class="center">
                        <td><input type="checkbox"></td>
                        <td>6</td>
                        <td>김사원</td>
                        <td>남자</td>
                        <td>영업부</td>
                        <td>사원</td>
                        <td>kim4one@jyp.co.kr</td>
                        <td>0510003333</td>
                        <td>5292</td>
                        <td>2020/09/04</td>
                        <td>
                            <button type="button" class="s-btn-on">수정</button>
                            <button type="button" class="s-btn-off">삭제</button>
                        </td>
                    </tr>
                    

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
</html>