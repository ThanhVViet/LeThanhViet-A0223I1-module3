<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Managenment</title>

</head>
<body> <link rel="stylesheet"
             href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
             integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
             crossorigin="anonymous">
<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>

<!-- font awesome cdn link  -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<header>
    <nav class="navbar navbar-expand-md navbar-dark"
         style="background-color: tomato">
        <div>
            <a href="#" class="navbar-brand"> User Management App </a>
        </div>

        <ul class="navbar-nav">
            <li><a href="<%=request.getContextPath()%>/user"
                   class="nav-link">Users</a></li>
        </ul>
    </nav>
</header>
<%-- day la form add va edit--%>
<br>
<div class="container col-md-5">

    <div class="card">
        <div class="card-body">
            <c:if test="${user != null}">
            <form action="/user" method="post">
                <input type="hidden" name="action" value="update">
                </c:if>
                <c:if test="${user == null}">
                <form action="/user" method="post">
                    <input type="hidden" name="action" value="insert">
                    </c:if>

                    <caption>
                        <h2>
                            <c:if test="${user != null}">
                                Edit User
                            </c:if>
                            <c:if test="${user == null}">
                                Add New User
                            </c:if>
                        </h2>
                    </caption>

                    <c:if test="${user != null}">
                        <input type="hidden" name="id"  value="<c:out value='${user.id}' />"/>
                    </c:if>

                    <fieldset class="form-group">
                        <label>User Name</label> <input type="text" id="name"
                                                        value="<c:out value='${user.name}' />" class="form-control"
                                                        name="name" required="required">
                        <small style="display: none" id="inputName" class="form-text text-danger">
                        Name must be 8-20 characters long, contain letters and numbers, and must not contain spaces, special
                        characters, or emoji.
                        </small>
                    </fieldset>

                    <fieldset class="form-group">
                        <label>User Email</label> <input type="text"
                                                         value="<c:out value='${user.email}' />" class="form-control"
                                                         name="email">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>User Country</label> <input type="text"
                                                           value="<c:out value='${user.country}' />"
                                                           class="form-control"
                                                           name="country">
                    </fieldset>

                    <button type="submit" onclick="validForm(event)" class="btn btn-success">Save</button>
                </form>
        </div>
    </div>
</div>
</body>
<script>
    function validForm(event) {
        const name = document.getElementById("name");
        const price = document.getElementById("price")
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
        if (price.value.trim().length == 0) {
            alert("lương không được bỏ trống !");
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
        let regExp1 = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (email.value.trim().length == 0 || !regExp1.test(email.value)) {
            alert("giá trị email không được bỏ trống");
            email.value = "";
            email.focus();
            inputEmail.style.display = 'block';
            return false;
        }
        if (address.value.trim().length == 0 || !regExp.test(name.address)) {
            alert("giá trị address không được bỏ trống");
            email.value = "";
            email.focus();
            inputAddress.style.display = 'block';
            return false;
        }
        alert("Dữ liệu hợp lệ!");
        return true;
    }
</script>
</html>