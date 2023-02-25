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
                <div>
                    <button type="button" class="btn btn-primary"
                        onclick="confirmApply(${recruitmentPostDtos.id}, ${recruitmentPostDtos.enterpriseId})">지원하기</button>
                </div>
            </div>
        </div>
        <script>
            function confirmApply(postId, enterpriseId) {
                console.log(" 경고창")
                console.log(${ recruitmentPostDtos.id });
                console.log(${ recruitmentPostDtos.enterpriseId });
                // console.log(${ recruitmentPostDtos.sector });
                if (confirm('이력서를 제출하시면 수정이 불가능합니다. 정말로 제출하시겠습니까?')) {
                    ApplyById(postId,
                        enterpriseId);
                }
            } function ApplyById(postId, enterpriseId) {
                console.log(" 2번 경고창")
                let data = {
                    recruitmentPostId: postId,
                    enterpriseId: enterpriseId,
                    sector: postId
                };

                $.ajax({
                    type: "post",
                    url: "/apply/" + postId,
                    data: JSON.stringify(data),
                    headers: {
                        "Content-Type": "application/json; charset=utf-8"
                    },
                    dataType: "json" // default : 응답의 MIMETYPE으로 유추함.
                }).done((res) => { // 20X 일때
                    alert(res.msg);
                    location.href = "recruitment/detail";
                }).fail((err) => { // 40X, 50X 일때
                    alert(err.responseJSON.msg);
                });
            }
        </script>
        <%@ include file="../layout/footer.jsp" %>