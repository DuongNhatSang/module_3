<%--
  Created by IntelliJ IDEA.
  User: sf book
  Date: 10/07/21
  Time: 10:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Calculator</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<h2>Simple Calculator</h2>
<div class="row">
    <div class="col-4">
        <form method="post" action="/calculator">
            <div class="form-group">
                <label for="inputAddress">First operand</label>
                <input type="number" class="form-control" id="inputAddress" placeholder="Enter number"
                       name="firsrOperand">
            </div>
            <div class="form-row">
                <label for="inputState">Operator</label>
                <select id="inputState" class="form-control" name="operator">
                    <option selected>Addition</option>
                    <option>+</option>
                    <option>-</option>
                    <option>*</option>
                    <option>/</option>
                </select>
            </div>
            <div class="form-group">
                <label for="inputAddress2">Second operand</label>
                <input type="number" class="form-control" id="inputAddress2" placeholder="Enter number"
                       name="secondOperand">
            </div>
            <button type="submit" class="btn btn-primary">Calculate</button>
        </form>
    </div>
    <div class="col-4"></div>
    <div class="col-4"></div>
</div>
</body>
</html>
