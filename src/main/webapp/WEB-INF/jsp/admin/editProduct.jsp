<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>



<title>Edit Product</title>


<script>
    $(function(){

        $("#editForm").submit(function(){
            if(!checkEmpty("name","Product name"))
                return false;

            return true;
        });
    });

</script>

<div class="workingArea">

	<ol class="breadcrumb">
		<li><a href="admin_category_list">All Categories</a></li>
		<li><a href="admin_category_list">${c.name}</a></li>
        <li><a href="admin_product_list?cid=${c.id}">${p.name}</a></li>
	</ol>

	<div class="panel panel-warning editDiv">
		<div class="panel-heading">Edit Product</div>
		<div class="panel-body">
			<form method="post" id="editForm" action="admin_product_update">
				<table class="editTable">
					<tr>
						<td>Product Name</td>
						<td><input  id="name" name="name" value="${p.name}" type="text" class="form-control"></td>
					</tr>
					<tr>
						<td>Subtitle</td>
						<td><input  id="subTitle" name="subTitle" value="${p.subTitle}" type="text" class="form-control"></td>
					</tr>
                    <tr>
						<td>Original Price</td>
						<td><input  id="originalPrice" name="originalPrice" value="${p.originalPrice}" type="text" class="form-control"></td>
					</tr>
                    <tr>
						<td>Promotion Price</td>
						<td><input  id="promotePrice" name="promotePrice" value="${p.promotePrice}" type="text" class="form-control"></td>
					</tr>
                    <tr>
						<td>Stock</td>
						<td><input  id="stock" name="stock" value="${p.stock}" type="text" class="form-control"></td>
					</tr>
					<tr class="submitTR">
						<td colspan="2" align="center">
							<input type="hidden" name="cid" value="${c.id}">
                            <input type="hidden" name="id" value="${p.id}">
							<button type="submit" class="btn btn-success">Submit</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>