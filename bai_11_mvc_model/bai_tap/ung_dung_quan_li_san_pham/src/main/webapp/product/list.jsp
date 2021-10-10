<%--
  Created by IntelliJ IDEA.
  User: sf book
  Date: 10/10/21
  Time: 3:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>List Product</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
<h2>
    <a href="/product?action=create">Create new Product</a>
</h2>
<table class="table table-striped table-dark">
    <thead>
    <tr>
        <th scope="col">ID</th>
        <th scope="col">Name Product</th>
        <th scope="col">Price</th>
        <th scope="col">Producer</th>
        <th scope="col">Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="pro" items="${listProduct}">
        <tr>
            <th>${pro.getId()}</th>
            <td><a href="/product?action=view&id=${pro.id}">${pro.name}</a></td>
            <td>${pro.price}</td>
            <td>${pro.producer}</td>
            <td>
                <a href="/product?action=update&id=${pro.id}">Update |</a>
                <a href="#deleteNoteModal" onclick="onDelete(${pro.id})" class="delete" data-toggle="modal" title="Delete">Delete</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</div>
<div id="deleteNoteModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/product" method="post">
                <div class="modal-header">
                    <h4 class="modal-title">Delete Product</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="form-group">
                    <input type="hidden" name="id" id="id"/>
                    <input type="hidden" name="action" value="delete">
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to delete product ?</p>
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
</script>
</body>
</html>
