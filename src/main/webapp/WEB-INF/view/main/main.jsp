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
/* card 조절 */

.jm_card {
  height: 400px;
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
            <div class="container-fluid" style="max-width: 1300px;">
                <c:if test="${principal.id != null}">
                    <div class="d-flex justify-content mt-3">
                        <div class="">
                            <button type="button" class="btn btn-secondary" data-bs-toggle="collapse"
                                data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                <h2>매칭 서비스!</h2>
                                기업에서 당신의 기술을 원하고 있습니다.
                            </button>
                        </div>
                    </div>
                    <div class="collapse mt-5" id="collapseExample">
                         매칭 서비스에 대한 내용 
                    </div>
                    </p>
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
                                                <h5 class="jm_company_name">${user.title}</h5>
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
                        </div><br><br>
                    </div>
                </div>
                <br><br>
                <h2>채용광고</h2>
                <div class="d-inline-flex justify-content-between flex-wrap">
                    <div class="g-col-3 my-3" style="width: 18rem;">
                        <a href="/recruitment/detail/1" style="color: inherit; text-decoration: none;">
                            <div class="card jm_card">
                                <img src="/images/AinB_logo.png" class="card-img-top jm_card_img_top">
                            <div class="jm_card_body"><br>
                                <div class="jm_company_title my-text-ellipsis">
                                    <h4>Java 개발자</h4>
                                </div>
                                <div class="jm_company_name my-text-ellipsis">
                                    <h5>AinB</h5>
                                </div>
                            </div>
                            </div>
                        </a>
                    </div>
                    <div class="g-col-3 my-3" style="width: 18rem;">
                        <a href="/recruitment/detail/2" style="color: inherit; text-decoration: none;">
                            <div class="card jm_card">
                                <img src="/images/birdkorea_logo.png" class="card-img-top jm_card_img_top">
                            <div class="jm_card_body"><br>
                                <div class="jm_company_title my-text-ellipsis">
                                    <h4>프론트엔드 개발자</h4>
                                </div>
                                <div class="jm_company_name my-text-ellipsis">
                                    <h5>birdkorea</h5>
                                </div>
                            </div>
                            </div>
                        </a>
                    </div>
                    <div class="g-col-3 my-3" style="width: 18rem;">
                        <a href="/recruitment/detail/3" style="color: inherit; text-decoration: none;">
                            <div class="card jm_card">
                                <img src="/images/gint_logo.png" class="card-img-top jm_card_img_top">
                            <div class="jm_card_body"><br>
                                <div class="jm_company_title my-text-ellipsis">
                                    <h4>IOS 개발자</h4>
                                </div>
                                <div class="jm_company_name my-text-ellipsis">
                                    <h5>Gint</h5>
                                </div>
                            </div>
                            </div>
                        </a>
                    </div>
                    <div class="g-col-3 my-3" style="width: 18rem;">
                        <a href="/recruitment/detail/4" style="color: inherit; text-decoration: none;">
                            <div class="card jm_card">
                                <img src="/images/notiplus_logo.png" class="card-img-top jm_card_img_top">
                            <div class="jm_card_body"><br>
                                <div class="jm_company_title my-text-ellipsis">
                                    <h4>Flutter 개발자</h4>
                                </div>
                                <div class="jm_company_name my-text-ellipsis">
                                    <h5>notiplus</h5>
                                </div>
                            </div>
                            </div>
                        </a>
                    </div>
                    <div class="g-col-3 my-3" style="width: 18rem;">
                        <a href="/recruitment/detail/5" style="color: inherit; text-decoration: none;">
                            <div class="card jm_card">
                                <img src="/images/poca_logo.png" class="card-img-top jm_card_img_top">
                            <div class="jm_card_body"><br>
                                <div class="jm_company_title my-text-ellipsis">
                                    <h4>풀스택 개발자</h4>
                                </div>
                                <div class="jm_company_name my-text-ellipsis">
                                    <h5>Poca</h5>
                                </div>
                            </div>
                            </div>
                        </a>
                    </div>
                    <div class="g-col-3 my-3" style="width: 18rem;">
                        <a href="/recruitment/detail/6" style="color: inherit; text-decoration: none;">
                            <div class="card jm_card">
                                <img src="/images/secondsyndrome_logo.png" class="card-img-top jm_card_img_top">
                            <div class="jm_card_body"><br>
                                <div class="jm_company_title my-text-ellipsis">
                                    <h4>스프링 개발자</h4>
                                </div>
                                <div class="jm_company_name my-text-ellipsis">
                                    <h5>Secondsyndrome</h5>
                                </div>
                            </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            </div>
            </div>
            <%@ include file="../layout/footer.jsp" %>