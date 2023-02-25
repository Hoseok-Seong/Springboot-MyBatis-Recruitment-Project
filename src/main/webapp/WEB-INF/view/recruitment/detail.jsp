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
            <input type="hidden" name="postId" id="postId" value="${recruitmentPostDtos.id}">
            <input type="hidden" name="enterpriseId" id="enterpriseId" value="${recruitmentPostDtos.enterpriseId}">
            <input type="hidden" name="sector" id="sector" value="${recruitmentPostDtos.sector}">
            <hr />
            <div class="d-flex justify-content-center">
                <div>
                    <button type="button" class="btn btn-primary" onClick="confirmApply()">지원하기</button>
                </div>
            </div>
        </div>
        <script>
            function confirmApply() {
                if (confirm('이력서를 제출하시면 수정이 불가능합니다. 정말로 제출하시겠습니까?')) {
                    ApplyById();
                }
            } function ApplyById() {
                let data = {
                    recruitmentPostId: $("#postId").val(),
                    enterpriseId: $("#enterpriseId").val(),
                    sector: $("#sector").val(),
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
                    location.href = "recruitment/list";
                }).fail((err) => { // 40X, 50X 일때
                    alert(err.responseJSON.msg);
                });
            }
        </script>
        <%@ include file="../layout/footer.jsp" %>