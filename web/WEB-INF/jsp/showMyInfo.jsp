<%--
  Created by IntelliJ IDEA.
  User: SONG
  Date: 2018/11/21
  Time: 18:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE>
<html>
<head>
    <meta charset="UTF-8">
    <title>主页</title>
    <script src="js/jquery/2.0.0/jquery.min.js"></script>
    <link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link href="css/home/showMyInfo.css" rel="stylesheet">
    <script>
        $(function() {
            $("#my_borrow").click(function () {
                if ($("#my_borrow").attr("name").length == 0){
                    alert("对不起还没有登录!");
                    return false;

                }else {
                    if ( $("#my_borrow").attr("name") == 'admin' || $("#my_borrow").attr("name") == 'whpu'){
                        alert("对不起该功能不对管理员开放");
                        return false;
                    }else {
                        return true;
                    }
                }
            });

            $("#my_message").click(function () {
                if ($("#my_message").attr("name").length == 0){
                    alert("对不起还没有登录!");
                    return false;

                }else {
                    if ( $("#my_message").attr("name") == 'admin' || $("#my_message").attr("name") == 'whpu'){
                        alert("对不起该功能不对管理员开放");
                        return false;
                    }else {
                        return true;
                    }
                }
            });

            <c:if test="${!empty message}">
            $("span.showMessage").html("${message}");
            $("div.MessageDiv").show();
            </c:if>

            <c:if test="${empty name}">
            $("div#name").hide();
            $("div#to_submit").show();
            </c:if>

            $("form.editForm input").mouseenter(function(){
                $("div.MessageDiv").hide();
            });

        });
    </script>
</head>

<body>
<div id="title">
    <span id="title_img"><img id="simpleLogo" src="img/1.png"/></span>
    <span id="title_content"><h1>WHPU 图书管理系统</h1></span>
</div>

<div id="navigation_bar">
			<span id="pull_left">
                <a id="home" href="foreHome">首页</a>
                <a id="book_preview" href="listBook">图书预览</a>
                <a id="my_borrow" name="${name}" href="myBorrow?name=${name}">读者借阅</a>
                <a id="my_message" name="${name}" href="showMyInfo?name=${name}">读者信息</a>
			</span>

    <span id="pull_right">

				<div class="btn-group" id="name">
				    <button type="button" class="btn btn-default dropdown-toggle "  data-toggle="dropdown">
				     ${name}
				      <span class="caret"></span>
				    </button>
				    <ul class="dropdown-menu" role="menu" >
				      <li style="width: 70px; margin-left: 34px;">
				         <a href="edit_pwd" style="margin-left: -42px;">修改密码</a>
				      </li>
				      <li style="width: 70px; margin-left: 34px;">
				         <a href="exit" style="margin-left: -42px;">退出</a>
				      </li>
				    </ul>
				</div>

         <div class="btn-group" id="to_submit" style="display: none">
            <a href="foreLogin">登录</a>
        </div>

			</span>
</div>

<nav id="nav">
    <ol class="breadcrumb" style="width: 1100px;">
        <li><a href="foreHome">首页</a></li>
        <li><a href="showMyInfo?name=${name}">我的信息 </a></li>
    </ol>
</nav>

<div id="editDiv">
    <form class="editForm" action="editReader" method="post">
        <table>
            <tr>
                <td><span id="right"><strong>读者: </strong></span><input class="form-control" type="text" name="name" value="${reader.name}"/></td>
                <td><span id="right"><strong>性别: </strong></span><input class="form-control" type="text" name="gender" value="${reader.gender}"/></td>
                <td><span id="right"><strong>电话: </strong></span><input class="form-control" type="text" name="phone" value="${reader.phone}"/></td>
            </tr>

            <tr>
                <td><span id="right"><strong>学院: </strong></span><input class="form-control" type="text" name="dep" value="${reader.dep}"/></td>
                <td><span id="right"><strong>注册日期: </strong></span><input class="form-control" type="date" name="regDate" value="<fmt:formatDate type="date" value='${reader.regDate}' pattern="yyyy-MM-dd" />"/></td>
                <td><input type="hidden" name="id" value="${reader.id}" /></td>
            </tr>
        </table>

        <div class="MessageDiv">
            <div class="alert alert-danger" >
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
                <span class="showMessage"></span>
            </div>
        </div>

        <button type="submit" id="submit" name="action" value="edit" class="btn btn-danger">提交修改</button>
        <button type="submit" id="goBack" name="action" value="goback" class="btn btn-info">返回首页</button>
    </form>
</div>



</body>
</html>
