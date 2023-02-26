<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <title>구직사이트</title>
            <link rel="icon" href="/images/favicon.png" type="image/x-icon">
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
            <script src="https://kit.fontawesome.com/32aa2b8683.js" crossorigin="anonymous"></script>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
            <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
            <link rel="stylesheet" href="/css/style.css">
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        </head>

        <body>
            <header>
                <div class="container-fluid">
                    <div style="height: 50px">
                        <nav class="navbar navbar-expand-sm">
                            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                                data-bs-target="#navbarSupportedContent">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                <ul class="navbar-nav m-auto">
                                    <a class="nav-link" href="#"><i class="bi bi-list"></i></a>
                                    <li class="nav-item">
                                        <a class="nav-link text-dark pt-1" href="/main"><img
                                                src="/images/projectLogo.png" alt=""
                                                style="width: 100px; height: 30px;"></a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link text-dark" href="/recruitment/list">채용</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link text-dark" href="/resumeMain">이력서</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link text-dark" href="/community">커뮤니티</a>
                                    </li>
                                </ul>
                                <ul class="navbar-nav m-auto">
                                    <a class="nav-link" href="#"><i class="bi bi-search"></i></a>
                                    <c:choose>
                                        <c:when test="${not empty principal or not empty principalEnt}">
                                            <!-- 세션에 principal 또는 principalEnt 중 하나 이상이 존재하는 경우 -->
                                            <li class="nav-item">
                                                <a class="nav-link text-dark" href=""><i class="bi bi-bell"></i></a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="/logout"><img src="/images/profile.png" style="width: 35px;"
                                                        class="rounded-circle" alt="Cinque Terre"></a>
                                            </li>
                                        </c:when>

                                        <c:otherwise>
                                            <!-- 세션에 principal 또는 principalEnt가 존재하지 않는 경우 -->
                                            <li class="nav-item">
                                                <a class="nav-link text-dark" data-toggle="modal" data-target="#login"
                                                    href="/loginForm">로그인</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link text-dark" href="/joinForm">회원가입</a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </ul>
                            </div>
                    </div>
                    </nav>
                </div>
                </div>
                <hr class="my-1">
            </header>

            <body>
                <!-- The Modal -->
                <div class="modal" id="login">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">로그인</h4>
                                <!-- Modal footer -->
                                <button type="button" data-dismiss="modal">X</button>
                            </div>

                            <!-- Modal body -->
                            <div class="modal-body">
                                <div class="card-body">
                                    <ul class="nav my-nav-tabs nav-fill mb-4">
                                        <li class="nav-item">
                                            <a class="my-nav-link list-group-item list-group-item-action active"
                                                data-toggle="tab" href="#loginUser">개인회원</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="my-nav-link list-group-item list-group-item-action"
                                                data-toggle="tab" href="#loginEnterprise">기업회원</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content ">
                                        <div class="tab-pane fade show active" id="loginUser">
                                            <form action="user/login" method="post">
                                                <table class="table table-borderless">

                                                    <tr class="text-center">
                                                        <!-- input의 크기는 class="form-control-lg" 로 늘린다. -->
                                                        <td><input type="text" class="form-control-lg w-100"
                                                                name="username" placeholder="username"></td>
                                                    </tr>

                                                    <tr class="text-center">
                                                        <td><input type="password" class="form-control-lg w-100"
                                                                name="password" placeholder="password"></td>
                                                    </tr>
                                                </table>
                                                <button class="btn btn-custom btn-sm" style="float:right;">로그인</button>
                                                <input type="checkbox" value="">로그인 상태 유지<br><br><br>
                                                <div class="d-inline-flex justify-content-between">
                                                    <p>좋은 기업 찾고 계신가요?&nbsp;<a href="/joinForm">회원가입</a></p>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="tab-pane fade" id="loginEnterprise">
                                            <form action="enterprise/login" method="post">
                                                <table class="table table-borderless">

                                                    <tr class="text-center ">
                                                        <td><input type="text" class="form-control-lg w-100"
                                                                name="enterpriseName" placeholder="enterpriseName"></td>
                                                    </tr>

                                                    <tr class="text-center">
                                                        <td><input type="password" class="form-control-lg w-100"
                                                                name="password" placeholder="password"></td>
                                                    </tr>
                                                </table>
                                                <button class="btn btn-custom btn-sm" style="float:right;">로그인</button>
                                                <input type="checkbox" value="">로그인 상태 유지<br><br><br>
                                                <p>좋은 인재 찾고 계신가요?&nbsp;<a href="/joinForm">회원가입</a></p>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>