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
                            <h5 class="card-title pt-2">${principalEnt.enterpriseName}</h5>
                            <h5 class="card-title pt-2">${principalEnt.address}</h5>
                            <h5 class="card-title pt-2">${principalEnt.email}</h5>
                            <h5 class="card-title pt-2">${principalEnt.contact}</h5>
                            <h5 class="card-title pt-2">${principalEnt.size}</h5>
                            <br>
                            <h3>지원자 수 :
                                <c:out value="${fn:length(applyLists)}" />
                            </h3>
                            <br>
                            <button type="button" class="btn btn-outline-info btn-lg"
                                onclick="window.location.href = '/recruitment/list';">채용공고 보러가기
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
                                        <a class="nav-link active" aria-current="page" href="/myapplicant">지원자현황</a>
                                    </h3>
                                    <h3>
                                        <a class="nav-link" href="/myrecommend">인재추천</a>
                                    </h3>
                                    <h3>
                                        <a class="nav-link" href="/mybookmarkEnt">북마크</a>
                                    </h3>
                                </div>
                            </div>
                        </div>
                    </nav>
                    <div class="card">
                        <div class="card-body text-center">
                            <br>
                            <h5>
                                ${principalEnt.enterpriseName}님이 작성한 채용공고의 지원자 목록입니다
                            </h5>
                            <br>
                            <table class="table table-hover">
                                <thead class="table-light">
                                    <tr>
                                        <th scope="col">공고번호</th>
                                        <th scope="col">제목</th>
                                        <th scope="col">아이디</th>
                                        <th scope="col">이름</th>
                                        <th scope="col">이력서</th>
                                        <th scope="col">지원일자</th>
                                        <th scope="col">결과</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${applyLists}" var="applyList">
                                        <tr>
                                            <td>${applyList.recruitmentPostId}</td>
                                            <td>
                                                <a href="/recruitment/detail/${applyList.recruitmentPostId}">
                                                    ${applyList.title}
                                                </a>
                                            </td>
                                            <td>${applyList.username}</td>
                                            <td>${applyList.name}</td>
                                            <td data-bs-toggle="modal"
                                                data-bs-target="#staticBackdrop${applyList.userId}"
                                                style="cursor: pointer;">이력서 보기
                                            </td>
                                            <td>${applyList.createdAtToString}</td>
                                            <c:choose>
                                                <c:when test="${applyList.result == false}">
                                                    <td>
                                                        <button class="btn btn-danger" disabled="disabled">불합격</button>
                                                    </td>
                                                </c:when>

                                                <c:when test="${applyList.result == true}">
                                                    <td>
                                                        <button class="btn btn-success" disabled="disabled">합격</button>
                                                    </td>
                                                </c:when>

                                                <c:when test="${applyList.result == null}">
                                                    <td>
                                                        <button class="btn btn-primary" disabled="disabled">대기</button>
                                                    </td>
                                                </c:when>
                                            </c:choose>

                                            <!-- modal -->
                                            <div class="modal fade" id="staticBackdrop${applyList.userId}"
                                                data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
                                                aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                                <div
                                                    class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="staticBackdropLabel">
                                                                ${applyList.name}님의 이력서
                                                            </h5>
                                                            <button type="button" class="btn-close"
                                                                data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body justify-content-start">
                                                            <div class="container-fluid">
                                                                <div class="container-fluid pt-4 ps-0"
                                                                    style="height: 450px;">
                                                                    <input type="text" name="title"
                                                                        style="border: none;"
                                                                        value="${resumeList[applyList.userId-1].title}"
                                                                        class="form-control" placeholder="제목" readonly>
                                                                    <br>
                                                                    <br>
                                                                    <br>
                                                                    <div>생년월일</div>
                                                                    <hr class="md-0">
                                                                    <div class="form-floating mb-3">
                                                                        <input name="birthdate"
                                                                            value="${resumeList[applyList.userId-1].birthdate}"
                                                                            required / readonly>
                                                                    </div>
                                                                    <br>
                                                                    <br>
                                                                    <div>주소</div>
                                                                    <hr class="md-0">
                                                                    <div class="form-floating mb-3">
                                                                        <input type="text" name="address"
                                                                            class="form-control"
                                                                            value="${resumeList[applyList.userId-1].address}"
                                                                            readonly>
                                                                        <label for="floatingInput">주소를 입력해주세요 예시: 부산광역시
                                                                            부산진구 양정동
                                                                            상세주소</label>
                                                                    </div>
                                                                    <br>
                                                                </div>
                                                                <br>
                                                                <br>
                                                                <div>간단 소개글</div>
                                                                <hr class="md-0">
                                                                <div class="form-floating">
                                                                    <textarea class="form-control" name="content"
                                                                        style="height: 100px"
                                                                        readonly>${resumeList[applyList.userId-1].content}</textarea>
                                                                </div>
                                                                <br>
                                                                <div class="mt-5">경력</div>
                                                                <hr class="md-0">
                                                                <div class="form-floating">
                                                                    <textarea class="form-control" name="career"
                                                                        style="height: 100px"
                                                                        readonly>${resumeList[applyList.userId-1].career}</textarea>
                                                                </div>
                                                                <br>
                                                                <div class="mt-5">학력</div>
                                                                <hr class="md-0">
                                                                <div class="form-floating">
                                                                    <textarea class="form-control" name="education"
                                                                        style="height: 100px"
                                                                        readonly>${resumeList[applyList.userId-1].education}</textarea>
                                                                </div>
                                                                <br>
                                                                <div class="mt-5">스킬</div>
                                                                <hr class="md-0">
                                                                <div class="form-floating">
                                                                    <textarea class="form-control" name="skill"
                                                                        style="height: 100px"
                                                                        readonly>${resumeList[applyList.userId-1].skill}</textarea>
                                                                </div>
                                                                <br>
                                                                <div class="mt-5">수상 및 기타</div>
                                                                <hr class="md-0">
                                                                <div class="form-floating">
                                                                    <textarea class="form-control" name="award"
                                                                        style="height: 100px"
                                                                        readonly>${resumeList[applyList.userId-1].award}</textarea>
                                                                </div>
                                                                <br>
                                                                <div class="mt-5">외국어</div>
                                                                <hr class="md-0">
                                                                <div class="form-floating">
                                                                    <textarea class="form-control" name="language"
                                                                        style="height: 100px"
                                                                        readonly>${resumeList[applyList.userId-1].language}</textarea>
                                                                </div>
                                                                <br>
                                                                <div class="mt-5">링크</div>
                                                                <hr class="md-0">
                                                                <div class="form-floating">
                                                                    <textarea class="form-control" name="link"
                                                                        style="height: 100px"
                                                                        readonly>${resumeList[applyList.userId-1].link}</textarea>
                                                                </div>
                                                                <br>
                                                                <button
                                                                    onclick="confirmResult2(`${applyList.name}`, `${applyList.id}`, false, true)"
                                                                    name="finish" value="false" type="button"
                                                                    class="btn btn-secondary btn-lg ms-3"
                                                                    style="float:right;">불합격</button>
                                                                <button
                                                                    onclick="confirmResult(`${applyList.name}`, ${applyList.id}, true, true)"
                                                                    name="finish" value="true" type="button"
                                                                    class="btn btn-primary btn-lg"
                                                                    style="float:right;">서류합격</button>
                                                                <br>
                                                                <br>
                                                                <br>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br>
        <script>
            function confirmResult(name, applyId, result, notify) {
                if (confirm(name + '님의 지원서를 합격 처리하시겠습니까?')) {
                    save(applyId, result, notify);
                }
            }

            function confirmResult2(name, applyId, result, notify) {
                if (confirm(name + '님의 지원서를 불합격 처리하시겠습니까?')) {
                    save(applyId, result, notify);
                }
            }

            function save(applyId, result, notify) {
                // 1. 값 받아오기
                let data = {
                    result: result,
                    notify: notify
                };

                $.ajax({
                    type: "put",
                    url: "/apply/" + applyId,
                    data: JSON.stringify(data),
                    headers: {
                        "Content-Type": "application/json; charset=utf-8"
                    },
                    dataType: "json" // default : 응답의 MIMETYPE으로 유추함.
                }).done((res) => { //20x일 때
                    alert(res.msg);
                    location.href = "/myapplicant";
                }).fail((err) => { // 40x, 50x 일 때
                    alert(err.responseJSON.msg);
                });
            };
        </script>
        <%@ include file="../layout/footer.jsp" %>