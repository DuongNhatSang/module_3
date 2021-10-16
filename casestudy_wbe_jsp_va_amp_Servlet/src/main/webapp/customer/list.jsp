<%--
  Created by IntelliJ IDEA.
  User: sf book
  Date: 10/12/21
  Time: 11:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>List Customer</title>
    <!-- CSS only -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.js" ></script>
    <!-- JS tạo nút bấm di chuyển trang start -->
    <script src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js" type="text/javascript"></script>
    <!-- JS, Popper.js, and jQuery -->
    <%--    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>--%>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <link rel="stylesheet prefetch" href="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css"><script src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.js"></script>
    <style>
        .menu li {
            margin-right: 110px;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $(".datepicker").datepicker({
                autoclose: true,
                todayHighlight: true
            }).datepicker('update', new Date());
        });
    </script>
</head>
<body style="background-image: url('https://resortdanang.info/wp-content/uploads/2019/01/resort-furama-da-nang-1024x576.jpg');background-size: cover">
<div class="header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-3">
                <img style="width: 30%;padding: 15px"
                     src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQlTaPPCcmHWMt6vGZ5QyfBTCSLcbmOys20dg&usqp=CAU">
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
            <div class="col-12">
                <ul style="list-style: none;display:flex ;padding-top: 12px">
                    <li><a href="/home">Home</a></li>
                    <li><a href="/employee">Employee</a></li>
                    <li><a href="/customer">Customer</a></li>
                    <li><a href="">Service</a></li>
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
            <div class="row">
                <div class="col-2" style="display: flex;flex-direction: column;margin-top: 85px">
                    <a href="#addCusModal" class="btn btn-primary" data-toggle="modal" style="margin: 3px"><i
                            class="fa fa-plus"></i> <span>Add New Customer</span></a>
                </div>
                <div class="col-10" style="margin-top: 28px">
                    <h2 style="color: aliceblue ;text-align: center">List Customer</h2>
                    <table class="table table-striped">
                        <thead class="thead-dark">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Customer type</th>
                            <th scope="col">Name</th>
                            <th scope="col">Date of birth</th>
                            <th scope="col">Gender</th>
                            <th scope="col">ID Card</th>
                            <th scope="col">Phone</th>
                            <th scope="col">Email</th>
                            <th scope="col">Address</th>
                            <th scope="col">Action</th>
                        </tr>
                        </thead>
                        <tbody style="background-color: #f7f5f2">
                        <c:forEach var="customer" items="${customerDisplayList}">
                            <tr class="contentPage">
                                <th>${customer.idNumber}</th>
                                <td><span>${customer.customerType}</span></td>
                                <td><span>${customer.fullName}</span></td>
                                <td><span>${customer.birthDay}</span></td>
                                <td><span><c:if test="${!customer.gender}">fe</c:if>male</span></td>
                                <td><span>${customer.idCard}</span></td>
                                <td><span>${customer.phoneNumber}</span></td>
                                <td><span>${customer.email}</span></td>
                                <td><span>${customer.address}</span></td>
                                <td>
                                    <a href="#editCusModal" class="edit" data-toggle="modal" onclick="onEdit('${customer.idNumber}',
                                            '${customer.fullName}','${customer.birthDay}','${customer.gender}','${customer.idCard}','${customer.phoneNumber}',
                                            '${customer.email}','${customer.address}','${customer.customerType}')" title="Edit">
                                        <i class="material-icons">&#xE254;</i></a>
                                    <a href="#deleteNoteModal" class="delete" data-toggle="modal" onclick="onDelete(${employee.idNumber})"
                                       title="Delete"><i class="material-icons">&#xE872;</i></a>
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

