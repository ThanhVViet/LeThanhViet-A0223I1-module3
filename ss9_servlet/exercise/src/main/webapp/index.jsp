<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Discount</title>
    <style>
        form {
            width: 50%;
            border-radius: 5px;
            background-color: #f2f2f2;
            padding: 20px;
            margin: 0 auto

        }
        input[type=text], select {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type=submit] {
            width: 100%;
            background-color: rgb(192, 227, 222);
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        h1{
            text-align: center;
        }

    </style>
</head>
<body>
<h1>Product Discount</h1>
<form action="${pageContext.request.contextPath}/display-discount" method="post">
    <input type="text" name="productName" placeholder="Enter name of product">
    <input type="text" name="listPrice" placeholder="Enter price">
    <input type="text" name="discountPercent" placeholder="Enter discount percent">
    <input type="submit" id="calculator" value="Calculate Discount">
</form>
</body>
</html>