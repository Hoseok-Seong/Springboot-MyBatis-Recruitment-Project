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
                        <img src="/images/이력서배너2.webp" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="/images/이력서배너3.webp" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="/images/이력서배너4.webp" class="d-block w-100" alt="...">
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
        <div class="container">
            <div class="d-flex justify-content-center text-center">
            <span><b><a class="btn hh-btn-custom btn-lg m-3" href="/resumeList" role="button">이력서 관리</a></span>
            <span><b><a class="btn hh-btn-custom btn-lg m-3" href="/resumeForm" role="button">이력서 작성</a></span>
            </div>
            <div class="grid text-center d-inline-flex justify-content-between float-left flex-wrap">
                <div class="card g-col-6 my-5 m-3" style="width: 525px; height: 400px; background-color: #f1f7fe;">
                    <div class="card-body">
                        <h3 class="card-title">이력서 하나로 모든 준비 끝</h3><br>
                        <p class="card-text">이력서 작성부터 지원까지 한 곳에서!</small></p>
                        <p class="card-text">회사별 양식에 맞출 필요 없이 하나의 이력서만 작성하세요.</small></p>
                        <img src="/images/resume_01.png" alt="">
                    </div>
                </div>
                <div class="card g-col-6 my-5 m-3" style="width: 525px; height: 400px; background-color: #f3f8ee;">
                    <div class="card-body">
                        <h3 class="card-title">기업 추천 서비스 개발!</h3><br>
                        <p class="card-text">이력서만 등록을 해주시면 </small></p>
                        <p class="card-text">채용담당자가 직접 면접을 제안합니다.</small></p>
                        <img src="/images/resume_03.png" alt="">
                    </div>
                </div>
                <div class="card g-col-6 my-5 m-3" style="width: 525px; height: 400px; background-color: #f1f1fe;">
                    <div class="card-body">
                        <h3 class="card-title">완성도를 높여주는 이력서 코칭</h3><br>
                        <p class="card-text">이력서 코칭*으로 서류 합격률 30% UP</small></p>
                        <p class="card-text"><small class="text-muted">*일부 직군에서는 사용 제한, 추후 확대 예정.</small></p>
                        <img src="/images/resume_02.png" alt="">
                    </div>
                </div>
                <div class="card g-col-6 my-5 m-3" style="width: 525px; height: 400px; background-color: #ecf8fb;">
                    <div class="card-body">
                        <h3 class="card-title">북마크 서비스 개발!</h3><br>
                        <p class="card-text">북마크가 많은 기업들을 소개 시켜드립니다</small></p>
                        <p class="card-text">가입자들이 체크한 북마크가 많은 순 대로 나열</small></p>
                        <img src="/images/resume_04.png" alt="">
                    </div>
                </div>
            </div>
        </div>
        </div>
        <%@ include file="../layout/footer.jsp" %>