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
                                            <a class="nav-link active" aria-current="page">프로필</a>
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
                                        <a class="nav-link active" aria-current="page" href="/myapply">지원현황</a>
                                    </h3>
                                    <h3>
                                        <a class="nav-link" href="/mymatching">추천서비스</a>
                                    </h3>
                                    <h3>
                                        <a class="nav-link" href="/mybookmark">북마크</a>
                                    </h3>
                                </div>
                            </div>
                        </div>
                    </nav>
                    <div class="card">
                        <div class="card-body text-center">
                            <table class="table table-hover">
                                <thead class="table-light">
                                    <tr>
                                        <th scope="col">기업명</th>
                                        <th scope="col">공고</th>
                                        <th scope="col">제목</th>
                                        <th scope="col">분야</th>
                                        <th scope="col">이력서</th>
                                        <th scope="col">지원일자</th>
                                        <th scope="col">삭제</th>
                                        <th scope="col">결과</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${applyLists}" var="applyList">
                                        <tr>
                                            <td>${applyList.enterpriseName}</td>
                                            <td>${applyList.recruitmentPostId}</td>
                                            <td>
                                                <a href="/recruitment/detail/${applyList.recruitmentPostId}">
                                                    ${applyList.title}
                                                </a>
                                            </td>
                                            <td>${applyList.sector}</td>
                                            <td data-bs-toggle="modal"
                                                data-bs-target="#staticBackdrop${applyList.applyResumeId}"
                                                style="cursor: pointer;">
                                                ${applyList.applyResumeId}
                                            </td>
                                            <td>${applyList.createdAtToString}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${Posts[applyList.recruitmentPostId-1].diffDays < 0}">
                                                        <button class="btn btn-warning disabled">만료
                                                        </button>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <button class="btn btn-warning"
                                                            onclick="confirmDelete(${applyList.recruitmentPostId})">삭제</button>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${applyList.result == null}">
                                                        <button class="btn btn-primary" disabled="disabled">대기</button>
                                                    </c:when>

                                                    <c:when test="${applyList.result == false}">
                                                        <button class="btn btn-danger" onclick="fail()">불합격</button>
                                                    </c:when>

                                                    <c:when test="${applyList.result == true}">
                                                        <button class="btn btn-success" onclick="success()">합격</button>
                                                    </c:when>

                                                </c:choose>
                                            </td>

                                            <!-- modal -->
                                            <div class="modal fade" id="staticBackdrop${applyList.applyResumeId}"
                                                data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
                                                aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                                <div
                                                    class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="staticBackdropLabel">
                                                                ${principal.username}님의 이력서</h5>
                                                            <button type="button" class="btn-close"
                                                                data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body justify-content-start">
                                                            <div class="container-fluid">
                                                                <div class="container-fluid pt-4 ps-0"
                                                                    style="height: 450px;">
                                                                    <input type="text" name="title"
                                                                        style="border: none;"
                                                                        value="${resumeList[applyList.applyResumeId-1].title}"
                                                                        class="form-control" placeholder="제목" readonly>
                                                                    <br>
                                                                    <br>
                                                                    <br>
                                                                    <div>생년월일</div>
                                                                    <hr class="md-0">
                                                                    <div class="form-floating mb-3">
                                                                        <input name="birthdate"
                                                                            value="${resumeList[applyList.applyResumeId-1].birthdate}"
                                                                            required / readonly>
                                                                    </div>
                                                                    <br>
                                                                    <br>
                                                                    <div>주소</div>
                                                                    <hr class="md-0">
                                                                    <div class="form-floating mb-3">
                                                                        <input type="text" name="address"
                                                                            class="form-control"
                                                                            value="${resumeList[applyList.applyResumeId-1].address}"
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
                                                                        readonly>${resumeList[applyList.applyResumeId-1].content}</textarea>
                                                                </div>
                                                                <br>
                                                                <div class="mt-5">경력</div>
                                                                <hr class="md-0">
                                                                <div class="form-floating">
                                                                    <textarea class="form-control" name="career"
                                                                        style="height: 100px"
                                                                        readonly>${resumeList[applyList.applyResumeId-1].career}</textarea>
                                                                </div>
                                                                <br>
                                                                <div class="mt-5">학력</div>
                                                                <hr class="md-0">
                                                                <div class="form-floating">
                                                                    <textarea class="form-control" name="education"
                                                                        style="height: 100px"
                                                                        readonly>${resumeList[applyList.applyResumeId-1].education}</textarea>
                                                                </div>
                                                                <br>
                                                                <div class="mt-5">스킬</div>
                                                                <hr class="md-0">
                                                                <div class="form-floating">
                                                                    <textarea class="form-control" name="skill"
                                                                        style="height: 100px"
                                                                        readonly>${resumeList[applyList.applyResumeId-1].skill}</textarea>
                                                                </div>
                                                                <br>
                                                                <div class="mt-5">수상 및 기타</div>
                                                                <hr class="md-0">
                                                                <div class="form-floating">
                                                                    <textarea class="form-control" name="award"
                                                                        style="height: 100px"
                                                                        readonly>${resumeList[applyList.applyResumeId-1].award}</textarea>
                                                                </div>
                                                                <br>
                                                                <div class="mt-5">외국어</div>
                                                                <hr class="md-0">
                                                                <div class="form-floating">
                                                                    <textarea class="form-control" name="language"
                                                                        style="height: 100px"
                                                                        readonly>${resumeList[applyList.applyResumeId-1].language}</textarea>
                                                                </div>
                                                                <br>
                                                                <div class="mt-5">링크</div>
                                                                <hr class="md-0">
                                                                <div class="form-floating">
                                                                    <textarea class="form-control" name="link"
                                                                        style="height: 100px"
                                                                        readonly>${resumeList[applyList.applyResumeId-1].link}</textarea>
                                                                </div>
                                                                <br>
                                                                <hr class="md-0">
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
            function confirmDelete(recruitmentPostId) {
                if (confirm('지원서를 삭제하시면 복구가 불가능합니다.\n정말로 삭제하시겠습니까?')) {
                    deleteById(recruitmentPostId);
                }
            }

            function deleteById(recruitmentPostId) {
                $.ajax({
                    type: "delete",
                    url: "/apply/" + recruitmentPostId,
                    dataType: "json"
                }).done((res) => { // 20X 일때
                    alert(res.msg);
                    location.href = "/myapply";
                }).fail((err) => { // 40X, 50X 일때
                    alert(err.responseJSON.msg);
                });
            }

            function success() {
                if (confirm('축하드립니다! 귀하는 서류전형에 합격하셨습니다.\n자세한 면접 일정은 이메일을 확인해주세요.')) {
                }
            }

            function fail() {
                if (confirm('귀하의 뛰어난 역량에도 불구하고,\n합격 소식을 전해드리지 못하게 되었습니다.\n다음 기회에 좀 더 좋은 인연으로 만나뵐 수 있기를 기대합니다.')) {
                }
            }
        </script>
        <%@ include file="../layout/footer.jsp" %>