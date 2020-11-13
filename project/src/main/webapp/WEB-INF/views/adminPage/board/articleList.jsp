<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/ADMIN_HEADER.jsp"%>

     

    <script src="https://kit.fontawesome.com/2524621651.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
</head>
<link rel="stylesheet" href="css/board.css"> 
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
<script src="js/table.js"></script>
<body>
    <main>
        <div class="mainContent bg-gray p10">
            <div class="page-main-wrap bg-white p10">
                <div class="contentHead flex flex-justify">
                    <h3>게시판</h3>
                </div>
                <div class="btn-wrap flex flex-justify">
                    <div class="btns">
                        <button type="button" class="btn-on" onclick="location.href='memberInsert.html'">게시글작성</button>
                        <button type="button" class="btn-off">선택삭제</button>
                    </div>
                    <div class="search-box">
                        <form name="search-frm" class="search-frm" method="post" action="search.do">
                            <select class="sel">
                                <option value="">제목</option>
                                <option value="">작성자</option>
                                <option value="">모두</option>
                            </select>
                            <input name="search" type="search" class="input" maxlength="20" tabindex="1" />
                            <button type="submit" class="search-btn">검색</button>
                        </form>
                    </div>
                </div>
                <span>게시글 수 : n 개</span>
                <div class="board-list">
                    <table>
                        <tr class="center font14">
                            <td class="td-5"><input type="checkbox" /></td>
                            <td class="td-5">번호</td>
                            <td class="td-8">분류</td>
                            <td>게시물 제목</td>
                            <td class="td-8">작성자</td>
                            <td class="td-5">조회</td>
                            <td class="td-8">날짜</td>
                            <td class="td-8">관리</td>
                        </tr>
                        <tr class="center font14">
                            <td>
                                <input type="checkbox" />
                            </td>
                            <td>멍</td>
                            <td>
                                <a href="board_list.html" target="_blank" class="under">멍</a>
                            </td>
                            <td>#멍</td>
                            <td>
                                <a href="board_list.html" target="_blank" class="under">멍</a>
                            </td>
                            <td>멍</td>
                            <td>멍</td>
                            <td>
                                <span class="s-btn-on">수정</span>
                                <span class="s-btn-off">삭제</span>
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
        </div>
    </main>
</body>
</html>