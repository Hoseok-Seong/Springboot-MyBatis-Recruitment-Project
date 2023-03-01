<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>
        <div class="container my-3" style="width: 65%">
            <h5>
                ${applyLists[0].enterpriseName}님이 작성한 채용공고의 지원자 목록입니다
            </h5>
            <br>
            <table class="table table-hover">
                <thead class="table-light">
                    <tr>
                        <th scope="col">공고번호</th>
                        <th scope="col">제목</th>
                        <th scope="col">아이디</th>
                        <th scope="col">이름</th>
                        <th scope="col">이력서</th>
                        <th scope="col">지원일자</th>
                        <th scope="col">결과</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${applyLists}" var="applyList">
                        <tr>
                            <td>${applyList.recruitmentPostId}</td>
                            <td>
                                <a href="/recruitment/detail/${applyList.recruitmentPostId}">
                                    ${applyList.title}
                                </a>
                            </td>
                            <td>${applyList.username}</td>
                            <td>${applyList.name}</td>
                            <td data-bs-toggle="modal" data-bs-target="#staticBackdrop" style="cursor: pointer;">
                                이력서 보기
                            </td>
                            <td>${applyList.createdAtToString}</td>
                            <td>
                                <button class="btn btn-warning" onclick="confirmDelete()">결과</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <script>
            function confirmDelete(recruitmentPostId) {
                if (confirm('지원서를 삭제하시면 복구가 불가능합니다.\n정말로 삭제하시겠습니까?')) {
                    deleteById(recruitmentPostId);
                }
            }
        </script>
        <%@ include file="../layout/footer.jsp" %>