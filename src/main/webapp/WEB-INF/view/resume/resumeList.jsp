<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>
            <div class="container-fluid my-5">
                <div class="row justify-content-center">
                    <!-- col-md => col-lg 변환 : div width 증가 -->
                    <div class="col-lg-8 col-lg-6">
                        <div class="card shadow-sm">
                            <div class="card-body inline-flex">
                                <img class="card-title card-img-top my-text-ellipsis" style="height: 250px;" src="/images/temp_banner4.png" alt="Card image">
                                <a href="#" class="btn btn-primary">채용페이지</a>
                            </div>
                        </div>
                        <br>
                        <div class="d-flex justify-content-between mt-3">
                        <H4>최근문서</H4>
                        <a href="#">이력서 페이지 이동</a>
                        </div>
                        <br>
                        
                        <div class="grid text-center d-inline-flex justify-content-between float-left flex-wrap ">
                            <div class="card g-col-3 my-3" style="width: 18rem;">
                           
                                <a href="#">이력서 등록</a>
                            
                            </div>
                            <div class="card g-col-3 my-3" style="width: 18rem;">
                                <div>
                                    <input type="file" name="" id="">
                                    <a href="#">파일 업로드</a>
                                </div>
                            </div>
                            <c:forEach items="${resumeList}" var="resume">
                                <div class="card g-col-3 my-3" style="width: 18rem;">
                                    <div>
                                        <div class="card-body">
                                            <h5 class="card-title">${resume.title}</h5><br>
                                            <p class="card-text">${resume.content}</small></p>
                                            <p class="card-text"><small class="text-muted">${resume.birthdate}</small></p>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between">
                                        <c:if test="${resume.finish == true}" >
                                            <small class="text-muted">작업 완료</small>
                                        </c:if>
                                        <c:if test="${resume.finish == false}" >
                                            <small class="text-muted">작업 중</small>
                                        </c:if>
                                        <div class="btn-group" role="group">
                                            <button id="btnGroupDrop1" type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                                            </button>
                                            <ul class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                                            <li><a class="dropdown-item" href="#">이력서 삭제</a></li>
                                            <li><a class="dropdown-item" href="#">이력서 무시기</a></li>
                                            <li><a class="dropdown-item" href="#">이력서 저시기</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <%-- <a href="#" class="btn btn-primary">상세보기</a> --%>
                                    <!-- Button trigger modal -->
                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                                    상세보기
                                    </button>

                                    <!-- Modal -->
                                    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
                                        <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="staticBackdropLabel">${resume.id}</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="container">
                                            <div class="container-fluid pt-4 ps-0" style="height: 600px;">
                                                <h1><input type="text" name="title" id="title" style="border: none;" placeholder="제목"></h1>
                                                <br>
                                                <br>
                                                <h2>username</h2>
                                                <h2>email</h2>
                                                <h2>contact</h2>
                                                <br>
                                                <div>생년월일</div>
                                                <hr class="md-0">
                                                <div class="form-floating mb-3">
                                                <input type="date" name="birthdate" id="birthdate" min="1900-01-01" required/>
                                                </div>
                                                <br>
                                                <div>주소</div>
                                                <hr class="md-0">
                                                <div class="form-floating mb-3">
                                                <input type="text" name="address" id="address" class="form-control" id="floatingInputValue">
                                                <label for="floatingInput">주소를 입력해주세요 예시: 부산광역시 부산진구 양정동 상세주소</label>
                                                </div>
                                                <br>
                                            </div>
                                            <br>
                                            <br>
                                            <div>간단 소개글</div>
                                            <hr class="md-0">
                                            <div style="background-color: aliceblue">
                                                <p>&nbsp;&nbsp;• 본인의 업무 경험을 기반으로 핵심역량과 업무 스킬을 간단히 작성해주세요. </p>
                                                <p>&nbsp;&nbsp;• 3~5줄로 요약하여 작성하는 것을 추천합니다! </p>
                                            </div>
                                            <div class="form-floating">
                                                <textarea class="form-control" name="content" id="content" style="height: 100px"></textarea>
                                            </div>
                                            <br>
                                            <div class="mt-5">경력</div>
                                            <hr class="md-0">
                                            <div style="background-color: aliceblue">
                                                <p>&nbsp;&nbsp;• 본인의 업무 경력을 간단히 작성해주세요. </p>
                                                <p>&nbsp;&nbsp;• 3~5줄로 요약하여 작성하는 것을 추천합니다! </p>
                                            </div>
                                            <div class="form-floating">
                                                <textarea class="form-control" name="career" id="career" style="height: 100px"></textarea>
                                            </div>
                                            <br>
                                            <div class="mt-5">학력</div>
                                            <hr class="md-0">
                                            <div style="background-color: aliceblue">
                                                <p>&nbsp;&nbsp;• 본인의 학력을 최신순으로 간단히 작성해주세요. </p>
                                                <p>&nbsp;&nbsp;• 3~5줄로 요약하여 작성하는 것을 추천합니다! </p>
                                            </div>
                                            <div class="form-floating">
                                                <textarea class="form-control" name="education" id="education" style="height: 100px"></textarea>
                                            </div>
                                            <br>
                                            <div class="mt-5">스킬</div>
                                            <hr class="md-0">
                                            <div style="background-color: aliceblue">
                                                <p>&nbsp;&nbsp;• 본인의 업무 스킬을 간단히 작성해주세요. </p>
                                                <p>&nbsp;&nbsp;• 3~5줄로 요약하여 작성하는 것을 추천합니다! </p>
                                            </div>
                                            <div class="form-floating">
                                                <textarea class="form-control" name="skill" id="skill" style="height: 100px"></textarea>
                                            </div>
                                            <br>
                                            <div class="mt-5">수상 및 기타</div>
                                            <hr class="md-0">
                                            <div style="background-color: aliceblue">
                                                <p>&nbsp;&nbsp;• 본인의 수상 경력을 간단히 작성해주세요. </p>
                                                <p>&nbsp;&nbsp;• 3~5줄로 요약하여 작성하는 것을 추천합니다! </p>
                                            </div>
                                            <div class="form-floating">
                                                <textarea class="form-control" name="award" id="award" style="height: 100px"></textarea>
                                            </div>
                                            <br>
                                            <div class="mt-5">외국어</div>
                                            <hr class="md-0">
                                            <div style="background-color: aliceblue">
                                                <p>&nbsp;&nbsp;• 본인의 외국어 스킬을 간단히 작성해주세요. </p>
                                                <p>&nbsp;&nbsp;• 3~5줄로 요약하여 작성하는 것을 추천합니다! </p>
                                            </div>
                                            <div class="form-floating">
                                                <textarea class="form-control" name="language" id="language" style="height: 100px"></textarea>
                                            </div>
                                            <br>
                                            <div class="mt-5">링크</div>
                                            <hr class="md-0">
                                            <div style="background-color: aliceblue">
                                                <p>&nbsp;&nbsp;• 깃헙, 노션으로 작성한 포트폴리오, 구글 드라이브 파일 등 업무 성과를 보여줄 수 있는 링크가 있다면 작성해주세요.</p>
                                            </div>
                                            <div class="form-floating">
                                                <textarea class="form-control" name="link" id="link" style="height: 100px"></textarea>
                                            </div>
                                            <br>
                                            <div class="mt-5">포트폴리오 파일</div>
                                            <hr class="md-0">
                                            <div style="background-color: aliceblue">
                                                <p>&nbsp;&nbsp;• 자신이 가지고 있는 포트폴리오 파일이 있다면 첨부해주세요.</p>
                                            </div>
                                            <div class="mb-3">
                                                <label for="formFileMultiple" class="form-label">파일 첨부하기</label>
                                                <input class="form-control" type="file" name="file" id="file" multiple>
                                            </div>
                                            <br>
                                            <hr class="md-0">
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-primary">Understood</button>
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
<%@ include file="../layout/footer.jsp" %>