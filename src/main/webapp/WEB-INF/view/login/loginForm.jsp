<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://kit.fontawesome.com/32aa2b8683.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <link rel="stylesheet" href="/css/style.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <title>Document</title>
    <style>
        /* 전체 컨테이너 스타일링 */
        body {
            background-color: #f8f9fa;
        }

        .container {
            max-width: 500px;
            margin: 0 auto;
            margin-top: 100px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        /* 로그인 폼 스타일링 */
        .form-group label {
            font-weight: bold;
        }

        .form-group input {
            border-radius: 0;
        }

        .btn-custom {
            background-color: #3e7bec;
            border: none;
            border-radius: 0;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            color: #f8f9fa;
            letter-spacing: 1px;
        }

        .btn-custom:hover {
            background-color: #3d65e7;
        }

        .nav-tabs {
            border-bottom: none;
        }

        .nav-tabs .nav-link.active {
            background-color: transparent;
            border-color: transparent;
            color: #f56a79;
            font-weight: bold;
        }
    </style>
</head>

<body>

    <div class="container my-5 justify-content-center pt-5" style="height: 650px;">
        <div class="row justify-content-center pt-5">
            <!-- col-md => col-lg 변환 : div width 증가 -->
            <div class="col-lg-8 col-lg-6">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h2 class="text-center mb-4">로그인</h2>
                        <ul class="nav nav-tabs nav-fill mb-4">
                            <li class="nav-item">
                                <a class="nav-link list-group-item list-group-item-action active" data-toggle="tab"
                                    href="#loginUser">개인회원</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link list-group-item list-group-item-action" data-toggle="tab"
                                    href="#loginEnterprise">기업회원</a>
                            </li>
                        </ul>
                        <div class="tab-content ">
                            <div class="tab-pane fade show active" id="loginUser">
                                <form action="user/login" method="post">
                                    <table class="table table-bordered">

                                        <tr class="text-center">
                                            <!-- input의 크기는 class="form-control-lg" 로 늘린다. -->
                                            <td><input type="text" class="form-control-lg w-100" name="username"
                                                    placeholder="username"></td>
                                        </tr>

                                        <tr class="text-center">
                                            <td><input type="password" class="form-control-lg w-100" name="password"
                                                    placeholder="password"></td>
                                        </tr>
                                    </table>
                                    <button class="btn btn-danger btn-sm" style="float:right;">로그인</button>
                                    <input type="checkbox" value="">로그인 상태 유지<br><br><br>
                                    <p>좋은 기업 찾고 계신가요?&nbsp;<a href="/joinForm">회원가입</a></p>
                                </form>
                            </div>
                            <div class="tab-pane fade" id="loginEnterprise">
                                <form action="enterprise/login" method="post">
                                    <table class="table table-bordered">

                                        <tr class="text-center ">
                                            <td><input type="text" class="form-control-lg w-100" name="enterpriseName"
                                                    placeholder="enterpriseName"></td>
                                        </tr>

                                        <tr class="text-center">
                                            <td><input type="password" class="form-control-lg w-100" name="password"
                                                    placeholder="password"></td>
                                        </tr>
                                    </table>
                                    <button class="btn btn-danger btn-sm" style="float:right;">로그인</button>
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
</body>