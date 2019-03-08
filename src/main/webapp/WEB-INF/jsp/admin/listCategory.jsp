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

<title>Category Management</title>

<div class="workingArea">
    <h1 class="label label-info" >Category Management</h1>
    <br>
    <br>

    <div class="listDataTableDiv">
        <table class="table table-striped table-bordered table-hover table-condensed">
            <thead>
            <tr class="success">
                <th>ID</th>
                <th>Picture</th>
                <th>Category name</th>
                <th>Property management</th>
                <th>Product management</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${cs}" var="c">

                <tr>
                    <td>${c.id}</td>
                    <td><img height="40px" src="img/category/${c.id}.jpg"></td>
                    <td>${c.name}</td>
                    <td><a href="admin_property_list?cid=${c.id}"><span class="glyphicon glyphicon-th-list"></span></a></td>
                    <td><a href="admin_product_list?cid=${c.id}"><span class="glyphicon glyphicon-shopping-cart"></span></a></td>
                    <td><a href="admin_category_edit?id=${c.id}"><span class="glyphicon glyphicon-edit"></span></a></td>
                    <td><a deleteLink="true" href="admin_category_delete?id=${c.id}"><span class="   glyphicon glyphicon-trash"></span></a></td>

                </tr>
            </c:forEach>
            
            </tbody>
        </table>
    </div>

    <div class="pageDiv">
        <%@include file="../include/admin/adminPage.jsp" %>
    </div>

    <div class="panel panel-warning addDiv">
        <div class="panel-heading">New Category</div>
        <div class="panel-body">
            <form method="post" id="addForm" action="admin_category_add" enctype="multipart/form-data">
                <table class="addTable">
                    <tr>
                        <td>Category Name</td>
                        <td><input  id="name" name="name" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>Category Picture</td>
                        <td>
                            <input id="categoryPic" accept="image/*" type="file" name="image" />
                        </td>
                    </tr>
                    <tr class="submitTR">
                        <td colspan="2" align="center">
                            <button type="submit" class="btn btn-success">Submit</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>

</div>

<%@include file="../include/admin/adminFooter.jsp"%>