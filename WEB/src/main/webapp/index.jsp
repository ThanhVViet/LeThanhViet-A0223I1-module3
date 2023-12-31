
<%@ page import="java.text.NumberFormat" %>

<%@ page import="java.util.List" %>
<%@ page import="com.example.web.service.ProductServiceImp" %>
<%@ page import="com.example.web.service.CategoryServiceImp" %>
<%@ page import="com.example.web.model.Category" %>
<%@ page import="com.example.web.model.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ATAG.VN</title>
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
    <link rel="stylesheet" href="boostrap/css/bootstrap.css">
    <link rel="stylesheet" href="boostrap/css/mainStyle.css">
</head>
<body>

<%! public static final int PRODUCT_QUANTITY_PER_PAGE = 6;
%><%
    ProductServiceImp productServiceImp = new ProductServiceImp();
    NumberFormat numberFormat = NumberFormat.getNumberInstance();
    CategoryServiceImp categoryServiceImp = new CategoryServiceImp();
    Category category = categoryServiceImp.getCategory(request.getParameter("categoryId"));
%>
<%--HEADER--%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="header-infor.jsp"></jsp:include>

<%--SLIDE BAR--%>
<jsp:include page="slide-bar.jsp"></jsp:include>

<%--BODY--%>

<h3 class="col-xl-12 text-center" style="font-size: 50px; margin: 20px 0">Best Products of the World</h3>

<%--CATEGORY 1--%>
<div class="categories-block" >
    <br>
    <div class="row">
        <c:forEach items="${subList}" var="product">
            <div class="card col-xl-3" style="width: 18rem; padding: 25px 10px; margin-bottom: 20px;box-shadow: 5px 5px rgba(43,134,126,0.2);border-radius: 20px; border: 1px rgba(43,134,126,0.7) solid;">
                <img class="card-img-top" src="${product.getImage()}" alt="Card image cap" width="620" height="350">
                <div class="card-body">
                    <b><h5 class="card-title">${product.getProductName()}</h5></b>
                    <h6 class="price" style="padding-bottom: 15px; color: red">Giá bán
                        : <fmt:formatNumber value="${product.getProductPrice()}"></fmt:formatNumber>₫</h6>
                    <p class="description">
                            ${product.getDescription()}
                    </p>
                    <a href="productDetails.jsp?productId=${product.getProductId()}" class="btn btn-primary">Chi Tiết</a>
                </div>
            </div>
        </c:forEach>
    </div>
    <br>
</div>
<%
    List<Product> productList = productServiceImp.getListProduct();
    int listSize = productList.size();
    int loopSize;

    if (listSize % PRODUCT_QUANTITY_PER_PAGE == 0) {
        loopSize = listSize / PRODUCT_QUANTITY_PER_PAGE;
    } else {
        loopSize = (listSize / PRODUCT_QUANTITY_PER_PAGE) + 1;
    }
%>
<nav aria-label="..." style="margin-left: 150px; margin-bottom: 50px">
    <ul class="pagination">
        <% for (int i = 1; i <= loopSize; i++) {
        %>
        <li class="page-item">
            <a class="page-link" href="/pagination?page=<%=i%>"><%=i%><span class="sr-only">(current)</span></a></li>
        <%
            }
        %>
    </ul>
</nav>
<%--FOOTER--%>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
