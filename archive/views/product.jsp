<%--
  Created by IntelliJ IDEA.
  User: chenma
  Date: 2019-01-28
  Time: 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
    <title>Stripe API playground</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">

    <!-- VENDOR CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/font-awesome/css/font-awesome.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/themify-icons/css/themify-icons.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/pace/themes/orange/pace-theme-minimal.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/toastr/toastr.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/datatables/css-main/jquery.dataTables.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/datatables/css-bootstrap/dataTables.bootstrap.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/datatables-tabletools/css/dataTables.tableTools.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/sweetalert2/sweetalert2.css"/>">
    <!-- MAIN CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/stripe.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/skins/sidebar-nav-darkgray.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/skins/navbar3.css" />">

    <!-- ICONS -->
    <link rel="icon" type="image/png" href="<c:url value="/resources/img/favicon.ico" />">

</head>
<body class="layout-topnav">

<!-- WRAPPER -->
<div id="wrapper">
    <!-- NAVBAR -->
    <jsp:include page='../../src/main/webapp/WEB-INF/views/navbar.jsp'/>
    <!-- END NAVBAR -->
    <!-- MAIN -->
    <div class="main">
        <!-- MAIN CONTENT -->
        <div class="main-content">
            <div class="container">
                <!-- HEADING AND BREADCRUMB -->
                <div class="content-heading clearfix">
                    <div class="heading-left">
                        <h1 class="page-title-st">Products</h1>
                    </div>
                    <ul class="breadcrumb">
                        <li><a href="#"><i class="fa fa-home"></i>Home</a></li>
                        <li><a href="#">Billing</a></li>
                        <li class="active">Products</li>
                    </ul>
                </div>
                <!-- END HEADING AND BREADCRUMB -->
                <div class="row">
                    <!-- FEATURED DATATABLE -->
                    <div class="panel panel-main">
                        <div class="panel-heading">
                            <form:form class="form-horizontal" id="acct-form" method="post" action="product" modelAttribute="stripeAccount">
                                <h3 class="panel-title">All Products - ${fn:length(products)}</h3>
                                <span class="client-server stripe-blue" >SERVER SIDE</span>
                                <form:select path="accountProperties" id="stripe-account" class="panel-title right">
                                    <form:option value="" label="Select account"/>
                                    <c:forEach items="${accounts}" var="account">
                                        <form:option value="${account.accountName}" label="Account - ${account.accountName}"/>
                                    </c:forEach>
                                </form:select>
                            </form:form>
                        </div>
                        <div class="panel-body">
                            <div class="container-fluid" >
                                <div class="row">
                                    <div class="col-md-3">
                                        <button type="submit" class="btn btn-primary-stripe-blue btn-toggle-createproduct" style="float: left !important; width: 70%;"><i class="fa fa-plus"></i>New product</button>
                                    </div>
                                </div>
                                <br>
                                <div class="row" style="display: none;">
                                    <c:forEach items="${products}" var="product">
                                        <div class="col-md-6 col-lg-4">
                                            <div class="panel project-item">
                                                <div class="panel-heading">
                                                    <h2 class="panel-title">${product.id}</h2>
                                                    <div class="right">
                                                        <c:choose>
                                                            <c:when test="${product.active}">
                                                                <span class="label label-success" style="padding: 0.4em .6em .3em;">ACTIVE</span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span class="label label-danger" style="padding: 0.4em .6em .3em;">INACTIVE</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                                <div class="panel-body">
                                                    <div class="left">
                                                        <div class="info">
                                                            <span class="title">NAME</span>
                                                            <span class="value">${product.name}</span>
                                                        </div>

                                                        <div class="info">
                                                            <span class="title">STATEMENT_DESCRIPTOR</span>
                                                            <span class="value">${product.statementDescriptor}</span>
                                                        </div>
                                                    </div>
                                                    <div class="right">
                                                        <div class="info">
                                                            <span class="title">TYPE</span>
                                                            <span class="value">${product.type}</span>
                                                        </div>
                                                        <div class="info">
                                                            <span class="title">CREATED</span>
                                                            <jsp:useBean id="dateValue" class="java.util.Date"/>
                                                            <jsp:setProperty name="dateValue" property="time" value="${product.created}"/>
                                                            <span class="value"><fmt:formatDate value="${dateValue}" pattern="yy-MMM-dd HH:mm:SS"/></span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <table id="featured-datatable" class="table table-striped table-hover">
                                        <thead>
                                        <tr>
                                            <th>id</th>
                                            <th>active</th>
                                            <th>name</th>
                                            <th>type</th>
                                            <th>created</th>
                                            <th></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${products}" var="product">
                                            <tr>
                                                <td><a href="#" id="${product.id}" class="product-id">${product.id}</a></td>
                                                <td style="vertical-align: middle;">
                                                    <c:choose>
                                                        <c:when test="${product.active}">
                                                            <span class="label label-success plan-status">ACTIVE</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="label label-danger plan-status">INACTIVE</span>
                                                        </c:otherwise>
                                                    </c:choose>

                                                </td>
                                                <td>${product.name}</td>
                                                <td>${product.type}</td>

                                                <jsp:setProperty name="dateValue" property="time" value="${product.created}"/>
                                                <td><fmt:formatDate value="${dateValue}" pattern="yy-MM-dd HH:mm:ss"/></td>
                                                <td>
                                                    <div class="dropdown" style="float: right;">
                                                        <a href="#" class="toggle-dropdown" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                                                        <ul class="dropdown-menu dropdown-menu-right">
                                                            <li><a href="#" class="delete-product" id="${product.id}"><i class="fa fa-fw fa-trash-o"></i>Delete</a></li>
                                                            <c:choose>
                                                                <c:when test="${product.active}">
                                                                    <li><a href="#" class="deactive-product" id="${product.id}"><i class="fa fa-fw fa-stop-circle-o"></i>Deactive</a></li>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <li><a href="#" class="active-product" id="${product.id}"><i class="fa fa-fw fa-play-circle-o"></i>Active</a></li>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </ul>
                                                    </div>
                                                </td>

                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- END FEATURED DATATABLE -->


                </div>


            </div>
        </div>
        <!-- END MAIN CONTENT -->

        <!-- RIGHT SIDEBAR -->
        <jsp:useBean id="now" class="java.util.Date"/>

        <div id="sidebar-right" class="right-sidebar">
            <div class="sidebar-widget">
                <h4 class="widget-heading"><i class="fa fa-shopping-basket"></i> CREATE A NEW PRODUCT</h4>
            </div>
            <div class="sidebar-widget">
                <form:form class="form-horizontal" id="prdForm" method="post" action="product" modelAttribute="prd">
                <div class="row">
                    <div class="col-xs-12">

                        <div class="form-group">
                            <label class="col-xs-6 control-label" style="padding-top: 5px;">name</label>
                            <div class="col-xs-6">
                                <form:input path="name" cssStyle="height: 25px;" class="form-control" id="name" value="${product.name}" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-6 control-label">currency</label>
                            <div class="col-sm-6">
                                <form:select path="type" id="type" class="form-control" itemValue="${product.type}" cssStyle="height: 26px;">
                                    <form:option value="service" label="service"/>
                                    <form:option value="good" label="good"/>
                                </form:select>
                            </div>
                        </div>

                    </div>
                </div>
                </form:form>
                <div class="row">
                    <div class="col-xs-12">
                        <button class="btn btn-primary-stripe-green btn-toggle-create" id="create-product-btn"><i class="fa fa-plus"></i>New product</button>
                    </div>
                </div>
            </div>



        </div>
        <!-- END RIGHT SIDEBAR -->
    </div>
    <!-- END MAIN -->
