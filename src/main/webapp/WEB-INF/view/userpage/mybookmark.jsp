<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>
        <div class="container-fluid" style="width: 65%">
            <br>
            <div class="row pt-3">
                <div class="col-3">
                    <nav class="navbar navbar-expand-lg bg-white">
                        <div class="container-fluid">
                            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                                <div class="navbar-nav">
                                    <h3>
                                        <strong>
                                            <a class="nav-link active" aria-current="page" href="#">프로필</a>
                                        </strong>
                                    </h3>
                                </div>
                            </div>
                        </div>
                    </nav>
                    <div class="card">
                        <div class="card-body text-center">
                            <img src="/images/user.png" class="card-img-top" alt="..."
                                style="width: 100px; height: 100px;">
                            <h5 class="card-title pt-2">${principal.name}</h5>
                            <h5 class="card-title pt-2">${principal.email}</h5>
                            <h5 class="card-title pt-2">${principal.contact}</h5>
                            <br>
                            <h3>지원횟수 :
                                <c:out value="${fn:length(applyLists)}" />
                            </h3>
                            <button type="button" class="btn btn-outline-info btn-lg" onclick="location.href='
                                /recruitment/list'">채용공고 보러가기
                            </button>
                        </div>
                    </div>
                </div>
                <div class="col-9 mb-2">
                    <nav class="navbar navbar-expand-lg bg-light">
                        <div class="container-fluid">
                            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                                <div class="navbar-nav">
                                    <h3>
                                        <a class="nav-link" href="/myapply">지원현황</a>
                                    </h3>
                                    <h3>
                                        <a class="nav-link" href="/mymatching">추천서비스</a>
                                    </h3>
                                    <h3>
                                        <a class="nav-link active" aria-current="page" href="/mybookmark">북마크</a>
                                    </h3>
                                </div>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
        <%@ include file="../layout/footer.jsp" %>