<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quản lý sinh viên</title>
    <style>
        body{
            padding: 10px;
        }
        table{
            border-collapse: collapse;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
          crossorigin="anonymous">
</head>
<body>
<h1>Danh sách sinh viên</h1>
<button><a href="?action=showFormCreate">Thêm mới</a></button>
<table border="1px">
    <tr>
        <th>STT</th>
        <th>Tên</th>
        <th>Giới tính</th>
        <th>Điểm</th>
        <th>Xếp loại</th>
        <th>Sửa</th>
        <th>Xóa</th>
    </tr>
    <c:forEach items="${list}" var="student" varStatus="loop">
        <tr>
            <td><c:out value="${loop.count}"/></td>
            <td><c:out value="${student.name}"/></td>
                <%--            Gender--%>
            <c:if test="${student.gender == true}">
                <td>Nam</td>
            </c:if>
            <c:if test="${student.gender == false}">
                <td>Nữ</td>
            </c:if>

            <td><c:out value="${student.point}"/></td>
                <%--            Point--%>
            <c:choose>
                <c:when test="${student.point >= 8}">
                    <td>Giỏi</td>
                </c:when>
                <c:when test="${student.point >= 6}">
                    <td>Khá</td>
                </c:when>
                <c:otherwise>
                    <td>Trung bình</td>
                </c:otherwise>
            </c:choose>
            <td><button>Sửa</button></td>
            <td>
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"
                        onclick="sendInfoToModal('${student.id}','${student.name}')"
                >
                    Xóa
                </button>
            </td>
        </tr>
    </c:forEach>
</table>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/?action=delete" method="post">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Xóa học viên</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="id_delete" name="id_delete">
                    Bạn có chắc chắn muốn xóa học viên có tên là
                    <span class="text-danger" id="name_delete"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary"
                            data-bs-dismiss="modal">Hủy</button>
                    <button type="submit" class="btn btn-primary">Xóa</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</body>
<script>
    function sendInfoToModal(id,name) {
        document.getElementById("name_delete").innerText = name;
        document.getElementById("id_delete").value = id;
    }
</script>
</html>