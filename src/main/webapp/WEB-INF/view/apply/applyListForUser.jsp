<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>
    <div class="container my-3" style="width: 65%">
    <table class="table table-striped">
    private int enterpriseId;
        private int recruitmentPostId;
        private String sector;
        private int resumeId;
        private Timestamp createdAt;
        <thead>
            <tr>
            <th scope="col">기업</th>
            <th scope="col">First</th>
            <th scope="col">Last</th>
            <th scope="col">Handle</th>
            </tr>
        </thead>
        <tbody>
            <tr>
            <th scope="row">1</th>
            <td>Mark</td>
            <td>Otto</td>
            <td>@mdo</td>
            </tr>
            <tr>
            <th scope="row">2</th>
            <td>Jacob</td>
            <td>Thornton</td>
            <td>@fat</td>
            </tr>
            <tr>
            <th scope="row">3</th>
            <td colspan="2">Larry the Bird</td>
            <td>@twitter</td>
            </tr>
        </tbody>
    </table>
    </div>
    <%@ include file="../layout/footer.jsp" %>