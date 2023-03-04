<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>
        <style>
            .btn-secondary {
                background-color: #ff7f00;
                border-color: #ff7f00;
            }

            .btn-secondary:hover {
                background-color: #ff7f00;
                border-color: #ff7f00;
            }

            .jm_card {
                height: 480px;
                border-radius: 0.5rem;
                box-shadow: 0px 5px 10px #ced4da;
                overflow: hidden;
                transition: transform 0.3s ease;
            }

            .jm_container {
                background-color: white;
                border-radius: 0.5rem;
                padding: 2rem;
                box-shadow: 0px 5px 10px #ced4da;
            }


            .jm_card:hover {
                transform: translateY(-10px);
            }

            /* 카드 제외 폰트 */
            .jm_company_name {
                font-size: 1.2rem;
                font-weight: bold;
                margin-bottom: 0.5rem;
            }

            .jm_company_title {
                font-size: 1rem;
                margin-bottom: 0.2rem;
            }

            .my-text-ellipsis {
                text-overflow: ellipsis;
                white-space: nowrap;
                overflow: hidden;
                max-width: 100%;
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
                        <img src="/images/메인배너1.png" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="/images/메인배너2.png" class="d-block w-100" alt="...">

                    </div>
                    <div class="carousel-item">
                        <img src="/images/메인배너3.png" class="d-block w-100" alt="...">

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

        <%-- 박스부 --%>
            <div class="container-fluid" style="width: 65%">
                <c:if test="${principal.id != null}">
                    <div class="d-flex justify-content">
                        <div class="">
                            <button type="button" class="btn btn-secondary" data-bs-toggle="collapse"
                                data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                <h2>매칭 서비스!</h2>
                                기업에서 당신의 기술을 원하고 있습니다.
                            </button>
                        </div>
                    </div>
                </c:if>
                <div class="collapse mt-5" id="collapseExample">
                    <div class="card card-body">
                        <div class="d-flex justify-content-between flex-wrap ">
                            <div class="row" id="emptyBox">
                                <c:forEach items="${userMatching}" var="user">
                                    <div class="col-sm-3 mb-3">
                                        <a href="/recruitment/detail/${user.userId}"
                                            style="color: inherit; text-decoration: none;">
                                            <div class="card jm_card pe-3">
                                                <img src="${user.enterpriseLogo}" class="card-img-top jm_card_img_top">
                                        </a>
                                        <div class="card-body jm_card_body">
                                            <h5 class="jm_company_name my-text-ellipsis">${user.title}</h5>
                                            <h6 class="jm_company_title my-text-ellipsis">${user.enterpriseName}</h6>
                                            <p class="jm_company_title my-text-ellipsis"><i class="bi-geo-alt"></i> 서울,
                                                부산</p>
                                            <p class="jm_company_title my-text-ellipsis"><i
                                                    class="bi-currency-dollar"></i> 채용보상금 1,000,000원</p>
                                        </div>
                                    </div>
                            </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            <br>
            </div>
            <div class="container jm_container" style="width: 65%">
                <h2>채용광고</h2>
                <div class="row" id="emptyBox">
                    <c:forEach items="${Posts}" var="post">
                        <div class="col-sm-3 mb-3">
                            <a href="/recruitment/detail/${post.id}" style="color: inherit; text-decoration: none;">
                                <div class="card jm_card">
                                    <img src="${post.enterpriseLogo}" class="card-img-top jm_card_img_top">
                            </a>
                            <div class="card-body jm_card_body "><br>
                                <div class="jm_company_name">
                                    <div class="card-body">
                                        <c:choose>
                                            <c:when test="${post.diffDays < 0}">
                                                <dt class="text-danger" style="font-size: smaller;">기간이 지났습니다</dt>
                                            </c:when>
                                            <c:otherwise>
                                                <dt style="font-size: smaller;">D-${post.diffDays}</dt>
                                            </c:otherwise>
                                        </c:choose>
                                        <div class="jm_company_name my-text-ellipsis">${post.title}</div>
                                        <div class="jm_company_title my-text-ellipsis">${post.enterpriseName}</div>
                                        <div class="jm_company_title my-text-ellipsis">
                                            <i class="bi-geo-alt"></i>서울, 부산
                                            <div class="jm_company_title my-text-ellipsis">
                                                <i class="bi-currency-dollar"></i> 채용보상금 1,000,000원</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
                </c:forEach>
            </div>
            </div>
            <br>
            <br>
            <%@ include file="../layout/footer.jsp" %>