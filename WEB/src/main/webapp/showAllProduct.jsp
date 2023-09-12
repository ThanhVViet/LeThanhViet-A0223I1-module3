
<%@ page import="java.text.NumberFormat" %>
<%@ page import="com.example.web.service.ProductServiceImp" %>
<%@ page import="com.example.web.service.CategoryServiceImp" %>
<%@ page import="com.example.web.model.Product" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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

<%
    ProductServiceImp productServiceImp = new ProductServiceImp();
    NumberFormat format = NumberFormat.getNumberInstance();
    CategoryServiceImp categoryServiceImp = new CategoryServiceImp();
%>
<%--HEADER--%>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="header-infor.jsp"></jsp:include>

<%--SLIDE BAR--%>
<jsp:include page="slide-bar.jsp"></jsp:include>

<%--BODY--%>

<div class="container">
    <div class="categoryName" style="margin-bottom: 20px">
        <h3><%=categoryServiceImp.getCategory(request.getParameter("categoryId")).getCategoryName().toUpperCase()%></h3>
    </div>
    <div class="cf-left" style="margin-bottom: 20px">
        <form method="post" action="${pageContext.request.contextPath}/sort?categoryId=<%=categoryServiceImp.getCategory(request.getParameter("categoryId")).getCategoryId()%>">
            <table>
                <tr>
                    <td><select name="sortByPrice" class="sort">
                        <option value="">Sort by</option>
                        <option value="asc">Price (Lowest first)</option>
                        <option value="desc">Price (Highest first)</option>
                    </select>
                    </td>
                    <td><input type="submit" value="Sort"></td>
                </tr>
            </table>
        </form>
    </div>
    <div class="productListShow" style="margin: 30px">

        <div style="padding-top: 40px; padding-bottom: 60px">
            <%
                for (Product product: productServiceImp.getListProduct(request.getParameter("categoryId"))){
            %>
            <div class="categories-block" style="box-shadow: 5px 5px rgba(43,134,126,0.5);border-radius: 20px; border: 1px rgba(43,134,126,0.5) solid; padding: 40px; height: 580px;">
            <table style="margin-bottom: 60px">
                <tr>
                    <td rowspan="4" style="height: 350px; width: 580px;"><img src="<%=product.getImage()%>"  height="500" width="500">
                    </td>
                    <td><h4><%=product.getProductName()%></h4></td>
                </tr>
                <tr>
                    <td style="vertical-align: top; color: red">Giá bán : <%=format.format(product.getProductPrice())%>₫</td>
                </tr>
                <tr>
                    <td style="line-height:25px; vertical-align: top">
                        <%=product.getDescription()%>
                    </td>
                </tr>
                <tr>
                    <td><a href="productDetails.jsp?productId=<%=product.getProductId()%>" class="btn btn-primary">Chi Tiết</a></td>
                </tr>
            </table>
            </div>
            <br>
            <%
                }
            %>
        </div>
    </div>

</div>

<%--FOOTER--%>
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
