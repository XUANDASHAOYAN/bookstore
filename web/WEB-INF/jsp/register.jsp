<%--
  Created by IntelliJ IDEA.
  User: SONG
  Date: 2018/11/18
  Time: 17:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
    <meta charset="UTF-8">
    <title>注册页面</title>
    <script src="js/jquery/2.0.0/jquery.min.js"></script>
    <link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link href="css/register/register.css" rel="stylesheet">
    <script>
        $(function(){
            <c:if test="${!empty message}">
            $("span.errorMessage").html("${message}");
            $("div.registerErrorMessageDiv").show();
            </c:if>

            $("form.registerForm").submit(function(){
                if(0==$("#name").val().length||0==$("#pwd").val().length){
                    $("span.errorMessage").html("请输入读者账号密码");
                    $("div.registerErrorMessageDiv").show();
                    return false;
                }
                return true;
            });

            $("form.registerForm input").keyup(function(){
                $("div.registerErrorMessageDiv").hide();
            });

        })
    </script>
</head>

<body>
<h1>请填写信息注册</h1>

<div id="registerDiv">

    <div class="registerErrorMessageDiv">
        <div class="alert alert-danger" >
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
            <span class="errorMessage"></span>
        </div>
    </div>

    <form class="registerForm" action="registerVerify" method="post">
        <table>
            <tr id="username">
                <td id="left"><span class="glyphicon glyphicon-user"></span></td>
                <td id="right"><input type="text" name="name" id="name" class="form-control" placeholder="请填写读者名称"/></td>
            </tr>

            <tr id="password">
                <td id="left"><span class="glyphicon glyphicon-lock"></span></td>
                <td id="right"><input type="password" name="password" id="pwd" class="form-control" placeholder="请填写密码"/></td>
            </tr>

            <tr id="Gender">
                <td id="left"><span class="gender_img"><img src="img/2.png"/></span></td>
                <td id="right">
                    <div class="btn-group" data-toggle="buttons">
                        <label class="btn btn-default" id="left">
                            <input type="radio" name="gender" value="男"> 男
                        </label>

                        <label class="btn btn-default" id="right">
                            <input type="radio" name="gender" value="女"> 女
                        </label>
                    </div>
                </td>
            </tr>

            <tr id="phone">
                <td id="left"><span class="glyphicon glyphicon-phone"></span></td>
                <td id="right"><input type="text" name="phone" class="form-control" placeholder="请填写手机号"/></td>
            </tr>

            <tr id="department">
                <td id="left"><span class="	glyphicon glyphicon-book"></span></td>
                <td id="right">
                    <select class="form-control" name="dep">
                        <option value="数计学院">数计学院</option>
                        <option value="经管学院">经管学院</option>
                        <option value="电气学院">电气学院</option>
                        <option value="机械学院">机械学院</option>
                        <option value="艺传学院">艺传学院</option>
                        <option value="马克思学院">马克思学院</option>
                    </select>
                </td>
            </tr>

            <tr id="regDate">
                <td id="left"><span class="glyphicon glyphicon-calendar"></span></td>
                <td id="right"><input type="datetime-local" name="regDate" class="form-control"/></td>
            </tr>
        </table>

        <button type="submit" class="btn btn-success" id="registB">注册</button>
    </form>
</div>
</body>
</html>
