<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../include/admin/adminHeader.jsp" %>

<script>
    $(function() {
        $("#addForm").submit(function() {
            if(!checkEmpty("name", "Property name"))
                return false;
            return true;
        });
    });
</script>

<div class="workingArea">
<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="admin_category_list">All Categories</a></li>
    <li class="breadcrumb-item"><a href="admin_property_list?cid=${c.id}">${c.name}</a></li>
    <li class="breadcrumb-item active" aria-current="page">Property Management</li>
  </ol>
</nav>
<br>
<div class="listDataTableDiv">
<table class="table table-stripped table-bordered table-hover table-condensed">
    <thead>
        <tr class="success">
            <th>ID</th>
            <th>Property Name</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
    </thead>

    <c:forEach items="${ps}" var="p" varStatus="status">
        <tr>
        <td>${p.id}</td>
        <td>${p.name}</td>
        <td>
            <a href="admin_property_edit?id=${p.id}">
                <span class="glyphicon glyphicon-edit"></span>
            </a>
        </td>
        <td>
            <a href="admin_property_delete?id=${p.id}" deleteLink="true">
                <span class="glyphicon glyphicon-trash"></span>
            </a>
        </td>
        </tr>
    </c:forEach>
</table>
<br>
</div>

<%@ include file="../include/admin/adminPage.jsp" %>

<br>
<div class="panel panel-warning addDiv">
    <div class="panel-heading">New Property</div>
    <div class="panel-body">
        <form method="post" action="admin_property_add" id="addForm">
        <table class="addTable">
            <tr>
                <td>Property Name</td>
                <td>
                    <input name="name" type="text" id="name">
                </td>
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

<%@ include file="../include/admin/adminFooter.jsp" %>