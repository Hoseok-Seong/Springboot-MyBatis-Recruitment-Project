<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                <link rel="stylesheet"
                    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
                <script src="https://kit.fontawesome.com/32aa2b8683.js" crossorigin="anonymous"></script>
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
                <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
                    rel="stylesheet">
                <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
                <link rel="stylesheet" href="/css/style.css">
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
            </head>

            <body>
                <div class="container-fluid" style="width: 65%">
                    <div style="height: 50px">
                        <nav class="navbar navbar-expand-sm">
                            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                                data-bs-target="#navbarSupportedContent">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                <ul class="navbar-nav col-7">
                                    <a class="nav-link" href="#"><i class="bi bi-list"></i></a>
                                    <li class="nav-item">
                                        <a class="nav-link text-dark pt-1" href="/main"><img
                                                src="/images/projectLogo.png" alt=""
                                                style="width: 100px; height: 30px;"></a>
                                    </li>
                                    <c:choose>
                                        <c:when test="${principalEnt != null}">
                                            <li class="nav-item">
                                                <a class="nav-link text-dark" href="/recruitment/list">채용</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link text-dark" href="/myapplicant">마이페이지</a>
                                            </li>
                                        </c:when>

                                        <c:otherwise>
                                            <li class="nav-item">
                                                <a class="nav-link text-dark" href="/recruitment/list">채용</a>
                                            </li>
                                            <c:choose>
                                                <c:when test="${principal != null}">
                                                    <li class="nav-item">
                                                        <a class="nav-link text-dark" href="/resumeList">이력서</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link text-dark" href="/myapply">마이페이지</a>
                                                    </li>
                                                </c:when>

                                                <c:otherwise>
                                                    <li class="nav-item">
                                                        <a class="nav-link text-dark" href="/resumeList"
                                                            data-toggle="modal" data-target="#login">이력서</a>
                                                    </li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:otherwise>
                                    </c:choose>

                                </ul>
                                <ul class="navbar-nav col-5 justify-content-end">
                                    <c:choose>
                                        <c:when test="${not empty principal or not empty principalEnt}">
                                            <!-- 세션에 principal 또는 principalEnt 중 하나 이상이 존재하는 경우 -->
                                            <li class="nav-item">
                                                <div class="dropdown">
                                                    <a class="btn btn-secondary dropdown-toggle" href="#" role="button"
                                                        id="dropdownMenuLink" data-bs-toggle="dropdown"
                                                        aria-expanded="false"
                                                        style="background-color: transparent; border: none;">
                                                        <img src="/images/profile.png" style="width: 35px;"
                                                            class="rounded-circle" alt="Cinque Terre">
                                                    </a>

                                                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                                        <li>
                                                            <a class=" dropdown-item" href="/logout"
                                                                onclick="logout()">로그아웃</a>
                                                        </li>
                                                        <li class="nav-item">
                                                        <li>
                                                            <a class="dropdown-item" data-toggle="modal"
                                                                data-target="#update" style="cursor: pointer;">회원수정</a>
                                                        </li>
                                                        <c:choose>
                                                            <c:when test="${principal != null}">
                                                                <li>
                                                                    <a class="dropdown-item" href="/myapply"
                                                                        style="cursor: pointer;">마이페이지</a>
                                                                </li>
                                                            </c:when>
                                                            <c:when test="${principalEnt != null}">
                                                                <li>
                                                                    <a class="dropdown-item" href="/myapplicant"
                                                                        style="cursor: pointer;">마이페이지</a>
                                                                </li>
                                                            </c:when>
                                                        </c:choose>
                                                    </ul>
                                                </div>

                                            </li>
                                        </c:when>

                                        <c:otherwise>
                                            <!-- 세션에 principal 또는 principalEnt가 존재하지 않는 경우 -->
                                            <li class="nav-item">
                                                <a class="nav-link text-dark" data-toggle="modal" data-target="#login"
                                                    style="cursor: pointer;">로그인</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link text-dark" data-toggle="modal" data-target="#join"
                                                    style="cursor: pointer;">회원가입</a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </ul>
                            </div>
                        </nav>
                    </div>
                </div>
                <hr class="my-1">
                </header>


                <%-- 회원가입 Modal --%>
                    <!-- The Modal -->
                    <div class="modal" id="login">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title ms-2">로그인</h4>
                                    <!-- Modal footer -->
                                    <button class="btn btn-custome" type="button" data-dismiss="modal">X</button>
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
                                                <div class="form-floating" style="padding: 8px">
                                                    <input type="text" value="${cookie.remember.value}" class="form-control form-control-lg" id="usernameCheck" name="username" placeholder="아이디">
                                                    <label for="usernameCheck">아이디</label>
                                                </div>
                                                <div class="form-floating" style="padding: 8px">
                                                    <input type="password" class="form-control form-control-lg" id="passwordCheck" name="password" placeholder="비밀번호">
                                                    <label for="passwordCheck">비밀번호</label>
                                                </div>

                                                <button type="submit" class="btn login-btn-custom btn-sm me-2"
                                                    onclick="userLogin()" style="float:right;">로그인</button>
                                                <input class="ms-2" type="checkbox" name="remember"> 아이디 기억
                                                <div class="d-inline-flex justify-content-between">
                                                </div>
                                            </div>
                                            <div class="tab-pane fade" id="loginEnterprise">
                                                <div class="form-floating" style="padding: 8px;">
                                                    <input type="text" value="${cookie.rememberEnt.value}" class="form-control form-control-lg" id="enterpriseName" name="enterpriseName" placeholder="아이디">
                                                    <label for="enterpriseName">아이디</label>
                                                </div>
                                                <div class="form-floating" style="padding: 8px;">
                                                    <input type="password" class="form-control form-control-lg" id="enterpassword" name="password" placeholder="비밀번호">
                                                    <label for="enterpassword">비밀번호</label>
                                                </div>
                                                <button type="submit" class="btn login-btn-custom btn-sm me-2"
                                                    onclick="enterpriseLogin()" style="float:right;">로그인</button>
                                                <input class="ms-2" type="checkbox" name="rememberEnt"> 아이디
                                                기억
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- The Modal -->
                    <div class="modal" id="join">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <!-- Modal Header -->
                                <div class="modal-header ms-2">
                                    <h4 class="modal-title">회원가입</h4>
                                    <!-- Modal footer -->
                                    <button class="btn btn-custome" type="button" data-dismiss="modal">X</button>
                                </div>

                                <!-- Modal body -->
                                <div class="card-body">
                                    <ul class="nav my-nav-tabs nav-fill my-2">
                                        <li class="nav-item">
                                            <a class="my-nav-link list-group-item list-group-item-action active"
                                                data-toggle="tab" href="#joinUser">개인회원</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="my-nav-link list-group-item list-group-item-action"
                                                data-toggle="tab" href="#joinEnterprise">기업회원</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="tab-content">
                                    <div class="tab-pane fade show active" id="joinUser">
                                        <form id="signup-form" action="/user/join" method="post"
                                            onsubmit="return valid()">

                                                <div class="form-floating d-flex justify-content-end" style="padding: 8px;">
                                                    <input type="text" id="username"
                                                                    class="form-control form-control-lg" name="username"
                                                                    placeholder="아이디">
                                                    <label for="username">아이디</label>
                                                    <button type="button"
                                                        class="btn btn-custom btn-sm col-2"
                                                        onclick="sameCheck()" style="float:right;">중복확인</button>
                                                </div>

                                                <div class="form-floating" style="padding: 8px">
                                                    <input type="password" class="form-control form-control-lg" id="password" name="password" placeholder="비밀번호">
                                                    <label for="password">비밀번호</label>
                                                </div>

                                                <div class="form-floating" style="padding: 8px">
                                                    <input type="password" class="form-control form-control-lg" id="confirm-password" name="confirm-password" placeholder="비밀번호 확인">
                                                    <label for="confirm-password">비밀번호 확인</label>
                                                </div>

                                                <div class="form-floating" style="padding: 8px">
                                                    <input type="text" class="form-control form-control-lg" name="name" placeholder="이름">
                                                    <label for="name">이름</label>
                                                </div>

                                                <div class="form-floating" style="padding: 8px">
                                                    <input type="text" class="form-control form-control-lg" name="email" placeholder="이메일">
                                                    <label for="email">이메일</label>
                                                </div>

                                                <div class="form-floating" style="padding: 8px">
                                                    <input type="text" class="form-control form-control-lg" name="contact" placeholder="전화번호">
                                                    <label for="contact">전화번호</label>
                                                </div>

                                            <a class="btn btn-custom ms-2" type="button" data-bs-toggle="collapse"
                                                data-bs-target="#collapseExample" aria-expanded="false"
                                                aria-controls="collapseExample">
                                                사용 가능 스택
                                            </a>
                                            <div class="collapse" id="collapseExample">
                                                <div class="card card-body">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" name="skill"
                                                            value="1" id="flexCheckDefault1">
                                                        <label class="form-check-label" for="flexCheckDefault1">
                                                            Java
                                                        </label>
                                                    </div>
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" name="skill"
                                                            value="2" id="flexCheckDefault2">
                                                        <label class="form-check-label" for="flexCheckDefault2">
                                                            Html
                                                        </label>
                                                    </div>
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" name="skill"
                                                            value="3" id="flexCheckDefault3">
                                                        <label class="form-check-label" for="flexCheckDefault3">
                                                            JavaScript
                                                        </label>
                                                    </div>
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" name="skill"
                                                            value="4" id="flexCheckDefault4">
                                                        <label class="form-check-label" for="flexCheckDefault4">
                                                            VueJS
                                                        </label>
                                                    </div>
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" name="skill"
                                                            value="5" id="flexCheckDefault5">
                                                        <label class="form-check-label" for="flexCheckDefault5">
                                                            CSS
                                                        </label>
                                                    </div>
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" name="skill"
                                                            value="6" id="flexCheckDefault6">
                                                        <label class="form-check-label" for="flexCheckDefault6">
                                                            Node.js
                                                        </label>
                                                    </div>
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" name="skill"
                                                            value="7" id="flexCheckDefault7">
                                                        <label class="form-check-label" for="flexCheckDefault7">
                                                            React
                                                        </label>
                                                    </div>
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" name="skill"
                                                            value="8" id="flexCheckDefault8">
                                                        <label class="form-check-label" for="flexCheckDefault8">
                                                            ReactJs
                                                        </label>
                                                    </div>
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" name="skill"
                                                            value="9" id="flexCheckDefault9">
                                                        <label class="form-check-label" for="flexCheckDefault9">
                                                            Typescript
                                                        </label>
                                                    </div>
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" name="skill"
                                                            value="10" id="flexCheckDefault10">
                                                        <label class="form-check-label" for="flexCheckDefault10">
                                                            Zustand
                                                        </label>
                                                    </div>
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" name="skill"
                                                            value="11" id="flexCheckDefault11">
                                                        <label class="form-check-label" for="flexCheckDefault11">
                                                            AWS
                                                        </label>
                                                    </div>

                                                </div>
                                            </div>


                                            <div class="text-center">
                                                <tr><br>
                                                    &nbsp;<input type="checkbox"
                                                        aria-label="Checkbox for following text input" name="agree"
                                                        required> 필수 동의 항목 및 개인정보 수집 및
                                                    이용 동의, 광고성 정보 수신에 동의합니다.
                                                </tr>
                                                <br>
                                                <button type="submit" class="btn btn-custom btn-sm my-3 ms-3 me-4"
                                                    onclick="passwordCheck" style="float:right;">회원가입</button>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="tab-pane fade" id="joinEnterprise">
                                        <form id="entsignup-form" action="/enterprise/join" method="post"
                                            onsubmit="return valid()">

                                            <div class="form-floating d-flex justify-content-end" style="padding: 8px;">
                                                <input type="text" id="enterpriseNameCheck" class="form-control form-control-lg" name="enterpriseName" placeholder="아이디">
                                                <label for="enterpriseName">아이디</label>
                                                <button type="button" class="btn btn-custom btn-sm col-2" onclick="sameCheckEnt()" style="float:right;">중복확인</button>
                                            </div>

                                            <div class="form-floating" style="padding: 8px">
                                                <input type="password" class="form-control form-control-lg" id="entpassword" name="password" placeholder="비밀번호">
                                                <label for="entpassword">비밀번호</label>
                                            </div>

                                            <div class="form-floating" style="padding: 8px">
                                                <input type="password" class="form-control form-control-lg" id="entconfirm-password" name="confirm-password" placeholder="비밀번호 확인">
                                                <label for="entconfirm-password">비밀번호 확인</label>
                                            </div>

                                            <div class="form-floating" style="padding: 8px">
                                                <input type="text" class="form-control form-control-lg" name="address" placeholder="주소">
                                                <label for="address">주소</label>
                                            </div>

                                            <div class="form-floating" style="padding: 8px">
                                                <input type="text" class="form-control form-control-lg" name="contact" placeholder="전화번호">
                                                <label for="contact">전화번호</label>
                                            </div>

                                            <div class="form-floating" style="padding: 8px">
                                                <input type="text" class="form-control form-control-lg" name="email" placeholder="이메일">
                                                <label for="email">이메일</label>
                                            </div>

                                            <div class="form-control-sm">
                                                &nbsp;회사분류
                                                <label for="exampleFormControlSelect4"></label>
                                                <select class="form-control" id="exampleFormControlSelect4"
                                                    name="sector">
                                                    <option value="SI">SI</option>
                                                    <option value="솔루션">솔루션</option>
                                                    <option value="웹 에이젼시">웹 에이젼시</option>
                                                    <option value="인력소싱">인력소싱</option>
                                                    <option value="IT 대기업 계열사">IT 대기업 계열사</option>
                                                    <option value="IT 스타트업">IT 스타트업</option>
                                                    <option value="IT 서비">IT 서비스</option>
                                                    <option value="IT 컨설팅 회사">IT 컨설팅 회사</option>
                                                </select>
                                            </div>
                                            <div class="form-control-sm">
                                                &nbsp;기업형태
                                                <label for="exampleFormControlSelect3"></label>
                                                <select class="form-control" id="exampleFormControlSelect3" name="size">
                                                    <option value="스타트업">스타트업</option>
                                                    <option value="중소기업">중소기업</option>
                                                    <option value="중견기업">중견기업</option>
                                                    <option value="대기업">대기업</option>
                                                </select>
                                            </div><br>
                                            <div class="text-center">
                                                <tr>
                                                    &nbsp;<input type="checkbox"
                                                        aria-label="Checkbox for following text input" name="agree"
                                                        required>
                                                    필수 동의 항목 및 개인정보 수집 및 이용 동의, 광고성 정보
                                                    수신에 동의합니다.
                                                </tr>
                                                <br>
                                                <button type="submit" class="btn btn-custom btn-sm m-1 my-3 ms-3 me-4"
                                                    style="float:right;">회원가입</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <script>
                        let submitCheck = false;
                        function valid() {
                            if (submitCheck) {
                                return true;
                            } else {
                                alert("유저네임 중복체크를 해주세요");
                                return false;
                            }
                        }
                        function sameCheck() {
                            let username = $("#username").val();
                            $.ajax({
                                type: "get",
                                url: "/user/usernameSameCheck?username=" + username
                            }).done((res) => {
                                //console.log(res);
                                if (res.data === true) {
                                    alert(res.msg);
                                    submitCheck = true;
                                } else {
                                    alert(res.msg);
                                    submitCheck = false;
                                }
                            }).fail((err) => {
                            });
                        }
                        function sameCheckEnt() {
                            let enterpriseName = $("#enterpriseNameCheck").val();
                            $.ajax({
                                type: "get",
                                url: "/enterprise/enterpriseNameSameCheckEnt?enterpriseName=" + enterpriseName
                            }).done((res) => {
                                //console.log(res);
                                if (res.data === true) {
                                    alert(res.msg);
                                    submitCheck = true;
                                } else {
                                    alert(res.msg);
                                    submitCheck = false;
                                }
                            }).fail((err) => {
                            });
                        }
                    </script>

                    <script>
                        var entform = document.getElementById("entsignup-form");
                        var entpassword = document.getElementById("entpassword");
                        var entconfirm_password = document.getElementById("entconfirm-password");
                        entform.addEventListener("submit", function (event) {
                            if (entpassword.value !== entconfirm_password.value) {
                                alert("비밀번호와 비밀번호 확인이 일치 하지 않습니다.");
                                event.preventDefault();
                            }
                        });
                        var form = document.getElementById("signup-form");
                        var password = document.getElementById("password");
                        var confirm_password = document.getElementById("confirm-password");
                        // const form = document.querySelector('#signup-form');
                        form.addEventListener("submit", function (event) {
                            if (password.value !== confirm_password.value) {
                                alert("비밀번호와 비밀번호 확인이 일치 하지 않습니다.");
                                event.preventDefault();
                            }
                        });
                    </script>
                    <script>
                        function enterpriseLogin() {
                            var rememberEnt = document.querySelector('input[name="rememberEnt"]').checked;
                            let data = {
                                enterpriseName: $("#enterpriseName").val(),
                                password: $("#enterpassword").val(),
                                rememberEnt: rememberEnt
                            };
                            $.ajax({
                                type: "post",
                                url: "/enterprise/login",
                                data: JSON.stringify(data),
                                contentType: 'application/json;charset=UTF-8',
                                dataType: "json"  // default : 응답의 mime 타입으로 유추함
                            }).done((res) => {    // 20x 일때
                                location.reload();
                            }).fail((err) => {    // 40x , 50x 일때
                                alert(err.responseJSON.msg);
                            });
                        }
                    </script>

                    <script>
                        function userLogin() {
                            var remember = document.querySelector('input[name="remember"]').checked;
                            let data = {
                                username: $("#usernameCheck").val(),
                                password: $("#passwordCheck").val(),
                                remember: remember
                            };
                            $.ajax({
                                type: "post",
                                url: "/user/login",
                                data: JSON.stringify(data),
                                contentType: 'application/json;charset=UTF-8',
                                dataType: "json"  // default : 응답의 mime 타입으로 유추함
                            }).done((res) => {    // 20x 일때
                                location.reload();
                                sessionStorage.setItem("username", username);
                            }).fail((err) => {    // 40x , 50x 일때
                                alert(err.responseJSON.msg);
                            });
                        }
                    </script>

                    <script>
                        function logout() {
                            sessionStorage.removeItem("username");
                        }
                    </script>

                    <div class="modal" id="update">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <!-- Modal Header -->
                                <div class="modal-header ms-2">
                                    <h4 class="modal-title">회원수정</h4>
                                    <!-- Modal footer -->
                                    <button class="btn btn-custome" type="button" data-dismiss="modal">X</button>
                                </div>
                                <div class="tab-content">
                                    <c:choose>
                                        <c:when test="${not empty principal}">

                                            <div class="tab-pane fade show active" id="updateUser">
                                                <form action="/user/update" method="post">

                                                    <div class="form-floating" style="padding: 8px">
                                                        <input type="password" class="form-control form-control-lg" name="password" placeholder="비밀번호">
                                                        <label for="password">비밀번호</label>
                                                    </div>
                                                    <div class="form-floating" style="padding: 8px">
                                                        <input type="password" class="form-control form-control-lg" name="passwordCheck" placeholder="비밀번호 중복검사">
                                                        <label for="passwordCheck">비밀번호 중복검사</label>
                                                    </div>

                                                    <div class="form-floating" style="padding: 8px">
                                                        <input type="text" class="form-control form-control-lg" name="email" placeholder="이메일" value="${principal.email}">
                                                        <label for="email">이메일</label>
                                                    </div>

                                                    <div class="form-floating" style="padding: 8px">
                                                        <input type="text" class="form-control form-control-lg" name="contact" placeholder="전화번호" value="${principal.contact}">
                                                        <label for="contact">전화번호</label>
                                                    </div>

                                                    <a class="btn btn-custom ms-2" type="button"
                                                        data-bs-toggle="collapse"
                                                        data-bs-target="#collapseExample"
                                                        aria-expanded="false"
                                                        aria-controls="collapseExample">
                                                        사용 가능 스택
                                                    </a>
                                                    <div class="collapse" id="collapseExample">
                                                        <div class="card card-body">
                                                            <div class="form-check">
                                                                <input class="form-check-input"
                                                                    type="checkbox" name="skill" value="1"
                                                                    id="1flexCheckDefault1">
                                                                <label class="form-check-label"
                                                                    for="1flexCheckDefault1">
                                                                    Java
                                                                </label>
                                                            </div>
                                                            <div class="form-check">
                                                                <input class="form-check-input"
                                                                    type="checkbox" name="skill" value="2"
                                                                    id="2flexCheckDefault2">
                                                                <label class="form-check-label"
                                                                    for="2flexCheckDefault2">
                                                                    Html
                                                                </label>
                                                            </div>
                                                            <div class="form-check">
                                                                <input class="form-check-input"
                                                                    type="checkbox" name="skill" value="3"
                                                                    id="3flexCheckDefault3">
                                                                <label class="form-check-label"
                                                                    for="3flexCheckDefault3">
                                                                    JavaScript
                                                                </label>
                                                            </div>
                                                            <div class="form-check">
                                                                <input class="form-check-input"
                                                                    type="checkbox" name="skill" value="4"
                                                                    id="4flexCheckDefault4">
                                                                <label class="form-check-label"
                                                                    for="4flexCheckDefault4">
                                                                    VueJS
                                                                </label>
                                                            </div>
                                                            <div class="form-check">
                                                                <input class="form-check-input"
                                                                    type="checkbox" name="skill" value="5"
                                                                    id="5flexCheckDefault5">
                                                                <label class="form-check-label"
                                                                    for="5flexCheckDefault5">
                                                                    CSS
                                                                </label>
                                                            </div>
                                                            <div class="form-check">
                                                                <input class="form-check-input"
                                                                    type="checkbox" name="skill" value="6"
                                                                    id="6flexCheckDefault6">
                                                                <label class="form-check-label"
                                                                    for="6flexCheckDefault6">
                                                                    Node.js
                                                                </label>
                                                            </div>
                                                            <div class="form-check">
                                                                <input class="form-check-input"
                                                                    type="checkbox" name="skill" value="7"
                                                                    id="7flexCheckDefault7">
                                                                <label class="form-check-label"
                                                                    for="7flexCheckDefault7">
                                                                    React
                                                                </label>
                                                            </div>
                                                            <div class="form-check">
                                                                <input class="form-check-input"
                                                                    type="checkbox" name="skill" value="8"
                                                                    id="8flexCheckDefault8">
                                                                <label class="form-check-label"
                                                                    for="8flexCheckDefault8">
                                                                    ReactJs
                                                                </label>
                                                            </div>
                                                            <div class="form-check">
                                                                <input class="form-check-input"
                                                                    type="checkbox" name="skill" value="9"
                                                                    id="9flexCheckDefault9">
                                                                <label class="form-check-label"
                                                                    for="9flexCheckDefault9">
                                                                    Typescript
                                                                </label>
                                                            </div>
                                                            <div class="form-check">
                                                                <input class="form-check-input"
                                                                    type="checkbox" name="skill" value="10"
                                                                    id="10flexCheckDefault10">
                                                                <label class="form-check-label"
                                                                    for="10flexCheckDefault10">
                                                                    Zustand
                                                                </label>
                                                            </div>
                                                            <div class="form-check">
                                                                <input class="form-check-input"
                                                                    type="checkbox" name="skill" value="11"
                                                                    id="11flexCheckDefault11">
                                                                <label class="form-check-label"
                                                                    for="11flexCheckDefault11">
                                                                    AWS
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class=" text-center">
                                                        <td>
                                                            <button class="btn btn-custom btn-sm my-3 ms-3 me-4"
                                                                style="float:right;">회원정보수정</button>
                                                        </td>
                                                    </div>
                                                </form>
                                            </div>
                                        </c:when>

                                        <c:otherwise>

                                            <div class="tab-pane fade show active" id="updateEnterprise">
                                                <form action="/enterprise/update" method="post">

                                                    <div class="form-floating" style="padding: 8px">
                                                        <input type="password" class="form-control form-control-lg" name="password" placeholder="비밀번호">
                                                        <label for="password">비밀번호</label>
                                                    </div>
                                                    <div class="form-floating" style="padding: 8px">
                                                        <input type="password" class="form-control form-control-lg" name="passwordCheck" placeholder="비밀번호 중복검사">
                                                        <label for="passwordCheck">비밀번호 중복검사</label>
                                                    </div>

                                                    <div class="form-floating" style="padding: 8px">
                                                        <input type="text" class="form-control form-control-lg" name="address" placeholder="주소" value="${principalEnt.address}">
                                                        <label for="address">주소</label>
                                                    </div>

                                                    <div class="form-floating" style="padding: 8px">
                                                        <input type="text" class="form-control form-control-lg" name="contact" placeholder="전화번호" value="${principalEnt.contact}">
                                                        <label for="contact">전화번호</label>
                                                    </div>

                                                    <div class="form-floating" style="padding: 8px">
                                                        <input type="text" class="form-control form-control-lg" name="email" placeholder="이메일" value="${principalEnt.email}">
                                                        <label for="email">이메일</label>
                                                    </div>

                                                    <div class="form-control-sm">
                                                        &nbsp;회사분류
                                                        <label for="exampleFormControlSelect1"></label>
                                                        <select class="form-control" id="exampleFormControlSelect1"
                                                            name="sector">
                                                            <option value="SI">SI</option>
                                                            <option value="솔루션">솔루션</option>
                                                            <option value="웹 에이젼시">웹 에이젼시</option>
                                                            <option value="인력소싱">인력소싱</option>
                                                            <option value="IT 대기업 계열사">IT 대기업 계열사</option>
                                                            <option value="IT 스타트업">IT 스타트업</option>
                                                            <option value="IT 서비">IT 서비스</option>
                                                            <option value="IT 컨설팅 회사">IT 컨설팅 회사</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-control-sm">
                                                        &nbsp;기업형태
                                                        <label for="exampleFormControlSelect2"></label>
                                                        <select class="form-control" id="exampleFormControlSelect2"
                                                            name="size">
                                                            <option value="스타트업">스타트업</option>
                                                            <option value="중소기업">중소기업</option>
                                                            <option value="중견기업">중견기업</option>
                                                            <option value="대기업">대기업</option>
                                                        </select>
                                                    </div>
                                                    <button class="btn btn-custom btn-sm m-1 my-3 ms-3 me-4"
                                                        style="float:right;">회원정보수정</button>
                                                </form>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                    <script>
                        $(document).ready(function () {

                            if (sessionStorage.getItem("username") != null) {
                                const eventSource = new EventSource('/notify');
                                eventSource.onmessage = function (event) {
                                    const data = event.data;
                                    alert(data);
                                };
                            }
                        })
                    </script>