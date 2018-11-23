<%--
  Created by IntelliJ IDEA.
  User: SONG
  Date: 2018/11/20
  Time: 23:09
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
    <link href="css/home/editBook.css" rel="stylesheet">
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

            <c:if test="${empty name}">
            $("div#name").hide();
            $("div#to_submit").show();
            </c:if>
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
        <li><a href="listBook">图书预览 </a></li>
        <li class="active">添加图书</li>
    </ol>
</nav>

<div id="editDiv">
    <form class="editForm" action="add_Book" method="post">
        <table>
            <tr>
                <td><span id="right"><strong>ISBN: </strong></span><input class="form-control" type="text" name="ISBN" /></td>
                <td><span id="right"><strong>名称: </strong></span><input class="form-control" type="text" name="name" /></td>
                <td><span id="right"><strong>类型: </strong></span><input class="form-control" type="text" name="typeName" /></td>
                <td><span id="right"><strong>作者: </strong></span><input class="form-control" type="text" name="author" /></td>
            </tr>

            <tr>
                <td><span id="right"><strong>出版社: </strong></span><input class="form-control" type="text" name="press" /></td>
                <td><span id="right"><strong>日期: </strong></span><input class="form-control" type="date" name="publish_date" /></td>
                <td><span id="right"><strong>价格: </strong></span><input class="form-control" type="text" name="price" /></td>
                <td><span id="right"><strong>库存: </strong></span><input class="form-control" type="text" name="stock" /></td>
            </tr>
        </table>
        <button type="submit" id="submit" class="btn btn-danger">提交</button>
    </form>
</div>



</body>
</html>

