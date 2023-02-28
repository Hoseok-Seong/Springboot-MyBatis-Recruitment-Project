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
                        <img src="/images/temp_banner1.jpg" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="/images/temp_banner2.jpg" class="d-block w-100" alt="...">

                    </div>
                    <div class="carousel-item">
                        <img src="/images/temp_banner3.jpg" class="d-block w-100" alt="...">

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
                <div class="d-inline-flex justify-content-between flex-wrap">
                    <div class="g-col-3 my-3" style="width: 18rem;">
                        <a href="/recruitment/detail/1" style="color: inherit; text-decoration: none;">
                            <div class="card jm_card">
                                <img src="/images/AinB_logo.png" class="card-img-top jm_card_img_top">
                            </div>
                            <div class="jm_card_body"><br>
                                <div class="jm_company_title">
                                    <h4>Java 개발자</h4>
                                </div>
                                <div class="jm_company_name">
                                    <h5>AinB</h5>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="g-col-3 my-3" style="width: 18rem;">
                        <a href="/recruitment/detail/2" style="color: inherit; text-decoration: none;">
                            <div class="card jm_card">
                                <img src="/images/birdkorea_logo.png" class="card-img-top jm_card_img_top">
                            </div>
                            <div class="jm_card_body"><br>
                                <div class="jm_company_title">
                                    <h4>프론트엔드 개발자</h4>
                                </div>
                                <div class="jm_company_name">
                                    <h5>birdkorea</h5>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="g-col-3 my-3" style="width: 18rem;">
                        <a href="/recruitment/detail/3" style="color: inherit; text-decoration: none;">
                            <div class="card jm_card">
                                <img src="/images/gint_logo.png" class="card-img-top jm_card_img_top">
                            </div>
                            <div class="jm_card_body"><br>
                                <div class="jm_company_title">
                                    <h4>IOS 개발자</h4>
                                </div>
                                <div class="jm_company_name">
                                    <h5>Gint</h5>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="g-col-3 my-3" style="width: 18rem;">
                        <a href="/recruitment/detail/4" style="color: inherit; text-decoration: none;">
                            <div class="card jm_card">
                                <img src="/images/notiplus_logo.png" class="card-img-top jm_card_img_top">
                            </div>
                            <div class="jm_card_body"><br>
                                <div class="jm_company_title">
                                    <h4>Flutter 개발자</h4>
                                </div>
                                <div class="jm_company_name">
                                    <h5>notiplus</h5>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="g-col-3 my-3" style="width: 18rem;">
                        <a href="/recruitment/detail/5" style="color: inherit; text-decoration: none;">
                            <div class="card jm_card">
                                <img src="/images/poca_logo.png" class="card-img-top jm_card_img_top">
                            </div>
                            <div class="jm_card_body"><br>
                                <div class="jm_company_title">
                                    <h4>풀스택 개발자</h4>
                                </div>
                                <div class="jm_company_name">
                                    <h5>Poca</h5>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="g-col-3 my-3" style="width: 18rem;">
                        <a href="/recruitment/detail/6" style="color: inherit; text-decoration: none;">
                            <div class="card jm_card">
                                <img src="/images/secondsyndrome_logo.png" class="card-img-top jm_card_img_top">
                            </div>
                            <div class="jm_card_body"><br>
                                <div class="jm_company_title">
                                    <h4>스프링 개발자</h4>
                                </div>
                                <div class="jm_company_name">
                                    <h5>Secondsyndrome</h5>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            </div>
            <%@ include file="../layout/footer.jsp" %>