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
            <div class="content-heading clearfix">
                <div class="heading-left">
                    <h1 class="page-title">Projects</h1>
                    <p class="page-subtitle">List of project information summary</p>
                </div>
                <ul class="breadcrumb">
                    <li><a href="#"><i class="fa fa-home"></i> Home</a></li>
                    <li><a href="#">App Views</a></li>
                    <li class="active">Project List</li>
                </ul>
            </div>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6 col-lg-4">
                        <div class="panel project-item">
                            <div class="panel-heading">
                                <h2 class="panel-title"><a href="#">SEO and Growth Project</a></h2>
                                <div class="right">
                                    <span class="label label-success">RUNNING</span>
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="left">
                                    <div class="info">
                                        <span class="title">DURATION</span>
                                        <span class="value">Jul 23, 2017 - Oct 01, 2017</span>
                                    </div>
                                    <div class="info">
                                        <span class="title">ESTIMATED VALUE</span>
                                        <span class="value">$21,847</span>
                                    </div>
                                    <div class="info">
                                        <span class="title">LEADER</span>
                                        <span class="value">
													<img src="assets/img/people/male1.png" class="leader-picture" alt=""> Stephen Burke</span>
                                    </div>
                                </div>
                                <div class="right">
                                    <div class="progress-chart easy-pie-chart" data-percent="65">
                                        <span class="percent">65%</span>
                                    </div>
                                    <div class="task">
                                        <div class="task-progress">14/60 tasks completed</div>
                                        <a href="#" class="btn btn-default btn-xs"><i class="fa fa-plus"></i> Add Task</a>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="controls">
                                    <a href="#"><i class="fa fa-eye"></i>View Details</a>
                                    <a href="#"><i class="fa fa-cloud-download"></i>Download Project File</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4">
                        <div class="panel project-item">
                            <div class="panel-heading">
                                <h2 class="panel-title"><a href="#">B2B eCommerce</a></h2>
                                <div class="right">
                                    <span class="label label-pending">PENDING</span>
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="left">
                                    <div class="info">
                                        <span class="title">DURATION</span>
                                        <span class="value">Jul 23, 2017 - Oct 01, 2017</span>
                                    </div>
                                    <div class="info">
                                        <span class="title">ESTIMATED VALUE</span>
                                        <span class="value">$21,847</span>
                                    </div>
                                    <div class="info">
                                        <span class="title">LEADER</span>
                                        <span class="value">
													<img src="assets/img/people/female2.png" class="leader-picture" alt=""> Diana Berry </span>
                                    </div>
                                </div>
                                <div class="right">
                                    <div class="progress-chart easy-pie-chart" data-percent="30">
                                        <span class="percent">30%</span>
                                    </div>
                                    <div class="task">
                                        <div class="task-progress">29/50 tasks completed</div>
                                        <a href="#" class="btn btn-default btn-xs"><i class="fa fa-plus"></i> Add Task</a>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="controls">
                                    <a href="#"><i class="fa fa-eye"></i>View Details</a>
                                    <a href="#"><i class="fa fa-cloud-download"></i>Download Project File</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4">
                        <div class="panel project-item">
                            <div class="panel-heading">
                                <h2 class="panel-title"><a href="#">WordPress Theme</a></h2>
                                <div class="right">
                                    <span class="label label-danger">TERMINATED</span>
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="left">
                                    <div class="info">
                                        <span class="title">DURATION</span>
                                        <span class="value">FEB 23, 2017 - Jul 01, 2017</span>
                                    </div>
                                    <div class="info">
                                        <span class="title">ESTIMATED VALUE</span>
                                        <span class="value">$5,400</span>
                                    </div>
                                    <div class="info">
                                        <span class="title">LEADER</span>
                                        <span class="value">
													<img src="assets/img/people/female3.png" class="leader-picture" alt=""> Carol Wilson</span>
                                    </div>
                                </div>
                                <div class="right">
                                    <div class="progress-chart easy-pie-chart" data-percent="12">
                                        <span class="percent">12%</span>
                                    </div>
                                    <div class="task">
                                        <div class="task-progress">7/20 tasks completed</div>
                                        <a href="#" class="btn btn-default btn-xs"><i class="fa fa-plus"></i> Add Task</a>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="controls">
                                    <a href="#"><i class="fa fa-eye"></i>View Details</a>
                                    <a href="#"><i class="fa fa-cloud-download"></i>Download Project File</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4">
                        <div class="panel project-item">
                            <div class="panel-heading">
                                <h2 class="panel-title"><a href="#">Redesign Landing Page</a></h2>
                                <div class="right">
                                    <span class="label label-success">RUNNING</span>
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="left">
                                    <div class="info">
                                        <span class="title">DURATION</span>
                                        <span class="value">Jul 23, 2017 - Oct 01, 2017</span>
                                    </div>
                                    <div class="info">
                                        <span class="title">ESTIMATED VALUE</span>
                                        <span class="value">$1,000</span>
                                    </div>
                                    <div class="info">
                                        <span class="title">LEADER</span>
                                        <span class="value">
													<img src="assets/img/people/male2.png" class="leader-picture" alt=""> Sean Meyer</span>
                                    </div>
                                </div>
                                <div class="right">
                                    <div class="progress-chart easy-pie-chart" data-percent="90">
                                        <span class="percent">90%</span>
                                    </div>
                                    <div class="task">
                                        <div class="task-progress">3/15 tasks completed</div>
                                        <a href="#" class="btn btn-default btn-xs"><i class="fa fa-plus"></i> Add Task</a>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="controls">
                                    <a href="#"><i class="fa fa-eye"></i>View Details</a>
                                    <a href="#"><i class="fa fa-cloud-download"></i>Download Project File</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4">
                        <div class="panel project-item">
                            <div class="panel-heading">
                                <h2 class="panel-title"><a href="#">Branding and Campaign</a></h2>
                                <div class="right">
                                    <span class="label label-success">RUNNING</span>
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="left">
                                    <div class="info">
                                        <span class="title">DURATION</span>
                                        <span class="value">Jul 23, 2017 - Oct 01, 2017</span>
                                    </div>
                                    <div class="info">
                                        <span class="title">ESTIMATED VALUE</span>
                                        <span class="value">$21,847</span>
                                    </div>
                                    <div class="info">
                                        <span class="title">LEADER</span>
                                        <span class="value">
													<img src="assets/img/people/female4.png" class="leader-picture" alt=""> Sara Mason</span>
                                    </div>
                                </div>
                                <div class="right">
                                    <div class="progress-chart easy-pie-chart" data-percent="35">
                                        <span class="percent">35%</span>
                                    </div>
                                    <div class="task">
                                        <div class="task-progress">14/60 tasks completed</div>
                                        <a href="#" class="btn btn-default btn-xs"><i class="fa fa-plus"></i> Add Task</a>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="controls">
                                    <a href="#"><i class="fa fa-eye"></i>View Details</a>
                                    <a href="#"><i class="fa fa-cloud-download"></i>Download Project File</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4">
                        <div class="panel project-item">
                            <div class="panel-heading">
                                <h2 class="panel-title"><a href="#">Project 123GO</a></h2>
                                <div class="right">
                                    <span class="label label-pending">PENDING</span>
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="left">
                                    <div class="info">
                                        <span class="title">DURATION</span>
                                        <span class="value">Jul 23, 2017 - Oct 01, 2017</span>
                                    </div>
                                    <div class="info">
                                        <span class="title">ESTIMATED VALUE</span>
                                        <span class="value">$21,847</span>
                                    </div>
                                    <div class="info">
                                        <span class="title">LEADER</span>
                                        <span class="value">
													<img src="assets/img/people/male1.png" class="leader-picture" alt=""> Stephen Burke</span>
                                    </div>
                                </div>
                                <div class="right">
                                    <div class="progress-chart easy-pie-chart" data-percent="40">
                                        <span class="percent">40%</span>
                                    </div>
                                    <div class="task">
                                        <div class="task-progress">14/60 tasks completed</div>
                                        <a href="#" class="btn btn-default btn-xs"><i class="fa fa-plus"></i> Add Task</a>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="controls">
                                    <a href="#"><i class="fa fa-eye"></i>View Details</a>
                                    <a href="#"><i class="fa fa-cloud-download"></i>Download Project File</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4">
                        <div class="panel project-item">
                            <div class="panel-heading">
                                <h2 class="panel-title"><a href="#">Company Rebranding</a></h2>
                                <div class="right">
                                    <span class="label label-danger">TERMINATED</span>
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="left">
                                    <div class="info">
                                        <span class="title">DURATION</span>
                                        <span class="value">FEB 23, 2017 - Jul 01, 2017</span>
                                    </div>
                                    <div class="info">
                                        <span class="title">ESTIMATED VALUE</span>
                                        <span class="value">$5,400</span>
                                    </div>
                                    <div class="info">
                                        <span class="title">LEADER</span>
                                        <span class="value">
													<img src="assets/img/people/female3.png" class="leader-picture" alt=""> Carol Wilson</span>
                                    </div>
                                </div>
                                <div class="right">
                                    <div class="progress-chart easy-pie-chart" data-percent="9">
                                        <span class="percent">9%</span>
                                    </div>
                                    <div class="task">
                                        <div class="task-progress">3/10 tasks completed</div>
                                        <a href="#" class="btn btn-default btn-xs"><i class="fa fa-plus"></i> Add Task</a>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="controls">
                                    <a href="#"><i class="fa fa-eye"></i>View Details</a>
                                    <a href="#"><i class="fa fa-cloud-download"></i>Download Project File</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4">
                        <div class="panel project-item">
                            <div class="panel-heading">
                                <h2 class="panel-title"><a href="#">Redesign Landing Page</a></h2>
                                <div class="right">
                                    <span class="label label-success">RUNNING</span>
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="left">
                                    <div class="info">
                                        <span class="title">DURATION</span>
                                        <span class="value">Jul 23, 2017 - Oct 01, 2017</span>
                                    </div>
                                    <div class="info">
                                        <span class="title">ESTIMATED VALUE</span>
                                        <span class="value">$1,000</span>
                                    </div>
                                    <div class="info">
                                        <span class="title">LEADER</span>
                                        <span class="value">
													<img src="assets/img/people/male1.png" class="leader-picture" alt=""> Stephen Burke</span>
                                    </div>
                                </div>
                                <div class="right">
                                    <div class="progress-chart easy-pie-chart" data-percent="90">
                                        <span class="percent">90%</span>
                                    </div>
                                    <div class="task">
                                        <div class="task-progress">3/15 tasks completed</div>
                                        <a href="#" class="btn btn-default btn-xs"><i class="fa fa-plus"></i> Add Task</a>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="controls">
                                    <a href="#"><i class="fa fa-eye"></i>View Details</a>
                                    <a href="#"><i class="fa fa-cloud-download"></i>Download Project File</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4">
                        <div class="panel project-item">
                            <div class="panel-heading">
                                <h2 class="panel-title"><a href="#">B2B eCommerce</a></h2>
                                <div class="right">
                                    <span class="label label-pending">PENDING</span>
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="left">
                                    <div class="info">
                                        <span class="title">DURATION</span>
                                        <span class="value">Jul 23, 2017 - Oct 01, 2017</span>
                                    </div>
                                    <div class="info">
                                        <span class="title">ESTIMATED VALUE</span>
                                        <span class="value">$21,847</span>
                                    </div>
                                    <div class="info">
                                        <span class="title">LEADER</span>
                                        <span class="value">
													<img src="assets/img/people/female2.png" class="leader-picture" alt=""> Diana Berry </span>
                                    </div>
                                </div>
                                <div class="right">
                                    <div class="progress-chart easy-pie-chart" data-percent="30">
                                        <span class="percent">30%</span>
                                    </div>
                                    <div class="task">
                                        <div class="task-progress">29/50 tasks completed</div>
                                        <a href="#" class="btn btn-default btn-xs"><i class="fa fa-plus"></i> Add Task</a>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="controls">
                                    <a href="#"><i class="fa fa-eye"></i>View Details</a>
                                    <a href="#"><i class="fa fa-cloud-download"></i>Download Project File</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END MAIN CONTENT -->

        <!-- RIGHT SIDEBAR -->
        <jsp:useBean id="now" class="java.util.Date"/>

        <div id="sidebar-right" class="right-sidebar">
            <div class="sidebar-widget">
                <h4 class="widget-heading"><i class="fa fa-shopping-basket"></i> CREATE A NEW PLAN</h4>
            </div>
            <form:form class="form-horizontal" id="plnForm" method="post" action="plan" modelAttribute="pln">
                <div class="sidebar-widget">
                    <div class="row">
                        <div class="col-xs-12">

                            <div class="form-group">
                                <label class="col-xs-6 control-label" style="padding-top: 5px;">currency</label>
                                <div class="col-xs-6">
                                    <form:input path="currency" cssStyle="height: 25px;" class="form-control" id="currency" value="${pln.currency}" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-6 control-label">interval</label>
                                <div class="col-sm-6">
                                    <form:select path="interval" id="interval" class="form-control" itemValue="${pln.interval}">
                                        <form:option value="month" label="month"/>
                                        <form:option value="day" label="day"/>
                                        <form:option value="week" label="week"/>
                                        <form:option value="year" label="year"/>
                                    </form:select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-6 control-label" style="padding-top: 5px;">product</label>
                                <div class="col-xs-6">
                                    <form:input path="product" cssStyle="height: 25px;" class="form-control" id="product" value="${pln.product}" />
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <button type="submit" class="btn btn-primary-stripe-slate btn-toggle-create"><i class="fa fa-plus"></i>New plan</button>
                        </div>
                    </div>
                </div>
            </form:form>
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

        // create a new product
        $('.btn-toggle-create').on('click', function() {
            if(!$('.right-sidebar').hasClass('active')) {
                $('.right-sidebar').addClass('active');
            } else {
                $('.right-sidebar').removeClass('active');
            }
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
