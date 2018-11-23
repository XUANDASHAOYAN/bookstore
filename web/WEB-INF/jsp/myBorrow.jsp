<%--
  Created by IntelliJ IDEA.
  User: SONG
  Date: 2018/11/17
  Time: 16:19
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
    <link href="css/home/myBorrow.css" rel="stylesheet">
    <script>
        $(function(){
            $("a").click(function(){
                var deleteLink = $(this).attr("deleteLink");
                console.log(deleteLink);
                if("true"==deleteLink){
                    var confirmDelete = confirm("确认要删除这一行数据?");
                    if(confirmDelete)
                        return true;
                    return false;
                }
            });

            $("#reBack").click(function () {
               if ($("#reBack").attr("name").length <= 0){
                   return false;
               }else {
                   return true;
               }
            });

            <c:if test="${empty name}">
            $("div#name").hide();
            $("div#to_submit").show();
            </c:if>


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

            $("ul.pagination li.disabled a").click(function(){
                return false;
            });

            <c:if test="${!empty message}">
            $("span.Message").html("${message}");
            $("div.ErrorMessageDiv").show();
            </c:if>

            $("a").click(function(){
                $("div.ErrorMessageDiv").hide();
            });

            $("input").keyup(function () {
                $("div.ErrorMessageDiv").hide();
            });

            $("button").click(function () {
                $("div.ErrorMessageDiv").hide();
            });
        })

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
        <li><a href="myBorrow?name=${name}">读者借阅 </a></li>
    </ol>
</nav>

<div id="searchDiv">
    <form action="searchBorrow" method="post">
        <span id="type">
            <select class="form-control" name="type">
                <option selected disabled style="display: none;">请选择书籍类型</option>
                <c:forEach items="${bookTypeNames}" var="bookTypeName">
                    <option value="${bookTypeName}">${bookTypeName}</option>
                </c:forEach>
            </select>
        </span>

        <span id="ContentofName"><input type="text" class="form-control" name="content" placeholder="请输入书籍名" style="width: 170px;"/></span>

        <span id="search"><button name="addOrSearch" value="search" class="btn btn-primary" type="submit"><span class="glyphicon glyphicon-search"></span>搜索</button></span>
    </form>
</div>

<div class="ErrorMessageDiv" style="display: none">
    <div class="alert alert-danger" >
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
        <span class="Message"></span>
    </div>
</div>


<div id="content">
    <table class="table table-striped table-bordered table-hover  table-condensed">
        <thead>
        <th>序号</th>
        <th>借阅人</th>
        <th>借阅书籍</th>
        <th>书籍类型</th>
        <th>数量: </th>
        <th>借阅日期</th>
        <th>借阅天数</th>
        <th>操作</th>
        </thead>

        <tbody>

        <c:if test="${empty borrowList}">
            <tr>
                <td colspan="10">
                    <h4><strong>没有查询到数据</strong></h4>
                </td>
            </tr>
        </c:if>

        <c:forEach items="${borrowList}" var="b" varStatus="sb">
            <tr>
                <td>${sb.count}</td>
                <td>${name}</td>
                <td>${b.book.name}</td>
                <td>${b.book.bookType.name}</td>
                <td>${b.num}</td>
                <td><fmt:formatDate type="date" value="${b.borrow_date}" /></td>
                <td>${b.days}</td>
                <td>
                    <a id="reBack" href="reBack?id=${b.id}" name="${name}"><button type="button" class="btn btn-warning">归还</button></a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<nav id="pagination">
    <ul class="pagination">
        <li <c:if test="${!page.hasPreviouse}">class="disabled"</c:if>>
            <a  href="myBorrow?name=${name}&start=0${page.param}" aria-label="Previous" >
                <span aria-hidden="true">&lt;&lt;</span>
            </a>
        </li>

        <li <c:if test="${!page.hasPreviouse}">class="disabled"</c:if>>
            <a  href="myBorrow?name=${name}&start=${page.start-page.count}${page.param}" aria-label="Previous" >
                <span aria-hidden="true">&lt;</span>
            </a>
        </li>

        <c:forEach begin="0" end="${page.totalPage-1}" varStatus="status">
            <li <c:if test="${status.index*page.count==page.start}">class="disabled"</c:if>>
                <a
                        href="myBorrow?name=${name}&start=${status.index*page.count}${page.param}"
                        <c:if test="${status.index*page.count==page.start}">class="current"</c:if>
                >${status.count}</a>
            </li>

        </c:forEach>

        <li <c:if test="${!page.hasNext}">class="disabled"</c:if>>
            <a href="myBorrow?name=${name}&start=${page.start+page.count}${page.param}" aria-label="Next">
                <span aria-hidden="true">&gt;</span>
            </a>
        </li>
        <li <c:if test="${!page.hasNext}">class="disabled"</c:if>>
            <a href="myBorrow?name=${name}&start=${page.last}${page.param}" aria-label="Next">
                <span aria-hidden="true">&gt;&gt;</span>
            </a>
        </li>
    </ul>
</nav>

</body>
</html>


