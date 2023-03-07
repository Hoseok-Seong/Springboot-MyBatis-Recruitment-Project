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
                                                <dt class="badge rounded-pill text-bg-danger" style="font-size: 12px;"><b>기간이 지났습니다</b></dt>
                                            </c:when>
                                            <c:when test="${post.diffDays == 0}">
                                                    <dt class="badge rounded-pill text-bg-warning" style="font-size: 12px;"><b>D-DAY</b></dt>
                                            </c:when>                                            
                                            <c:when test="${post.diffDays > 0 && post.diffDays <= 7}">
                                                <dt class="badge rounded-pill text-bg-warning" style="font-size: 12px;"><b>${post.diffDays}일 남았습니다</b></dt>
                                            </c:when>
                                            <c:otherwise>
                                                <dt class="badge rounded-pill text-bg-success" style="font-size: 12px;"><b>${post.diffDays}일 남았습니다</b></dt>
                                            </c:otherwise>
                                        </c:choose>
                                        <div class="jm_company_name my-text-ellipsis">${post.title}</div>
                                        <div class="jm_company_title my-text-ellipsis">${post.enterpriseName}</div>
                                        <div class="jm_company_title my-text-ellipsis">
                                            <i class="bi-geo-alt"></i>${post.address}
                                        </div>
                                        <div class="jm_company_title my-text-ellipsis">
                                            <i class="bi bi-person-workspace"></i>${post.position}
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