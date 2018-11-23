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
    <link href="css/home/listBook.css" rel="stylesheet">
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


            if ($("#borrow").attr("name").length != 0){
                if ($("#borrow").attr("name") == 'admin' || $("#borrow").attr("name") == 'whpu'){
                    $("span#addBook").show();
                    $("td#operateOfTD1").show();
                    $("td#operateOfTD2").hide();
                }else {
                    $("span#addBook").hide();
                    $("td#operateOfTD1").hide();
                    $("td#operateOfTD2").show();
                }

            }else {
                $("span#addBook").hide();
                $("th#operateOfTH").hide();
                $("td#operateOfTD1").hide();
                $("td#operateOfTD2").hide();
            }



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
        <li><a href="listBook">图书预览 </a></li>
    </ol>
</nav>

<div id="searchDiv">
    <form action="searchBook" method="post">
        <span id="type">
            <select class="form-control" name="type">
                <option selected disabled style="display: none;">请选择书籍类型</option>
                <c:forEach items="${bookTypeNames}" var="bookTypeName">
                    <option value="${bookTypeName}">${bookTypeName}</option>
                </c:forEach>
            </select>
        </span>

        <span id="author">
            <select class="form-control" name="author">
                <option selected disabled style="display: none;">请选择作者</option>
                <c:forEach items="${authors}" var="author">
                    <option value="${author}">${author}</option>
                </c:forEach>
            </select>
        </span>

        <span id="NameAndISBN">
            <select class="form-control" name="NameAndISBN">
                <option value="name">名称</option>
                <option value="ISBN">ISBN</option>
            </select>
        </span>

        <span id="ContentofNameAndISBN"><input type="text" class="form-control" name="content" placeholder="请输入ISBN或书籍名" style="width: 170px;"/></span>

        <span id="search"><button name="addOrSearch" value="search" class="btn btn-primary" type="submit"><span class="glyphicon glyphicon-search"></span>搜索</button></span>
        <span id="addBook"><button name="addOrSearch" value="add" class="btn btn-primary" type="submit"><span class="glyphicon glyphicon-plus"></span>添加书籍信息</button></span>
    </form>
</div>


<div id="content">
    <table class="table table-striped table-bordered table-hover  table-condensed">
        <thead>
        <th>序号</th>
        <th>ISBN</th>
        <th>名称</th>
        <th>书籍类型</th>
        <th>作者</th>
        <th>出版社</th>
        <th>出版日期</th>
        <th>价格</th>
        <th>库存</th>
        <th id="operateOfTH">操作</th>
        </thead>

        <tbody>

        <c:if test="${empty bookList}">
            <tr>
                <td colspan="10">
                    <h4><strong>没有查询到数据</strong></h4>
                </td>
            </tr>
        </c:if>

        <c:forEach items="${bookList}" var="b" varStatus="sb">
            <tr>
                <td>${sb.count}</td>
                <td>${b.ISBN}</td>
                <td>${b.name}</td>
                <td>${b.bookType.name}</td>
                <td>${b.author}</td>
                <td>${b.press}</td>
                <td><fmt:formatDate type="date" value="${b.publish_date}" /></td>
                <td>${b.price}</td>
                <td>${b.stock}</td>
                <td id="operateOfTD1">
                    <a id="edit" href="editBook?id=${b.id}"><span class="glyphicon glyphicon-edit"></span></a>
                    <a id="delete" href="deleteBook?id=${b.id}" deleteLink="true"><span class="glyphicon glyphicon-trash"></span></a>
                </td>

                <td id="operateOfTD2" style="display: none">
                    <a id="borrow" href="foreBorrow?id=${b.id}" name="${name}"><button type="button" class="btn btn-success">借阅</button></a>
                </td>

            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<nav id="pagination">
    <ul class="pagination">
        <li <c:if test="${!page.hasPreviouse}">class="disabled"</c:if>>
            <a  href="?start=0${page.param}" aria-label="Previous" >
                <span aria-hidden="true">&lt;&lt;</span>
            </a>
        </li>

        <li <c:if test="${!page.hasPreviouse}">class="disabled"</c:if>>
            <a  href="?start=${page.start-page.count}${page.param}" aria-label="Previous" >
                <span aria-hidden="true">&lt;</span>
            </a>
        </li>

        <c:forEach begin="0" end="${page.totalPage-1}" varStatus="status">
            <li <c:if test="${status.index*page.count==page.start}">class="disabled"</c:if>>
                <a
                        href="?start=${status.index*page.count}${page.param}"
                        <c:if test="${status.index*page.count==page.start}">class="current"</c:if>
                >${status.count}</a>
            </li>

        </c:forEach>

        <li <c:if test="${!page.hasNext}">class="disabled"</c:if>>
            <a href="?start=${page.start+page.count}${page.param}" aria-label="Next">
                <span aria-hidden="true">&gt;</span>
            </a>
        </li>
        <li <c:if test="${!page.hasNext}">class="disabled"</c:if>>
            <a href="?start=${page.last}${page.param}" aria-label="Next">
                <span aria-hidden="true">&gt;&gt;</span>
            </a>
        </li>
    </ul>
</nav>

</body>
</html>

