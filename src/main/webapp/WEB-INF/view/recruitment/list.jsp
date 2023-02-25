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
                    <div class="container jm_container mt-5">
                        <div class="row">
                            <c:forEach items="${Posts}" var="post">
                                <div class="col-sm-3 mb-3">
                                    <a href="#" style="color: inherit; text-decoration: none;">
                                        <div class="card jm_card h-100">
                                            <img src="/images/coupang.png" class="card-img-top jm_card_img_top">
                                            <div class="card-body jm_card_body">
                                                <div class="jm_company_name">${post.title}</div>
                                                <div class="jm_company_title">${post.enterpriseName}</div>
                                                <button type="button" class="btn btn-warning btn-sm">상세보기</button>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="row row-cols-1 row-cols-md-4 g-4 d-flex flex-wrap">
                        <div class="container">
                        </div>
                        </tbody>
                        </table>
                    </div>
                </div>
        </div>
        </main>
        </div>
        </body>
        <div style="height : 200px"></div>