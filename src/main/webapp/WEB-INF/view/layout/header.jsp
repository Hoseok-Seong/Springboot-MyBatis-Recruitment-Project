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
                                        <a class="nav-link text-dark" href="/main">로고</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link text-dark" href="/recruitment/RecruitmentInformation">채용</a>
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
                                    <c:when test="${principal == null}">
                                    <li class="nav-item">
                                        <a class="nav-link text-dark" href="/loginForm">로그인</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link text-dark" href="/joinForm">회원가입</a>
                                    </li>
                                    </c:when>

                                    <c:otherwise>
                                    <li class="nav-item">
                                        <a class="nav-link text-dark" href=""><i class="bi bi-bell"></i></a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="/logout"><img src="/images/profile.png" style="width: 35px;"
                                                   href="/logout" class="rounded-circle" alt="Cinque Terre"></a>
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