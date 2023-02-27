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
            <div class="container">
                <div class="d-inline-flex justify-content-between float-left flex-wrap">
                    <div class="g-col-3 my-3" style="width: 18rem;">
                        <a href="/recruitment/detail/${post.id}"
                            style="color: inherit; text-decoration: none;">
                        <div class="card jm_card">
                            <img src="/images/main01.jpg" class="card-img-top jm_card_img_top">
                        </div>
                            <div class="jm_card_body"><br>
                                <div class="jm_company_title"><h4>Java 개발자</h4></div>
                                <div class="jm_company_name"><h5>쿠팡</h5></div>
                                <div class="jm_company_name"><h6>서울, 부산</h6></div>
                                <div class="jm_company_name"><h6>채용보상금 1,000,000원</h6></div>
                            </div>
                        </a>
                    </div>
                    <div class="g-col-3 my-3" style="width: 18rem;">
                        <a href="/recruitment/detail/${post.id}"
                            style="color: inherit; text-decoration: none;">
                        <div class="card jm_card">
                            <img src="/images/main02.jpg" class="card-img-top jm_card_img_top">
                        </div>
                            <div class="jm_card_body"><br>
                                <div class="jm_company_title"><h4>Search 개발자</h4></div>
                                <div class="jm_company_name"><h5>Search</h5></div>
                                <div class="jm_company_name"><h6>서울, 부산</h6></div>
                                <div class="jm_company_name"><h6>채용보상금 1,000,000원</h6></div>
                            </div>
                        </a>
                    </div>
                    <div class="g-col-3 my-3" style="width: 18rem;">
                        <a href="/recruitment/detail/${post.id}"
                            style="color: inherit; text-decoration: none;">
                        <div class="card jm_card">
                            <img src="/images/resume_03.png" class="card-img-top jm_card_img_top">
                        </div>
                            <div class="jm_card_body"><br>
                                <div class="jm_company_title"><h4>앱 개발자</h4></div>
                                <div class="jm_company_name"><h5>원티두</h5></div>
                                <div class="jm_company_name"><h6>서울, 부산</h6></div>
                                <div class="jm_company_name"><h6>채용보상금 1,000,000원</h6></div>
                            </div>
                        </a>
                    </div>
                    <div class="g-col-3 my-3" style="width: 18rem;">
                        <a href="/recruitment/detail/${post.id}"
                            style="color: inherit; text-decoration: none;">
                        <div class="card jm_card">
                            <img src="/images/resume_04.png" class="card-img-top jm_card_img_top">
                        </div>
                            <div class="jm_card_body"><br>
                                <div class="jm_company_title"><h4>백엔드 개발자</h4></div>
                                <div class="jm_company_name"><h5>완티드</h5></div>
                                <div class="jm_company_name"><h6>서울, 부산</h6></div>
                                <div class="jm_company_name"><h6>채용보상금 1,000,000원</h6></div>
                            </div>
                        </a>
                    </div>
                    <div class="g-col-3 my-3" style="width: 18rem;">
                        <a href="/recruitment/detail/${post.id}"
                            style="color: inherit; text-decoration: none;">
                        <div class="card jm_card">
                            <img src="/images/coupang.png" class="card-img-top jm_card_img_top">
                        </div>
                            <div class="jm_card_body">
                                <div class="jm_company_title"><h4>Java 개발자</h4></div>
                                <div class="jm_company_name"><h5>쿠팡</h5></div>
                            </div>
                        </a>
                    </div>
                    <div class="g-col-3 my-3" style="width: 18rem;">
                        <a href="/recruitment/detail/${post.id}"
                            style="color: inherit; text-decoration: none;">
                        <div class="card jm_card">
                            <img src="/images/coupang.png" class="card-img-top jm_card_img_top">
                        </div>
                            <div class="jm_card_body">
                                <div class="jm_company_title"><h4>Java 개발자</h4></div>
                                <div class="jm_company_name"><h5>쿠팡</h5></div>
                            </div>
                        </a>
                    </div>
                    <div class="g-col-3 my-3" style="width: 18rem;">
                        <a href="/recruitment/detail/${post.id}"
                            style="color: inherit; text-decoration: none;">
                        <div class="card jm_card">
                            <img src="/images/coupang.png" class="card-img-top jm_card_img_top">
                        </div>
                            <div class="jm_card_body">
                                <div class="jm_company_title"><h4>Java 개발자</h4></div>
                                <div class="jm_company_name"><h5>쿠팡</h5></div>
                            </div>
                        </a>
                    </div>
                    <div class="g-col-3 my-3" style="width: 18rem;">
                        <a href="/recruitment/detail/${post.id}"
                            style="color: inherit; text-decoration: none;">
                        <div class="card jm_card">
                            <img src="/images/coupang.png" class="card-img-top jm_card_img_top">
                        </div>
                            <div class="jm_card_body">
                                <div class="jm_company_title"><h4>Java 개발자</h4></div>
                                <div class="jm_company_name"><h5>쿠팡</h5></div>
                            </div>
                        </a>
                    </div>
                    
                </div>    
            </div>
            <%@ include file="../layout/footer.jsp" %>