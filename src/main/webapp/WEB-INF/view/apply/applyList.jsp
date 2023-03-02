<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>
        <div class="container my-3" style="width: 65%">
            <table class="table table-hover">
                <thead class="table-light">
                    <tr>
                        <th scope="col">기업명</th>
                        <th scope="col">공고 번호</th>
                        <th scope="col">제목</th>
                        <th scope="col">분야</th>
                        <th scope="col">이력서번호</th>
                        <th scope="col">지원일자</th>
                        <th scope="col">결과발표</th>
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
                            <td data-bs-toggle="modal" data-bs-target="#staticBackdrop${applyList.resumeId}"
                                style="cursor: pointer;">
                                ${applyList.resumeId}
                            </td>
                            <td>${applyList.createdAtToString}</td>
                            <td>
                                <button class="btn btn-warning"
                                    onclick="confirmDelete(${applyList.recruitmentPostId})">삭제</button>
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
                            <div class="modal fade" id="staticBackdrop${applyList.resumeId}" data-bs-backdrop="static"
                                data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel"
                                aria-hidden="true">
                                <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="staticBackdropLabel">
                                                ${principal.username}님의 이력서</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body justify-content-start">
                                            <div class="container-fluid">
                                                <div class="container-fluid pt-4 ps-0" style="height: 450px;">
                                                    <input type="text" name="title" style="border: none;"
                                                        value="${resumeList[applyList.resumeId-1].title}"
                                                        class="form-control" placeholder="제목" readonly>
                                                    <br>
                                                    <br>
                                                    <br>
                                                    <div>생년월일</div>
                                                    <hr class="md-0">
                                                    <div class="form-floating mb-3">
                                                        <input name="birthdate"
                                                            value="${resumeList[applyList.resumeId-1].birthdate}"
                                                            required / readonly>
                                                    </div>
                                                    <br>
                                                    <br>
                                                    <div>주소</div>
                                                    <hr class="md-0">
                                                    <div class="form-floating mb-3">
                                                        <input type="text" name="address" class="form-control"
                                                            value="${resumeList[applyList.resumeId-1].address}"
                                                            readonly>
                                                        <label for="floatingInput">주소를 입력해주세요 예시: 부산광역시 부산진구 양정동
                                                            상세주소</label>
                                                    </div>
                                                    <br>
                                                </div>
                                                <br>
                                                <br>
                                                <div>간단 소개글</div>
                                                <hr class="md-0">
                                                <div class="form-floating">
                                                    <textarea class="form-control" name="content" style="height: 100px"
                                                        readonly>${resumeList[applyList.resumeId-1].content}</textarea>
                                                </div>
                                                <br>
                                                <div class="mt-5">경력</div>
                                                <hr class="md-0">
                                                <div class="form-floating">
                                                    <textarea class="form-control" name="career" style="height: 100px"
                                                        readonly>${resumeList[applyList.resumeId-1].career}</textarea>
                                                </div>
                                                <br>
                                                <div class="mt-5">학력</div>
                                                <hr class="md-0">
                                                <div class="form-floating">
                                                    <textarea class="form-control" name="education"
                                                        style="height: 100px"
                                                        readonly>${resumeList[applyList.resumeId-1].education}</textarea>
                                                </div>
                                                <br>
                                                <div class="mt-5">스킬</div>
                                                <hr class="md-0">
                                                <div class="form-floating">
                                                    <textarea class="form-control" name="skill" style="height: 100px"
                                                        readonly>${resumeList[applyList.resumeId-1].skill}</textarea>
                                                </div>
                                                <br>
                                                <div class="mt-5">수상 및 기타</div>
                                                <hr class="md-0">
                                                <div class="form-floating">
                                                    <textarea class="form-control" name="award" style="height: 100px"
                                                        readonly>${resumeList[applyList.resumeId-1].award}</textarea>
                                                </div>
                                                <br>
                                                <div class="mt-5">외국어</div>
                                                <hr class="md-0">
                                                <div class="form-floating">
                                                    <textarea class="form-control" name="language" style="height: 100px"
                                                        readonly>${resumeList[applyList.resumeId-1].language}</textarea>
                                                </div>
                                                <br>
                                                <div class="mt-5">링크</div>
                                                <hr class="md-0">
                                                <div class="form-floating">
                                                    <textarea class="form-control" name="link" style="height: 100px"
                                                        readonly>${resumeList[applyList.resumeId-1].link}</textarea>
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
                    location.href = "/applyList";
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