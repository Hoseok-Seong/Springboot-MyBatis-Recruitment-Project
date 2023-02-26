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
            <div id="emptyBox">
                <c:forEach items="${Posts}" var="post">
                    <div>
                        ${post.title}
                        ${post.enterpriseName}
                        <img src="/images/coupang.png">
                    </div>
                </c:forEach>
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
                            console.log(res.data[0].enterpriseLogo);
                            console.log(res.data[0].enterpriseName);
                            console.log(res.data[0].title);
                            $("#emptyBox").empty();
                            for (let i = 0; i < res.data.length; i++) {
                                let el =
                                    `<div>` +
                                    res.data[i].title +
                                    res.data[i].enterpriseName +
                                    `</div>`;

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