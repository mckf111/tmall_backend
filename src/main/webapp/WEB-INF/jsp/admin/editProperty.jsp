<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>

<script>
    $(function(){

        $("#editForm").submit(function(){
            if(!checkEmpty("name","Property name"))
                return false;

            return true;
        });
    });

</script>

<div class="property_edit">
    <ol class="breadcrumb">
		<li><a href="admin_property_list">All Properties</a></li>
		<li class="active">Edit Property</li>
	</ol>

    <div class="panel panel-success editDiv">
        <div class="panel-heading">Edit Property</div>
        <div class="panel-body">
            <form method="post" action="admin_property_update" id="editForm">
                <table class="editTable">
                    <tr>
                        <td>Property Name</td>
                        <td>
                            <input name="name" value="${p.name}" type="text">
                        </td>
                    </tr>
                    <tr class="submitTR">
                        <td colspan="2" align="center">
                            <input type="hidden" value="${p.cid}" name="cid">
                            <input type="hidden" value="${p.id}" name="id">
                            <button type="submit" class="btn btn-success">Submit</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>