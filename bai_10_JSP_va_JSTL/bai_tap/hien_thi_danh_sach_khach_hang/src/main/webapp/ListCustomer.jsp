<%--
  Created by IntelliJ IDEA.
  User: sf book
  Date: 10/07/21
  Time: 4:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>List Customer</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<div class="row">
    <div class="col-4"></div>
    <div class="col-4">
        <table class="table">
            <thead class="thead-dark">
            <tr>
                <th scope="col">Tên</th>
                <th scope="col">Ngày Sinh</th>
                <th scope="col">Địa Chỉ</th>
                <th scope="col">Ảnh</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="customer" items="${customerList}">
            <tr>
                <th scope="row">${customer.name}</th>
                <td>${customer.birthday}</td>
                <td>${customer.address}</td>
                <td>@${customer.img}</td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="col-4"></div>
</div>
</body>
</html>
