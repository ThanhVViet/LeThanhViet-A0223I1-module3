<%--
  Created by IntelliJ IDEA.
  User: HoangLinh
  Date: 5/17/2020
  Time: 9:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>ATAG.VN</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="header-infor.jsp"></jsp:include>
<jsp:include page="slide-bar.jsp"></jsp:include>

<div class="container" style="margin-bottom: 100px; margin-top: 100px">
    <h3>One More Step for Becoming A Part of ATAG.VN</h3><br>
    <h5>Fill up below form <i>[(*) can not be leave empty)]</i></h5><br>
    <form action="/login?action=signup" method="post">
       <div class="table table-hover">
           <table>
               <tr>
                   <td>User Name*</td>
                   <td><input type="text" name="registerUserName" value="example"></td>
                   <td><h6><i style="color: red" name="validateUserName">${validateUserName} </i></h6></td>
               </tr>
               <tr>
                   <td>Password*</td>
                   <td><input type="password" name="registerPassword" value="example"></td>
                   <td><h6><i style="color: red" name="validatePassword">${validatePassword}</i></h6></td>
               </tr>
               <tr>
                   <td>Re-type Password*</td>
                   <td><input type="password" name="registerRetypePassword" value="example"></td>
                   <td><h6><i style="color: red" name="validateRetypePassword">${validateReTypePassword} </i></h6></td>
               </tr>
               <tr>
                   <td>Your Name*</td>
                   <td><input type="text" name="registerName" value="example"></td>
                   <td><h6><i style="color: red" name ="validateName">${validateFullName} </i></h6></td>
               </tr>
               <tr>
                   <td>Your Gender*</td>
                   <td>
                       <input checked type="radio" id="male" name="gender" value="male">
                       <label for="male">Male</label><br>
                       <input type="radio" id="female" name="gender" value="female">
                       <label for="female">Female</label><br>
                   <td><h6><i></i></h6></td>
               </tr>
               <tr>
                   <td>Your Address*</td>
                   <td><input type="text" name="registerAddress" value="example"></td>
                   <td><h6><i style="color: red">${validateAddress}</i></h6></td>
               </tr>
               <tr>
                   <td>Your Phone Number*</td>
                   <td><input type="text" name="registerPhoneNumber" value="example"></td>
                   <td><h6><i style="color: red">${validatePhoneNumber}</i></h6></td>
               </tr>
               <tr>
                   <td><a href=""><input type="button" value="Cancel"></a></td>
                   <td><input type="submit" value="Submit"></td>
                   <td></td>
               </tr>
           </table>
           ${signUpOK}
       </div>
    </form>
</div>



<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
