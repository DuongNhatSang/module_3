<%--
  Created by IntelliJ IDEA.
  User: sf book
  Date: 10/12/21
  Time: 11:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .menu li{
            margin-right: 110px;
        }
    </style>
</head>
<body style="background-image: url('https://resortdanang.info/wp-content/uploads/2019/01/resort-furama-da-nang-1024x576.jpg');background-size: cover">
<div class="header">
    <div class="container-fluid">
        <div class="row" >
            <div class="col-3">
                <img style="width: 30%;padding: 15px" src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQlTaPPCcmHWMt6vGZ5QyfBTCSLcbmOys20dg&usqp=CAU">
            </div>
            <div class="col-3"></div>
            <div class="col-3"></div>
            <div class="col-3" style="display: flex;align-items: center">
                <h3 style="color: white">Dương Nhật Sang</h3>
            </div>
        </div>
    </div>
</div>
<!--end header-->

<div class="menu" style="background-color: #2d3338;height: 50px">
    <div class="container">
        <div class="row">
            <div class="col-12" >
                <ul style="list-style: none;display:flex ;padding-top: 12px">
                    <li><a href="/home">Home</a></li>
                    <li><a href="/employee">Employee</a></li>
                    <li><a href="/customer">Customer</a></li>
                    <li>  <a href="">Service</a></li>
                    <li><a href="">Contract</a></li>
                    <li class="input-group" style="margin: -6px">
                        <input type="text" id="search" class="form-control" placeholder="Search by Name">
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<%--<!--end menu-->--%>
<div>
    <div class="content" style="height: 71vh">
        <div class="container-fluid">
            <div class="row" >
                <div class="col-2" style="display: flex;flex-direction: column;margin-top: 85px" >
                    <a href="#addCusModal" class="btn btn-primary" data-toggle="modal" style="margin: 3px"><i class="fa fa-plus"></i> <span>Add New Customer</span></a>
                </div>
                <div class="col-10" style="margin-top: 28px">
                    <h2 style="color: aliceblue ;text-align: center">List Customers</h2>
                    <table class="table table-striped">
                        <thead class="thead-dark" >
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Name</th>
                            <th scope="col">Date of birth</th>
                            <th scope="col">Card id</th>
                            <th scope="col">Phone</th>
                            <th scope="col">Email</th>
                            <th scope="col">Address</th>
                            <th scope="col">Customer Type</th>
                            <th scope="col">Action</th>
                        </tr>
                        </thead>
                        <tbody style="background-color: #f7f5f2">
                        <c:forEach var="cusService" items="${listCusService}">
                            <tr class="contentPage">
                                <th><c:out value="${cus.id_khach_hang}"></c:out></th>
                                <td><span><c:out value="${cus.ho_ten}"></c:out></span></td>
                                <td><span><c:out value="${cus.ngay_sinh}"></c:out></span></td>
                                <td><span><c:out value="${cus.CMND}"></c:out></span></td>
                                <td><span><c:out value="${cus.SDT}"></c:out></span></td>
                                <td><span><c:out value="${cus.email}"></c:out></span></td>
                                <td><span><c:out value="${cus.dia_chi}"></c:out></span></td>
                                <td><span><c:out value="${cus.ten_loai_khach}"></c:out></span></td>
                                <td>
                                    <a href="/KhachHangServlet?action=edit&id=${cus.id_khach_hang}" class="edit" title="Edit" ><i class="material-icons">&#xE254;</i></a>
                                    <a href="/KhachHangServlet?action=delete&id=${cus.id_khach_hang}" class="delete" title="Delete"><i class="material-icons">&#xE872;</i></a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <ul id="pagination"></ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!--end content-->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>

</body>
</html>
