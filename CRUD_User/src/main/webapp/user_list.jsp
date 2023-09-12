<%--
  Created by IntelliJ IDEA.
  User: thanhviet
  Date: 03/09/2023
  Time: 08:04
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Management</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
</head>
<body>
<header>
    <nav class="navbar navbar-expand-md navbar-dark"
         style="background-color: tomato">
        <div>
            <a href="#" class="navbar-brand"> User
                Management App </a>
        </div>

        <ul class="navbar-nav">
            <li><a href="<%=request.getContextPath()%>/list"
                   class="nav-link">Users</a></li>
        </ul>
    </nav>
</header>
<br>

<div class="row">
    <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

    <div class="container">
        <h3 class="text-center">List of Users</h3>
        <hr>
        <div class="container text-left">
            <div class="row">

                <div class="col-6">
                    <a href="<%=request.getContextPath()%>/?action=new" class="btn btn-success">Add
                        New User</a>
                </div>

                <form action="/user?action=search1" method="post" class="col-6">
                    <div class="input-group">
                        <input class="form-control border-end-0 border" type="search" name="search1" value=""
                               id="example-search-input">
                        <span class="input-group-append">
                    <button class="btn btn-outline-secondary bg-white border-start-0 border-bottom-0 border ms-n5"
                            type="submit">
                        <i class="fa fa-search"></i>
                    </button>
                            </span>
                    </div>
                </form>
            </div>
        </div>
        <br>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Country</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <!--   for (Todo todo: todos) {  -->
            <c:forEach var="user" items="${userList}">

                <tr>
                    <td><c:out value="${user.id}"/></td>
                    <td><c:out value="${user.name}"/></td>
                    <td><c:out value="${user.email}"/></td>
                    <td><c:out value="${user.country}"/></td>
                    <td>
                        <button type="button">
                            <a href="/user?action=edit&id=${user.id}">Edit</a>
                        </button>
                        &nbsp;&nbsp;&nbsp;&nbsp;
<%--                                                    <button type="button" onclick="showMess('${user.id}','${user.name}')">--%>
<%--                                                        <span id="name_delete"></span>--%>
<%--                                                            &lt;%&ndash;                           cach1     &lt;%&ndash;                            <a href="/user?action=delete&id=${user.id}">Delete</a>&ndash;%&gt;&ndash;%&gt;--%>
<%--                                                        Delete--%>
<%--                                                    </button>--%>

                        <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                data-bs-target="#exampleModal"
                                onclick="sendInfoToModal('${user.id}','${user.name}')"
                        >
                            Delete
                        </button>
                    </td>
                </tr>
            </c:forEach>
            <!-- } -->
            </tbody>

        </table>
    </div>
</div>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/user" method="get">
                <input type="hidden" name="action" value="delete">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Xóa học viên</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="id_delete" name="id">
                    Bạn có chắc chắn muốn xóa học viên có tên là
                    <span class="text-danger" id="name_delete1"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary"
                            data-bs-dismiss="modal">Hủy
                    </button>
                    <button type="submit" class="btn btn-primary">Xóa</button>
                </div>
            </form>
        </div>
    </div>
</div>


<script>
    function showMess(id, name) {
        var option = confirm("Are you sure want to delete  " + name + "?")
        if (option === true) {
            window.location.href = "/user?action=delete&id=" + id;
        }
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>

</body>
<script>
    function sendInfoToModal(id, name) {
        document.getElementById("name_delete1").innerText = name;
        document.getElementById("id_delete").value = id;
    }
</script>
</html>
