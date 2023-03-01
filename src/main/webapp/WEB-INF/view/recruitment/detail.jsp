<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>
        <div class="container my-5 p-0" style="width: 60%;">
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
                        <div style="width: 95%;">
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
                            <%-- 개인회원 인증 됐을 시 --%>
                                <c:when test="${principal != null}">
                                    <div class="card" style="width: 22rem;">
                                        <div class="card-body">
                                            <br>
                                            <h5 class="card-title">지원하기</h5>
                                            <br>
                                            <p class="card-text">지금 지원해보세요</p>
                                            <button style="background-color: #36f;" type="button"
                                                data-bs-toggle="collapse" data-bs-target="#collapseExample"
                                                aria-expanded="false" aria-controls="collapseExample">
                                                이력서 찾아보기
                                            </button>
                                            <div class="collapse" id="collapseExample">
                                                <div class="card card-body">
                                                    <c:choose>
                                                        <%-- 유저 인증 안 됐을 시 --%>
                                                            <c:when test="${principal == null}">
                                                                로그인이 필요합니다
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:forEach items="${resumes}" var="resume">
                                                                    <div class="card"
                                                                        style="width: 14rem; background-color: #f2f4f7">
                                                                        <div class="card-body">
                                                                            <div class="row">
                                                                                <div class="col-9">
                                                                                    <p class="card-text">${resume.title}
                                                                                    </p>
                                                                                </div>
                                                                                <div class="col-3">
                                                                                    <input class="form-check-input"
                                                                                        type="radio" name="chooseResume"
                                                                                        id="chooseResume"
                                                                                        value="${resume.id}">
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <br>
                                                                </c:forEach>
                                                                <div>
                                                                    <button type="button"
                                                                        onClick="confirmApply()">지원하기</button>
                                                                </div>
                                                            </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:when>

                                <%-- 기업회원 인증됐을 시 --%>
                                    <c:when test="${principalEnt != null}">
                                        <div class="col">
                                            <div class="card" style="width: 22rem;">
                                                <div class="card-body">
                                                    <br>
                                                    <h5 class="card-title">매칭 서비스</h5>
                                                    <br>
                                                    <p class="card-text">회사가 찾는 인재를 매칭해드려요</p>
                                                    <button style="background-color: #36f;" type="button">
                                                        매칭 서비스 사용하기
                                                    </button>
                                                </div>
                                            </div>
                                            <c:choose>
                                                <%-- 자신이 쓴 공고일 경우 --%>
                                                    <c:when
                                                        test="${principalEnt.id == recruitmentPostDtos.enterpriseId}">
                                                        <div class="card mt-5" style="width: 22rem;">
                                                            <div class="card card-body">
                                                                <button class="my_blue_button"
                                                                    href="/recruitment/${recruitmentPostDtos.id}/updateForm">수정</button>
                                                                <button class="my_gray_button"
                                                                    href="/recruitment/${recruitmentPostDtos.id}/updateForm">삭제</button>
                                                            </div>
                                                        </div>
                                                    </c:when>
                                            </c:choose>
                                        </div>
                                    </c:when>

                                    <%-- 아무 인증이 안됐을 경우--%>
                                        <c:when test="${principal == null && principalEnt == null}">
                                            <div class="col">
                                                <div class="card" style="width: 22rem;">
                                                    <div class="card-body">
                                                        <br>
                                                        <h5 class="card-title">지원하기</h5>
                                                        <br>
                                                        <p class="card-text">지금 지원해보세요</p>
                                                        <button style="background-color: #36f;" type="button"
                                                            data-bs-toggle="collapse" data-bs-target="#collapseExample"
                                                            aria-expanded="false" aria-controls="collapseExample">
                                                            이력서 찾아보기
                                                        </button>
                                                        <div class="collapse" id="collapseExample">
                                                            <div class="card card-body">
                                                                <c:choose>
                                                                    <%-- 유저 인증 안 됐을 시 --%>
                                                                        <c:when test="${principal == null}">
                                                                            로그인이 필요합니다
                                                                        </c:when>
                                                                </c:choose>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="card mt-5" style="width: 22rem;">
                                                    <div class="card-body">
                                                        <br>
                                                        <h5 class="card-title">매칭 서비스</h5>
                                                        <br>
                                                        <p class="card-text">회사가 찾는 인재를 매칭해드려요</p>
                                                        <button style="background-color: #36f;" type="button">
                                                            매칭 서비스 사용하기
                                                        </button>
                                                    </div>
                                                </div>
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
                var selectedResume = document.querySelector('input[name="chooseResume"]:checked');
                var selectedResumeId = selectedResume ? selectedResume.value : null;
                if (selectedResumeId == null) {
                    alert("이력서를 선택해 주세요.")
                } else {
                    if (confirm('이력서를 선택하셨습니다.\n이력서를 제출하시면 수정이 불가능합니다.\n정말로 제출하시겠습니까? ')) {
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