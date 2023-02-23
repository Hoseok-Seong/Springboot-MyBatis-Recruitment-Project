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
                                    <div class="card-footer">
                                        <c:if test="${resume.finish == true}" >
                                            <small class="text-muted">작업 완료</small>
                                        </c:if>
                                        <c:if test="${resume.finish == false}" >
                                            <small class="text-muted">작업 중</small>
                                        </c:if>
                                    </div>
                                    <a href="#" class="btn btn-primary">상세보기</a>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
<%@ include file="../layout/footer.jsp" %>