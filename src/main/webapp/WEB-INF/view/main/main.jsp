<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>
        
        <div class="container-fluid my_main_banner pt-4">

            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" >
                <div class="carousel-indicators">
                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <img src="/images/temp_banner1.jpg" class="d-block w-100" alt="..." >
                  </div>
                  <div class="carousel-item">
                    <img src="/images/temp_banner2.jpg" class="d-block w-100" alt="..." >
                  </div>
                  <div class="carousel-item">
                    <img src="/images/temp_banner3.jpg" class="d-block w-100" alt="..." >
                  </div>
                </div>
                
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>

<%-- 박스부 --%>
        <div class="container">
            <div class="my-board-box">
                <div class="product-box">
                    <a href="detailPage" class="">
                        <img class="card-img-top" src="/images/coupang.png" alt="Card image">
                        <div class="card-body">
                        </div>
                    </a>
                </div>
                <div class="product-box">
                    <a href="detailPage" class="">
                        <img class="card-img-top" src="/images/coupang.png" alt="Card image">
                        <div class="card-body">
                        </div>
                    </a>
                </div>
                <div class="product-box">
                    <a href="detailPage" class="">
                        <img class="card-img-top" src="/images/coupang.png" alt="Card image">
                        <div class="card-body">
                        </div>
                    </a>
                </div>
                <div class="product-box">
                    <a href="detailPage" class="">
                        <img class="card-img-top" src="/images/coupang.png" alt="Card image">
                        <div class="card-body">
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="my-board-box">
                <div class="product-box">
                    <a href="detailPage" class="">
                        <img class="card-img-top" src="/images/coupang.png" alt="Card image">
                        <div class="card-body">
                        </div>
                    </a>
                </div>
                <div class="product-box">
                    <a href="detailPage" class="">
                        <img class="card-img-top" src="/images/coupang.png" alt="Card image">
                        <div class="card-body">
                        </div>
                    </a>
                </div>
                <div class="product-box">
                    <a href="detailPage" class="">
                        <img class="card-img-top" src="/images/coupang.png" alt="Card image">
                        <div class="card-body">
                        </div>
                    </a>
                </div>
                <div class="product-box">
                    <a href="detailPage" class="">
                        <img class="card-img-top" src="/images/coupang.png" alt="Card image">
                        <div class="card-body">
                        </div>
                    </a>
                </div>
            </div>
        </div>
</div>
<%@ include file="../layout/footer.jsp" %>