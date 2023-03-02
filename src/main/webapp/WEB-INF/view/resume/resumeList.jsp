<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>
        <div class="container-fluid my_main_banner pt-4">
            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
                        class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                        aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                        aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="/images/이력서배너2.webp" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="/images/이력서배너3.webp" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="/images/이력서배너4.webp" class="d-block w-100" alt="...">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                    data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                    data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="d-flex justify-content-center text-center">
                    <span><b><a class="btn hh-btn-custom btn-lg m-3" href="/recruitment/list"
                                role="button">채용페이지</a></span>
                </div>
            </div>
            <br>
            <div class="container-fluid" style="width: 65%;">
                <div class="d-flex justify-content-between mt-3">
                    <H4>최근문서</H4>
                </div>
                <br>

                <div class="grid text-center d-inline-flex justify-content-between float-left flex-wrap ">
                    <div class="card g-col-3 my-3" style="width: 18rem;">
                        <a href="/resumeForm">이력서 등록</a>
                    </div>
                    <div class="card g-col-3 my-3" style="width: 18rem;">
                        <div>
                            <input type="file" name="" id="">
                            <a href="#">파일 업로드</a>
                        </div>
                    </div>
                    <c:forEach items="${resumeList}" var="resume" varStatus="status">
                        <div class="card g-col-3 my-3" style="width: 18rem;">
                            <div>
                                <div class="card-body">
                                    <h5 class="card-title my-text-ellipsis">${resume.title}</h5><br>
                                    <p class="card-text my-text-ellipsis">${resume.content}</small></p>
                                    <p class="card-text"><small class="text-muted">${resume.birthdate}</small></p>
                                </div>
                            </div>
                            <div class="card-footer d-flex justify-content-between">
                                <div class="btn-group" role="group">
                                    <button id="btnGroupDrop1" type="button" class="btn btn-primary dropdown-toggle"
                                        style="background-color: #fff; border-color: #fff; color: black;"
                                        data-bs-toggle="dropdown" aria-expanded="false">
                                    </button>
                                    <ul class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                                        <li><a class="dropdown-item" data-bs-toggle="modal"
                                                data-bs-target="#staticBackdrop${resume.id}">이력서 수정</a></li>
                                        <li><a class="dropdown-item" href="#" onclick="confirmDelete(${resume.id})">이력서
                                                삭제</a></li>
                                    </ul>
                                </div>
                                <c:if test="${resume.finish == true}">
                                    <small class="text-muted my-3 me-2">작업 완료</small>
                                </c:if>
                                <c:if test="${resume.finish == false}">
                                    <small class="text-muted my-3 me-2">작업 중</small>
                                </c:if>
                            </div>
                            <!-- Button trigger modal -->
                            <button type="button" class="btn btn-custom" data-bs-toggle="modal"
                                data-bs-target="#staticBackdrop${resume.id}">
                                상세보기
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="staticBackdrop${resume.id}" data-bs-backdrop="static"
                                data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel"
                                aria-hidden="true">
                                <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="staticBackdropLabel">
                                                ${principal.username}</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body justify-content-start">
                                            <div class="container-fluid">
                                                <div class="container-fluid pt-4 ps-0" style="height: 450px;">
                                                    <input type="text" name="title" id="title" style="border: none;"
                                                        class="form-control" value="${resume.title}" placeholder="제목">
                                                    <br>
                                                    <br>
                                                    <br>
                                                    <div>생년월일</div>
                                                    <hr class="md-0">
                                                    <div class="form-floating mb-3">
                                                        <input type="date" name="birthdate" id="birthdate"
                                                            value="${resume.birthdate}" min="1900-01-01" required />
                                                    </div>
                                                    <br>
                                                    <br>
                                                    <div>주소</div>
                                                    <hr class="md-0">
                                                    <div class="form-floating mb-3">
                                                        <input type="text" name="address" id="address"
                                                            class="form-control" id="floatingInputValue"
                                                            value="${resume.address}">
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
                                                        style="height: 100px">${resume.content}</textarea>
                                                </div>
                                                <br>
                                                <div class="mt-5">경력</div>
                                                <hr class="md-0">
                                                <div class="form-floating">
                                                    <textarea class="form-control" name="career" id="career"
                                                        style="height: 100px">${resume.career}</textarea>
                                                </div>
                                                <br>
                                                <div class="mt-5">학력</div>
                                                <hr class="md-0">
                                                <div class="form-floating">
                                                    <textarea class="form-control" name="education" id="education"
                                                        style="height: 100px">${resume.education}</textarea>
                                                </div>
                                                <br>
                                                <div class="mt-5">스킬</div>
                                                <hr class="md-0">
                                                <div class="form-floating">
                                                    <textarea class="form-control" name="skill" id="skill"
                                                        style="height: 100px">${resume.skill}</textarea>
                                                </div>
                                                <br>
                                                <div class="mt-5">수상 및 기타</div>
                                                <hr class="md-0">
                                                <div class="form-floating">
                                                    <textarea class="form-control" name="award" id="award"
                                                        style="height: 100px">${resume.award}</textarea>
                                                </div>
                                                <br>
                                                <div class="mt-5">외국어</div>
                                                <hr class="md-0">
                                                <div class="form-floating">
                                                    <textarea class="form-control" name="language" id="language"
                                                        style="height: 100px">${resume.language}</textarea>
                                                </div>
                                                <br>
                                                <div class="mt-5">링크</div>
                                                <hr class="md-0">
                                                <div class="form-floating">
                                                    <textarea class="form-control" name="link" id="link"
                                                        style="height: 100px">${resume.link}</textarea>
                                                </div>
                                                <br>
                                                <hr class="md-0">
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button onclick="updateByResume(${resume.id}, true)" type="button"
                                                class="btn btn-primary">작성완료</button>
                                            <button onclick="updateByResume(${resume.id}, false)" type="button"
                                                class="btn btn-secondary">임시저장</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        </div>
        <script>
            function confirmDelete(resumeId) {
                if (confirm('이력서를 삭제하시면 복구가 불가능합니다.\n정말로 삭제하시겠습니까?')) {
                    deleteById(resumeId);
                }
            }

            function deleteById(resumeId) {
                $.ajax({
                    type: "delete",
                    url: "/resume/" + resumeId,
                    dataType: "json"
                }).done((res) => { // 20X 일때
                    alert(res.msg);
                    location.href = "/resumeList";
                }).fail((err) => { // 40X, 50X 일때
                    alert(err.responseJSON.msg);
                });
            }
        </script>
        <script>
            function updateByResume(id, result) {
                let data = {
                    title: $("#title").val(),
                    content: $("#content").val(),
                    career: $("#career").val(),
                    education: $("#education").val(),
                    skill: $("#skill").val(),
                    award: $("#award").val(),
                    language: $("#language").val(),
                    link: $("#link").val(),
                    file: $("#file").val(),
                    birthdate: $("#birthdate").val(),
                    address: $("#address").val(),
                    finish: result
                };
                $.ajax({
                    type: "put",
                    url: "resume/" + id,
                    data: JSON.stringify(data),
                    contentType: 'application/json;charset=UTF-8',
                    dataType: "json"  // default : 응답의 mime 타입으로 유추함
                }).done((res) => {    // 20x 일때
                    alert(res.msg);
                    location.href = "/resumeList";
                }).fail((err) => {    // 40x , 50x 일때
                    alert(err.responseJSON.msg);
                });
            }
        </script>
        <%@ include file="../layout/footer.jsp" %>