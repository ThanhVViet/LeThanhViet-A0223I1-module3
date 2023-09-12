<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
    <style>

        header {
            color: aquamarine;
        }

        th {
            text-align: center;
        }
    </style>
</head>
<body>
<header>
    <nav class="navbar navbar-expand-md navbar-dark"
         style="background-color: tomato">
        <div>
            <a href="#" class="navbar-brand"> Products
                Management App </a>
        </div>

        <ul class="navbar-nav">
            <li><a href="<%=request.getContextPath()%>/list"
                   class="nav-link">Products</a></li>
        </ul>
    </nav>
</header>
<br>

<div class="row">

    <div class="container">
        <h3 class="text-center">Danh sách sản phẩm</h3>
        <hr>
        <div class="container text-left">
            <div class="row">
                <div class="col-6 left">
                    <a href="/servlet?action=new" class="btn btn-success">Add
                        New Product</a>

                </div>
                <form action="/servlet?action=search1" method="post" class="col-6">
                    <div class="input-group">
                        <input class="form-control border-end-0 border" type="search" name="search1"
                               value="${searchName}"
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

        <table class="table table-hover table-bordered">
            <thead>

            <tr>
                <th>#</th>
                <th>Tên</th>
                <th>Giá</th>
                <th>Số lượng</th>
                <th>Color</th>
                <th>Category Name</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>

            </thead>
            <tbody>

            <c:forEach var="user" items="${requestScope.list1}">
                <tr>
                    <td><c:out value="${user.id}"/></td>
                    <td><c:out value="${user.name}"/></td>
                    <td><c:out value="${user.price}"/></td>
                    <td><c:out value="${user.quantity}"/></td>
                    <td><c:out value="${user.color}"/></td>
                    <td><c:out value="${user.categoryId.name}"/></td>
                    <td>
                        <button type="button" class="btn btn-primary">
                            <a style="color: white" href="servlet?action=edit&id=${user.id}">Edit</a>
                        </button>
                    </td>
                    <td>
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                data-bs-target="#exampleModal"
                                onclick="sendInfoToModal('${user.id}','${user.name}')"
                        >
                            Delete
                        </button>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    </td>

                </tr>
            </c:forEach>

            </tbody>

        </table>

    </div>

</div>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/servlet" method="get">
                <input type="hidden" name="action" value="delete">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Xóa sản phẩm</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="id_delete" name="id">
                    Bạn có chắc chắn muốn xóa sản phẩm có tên là
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