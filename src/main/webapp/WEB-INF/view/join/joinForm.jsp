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
                                            data-toggle="tab" href="#joinUser">개인회원</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="my-nav-link list-group-item list-group-item-action" data-toggle="tab"
                                            href="#joinEnterprise">기업회원</a>
                                    </li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane fade show active" id="joinUser">
                                        <form action="user/join" method="post" onsubmit="return valid()">
                                            <table class="table table-borderless">
                                                <div class="text-center border d-flex justify-content-end">
                                                    <!-- input의 크기는 class="form-control-lg" 로 늘린다. -->
                                                    <td><input type="text" id="username" class="form-control-lg w-75"
                                                            name="username" placeholder="아이디를 입력해주세요">
                                                        <button type="button" class="btn btn-custom btn-sm"
                                                            onclick="sameCheck()" style="float:right;">중복확인</button>
                                                    </td>
                                                </div>
                                                <tr class="text-center">
                                                    <td><input type="password" class="form-control-lg"
                                                            style="width:350px" name="password" placeholder="비밀번호"></td>
                                                </tr>
                                                <tr class="text-center">
                                                    <td><input type="password" class="form-control-lg w-100" name=""
                                                            placeholder="비밀번호"></td>
                                                </tr>
                                                <tr class="text-center">
                                                    <td><input type="text" class="form-control-lg w-100" name="name"
                                                            placeholder="name"></td>
                                                </tr>
                                                <tr class="text-center">
                                                    <td><input type="text" class="form-control-lg w-100" name="email"
                                                            placeholder="email"></td>
                                                </tr>
                                                <div class="text-center">
                                                    <td><input type="text" class="form-control-lg w-75" name="contact"
                                                            placeholder="contact">
                                                        <button class="btn btn-custom btn-sm"
                                                            style="float:right;">인증번호</button>
                                                    <td>
                                                </div>
                                                </tr>
                                                <tr class="text-center">
                                                    <td><input type="text" class="form-control-lg w-100"
                                                            name="certificationNumber"
                                                            placeholder="certification-number"></td>
                                                </tr>
                                            </table>
                                            <div class="text-center">
                                                <tr>
                                                    &nbsp;<input type="checkbox"
                                                        aria-label="Checkbox for following text input"> 필수 동의 항목 및 개인정보
                                                    수집 및 이용 동의, 광고성 정보 수신에 동의합니다.
                                                </tr>
                                            </div>
                                            <br>
                                            <button class="btn btn-custom btn-sm m-1" style="float:right;">회원가입</button>
                                        </form>
                                    </div>
                                    <div class="tab-pane fade" id="joinEnterprise">
                                        <form action="enterprise/join" method="post" onsubmit="return valid()">
                                            <table class="table table-borderless">
                                                <div class="text-center border d-flex justify-content-end">
                                                    <%-- input의 크기는 class="form-control-lg" 로 늘린다. --%>
                                                        <td><input type="text" class="form-control-lg w-75"
                                                                name="enterpriseName" placeholder="enterprise name">
                                                            <button class="btn btn-custom btn-sm" onclick="sameCheck()"
                                                                style="float:right;">중복확인</button>
                                                        </td>
                                                </div>
                                                <tr class="text-center">
                                                    <td><input type="password" class="form-control-lg w-100"
                                                            name="password" placeholder="password"></td>
                                                </tr>
                                                <tr class="text-center">
                                                    <td><input type="password" class="form-control-lg w-100"
                                                            name="passwordCheck" placeholder="passwordcheck">
                                                    </td>
                                                </tr>
                                                <tr class="text-center">
                                                    <td><input type="text" class="form-control-lg w-100" name="address"
                                                            placeholder="address"></td>
                                                </tr>
                                                <div class="text-center">
                                                    <td><input type="text" class="form-control-lg w-75" name="contact"
                                                            placeholder="contact">
                                                        <button class="btn btn-custom btn-sm"
                                                            style="float:right;">인증번호</button>
                                                    </td>
                                                </div>
                                                <tr class="text-center">
                                                    <td><input type="text" class="form-control-lg w-100" name="image"
                                                            placeholder="image"></td>
                                                </tr>
                                                <tr class="text-center">
                                                    <td><input type="text" class="form-control-lg w-100" name="email"
                                                            placeholder="email"></td>
                                                </tr>
                                            </table>
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
                                            </div><br>

                                            <div class="form-control-sm">
                                                &nbsp;기업형태
                                                <label for="exampleFormControlSelect1"></label>
                                                <select class="form-control" id="exampleFormControlSelect1" name="size">
                                                    <option value="스타트업">스타트업</option>
                                                    <option value="중소기업">중소기업</option>
                                                    <option value="중견기업">중견기업</option>
                                                    <option value="대기업">대기업</option>
                                                </select>
                                            </div><br>
                                            <div class="text-center">
                                                <tr>
                                                    &nbsp;<input type="checkbox"
                                                        aria-label="Checkbox for following text input"> 필수 동의 항목 및 개인정보
                                                    수집 및 이용 동의, 광고성 정보
                                                    수신에 동의합니다.
                                                </tr>
                                            </div>
                                            <br>
                                            <button class="btn btn-custom btn-sm m-1" style="float:right;">회원가입</button>
                                        </form>
                                    </div>
                                </div>
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
            </script>
            <%@ include file="../layout/footer.jsp" %>