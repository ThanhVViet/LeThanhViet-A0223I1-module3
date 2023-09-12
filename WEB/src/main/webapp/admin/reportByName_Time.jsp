<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%--
  Created by IntelliJ IDEA.
  User: binhnguyen
  Date: 5/22/20
  Time: 11:15 AM
  To change this template use File | Settings | File Templates.
--%>
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

</head>
<body>
<header class="header-section">
    <div class="container-fluid">
        <div class="inner-header">
            <div class="logo">
                <h2 style="margin-bottom: 20px">REPORT <small class="text-muted">Management</small></h2>
            </div>
            <div class="user-access">
                <a style="margin: 30px" class="active" href="/loginSession">Home Page/Logout</a>
                <a href="" class="out"><i class="fa fa-user"></i>&nbspAdmin</a>
            </div>
        </div>
    </div>
</header>
<hr style="height: 10px">
<div class="container-fluid" style="margin-left: 30px">
<h3>Report by Name and Time</h3>
    <h6 style="margin: 20px 0"><a class="btn btn-outline-danger" href="/mainAdminNavigateServlet">Back to Listing</a></h6>
<form action="/reportByName_TimeServlet" method="post">
    <table>
        <tr>
            <td style="width: 100px;">User       : </td>
            <td><select name="name" id="selectionName">
                <c:forEach items="${users}" var="user">
                    <option value="${user.getAccountName()}">${user.getAccountName()}</option>
                </c:forEach>
            </select></td>
        </tr>
        <tr>
            <td style="width: 100px;">Start Time :</td>
            <td><label for="startTime"></label></label><input type="text" id="startTime" name="startTime" placeholder="Format: 'YYYY-MM-DD'"></td>
        </tr>
        <tr>
            <td style="width: 100px;">End Time   : </td>
            <td><label for="endTime"></label><input type="text" id="endTime" name="endTime" placeholder="Format: 'YYYY-MM-DD'"></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Get Report"></td>
        </tr>
    </table>
</form>
</div>
</body>
</html>
