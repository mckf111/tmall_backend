<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>
 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>
 
<script>
    $(function(){
        $(".addFormSingle").submit(function(){
            if(checkEmpty("filepathSingle","Picture file")){
                $("#filepathSingle").value("");
                return true;
            }
            return false;
        });
        $(".addFormDetail").submit(function(){
            if(checkEmpty("filepathDetail","Picture file"))
                return true;
            return false;
        });
    });
 
</script>
 
<title>Product Picture Management</title>
 
<div class="workingArea">
    <ol class="breadcrumb">
        <li><a href="admin_category_list">All Categories</a></li>
        <li><a href="admin_product_list?cid=${p.category.id}">${p.category.name}</a></li>
        <li class="active">${p.name}</li>
        <li class="active">Product Picture Management</li>
    </ol>
 
    <table class="addPictureTable" align="center">
        <tr>
            <td class="addPictureTableTD">
                <div>
                    <div class="panel panel-warning addPictureDiv">
                        <div class="panel-heading">New product<b class="text-primary"> single </b>picture</div>
                        <div class="panel-body">
                            <form method="post" class="addFormSingle" action="admin_productImage_add" enctype="multipart/form-data">
                                <table class="addTable">
                                    <tr>
                                        <td>Local picture, best size: 400X400 </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input id="filepathSingle" type="file" name="image" />
                                        </td>
                                    </tr>
                                    <tr class="submitTR">
                                        <td align="center">
                                            <input type="hidden" name="type" value="type_single" />
                                            <input type="hidden" name="pid" value="${p.id}" />
                                            <button type="submit" class="btn btn-success">Submit</button>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                    </div>
                    <table class="table table-striped table-bordered table-hover  table-condensed">
                        <thead>
                        <tr class="success">
                            <th>ID</th>
                            <th>Single Picture</th>
                            <th>Delete</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${pisSingle}" var="pi">
                            <tr>
                                <td>${pi.id}</td>
                                <td>
                                    <a title="click to see original picture" href="img/productSingle/${pi.id}.jpg"><img height="50px" src="img/productSingle/${pi.id}.jpg"></a>
                                </td>
                                <td><a deleteLink="true"
                                       href="admin_productImage_delete?id=${pi.id}"><span
                                        class="     glyphicon glyphicon-trash"></span></a></td>
 
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
 
                </div>
            </td>
            <td class="addPictureTableTD">
                <div>
 
                    <div class="panel panel-warning addPictureDiv">
                        <div class="panel-heading">New product<b class="text-primary"> detailed </b>picture</div>
                        <div class="panel-body">
                            <form method="post" class="addFormDetail" action="admin_productImage_add" enctype="multipart/form-data">
                                <table class="addTable">
                                    <tr>
                                        <td>Local picture, best size: 790</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input id="filepathDetail"  type="file" name="image" />
                                        </td>
                                    </tr>
                                    <tr class="submitTR">
                                        <td align="center">
                                            <input type="hidden" name="type" value="type_detail" />
                                            <input type="hidden" name="pid" value="${p.id}" />
                                            <button type="submit" class="btn btn-success">Submit</button>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                    </div>
                    <table class="table table-striped table-bordered table-hover  table-condensed">
                        <thead>
                        <tr class="success">
                            <th>ID</th>
                            <th>Detailed picture</th>
                            <th>Delete</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${pisDetail}" var="pi">
                            <tr>
                                <td>${pi.id}</td>
                                <td>
                                    <a title="click to see original picture" href="img/productDetail/${pi.id}.jpg"><img height="50px" src="img/productDetail/${pi.id}.jpg"></a>
                                </td>
                                <td><a deleteLink="true"
                                       href="admin_productImage_delete?id=${pi.id}"><span
                                        class="     glyphicon glyphicon-trash"></span></a></td>
 
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </td>
        </tr>
    </table>
 
</div>
 
<%@include file="../include/admin/adminFooter.jsp"%>