</div>
<!-- END WRAPPER -->
<!-- Javascript -->
<script src="<c:url value="/resources/vendor/jquery/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/pace/pace.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/toastr/toastr.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/datatables/js-main/jquery.dataTables.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/datatables/js-bootstrap/dataTables.bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/datatables-colreorder/dataTables.colReorder.js"/>"></script>
<script src="<c:url value="/resources/vendor/datatables-tabletools/js/dataTables.tableTools.js"/>"></script>
<script src="<c:url value="/resources/scripts/klorofilpro-common.js"/>"></script>
<script src="<c:url value="/resources/scripts/stripe-playground.js"/>"></script>
<script src="https://js.stripe.com/v3/"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8.0.3/dist/sweetalert2.all.min.js"></script>
<script>

    $(function()
    {
        // toggle nav active
        $('#navBilling').toggleClass('active');
        $('#navProduct').toggleClass('active');


        // Show error message
        if (${error != null}){
            showErrorMsg("${error.event}", "${error.message}");
        }

        // show notification message
        if (${notification != null}){
            showNotification("${notification.title}", "${notification.message}");
        }

        // preselect account
        var accountName = "${account.accountName}";
        $('#stripe-account option').each(function () {
            var name = $(this).val();
            if (name === accountName){
                $(this).attr("selected", "selected");
            }
        });

        $('#create-product-btn').on('click', function () {
           $('#prdForm').append('<input type="hidden" name="accountForNewProd" value="' + accountName + '" /> ');
            $('#prdForm').append('<input type="hidden" name="createNewProduct" value="true" /> ');
            $('#prdForm').submit();
        });


        // remove [] from allow_source_type
        //var allowedSourceType = $('#allowedSourceTypes').val();
        //$('#allowedSourceTypes').val(allowedSourceType.substr(1, allowedSourceType.length-2));

        // accordion toggle collapse
        $('.project-accordion [data-toggle="collapse"]').on('click', function()
        {
            $(this).find('.toggle-icon').toggleClass('fa-minus-circle fa-plus-circle');
        });

        $('#stripe-account').on('change', function () {
            var accountName = $(this).children("option:selected").val();

            $(this).parent().append('<input type="hidden" name="accountName" value="' + accountName + '" /> ');
            $(this).parent().submit();
        });

        // datatable column with reorder extension
        $('#datatable-column-reorder').dataTable(
            {
                pagingType: "full_numbers",
                sDom: "RC" +
                    "t" +
                    "<'row'<'col-sm-6'i><'col-sm-6'p>>",
                colReorder: true,
            });
        // datatable with column filter enabled
        var dtTable = $('#datatable-column-filter').DataTable(
            { // use DataTable, not dataTable
                sDom: // redefine sDom without lengthChange and default search box
                    "t" +
                    "<'row'<'col-sm-6'i><'col-sm-6'p>>"
            });
        $('#datatable-column-filter thead').append('<tr class="row-filter"><th></th><th></th><th></th><th></th><th></th></tr>');
        $('#datatable-column-filter thead .row-filter th').each(function()
        {
            $(this).html('<input type="text" class="form-control input-sm" placeholder="Search...">');
        });
        $('#datatable-column-filter .row-filter input').on('keyup change', function()
        {
            dtTable
                .column($(this).parent().index() + ':visible')
                .search(this.value)
                .draw();
        });
        // datatable with paging options and live search
        $('#featured-datatable').dataTable(
            {
                sDom: "<'row'<'col-sm-6'l><'col-sm-6'f>r>t<'row'<'col-sm-6'i><'col-sm-6'p>>",
            });

        // datatable with scrolling
        $('#datatable-basic-scrolling').dataTable(
            {
                scrollY: "300px",
                scrollCollapse: true,
                paging: true
            });

        // create a new product
        $('.btn-toggle-createproduct').on('click', function() {
            if(!$('.right-sidebar').hasClass('active')) {
                $('.right-sidebar').addClass('active');
            } else {
                $('.right-sidebar').removeClass('active');
            }
        });

        // retrieve product details
        $('.product-id').on('click', function()
        {
            retrieveDetails("https://api.stripe.com/v1/products/" + $(this).get(0).id, "${account.accountSecretKey}");
        });

        // delete a product
        $('.delete-product').on('click', function () {
            var prodId = $(this).get(0).id;

            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                type: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Yes, delete it!'
            }).then(function (result) {
                if (result.value){
                    $.ajax({
                        type: "DELETE",
                        url: "https://api.stripe.com/v1/products/" + prodId,
                        beforeSend: function (xhr) {

                            xhr.setRequestHeader("Authorization", "Bearer ${account.accountSecretKey}");
                            xhr.setRequestHeader("X-Mobile", "false");
                        },
                        success: function(result){
                            console.log(result);
                            Swal.fire({
                                text: 'The product '  + prodId + ' has been deleted.',
                                type: 'success'
                            }).then(function(result){
                                if (result.value){
                                    window.location = getURL(window.location.href, "${account.accountName}");
                                }
                            });
                        },
                        error: function (error) {
                            console.log(error);
                        }
                    });
                }
            });
        });

        // reactive a product
        $('.active-product').on('click', function () {
            var prodId = $(this).get(0).id;

            $.ajax({
                type: "POST",
                url: "https://api.stripe.com/v1/products/" + prodId,
                data: "active=true",
                beforeSend: function (xhr) {

                    xhr.setRequestHeader("Authorization", "Bearer ${account.accountSecretKey}");
                    xhr.setRequestHeader("X-Mobile", "false");
                },
                success: function(result){
                    console.log(result);
                    Swal.fire({
                        text: 'The product '  + prodId + ' has been reactived.',
                        type: 'success'
                    }).then(function(result){
                        if (result.value){
                            window.location = getURL(window.location.href, "${account.accountName}");
                        }
                    });
                }
            });
        });

        // deactive a product
        $('.deactive-product').on('click', function () {
            var prodId = $(this).get(0).id;

            $.ajax({
                type: "POST",
                url: "https://api.stripe.com/v1/products/" + prodId,
                data: "active=false",
                beforeSend: function (xhr) {

                    xhr.setRequestHeader("Authorization", "Bearer ${account.accountSecretKey}");
                    xhr.setRequestHeader("X-Mobile", "false");
                },
                success: function(result){
                    console.log(result);
                    Swal.fire({
                        text: 'The product '  + prodId + ' has been deactived.',
                        type: 'success'
                    }).then(function(result){
                        if (result.value){
                            window.location = getURL(window.location.href, "${account.accountName}");
                        }
                    });
                }
            });
        });
    });

</script>

</body>
</html>
