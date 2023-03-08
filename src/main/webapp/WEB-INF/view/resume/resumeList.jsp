<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>
        <style>
            /* 채용페이지 버튼 스타일 */
            .btn.hh-btn-custom {
                border: none;
                background-color: #ff7f00;
                color: white;
                padding: 10px 20px;
                border-radius: 25px;
                transition: background-color 0.3s ease;
            }

            .card:hover {
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
            }

            .card-title {
                font-size: 1.2rem;
                font-weight: bold;
                margin-bottom: 10px;
            }

            .card-text {
                font-size: 1rem;
                color: #4d4d4d;
                margin-bottom: 5px;
            }

            .card-footer {
                background-color: #f9f9f9;
                border-top: none;
            }

            .resumeList-btn-custom {
                border: none;
                background-color: #ff7f00;
                color: white;
                padding: 10px 20px;
                transition: background-color 0.3s ease;
                margin-top: 10px;
            }
        </style>
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
            <div class="container-fluid" style="width: 64%;">
                <div class="text-center d-flex justify-content-center flex-wrap">
                    <div class="card g-col-3 my-3 text-center mx-2" style="width: 17rem;">
                        <a href="/resumeForm"><br>
                            <img src="images/resume.png" width="150" height="150"><br><br>
                            <h4>이력서 등록</h4>
                        </a>
                    </div>
                    <c:forEach items="${resumeList}" var="resume" varStatus="status">
                        <div class="card g-col-3 my-3 mx-2" style="width: 17rem; height: 16.4rem; position: relative;">
                            <div>
                                <div class="card-body">
                                    <h5 class="card-title my-text-ellipsis">${resume.title}</h5><br>
                                    <p class="card-text my-text-ellipsis">${resume.content}</small></p>
                                    <p class="card-text"><small class="text-muted">${resume.birthdate}</small></p>
                                </div>
                            </div>
                            <div class="card-footer d-flex justify-content-between"
                                style="position: absolute; bottom: 16%; width: 100%;">
                                <div class="btn-group" role="group">
                                    <button id="btnGroupDrop1" class="btn "
                                        style="background-color: #fff; border-color: #fff; color: black;"
                                        data-bs-toggle="dropdown" aria-expanded="false">
                                        <img src="images/icons8-menu-vertical-30.png" width="30" height="30">
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
                            <button type="button" class="btn resumeList-btn-custom" data-bs-toggle="modal"
                                data-bs-target="#staticBackdrop${resume.id}"
                                style="position: absolute; bottom: 0; width: 100%;">
                                상세보기
                            </button>
                            <!-- Button trigger modal -->

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
                                                    <input type="text" name="title" id="title${resume.id}" style="border: none;"
                                                        class="form-control" value="${resume.title}" placeholder="제목">
                                                    <br>
                                                    <br>
                                                    <br>
                                                    <div>생년월일</div>
                                                    <hr class="md-0">
                                                    <div class="form-floating mb-3">
                                                        <input type="date" name="birthdate" id="birthdate${resume.id}"
                                                            value="${resume.birthdate}" min="1900-01-01" required />
                                                    </div>
                                                    <br>
                                                    <br>
                                                    <div>주소</div>
                                                    <hr class="md-0">
                                                    <div class="form-floating mb-3">
                                                        <input type="text" name="address" id="address${resume.id}"
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
                                                    <textarea class="form-control" name="content" id="content${resume.id}"
                                                        style="height: 100px">${resume.content}</textarea>
                                                </div>
                                                <br>
                                                <div class="mt-5">경력</div>
                                                <hr class="md-0">
                                                <div class="form-floating">
                                                    <textarea class="form-control" name="career" id="career${resume.id}"
                                                        style="height: 100px">${resume.career}</textarea>
                                                </div>
                                                <br>
                                                <div class="mt-5">학력</div>
                                                <hr class="md-0">
                                                <div class="form-floating">
                                                    <textarea class="form-control" name="education" id="education${resume.id}"
                                                        style="height: 100px">${resume.education}</textarea>
                                                </div>
                                                <br>
                                                <div class="mt-5">스킬</div>
                                                <hr class="md-0">
                                                <div class="form-floating">
                                                    <textarea class="form-control" name="skill" id="skill${resume.id}"
                                                        style="height: 100px">${resume.skill}</textarea>
                                                </div>
                                                <br>
                                                <div class="mt-5">수상 및 기타</div>
                                                <hr class="md-0">
                                                <div class="form-floating">
                                                    <textarea class="form-control" name="award" id="award${resume.id}"
                                                        style="height: 100px">${resume.award}</textarea>
                                                </div>
                                                <br>
                                                <div class="mt-5">외국어</div>
                                                <hr class="md-0">
                                                <div class="form-floating">
                                                    <textarea class="form-control" name="language" id="language${resume.id}"
                                                        style="height: 100px">${resume.language}</textarea>
                                                </div>
                                                <br>
                                                <div class="mt-5">링크</div>
                                                <hr class="md-0">
                                                <div class="form-floating">
                                                    <textarea class="form-control" name="link" id="link${resume.id}"
                                                        style="height: 100px">${resume.link}</textarea>
                                                </div>
                                                <br>
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
                    title: $("#title"+id).val(),
                    content: $("#content"+id).val(),
                    career: $("#career"+id).val(),
                    education: $("#education"+id).val(),
                    skill: $("#skill"+id).val(),
                    award: $("#award"+id).val(),
                    language: $("#language"+id).val(),
                    link: $("#link"+id).val(),
                    file: $("#file"+id).val(),
                    birthdate: $("#birthdate"+id).val(),
                    address: $("#address"+id).val(),
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