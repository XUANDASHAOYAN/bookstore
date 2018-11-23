<%--
  Created by IntelliJ IDEA.
  User: SONG
  Date: 2018/11/17
  Time: 17:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
    String uri = request.getRequestURI();
    String basePath = uri.replace("/foreLogin","");
%>

<html>
    <head>
        <title>登录页面</title>
        <script src="js/jquery/2.0.0/jquery.min.js"></script>
        <link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
        <script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
        <link href="css/login/login.css" rel="stylesheet">
        <script>
            $(function(){
                <c:if test="${!empty message}">
                $("span.errorMessage").html("${message}");
                $("div.loginErrorMessageDiv").show();
                </c:if>

                $("form.loginForm input").keyup(function(){
                    $("div.loginErrorMessageDiv").hide();
                });
            })

        </script>
    </head>

    <body>
    <h1>WHPU 图书管理系统</h1>
    <div id="loginDiv">

        <div id="simpleLogo">
            <img src="img/0.jpg">
        </div>

        <div id="login">
            <div class="loginErrorMessageDiv">
                <div class="alert alert-danger" >
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
                    <span class="errorMessage"></span>
                </div>
            </div>

            <form class="loginForm" action="loginVerify" method="post">
                <table>
                    <tr id="username">
                        <td id="left"><span class="glyphicon glyphicon-user"></span></td>
                        <td id="right"><input type="text" class="form-control" placeholder="请输入姓名" name="name"/></td>
                    </tr>

                    <tr id="password">
                        <td id="left"><span class="glyphicon glyphicon-lock"></span></td>
                        <td id="right"><input type="password" class="form-control" placeholder="请输入密码" name="password"/></td>
                    </tr>

                    <tr id="identity">
                        <td id="left"><span class="glyphicon glyphicon-eye-open"></span></td>
                        <td id="right">
                            <select class="form-control" id="identity_right" name="identity">
                                <option value="admin">管理员</option>
                                <option value="reader">读者</option>
                            </select>
                        </td>
                    </tr>
                </table>

                <button type="submit" class="btn btn-primary" id="loginB" name="action" value="login">登录</button>
                <button type="submit" class="btn btn-info" id="registB" name="action" value="register">注册</button>
            </form>
        </div>
    </div>

    </body>
</html>
