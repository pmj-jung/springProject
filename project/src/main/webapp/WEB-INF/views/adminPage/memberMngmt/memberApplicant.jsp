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
                <h3 class="font18">사용자 관리 > 사용자 신청 목록</h3>
            </div>
            <div class="btn-wrap flex flex-justify">
                <div class="btns">
                    <button type="button" class="btn-on">선택승인</button>
                    <button type="button" class="btn-off">선택거부</button>
                    <button type="button" class="btn-del">선택삭제</button>
                </div>
                <div class="search-box">
                    <form name="search-frm" class="search-frm" method="post" action="search.do">
                        <select class="sel">
                            <option value="">아이디</option>
                            <option value="">신청자</option>
                            <option value="">부서명</option>
                        </select>
                        <input name="search" type="search" class="input" maxlength="20" tabindex="1" />
                        <button type="submit" class="search-btn">검색</button>
                    </form>
                </div>
            </div>
            <div class="member-tbl">
                <table>
                    <tr class="center">
                        <td class="td-3"><input type="checkbox"></td>
                        <td class="td-8">신청일</td>
                        <td class="td-8">신청 아이디</td>
                        <td class="td-8">신청자</td>
                        <td class="td-8">부서</td>
                        <td class="td-15">이메일</td>
                        <td class="td-15">전화번호</td>
                        <td class="">거부사유</td>
                        <td class="">관리</td>
                    </tr>
                    <tr class="center">
                        <td><input type="checkbox"></td>
                        <td>2020/09/04</td>
                        <td>allwid4993</td>
                        <td>이신입</td>
                        <td>영업2팀</td>
                        <td>kim4one@jyp.co.kr</td>
                        <td>01055783321</td>
                        <td>
                            <select name="" id="" class="sel-100">
                                <option value="">사유1</option>
                                <option value="">사유2</option>
                            </select>
                        </td>
                        <td>
                            <button type="button" class="s-btn-on">승인</button>
                            <button type="button" class="s-btn-off">거부</button>
                            <button type="button" class="s-btn-del">삭제</button>
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
        </div>
    </main>
</body>
</html>