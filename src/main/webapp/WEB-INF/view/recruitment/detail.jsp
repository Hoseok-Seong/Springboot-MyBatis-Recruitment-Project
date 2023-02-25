<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>

        <style>
            * {
                font-weight: normal;
            }
        </style>

        <div class="container my-3">

            <div>
                ${recruitmentPostDtos.enterpriseName}
            </div>

            <div class="">
                <h2><b>${recruitmentPostDtos.title}</h2>
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
            <hr />
            <div class="d-flex justify-content-center">

                <c:choose>
                    <c:when test="${principalEnt == null}">
                        <div>
                            <button type="button" class="btn btn-primary">지원하기</button>
                        </div>
                    </c:when>
                    <c:when test="${principalEnt.id == recruitmentPostDtos.enterpriseId}">
                        <div>
                            <a href="/recruitment/${recruitmentPostDtos.enterpriseId}/updateForm" class="btn btn-warning">수정</a>
                            <button type="button" class="btn btn-danger">삭제</button>
                        </div>
                    </c:when>
                </c:choose>
            </div>
        </div>

            <%@ include file="../layout/footer.jsp" %>