<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>

<script>
    $(function(){

        $("#addForm").submit(function(){
            if(!checkEmpty("name","Category name"))
                return false;
            if(!checkEmpty("categoryPic","Category picture"))
                return false;
            return true;
        });
    });

</script>

<div class="workingArea">
<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="admin_category_list">All Categories</a></li>
    <li class="breadcrumb-item"><a href="admin_product_list?cid=${c.id}">${c.name}</a></li>
    <li class="breadcrumb-item active" aria-current="page">Product management</li>
  </ol>
</nav>
    <br>
    <div class="listDataTableDiv">
        <table class="table table-striped table-bordered table-hover  table-condensed">
            <thead>
            <tr class="success">
                <th>ID</th>
                <th>Picture</th>
                <th>Product name</th>
                <th>Subtitle</th>
                <th>Original price</th>
                <th>Promotion</th>
                <th>Stock</th>
                <th>Picture Management</th>
                <th>Set property</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${ps}" var="p">

                <tr>
                    <td>${p.id}</td>
                    <td>
                        <c:if test="${!empty p.firstProductImage}">
                            <img width="40px" src="img/productSingle/${p.firstProductImage.id}.jpg">
                        </c:if>
                    </td>
                    <td>${p.name}</td>
                    <td>${p.subTitle}</td>
                    <td>${p.originalPrice}</td>
                    <td>${p.promotePrice}</td>
                    <td>${p.stock}</td>
                    <td><a href="admin_productImage_list?pid=${p.id}"><span class="glyphicon glyphicon-picture"></span></a></td>
                    <td><a href="admin_propertyValue_edit?pid=${p.id}"><span class="glyphicon glyphicon-th-list"></span></a></td>
                    <td><a href="admin_product_edit?id=${p.id}"><span class="glyphicon glyphicon-edit"></span></a></td>
                    <td><a deleteLink="true" href="admin_product_delete?id=${p.id}"><span class="glyphicon glyphicon-trash"></span></a></td>

                </tr>
            </c:forEach>
            
            </tbody>
        </table>
    </div>

    <div class="pageDiv">
        <%@include file="../include/admin/adminPage.jsp" %>
    </div>

    <div class="panel panel-warning addDiv">
        <div class="panel-heading">New Product</div>
        <div class="panel-body">
            <form method="post" id="addForm" action="admin_product_add">
                <table class="addTable">
                    <tr>
                        <td>Product Name</td>
                        <td><input  id="name" name="name" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>Subtitle</td>
                        <td><input  id="name" name="subTitle" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>Original price</td>
                        <td><input  id="name" name="originalPrice" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>Promotion</td>
                        <td><input  id="name" name="promotePrice" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>Stock</td>
                        <td><input  id="name" name="stock" type="text" class="form-control"></td>
                    </tr>
                    <tr class="submitTR">
                        <td colspan="2" align="center">
                            <input name="cid" value="${c.id}" type="hidden">
                            <button type="submit" class="btn btn-success">Submit</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>

</div>

<%@include file="../include/admin/adminFooter.jsp"%>