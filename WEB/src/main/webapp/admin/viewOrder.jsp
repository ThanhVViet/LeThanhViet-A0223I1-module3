
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Admin - Order Management</title>
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
</head>
<body>
<%--HEADER--%>
<header class="header-section">
    <div class="container-fluid">
        <div class="inner-header">
            <div class="logo">
                <h2 style="margin-bottom: 20px">ORDER <small class="text-muted">Management</small></h2>
            </div>
            <div class="user-access">
                <a style="margin: 30px" class="active" href="/loginSession">Home Page/Logout</a>
                <a href="" class="out"><i class="fa fa-user"></i>&nbspAdmin</a>
            </div>
        </div>
    </div>
</header>
<hr style="height: 10px">
<div class="mainManagement">
    <div class="productManagement" style="width: 1400px">
        <h6><a style="float:right;" class="btn btn-outline-primary" href="/orderServlet?action=add">Add more Order</a>&nbsp&nbsp<a class="btn btn-outline-danger" href="admin/admin.jsp">Back to Listing</a></h6>
        <table class="table table-hover">
            <thead>
            <tr>
                <th> OrderID</th>
                <th> AccountID</th>
                <th> OrderDate</th>
                <th> Receiver</th>
                <th> Address</th>
                <th> Email</th>
                <th> PhoneNumber</th>
                <th> Status</th>
                <th style="width: 50px;" scope="col" colspan="2">Functions</th>
            </tr>

            </thead>
            <tbody>

            <c:forEach items="${orders}" var="order">
                <tr>
                    <th style="width: 100px;"><input style="width: 100px;" type="text" name="orderId" value="${order.getOrderID()}"></th>
                    <th style="width: 85px;"><input style="width: 85px;" type="text" name="accountID" value="${order.getAccountID()}"></th>
                    <th style="width: 100px;"><input style="width: 100px;" type="text" name="orderDate" value="${order.getOrderDate()}"></th>
                    <th><input type="text" name="receiver" value="${order.getReceiver()}"></th>
                    <th><input type="text" name="address" value="${order.getAddress()}"></th>
                    <th><input type="text" name="email" value="${order.getEmail()}"></th>
                    <th style="width: 130px;"><input style="width: 130px;" type="text" name="phoneNumber" value="${order.getPhoneNumber()}"></th>
                    <th style="width: 50px;"><input style="width: 50px;" type="text" name="status" value="${order.getStatus()}"></th>
                    <td style="width: 50px;"><a class="btn btn-outline-success" href="/orderServlet?action=update&orderID=${order.getOrderID()}">Update</a></td>
                    <td style="width: 50px;"><a class="btn btn-outline-danger" href="/orderServlet?action=delete&orderID=${order.getOrderID()}">Delete</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>

