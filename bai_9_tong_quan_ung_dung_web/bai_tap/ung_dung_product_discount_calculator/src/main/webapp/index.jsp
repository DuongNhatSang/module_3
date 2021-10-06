<%--
  Created by IntelliJ IDEA.
  User: sf book
  Date: 10/06/21
  Time: 8:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Product Discount Calculator</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  </head>
  <body>
  <div class="row">
    <div class="col-4"></div>
    <div class="col-4">
      <form action="/home" method="post">
        <div class="form-group">
          <label>Product Description</label>
          <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="ProductDescription">
        </div>
        <div class="form-group">
          <label>List Price</label>
          <input type="number" class="form-control" id="exampleInputPassword1" name="ListPrice">
        </div>
        <div class="form-group">
          <label>Discount Percent</label>
          <input type="number" class="form-control" id="exampleInputEmail2" aria-describedby="emailHelp" name="DiscountPercent">
        </div>
        <button type="submit" class="btn btn-primary">  Calculate Discount</button>
      </form>
    </div>
    <div class="col-4"></div>
  </div>
  </body>
</html>
