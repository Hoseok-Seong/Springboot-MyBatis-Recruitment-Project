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
                        <th scope="col"></th>
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
                                <button class="btn btn-primary" disabled="disabled">결과</button>
                            </td>
                            <!-- <button type="button" class="btn btn-custom" data-bs-toggle="modal"
                                data-bs-target="#staticBackdrop${resume.id}">
                                상세보기
                            </button> -->

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
                                                    <input type="text" name="title" id="title" style="border: none;"
                                                        value="${resumeList[applyList.resumeId-1].title}"
                                                        class="form-control" placeholder="제목" readonly>
                                                    <br>
                                                    <br>
                                                    <br>
                                                    <div>생년월일</div>
                                                    <hr class="md-0">
                                                    <div class="form-floating mb-3">
                                                        <input name="birthdate" id="birthdate"
                                                            value="${resumeList[applyList.resumeId-1].birthdate}"
                                                            required / readonly>
                                                    </div>
                                                    <br>
                                                    <br>
                                                    <div>주소</div>
                                                    <hr class="md-0">
                                                    <div class="form-floating mb-3">
                                                        <input type="text" name="address" id="address"
                                                            class="form-control" id="floatingInputValue"
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
                                                    <textarea class="form-control" name="content" id="content"
                                                        style="height: 100px"
                                                        readonly>${resumeList[applyList.resumeId-1].content}</textarea>
                                                </div>
                                                <br>
                                                <div class="mt-5">경력</div>
                                                <hr class="md-0">
                                                <div class="form-floating">
                                                    <textarea class="form-control" name="career" id="career"
                                                        style="height: 100px"
                                                        readonly>${resumeList[applyList.resumeId-1].career}</textarea>
                                                </div>
                                                <br>
                                                <div class="mt-5">학력</div>
                                                <hr class="md-0">
                                                <div class="form-floating">
                                                    <textarea class="form-control" name="education" id="education"
                                                        style="height: 100px"
                                                        readonly>${resumeList[applyList.resumeId-1].education}</textarea>
                                                </div>
                                                <br>
                                                <div class="mt-5">스킬</div>
                                                <hr class="md-0">
                                                <div class="form-floating">
                                                    <textarea class="form-control" name="skill" id="skill"
                                                        style="height: 100px"
                                                        readonly>${resumeList[applyList.resumeId-1].skill}</textarea>
                                                </div>
                                                <br>
                                                <div class="mt-5">수상 및 기타</div>
                                                <hr class="md-0">
                                                <div class="form-floating">
                                                    <textarea class="form-control" name="award" id="award"
                                                        style="height: 100px"
                                                        readonly>${resumeList[applyList.resumeId-1].award}</textarea>
                                                </div>
                                                <br>
                                                <div class="mt-5">외국어</div>
                                                <hr class="md-0">
                                                <div class="form-floating">
                                                    <textarea class="form-control" name="language" id="language"
                                                        style="height: 100px"
                                                        readonly>${resumeList[applyList.resumeId-1].language}</textarea>
                                                </div>
                                                <br>
                                                <div class="mt-5">링크</div>
                                                <hr class="md-0">
                                                <div class="form-floating">
                                                    <textarea class="form-control" name="link" id="link"
                                                        style="height: 100px"
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
                    <c:forEach items="${resumeList}" var="resume" varStatus="status">
                        <!-- Modal -->

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
        </script>
        <%@ include file="../layout/footer.jsp" %>