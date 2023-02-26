<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>

        <style>
            * {
                font-weight: normal;
            }
        </style>

        <div class="container my-3">
            <div class="row">
                <!-- 채용공고 시작 -->
                <div class="col-8">
                    <div>
                        ${recruitmentPostDtos.enterpriseName}
                    </div>

                    <div>
                        <h2><b>${recruitmentPostDtos.title}</b></h2>
                    </div>

                    <div class="d-flex justify-content-between pb-3">
                        <div class="border border-end-0 border-start-0 pt-3" style="width: 48%;">
                            <dl>
                                <dt>
                                    경력
                                </dt>
                                <dd>
                                    ${recruitmentPostDtos.career}
                                </dd>
                            </dl>
                            <dl>
                                <dt>
                                    학력
                                </dt>
                                <dd>
                                    ${recruitmentPostDtos.education}
                                </dd>
                            </dl>
                            <dl>
                                <dt>
                                    기업형태
                                </dt>
                                <dd>
                                    ${recruitmentPostDtos.sector}
                                </dd>
                            </dl>
                        </div>

                        <div class="border border-end-0 border-start-0 pt-3" style=" width: 48%;">
                            <dl>
                                <dt>
                                    급여
                                </dt>
                                <dd>
                                    ${recruitmentPostDtos.pay}
                                </dd>
                            </dl>
                            <dl>
                                <dt>
                                    근무지역
                                </dt>
                                <dd>
                                    ${recruitmentPostDtos.address}
                                </dd>
                            </dl>
                            <dl>
                                <dt>
                                    희망포지션
                                </dt>
                                <dd>
                                    ${recruitmentPostDtos.position}
                                </dd>
                            </dl>
                        </div>
                    </div>


                    <div>
                        <div>
                            ${recruitmentPostDtos.content}
                        </div>
                    </div>

                </div>
                <!-- 채용공고 끝 -->
                <input type="hidden" name="postId" id="postId" value="${recruitmentPostDtos.id}">
                <input type="hidden" name="enterpriseId" id="enterpriseId" value="${recruitmentPostDtos.enterpriseId}">
                <input type="hidden" name="sector" id="sector" value="${recruitmentPostDtos.sector}">
                <input type="hidden" name="resumeId" id="resumeId" value="${resume.id}">
                <!-- 지원 창 시작 -->
                <div class="col-4">
                    <div class="d-flex justify-content-center py-3">
                        <c:choose>
                            <c:when test="${principalEnt == null}">
                                <div class="card" style="width: 18rem;">
                                    <div class="card-body">
                                        <h5 class="card-title">지원하기</h5>
                                        <p class="card-text">지금 지원해보세요</p>
                                        <button class="btn btn-primary" type="button" data-bs-toggle="collapse"
                                            data-bs-target="#collapseExample" aria-expanded="false"
                                            aria-controls="collapseExample">
                                            이력서 찾아보기
                                        </button>
                                        <div class="collapse" id="collapseExample">
                                            <div class="card card-body">
                                                <c:choose>
                                                    <c:when test="${principal == null}">
                                                        로그인이 필요합니다
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:forEach items="${resumes}" var="resume">
                                                            <table class="table">
                                                                <thead>
                                                                    <tr>
                                                                        <th scope="col">번호</th>
                                                                        <th scope="col">작성자</th>
                                                                        <th scope="col">제목</th>
                                                                        <th scope="col">제출</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr>
                                                                        <td scope="row" id="resumeId">${resume.id}</th>
                                                                        <td scope="row">${resume.userId}</td>
                                                                        <td scope="row">${resume.title}</td>
                                                                        <td scope="row">
                                                                            <div class="form-check">
                                                                                <input class="form-check-input"
                                                                                    type="radio" name="chooseResume"
                                                                                    id="chooseResume"
                                                                                    value=" ${resume.id}">
                                                                                <label class="form-check-label"
                                                                                    for="chooseResume">
                                                                                    이력서 선택
                                                                                </label>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </c:forEach>
                                                        <div>
                                                            <button type="button" class="btn btn-primary"
                                                                onClick="confirmApply()">지원하기</button>
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </c:when>
                            <c:when test="${principalEnt.id == recruitmentPostDtos.enterpriseId}">
                                <div>
                                    <a href="/recruitment/${recruitmentPostDtos.id}/updateForm"
                                        class="btn btn-warning">수정</a>
                                    <button type="button" class="btn btn-danger">삭제</button>
                                </div>
                            </c:when>
                        </c:choose>
                    </div>
                </div>
                <!-- 지원 창 끝 -->
            </div>
        </div>
        <script>
            function confirmApply() {
                let selectedResumeId = 0;
                selectedResumeId = document.querySelector('input[name="chooseResume"]:checked').value;
                // console.log(selectedResumeId);
                // let selectedResumeId = selectedResume ? selectedResume.value : null;
                if (selectedResumeId == 0) {
                    alert("이력서를 선택해 주세요.")
                } else {
                    if (confirm(selectedResumeId + '번 이력서를 선택하셨습니다. \n 이력서를 제출하시면 수정이 불가능합니다. \n 정말로 제출하시겠습니까? ')) {
                        ApplyById(selectedResumeId);
                    }
                }

            } function ApplyById(selectedResumeId) {
                let data = {
                    recruitmentPostId: $("#postId").val(),
                    enterpriseId: $("#enterpriseId").val(),
                    sector: $("#sector").val(),
                    resumeId: selectedResumeId
                };

                $.ajax({
                    type: "post",
                    url: "/apply/" + $("#postId").val(),
                    data: JSON.stringify(data),
                    headers: {
                        "Content-Type": "application/json; charset=utf-8"
                    },
                    dataType: "json" // default : 응답의 MIMETYPE으로 유추함.
                }).done((res) => { // 20X 일때
                    alert(res.msg);
                    location.href = "/recruitment/list";
                }).fail((err) => { // 40X, 50X 일때
                    alert(err.responseJSON.msg);
                });
            }
        </script>
        <%@ include file="../layout/footer.jsp" %>