<%@ page import="com.example.web.model.Category" %>
<%@ page import="com.example.web.service.CategoryServiceImp" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>ATAG.VN</title>
    <link rel="stylesheet" href="../boostrap/css/mainStyle.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <link rel="stylesheet" href="../boostrap/css/bootstrap.css">
    <link rel="stylesheet" href="../boostrap/css/mainStyle.css">
</head>
<body>
<%--HEADER--%>
<header class="header-section">
    <div class="container-fluid">
        <div class="inner-header">
            <div class="logo">
                <h2 style="margin-bottom: 20px">PRODUCT <small class="text-muted">Management</small></h2>
            </div>
            <div class="user-access">
                <a style="margin: 30px" class="active" href="/loginSession">Home Page/Logout</a>
                <a href="" class="out"><i class="fa fa-user"></i>&nbspAdmin</a>
            </div>
        </div>
    </div>
</header>
<hr style="height: 10px">
<body>
<div class="container-fluid" style="margin-left: 30px">
<%
    CategoryServiceImp categoryDAO = new CategoryServiceImp();
%>
<h2>Create new Product</h2>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a class="btn btn-outline-danger" href="/productServlet">Back to Product list</a>
</p>
<form style = "margin-top: 40px" enctype='multipart/form-data' method="post" action="${pageContext.request.contextPath}/addProduct">
    <fieldset>
        <legend>Product information</legend>
        <table>
            <tr>
                <td>ID: </td>
                <td><input type="text" name="productId" id="product_id"></td>
            </tr>
            <tr>
                <td>Category: </td>
                <td><select name="categoryId">
                    <%
                        for (Category category : categoryDAO.getListCategory()) {
                    %>
                    <option value="<%=category.getCategoryId()%>"><%=category.getCategoryName()%></option>
                    <% } %>
                </select>
                </td>
            </tr>
            <tr>
                <td>Name: </td>
                <td><input type="text" name="productName" id="product_name"></td>
            </tr>
            <tr>
                <td>Price: </td>
                <td><input type="number" name="productPrice" id="product_price"></td>
            </tr>
            <tr>
                <td>Quantity: </td>
                <td><input type="number" name="quantityInStock" id="product_quantity"></td>
            </tr>
            <tr>
                <td>Image: </td>
                <td><input type="text" name="productImage" id="product_image"></td>
            </tr>
            <tr>
                <td>Status: </td>
                <td><input type="number" name="status" id="product_status"></td>
            </tr>
            <tr>
                <td>Description: </td>
                <td><input type="text" name="description" id="product_description"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Create Product"></td>
            </tr>
        </table>
    </fieldset>
</form>
</div>
</body>
</html>