<%--
  Created by IntelliJ IDEA.
  User: chenma
  Date: 2019-01-15
  Time: 09:25
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
    <jsp:include page='../navbar.jsp'/>
    <!-- END NAVBAR -->
    <!-- MAIN -->
    <div class="main">
        <!-- MAIN CONTENT -->
        <div class="main-content">
            <div class="container">
                <!-- HEADING AND BREADCRUMB -->
                <div class="content-heading clearfix">
                    <div class="heading-left">
                        <h1 class="page-title-st">Customers</h1>
                    </div>
                    <ul class="breadcrumb">
                        <li><a href="#"><i class="fa fa-home"></i>Home</a></li>
                        <li><a href="#">Customers</a></li>
                        <li class="active">List customers</li>
                    </ul>
                </div>
                <!-- END HEADING AND BREADCRUMB -->
                <div class="row">


                    <!-- FEATURED DATATABLE -->
                    <div class="panel">
                        <div class="panel-heading">
                            <h3 class="panel-title">Featured Datatable</h3>
                        </div>
                        <div class="panel-body">
                            <p class="alert alert-info">Added paging options and live search</p>
                            <table id="featured-datatable" class="table table-striped table-hover">
                                <thead>
                                <tr>
                                    <th>id</th>
                                    <th>description</th>
                                    <th>source(<i class="fa fa-check icon-indicator text-success"></i> = default)</th>
                                    <th>source type</th>
                                    <th>subscription</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${customers}" var="customer">
                                    <tr>
                                        <td><a href="customer/${customer.id}">${customer.id}</a></td>
                                        <td>${customer.description}</td>
                                        <td>
                                            <c:forEach items="${customer.sources}" var="source">
                                                <c:if test="${customer.defaultSource == source}">
                                                    <i class="fa fa-check icon-indicator text-success"></i>
                                                </c:if>
                                                <a href="source/${source}">${source}</a>
                                                <br>
                                            </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach items="${customer.sourceTypes}" var="type">
                                                ${type}
                                                <br>
                                            </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach items="${customer.subscriptions}" var="sub">
                                                <a href="subscriptions/${sub}">${sub}</a>
                                                <br>
                                            </c:forEach>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- END FEATURED DATATABLE -->


                </div>


            </div>
        </div>
        <!-- END MAIN CONTENT -->

        <!-- RIGHT SIDEBAR -->
        <jsp:include page='../sidebar.jsp'/>
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
<script src="https://js.stripe.com/v3/"></script>
<script>

    $(function()
    {
        // toggle nav active
        $('#navPayment').toggleClass('active');
        $('#navPi').toggleClass('active');
        $('#navCreatePi').toggleClass('active');

        // remove [] from allow_source_type
        //var allowedSourceType = $('#allowedSourceTypes').val();
        //$('#allowedSourceTypes').val(allowedSourceType.substr(1, allowedSourceType.length-2));

        // accordion toggle collapse
        $('.project-accordion [data-toggle="collapse"]').on('click', function()
        {
            $(this).find('.toggle-icon').toggleClass('fa-minus-circle fa-plus-circle');
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
        // datatable with export feature
        var exportTable = $('#datatable-data-export').DataTable(
            {
                sDom: "T<'clearfix'>" +
                    "<'row'<'col-sm-6'l><'col-sm-6'f>r>" +
                    "t" +
                    "<'row'<'col-sm-6'i><'col-sm-6'p>>",
                "tableTools":
                    {
                        "sSwfPath": "assets/vendor/datatables-tabletools/swf/copy_csv_xls_pdf.swf"
                    }
            });
        // datatable with scrolling
        $('#datatable-basic-scrolling').dataTable(
            {
                scrollY: "300px",
                scrollCollapse: true,
                paging: false
            });
    });



    function showErrorMsg(title, msg){

        toastr.options = {
            "closeButton": true,
            "debug": false,
            "newestOnTop": false,
            "progressBar": false,
            "positionClass": "toast-top-full-width",
            "preventDuplicates": false,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "0",
            "extendedTimeOut": "0",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        };
        toastr.error(msg, title);
    }
</script>

</body>
</html>