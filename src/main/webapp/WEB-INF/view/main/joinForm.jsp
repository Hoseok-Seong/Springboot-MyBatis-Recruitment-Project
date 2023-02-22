<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp" %>

    <body>
        <div class="my-container my-5 ">
            <div class="row justify-content-center">
                <!-- col-md => col-lg 변환 : div width 증가 -->
                <div class="col-lg-8 col-lg-6">
                    <div class="card shadow-sm">
                        <div class="card-body">
                            <h2 class="text-center mb-4">회원가입</h2>
                            <ul class="nav my-nav-tabs nav-fill mb-4">
                                <li class="nav-item">
                                    <a class="my-nav-link list-group-item list-group-item-action active"
                                        data-toggle="tab" href="#loginUser">개인회원</a>
                                </li>
                                <li class="nav-item">
                                    <a class="my-nav-link list-group-item list-group-item-action" data-toggle="tab"
                                        href="#loginEnterprise">기업회원</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane fade show active" id="loginUser">
                                    
                                    <form action="/join" method="post">
                                        <table class="table table-bordered">
                                            <div class="text-center border d-flex justify-content-end">
                                                    <!-- input의 크기는 class="form-control-lg" 로 늘린다. -->
                                                <td><input type="text" class="form-control-lg w-75" name="username" placeholder="username">
                                                    <button class="btn btn-danger btn-sm" style="float:right;">중복확인</button></td>
                                            </div>
                                            <tr class="text-center">
                                                <td><input type="password" class="form-control-lg w-100" name="password" placeholder="password"></td>
                                            </tr>
                                            <tr class="text-center">
                                                <td><input type="password" class="form-control-lg w-100" name="" placeholder="password check"></td>
                                            </tr>
                                            <tr class="text-center">
                                                <td><input type="text" class="form-control-lg w-100" name="name" placeholder="name"></td>
                                            </tr>
                                            <tr class="text-center">
                                                <td><input type="text" class="form-control-lg w-100" name="email" placeholder="email"></td>
                                            </tr>
                                            <div class="text-center">
                                                <td><input type="text" class="form-control-lg w-75" name="contact" placeholder="contact">
                                                    <button class="btn btn-danger btn-sm" style="float:right;">인증번호</button><td>
                                            </div>
                                            </tr>
                                            <tr class="text-center">
                                                <td><input type="text" class="form-control-lg w-100" name="certificationNumber" placeholder="certification-number"></td>
                                            </tr>
                                        </table>
                                            <div>
                                                <tr class="text-center">
                                                    <input type="checkbox"> 필수 동의 항목 및 개인정보 수집 및 이용 동의, 광고성 정보 수신에 동의합니다.
                                                </tr>
                                            </div>
                                        <button class="btn btn-danger btn-sm m-1" style="float:right;">회원가입</button>
                                    </form> 
                                </div>
                            <div class="tab-pane fade" id="loginEnterprise">
                                <form action="enterprise/join" method="post">
                                    <table class="table table-bordered">

                                        <div class="text-center border d-flex justify-content-end">
                                            input의 크기는 class="form-control-lg" 로 늘린다.
                                            <td><input type="text" class="form-control-lg w-75" name="enterprisename" placeholder="enterprise name">
                                                <button class="btn btn-danger btn-sm" style="float:right;">중복확인</button>
                                            </td>
                                        </div>
                                        <tr class="text-center">
                                            <td><input type="password" class="form-control-lg w-100" name="password" placeholder="password"></td>
                                        </tr>
                                        <tr class="text-center">
                                            <td><input type="password" class="form-control-lg w-100" name="passwordCheck" placeholder="passwordcheck">
                                            </td>
                                        </tr>
                                        <tr class="text-center">
                                            <td><input type="text" class="form-control-lg w-100" name="email" placeholder="email"></td>
                                        </tr>
                                        <tr class="text-center">
                                            <td><input type="text" class="form-control-lg w-100" name="adress" placeholder="adress"></td>
                                        </tr>
                                        <div class="text-center">
                                            <td><input type="text" class="form-control-lg w-75" name="contact" placeholder="contact">
                                                <button class="btn btn-danger btn-sm" style="float:right;">인증번호</button></td>
                                        </div>
                                    </table>
                                    <div>
                                        <tr class="text-center">
                                            <input type="checkbox"> 필수 동의 항목 및 개인정보 수집 및 이용 동의, 광고성 정보 수신에 동의합니다.
                                        </tr>
                                    </div>
                                    <button class="btn btn-danger btn-sm m-1" style="float:right;">회원가입</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <%@ include file="../layout/footer.jsp" %>