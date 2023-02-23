<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>

        <div style="width: 80%; margin: 0 auto;">

            <!-- 게시판 부분 -->

            <main class="pt-3">
                <div class="container-fluid px-4">
                    <div class="d-flex justify-content-between align-items-center">
                        <h1 class="mt-4">채용정보</h1>
                        <div class="input-group" style="width: 50%;">
                            <input type="text" class="form-control" id="search" placeholder="검색어를 입력하세요">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button" id="searchButton">검색</button>
                            </div>
                        </div>
                    </div>

                    <div class="card mb-4">
                        <div class="card-header">
                            <a class="btn btn-primary float-end" href="register">
                                <!-- <i class="fas fa-table me-1"></i> -->
                                <i class="fas fa-edit"></i> 글 작성
                            </a>
                        </div>
                        <div class="card-body">
                            <table class="table table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th>글번호</th>
                                        <th>기업명</th>
                                        <th>제목</th>
                                        <th>작성일</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${boards}" var="board">
                                        <tr>
                                            <td>${board.id}</td>
                                            <td>${board.title}</td>
                                            <td><a href="recruitment/detail/${board.id} ">${board.enterpriseName}</a>
                                            <td>${board.createdAt}</td>
                                        </tr>
                                        </c:forEach>
                                        <%-- <tr>
                                            <td>1</td>
                                            <td><a href="${recruitment/detail/dto.id} ">부산갈매기</a></td>
                                            <td>부산갈매기 개발자채용</td>
                                            <td>2022.02.22</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td><a href="${recruitment/detail/dto.id} ">노마드랩</a></td>
                                            <td>노마드랩 개발자채용</td>
                                            <td>2022.02.22</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td><a href="${recruitment/detail/dto.id} ">제노마드</a></td>
                                            <td>제노마드 개발자채용</td>
                                            <td>2022.02.22</td>
                                        </tr>
                                        <tr>
                                            <td>4</td>
                                            <td><a href="${recruitment/detail/dto.id} ">삼성</a></td>
                                            <td>삼성 개발자채용</td>
                                            <td>2022.02.22</td>
                                        </tr>
                                        <tr>
                                            <td>5</td>
                                            <td><a href="${recruitment/detail/dto.id} ">한화</a></td>
                                            <td>한화 개발자채용</td>
                                            <td>2022.02.22</td>
                                        </tr> --%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </main>
        </div>
        </body>



        <%@ include file="../layout/footer.jsp" %>