<!-- add Modal HTML -->
<div id="addCusModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/customer?action=create" method="post">
                <div class="modal-header" style="background: #2d3338">
                    <h4 class="modal-title" style="color: #e9e9e9">Add New Customer</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Name :</label>
                        <input type="text" class="form-control" name="Name" id="Name">
                    </div>
                    <div class="form-group">
                        <label>Date of birth : </label>
                        <div class="input-group date datepicker" data-date-format="dd-mm-yyyy"> <input class="form-control" readonly="" type="text" name="dateOfBirth"> <span class="input-group-addon"><i class="fa fa-calendar"></i></span></div>
                    </div>
                    <div class="form-group">
                        <label>Gender :</label>
                        <select name="gender" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

                                <option value="true">Male</option>
                                <option value="false">Female</option>

                        </select>
                    </div>
                    <div class="form-group">
                        <label>ID Card : </label>
                        <input type="text" class="form-control" name="CMND" id="CMND" pattern="\d{9}|\d{12}" title="Format id card: xxxxxxxxx or xxxxxxxxxxxx">
                    </div>
                    <div class="form-group">
                        <label>Phone : </label>
                        <input type="text" class="form-control" name="SDT" id="SDT" placeholder="09xx" pattern="(090|091)[\d]{7}" title="Phone number is not format ">
                    </div>
                    <div class="form-group">
                        <label>Email : </label>
                        <input type="text" class="form-control" name="Email" id="Email" placeholder="abc@abc.abc" pattern="[a-z]+[a-zA-Z0-9]+@[a-zA-Z0-9]+(\.[a-zA-Z0-9]+\.*[a-zA-Z0-9]*)" title="Email is not format">
                    </div>
                    <div class="form-group">
                        <label>Address : </label>
                        <input type="text" class="form-control" name="Address" id="Address">
                    </div>
                    <div class="form-group">
                        <label>Customer Type :</label>
                        <select name="CusTypeId" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <c:forEach var="CusType" items="${customerTypeList}">
                                <option value="${CusType.customerTypeId}">${CusType.customerTypeName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancel">
                    <input type="submit" class="btn btn-primary" value="Add">
                </div>
            </form>
        </div>
    </div>
</div>


<!-- edit Modal HTML -->
<div id="editCusModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/customer?action=edit" method="post">
                <div class="modal-header" style="background: #2d3338">
                    <h4 class="modal-title" style="color: #e9e9e9">Edit Customer</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="id" id="idEdit">
                    <div class="form-group">
                        <label>Name :</label>
                        <input type="text" class="form-control" name="Name" id="editname">
                    </div>
                    <div class="form-group">
                        <label>Date of birth : </label>
                        <div class="input-group date datepicker" data-date-format="dd-mm-yyyy">
                            <input class="form-control" readonly="" type="text" name="dateOfBirth" id="birthday"> <span class="input-group-addon"><i class="fa fa-calendar"></i></span></div>
                    </div>
                    <div class="form-group">
                        <label>Gender :</label>
                        <select name="gender" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="gender">

                            <option value="true">Male</option>
                            <option value="false">Female</option>

                        </select>
                    </div>
                    <div class="form-group">
                        <label>ID Card : </label>
                        <input type="text" class="form-control" name="CMND" id="CMNDedit" pattern="\d{9}|\d{12}" title="Format id card: xxxxxxxxx or xxxxxxxxxxxx">
                    </div>
                    <div class="form-group">
                        <label>Phone : </label>
                        <input type="text" class="form-control" name="SDT" id="SDTedit" placeholder="09xx" pattern="(090|091)[\d]{7}" title="Phone number is not format ">
                    </div>
                    <div class="form-group">
                        <label>Email : </label>
                        <input type="text" class="form-control" name="Email" id="Emailedit" placeholder="abc@abc.abc" pattern="[a-z]+[a-zA-Z0-9]+@[a-zA-Z0-9]+(\.[a-zA-Z0-9]+\.*[a-zA-Z0-9]*)" title="Email is not format">
                    </div>
                    <div class="form-group">
                        <label>Address : </label>
                        <input type="text" class="form-control" name="Address" id="Addressedit">
                    </div>
                    <div class="form-group">
                        <label>Customer Type :</label>
                        <select name="CusTypeId" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="cusType">
                            <c:forEach var="CusType" items="${customerTypeList}">
                                <option value="${CusType.customerTypeId}">${CusType.customerTypeName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancel">
                    <input type="submit" class="btn btn-primary" value="Add">
                </div>
            </form>
        </div>
    </div>
</div>


<!-- Delete Modal HTML -->
<div id="deleteNoteModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/customer?action=delete" method="post">
                <div class="modal-header">
                    <h4 class="modal-title">Delete customer</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="form-group">
                    <input type="hidden" name="id" id="id"/>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to delete customer ?</p>
                    <label name="title"></label>
                    <p class="text-warning"><small>This action cannot be undone.</small></p>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                    <input type="submit" class="btn btn-danger" value="Delete">
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    function onDelete(id) {
        document.getElementById("id").value = id;

    }
    function onEdit(id,name,birthday,gender,idCard,phoneNumber,email,address,type) {
        document.getElementById("idEdit").value = id;
        document.getElementById("editname").value = name;
        document.getElementById("birthday").value = birthday;
        document.getElementById("CMNDedit").value = idCard;
        document.getElementById("SDTedit").value = phoneNumber;
        document.getElementById("Emailedit").value = email;
        document.getElementById("Addressedit").value = address;
        let types = document.getElementById("cusType");
        for (let i = 0; i < types.options.length; i++){
            if(types.options[i].text == type){
                types.options[i].selected = true;
            }
        }
        let gd = document.getElementById("gender");

        for (let i = 0; i < gd.options.length;i++){
            if(gd.options[i].value == gender){
                gd.options[i].selected = true;
            }
        }
    }
</script>
</body>
</html>