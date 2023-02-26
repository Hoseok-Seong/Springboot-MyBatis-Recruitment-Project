<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>
        <!-- 게시판부분 -->

        <div style="width: 80%; margin: 0 auto;">
            <main class="pt-3">
                <div class="container-fluid px-4">
                    <div class="d-flex justify-content-between align-items-center">
                        <h1 class="mt-4">채용정보</h1>
                        <div class="input-group" style="width: 50%;">
                            <input type="text" class="form-control" id="search" placeholder="검색어를 입력하세요">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button" id="searchButton" onclick="search()">검색
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
            <div class="container jm_container mt-5">
                        <div class="row" id="emptyBox">

                <c:forEach items="${Posts}" var="post">
                <div class="col-sm-3 mb-3">
                                    <a href="#" style="color: inherit; text-decoration: none;">
                                        <div class="card jm_card h-100">
                                            <img src="${post.enterpriseLogo}" class="card-img-top jm_card_img_top">
                                            <div class="card-body jm_card_body">
                                                <div class="jm_company_name">${post.title}</div>
                                                <div class="jm_company_title">${post.enterpriseName}</div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                </c:forEach>
            </div>
            </div>

            <script>
                function search() {
                    let data = {
                        searchString: $("#search").val()
                    };
                    $.ajax({
                        type: "post",
                        url: "/recruitment/search",
                        contentType: "application/json;charset=UTF-8",
                        data: JSON.stringify(data),
                        dataType: "json"
                    })
                        .done((res) => {
                            console.log(res.data);
                            $("#emptyBox").empty();
                            for (let i = 0; i < res.data.length; i++) {
                                let el =
                                `<div class="col-sm-3 mb-3">
                                       <a href="#" style="color: inherit; text-decoration: none;">
                                             <div class="card jm_card h-100">
                                                 <img src=`+res.data[i].enterpriseLogo+` class="card-img-top jm_card_img_top">
                                                 <div class="card-body jm_card_body">
                                                     <div class="jm_company_name">`+res.data[i].title+`</div>
                                                     <div class="jm_company_title">`+res.data[i].enterpriseName+`</div>
                                                 </div>
                                             </div>
                                         </a>
                                     </div>`
                                $("#emptyBox").append(el);
                            }

                            alert(res.msg);
                        })
                        .fail((err) => {
                            alert(err.responseJSON.msg);
                        })
                }
            </script>
        </div>
        </body>