
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
</head>
<body>
<%--HEADER--%>
<header class="header-section" >
    <div class="container-fluid" >
        <div class="inner-header">
            <div class="logo">
                <h2 style="margin-bottom: 20px">Order <small class="text-muted">Management</small></h2>
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
    <div class="accountManagement">
        <h3>Update Order</h3>
        <h6><a class="btn btn-outline-danger" href="/orderServlet">Back to Listing</a></h6>
        <form method="post">
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
                    <th scope="col" colspan="2">Functions</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th style="width: 100px;"><input style="width: 100px;" type="text" name="orderID" value="${requestScope["order"].getOrderID()}"></th>
                    <th style="width: 90px;"><input style="width: 90px;" type="text" name="accountID" value="${requestScope["order"].getAccountID()}"></th>
                    <th style="width: 100px;"><input style="width: 100px;" type="text" name="orderDate" value="${requestScope["order"].getOrderDate()}"></th>
                    <th><input type="text" name="receiver" value="${requestScope["order"].getReceiver()}"></th>
                    <th><input type="text" name="address" value="${requestScope["order"].getAddress()}"></th>
                    <th><input type="text" name="email" value="${requestScope["order"].getEmail()}"></th>
                    <th style="width: 130px;"><input style="width: 130px;" type="text" name="phoneNumber" value="${requestScope["order"].getPhoneNumber()}"></th>
                    <th style="width: 50px;"><input style="width: 50px;" type="text" name="status" value="${requestScope["order"].getStatus()}"></th>
                    <td><input class="btn btn-outline-success" type="submit" value="Update"></td>
                </tr>
                </tbody>
            </table>
        </form>
    </div>

</div>
</body>
</html>

