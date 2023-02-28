<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>
    <div class="container my-3" style="width: 65%">
    <table class="table table-striped">
        <thead>
            <tr>
            <th scope="col">기업명</th>
            <th scope="col">채용공고 번호</th>
            <th scope="col">제목</th>
            <th scope="col">분야</th>
            <th scope="col">이력서번호</th>
            <th scope="col">지원일자</th>
            <th scope="col">삭제하기</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${applyLists}" var="applyList">
                <tr>
                <td>${applyList.enterpriseName}</td>
                <td>${applyList.recruitmentPostId}</td>
                <td>${applyList.title}</td>
                <td>${applyList.sector}</td>
                <td>${applyList.resumeId}</td>
                <td>${applyList.createdAt}</td>
                <td><button onclick="confirmDelete(${applyList.recruitmentPostId})">삭제</button></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    </div>
    <script>
        function confirmDelete(recruitmentPostId) {
            if (confirm('지원서를 삭제하시면 복구가 불가능합니다. 정말로 삭제하시겠습니까?')) {
                deleteById(recruitmentPostId);
            }
        }

        function deleteById(recruitmentPostId) {
            $.ajax({
                type: "delete",
                url: "/apply/" + recruitmentPostId,
                dataType: "json"
            }).done((res) => { // 20X 일때
                alert(res.msg);
                location.href = "/applyList";
            }).fail((err) => { // 40X, 50X 일때
                alert(err.responseJSON.msg);
            });
        }
    </script>
    <%@ include file="../layout/footer.jsp" %>