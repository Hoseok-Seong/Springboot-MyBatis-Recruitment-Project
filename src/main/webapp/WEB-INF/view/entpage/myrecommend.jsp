<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>
        <div class="container-fluid" style="width: 65%">
            <br>
            <div class="row pt-3">
                <div class="col-3">
                    <nav class="navbar navbar-expand-lg bg-white">
                        <div class="container-fluid">
                            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                                <div class="navbar-nav">
                                    <h3>
                                        <strong>
                                            <a class="nav-link active" aria-current="page" href="#">프로필</a>
                                        </strong>
                                    </h3>
                                </div>
                            </div>
                        </div>
                    </nav>
                    <div class="card">
                        <div class="card-body text-center">
                            <img src="/images/user.png" class="card-img-top" alt="..."
                                style="width: 100px; height: 100px;">
                            <h5 class="card-title pt-2">${principalEnt.enterpriseName}</h5>
                            <h5 class="card-title pt-2">${principalEnt.address}</h5>
                            <h5 class="card-title pt-2">${principalEnt.email}</h5>
                            <h5 class="card-title pt-2">${principalEnt.contact}</h5>
                            <h5 class="card-title pt-2">${principalEnt.size}</h5>
                            <br>
                            <h3>내가 찾는 인재 :
                                <c:out value="${fn:length(enterpriseMatching)}" />
                            </h3>
                            <br>
                            <button type="button" class="btn btn-outline-info btn-lg"
                                onclick="window.location.href = '/recruitment/list';">채용공고 보러가기
                            </button>
                        </div>
                    </div>
                </div>
                <div class="col-9 mb-2">
                    <nav class="navbar navbar-expand-lg bg-light">
                        <div class="container-fluid">
                            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                                <div class="navbar-nav">
                                    <h3>
                                        <a class="nav-link" href="/myapplicant">지원자현황</a>
                                    </h3>
                                    <h3>
                                        <a class="nav-link active" aria-current="page" href="/myrecommend">인재추천</a>
                                    </h3>
                                    <h3>
                                        <a class="nav-link" aria-current="page" href="/mybookmarkEnt">북마크</a>
                                    </h3>
                                </div>
                            </div>
                        </div>
                    </nav>
                    <div class="card">
                        <div class="card-body">
                            <table class="table table-hover">
                                <br>
                                <h3><img src="images/applicant.png" alt="">회원님이 찾는 기술스택을 보유한 지원자입니다</h3>
                                <br>
                                <thead class="table-light">
                                    <tr>
                                        <th scope="col">아이디</th>
                                        <th scope="col">이름</th>
                                        <th scope="col">연락처</th>
                                        <th scope="col">이메일</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${enterpriseMatching}" var="user">
                                        <tr>
                                            <td scope="col">${user.username}
                                            </td>
                                            <td scope="col">${user.name}
                                            </td>
                                            <td scope="col">
                                                ${user.contact}
                                            </td>
                                            <td scope="col">
                                                ${user.email}
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
        </div>
        <br>
        <%@ include file="../layout/footer.jsp" %>