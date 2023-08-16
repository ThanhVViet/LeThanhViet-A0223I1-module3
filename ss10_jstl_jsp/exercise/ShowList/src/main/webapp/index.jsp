<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>List Customer</title>
    <link rel="stylesheet" href="style.css">
    <style>
        img{
            width: 100px;
            height: 100px;
        }
    </style>
</head>
<body>
<h1>Customer Management</h1>
<table>
    <tr>
        <th>Name</th>
        <th>Day Of Birth</th>
        <th>Address</th>
        <th>Picture</th>
    </tr>
    <c:forEach items="${customers}" var="student">
        <tr>
            <td><c:out value="${student.name}"/></td>
            <td><c:out value="${student.dob}"/></td>
            <td><c:out value="${student.address}"/></td>
            <td><img src="${student.image}"></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>