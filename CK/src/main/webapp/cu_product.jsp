<%--
  Created by IntelliJ IDEA.
  Product: thanhviet
  Date: 07/09/2023
  Time: 18:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Product</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        .la {
            margin-left: 30%;
        }
    </style>
</head>


<body>

<header>
    <nav class="navbar navbar-expand-md navbar-dark"
         style="background-color: tomato">
        <div>
            <a href="#" class="navbar-brand"> Meo meo </a>
        </div>

        <ul class="navbar-nav">
            <li><a href="<%=request.getContextPath()%>/servlet"
                   class="nav-link">Products</a></li>
        </ul>
    </nav>
</header>

<div class="container col-md-5">
    <div class="card">
        <div class="card-body">
            <c:if test="${product != null}">
            <form action="${pageContext.request.contextPath}/servlet" method="post">
                <input type="hidden" name="action" value="update">
                </c:if>
                <c:if test="${product == null}">
                <form action="${pageContext.request.contextPath}/servlet" method="post">
                    <input type="hidden" name="action" value="meo">
                    </c:if>

                    <caption>
                        <h2>
                            <c:if test="${product != null}">
                                Edit Product
                            </c:if>
                            <c:if test="${product == null}">
                                Add New Product
                            </c:if>
                        </h2>
                    </caption>

                    <c:if test="${product != null}">
                        <input type="hidden" name="id" value="<c:out value='${product.id}' />"/>
                    </c:if>


                    <fieldset class="form-group">
                        <label>Product Name</label> <input type="text" id="name"
                                                           value="<c:out value='${product.name}' />"
                                                           class="form-control"
                                                           name="name" required="required">
                        <small style="display: none" id="inputName" class="form-text text-danger">
                            Name must be 8-20 characters long, contain letters and numbers, and must not contain spaces,
                            special
                            characters, or emoji.
                        </small>
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Product Price</label> <input type="text" id="price" required="required"
                                                            value="<c:out value='${product.price}' />"
                                                            class="form-control"
                                                            name="price">
                        <small style="display: none" id="inputPrice" class="form-text text-danger">
                            Please Enter Again !!!
                        </small>
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Product Quantity</label> <input type="text" required="required"
                                                               value="<c:out value='${product.quantity}' />"
                                                               class="form-control"
                                                               name="quantity">
                        <small style="display: none" id="inputQuantity" class="form-text text-danger">
                            Please Enter Again !!!
                        </small>

                    </fieldset>
                    <fieldset class="form-group">
                        <label>Product Color</label> <input type="text"
                                                            value="<c:out value='${product.color}' />"
                                                            class="form-control"
                                                            name="color">

                    </fieldset>

                    <fieldset class="form-group">
                        <label>Product Description</label> <input type="text" required="required"
                                                                  value="<c:out value='${product.moTa}' />"
                                                                  class="form-control"
                                                                  name="moTa">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Category</label> <br/>
                        <c:set var="cid" value="${product.id_category}"/>
                        <select style="height:50px; width: 60%" class="form-select form-control"
                                required="required" name="cid">
                            <option>
                                Choose a category
                            </option>

                            <c:forEach items="${requestScope.list}" var="c">
                                <option
                                        <c:if test="${c.id==cid}">selected</c:if>
                                        value="${c.id}">
                                        ${c.name}
                                </option>
                            </c:forEach>


                        </select>
                    </fieldset>
                    <div class="la">
                        <button type="submit" style="width: 20%" onclick="validForm(event)"
                                class="btn btn-success text-center">Save
                        </button>
                        <button type="button" style="width: 20%; text-decoration: none; color: red"
                                class="btn btn-success">
                            <a href="/servlet">Cancel</a>
                        </button>
                    </div>
                </form>
        </div>
    </div>
</div>
</body>
<script>
    function validForm(event) {
        const name = document.getElementById("name");
        const price = document.getElementById("price");
        const quantity = document.getElementById("quantity");
        let regExp = /^[a-zA-Z]+$/;
        let a = /^[0-9]{9}$/;
        if (name.value.trim().length == 0 || !regExp.test(name.value)) {
            alert("Tên không được bỏ trống và phải là chữ!");
            name.value = "";
            name.focus();
            inputName.style.display = 'block';
            event.preventDefault();
            return false;
        }
        let num = price;
        if (price.value.trim().length == 0 || num > 0) {
            alert(" Lala !");
            price.value = "";
            price.focus();
            inputPrice.style.display = 'block';
            event.preventDefault();
            return false;
        }
        let regPhone = /^090\d{7}$/
        if (phone.value.trim().length == 0 || !regPhone.test(phone.value)) {
            alert("số điện thoại phải bắt đầu bằng 090 hoặc  không được bỏ trống !");
            phone.value = "";
            phone.focus();
            inputPhone.style.display = 'block';
            event.preventDefault();
            return false;
        }


        alert("Dữ liệu hợp lệ!");
        return true;
    }
</script>
</html>
