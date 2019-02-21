<%--
  Created by IntelliJ IDEA.
  User: chenma
  Date: 2019-02-08
  Time: 14:54
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
    <link rel="stylesheet" href="<c:url value="/resources/css/stripe-colour.css"/>">
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
                        <h1 class="page-title-st">Webhooks</h1>
                    </div>
                    <ul class="breadcrumb">
                        <li><a href="#"><i class="fa fa-home"></i>Home</a></li>
                        <li class="active">Webhooks</li>
                    </ul>
                </div>
                <!-- END HEADING AND BREADCRUMB -->
                <!-- WEBHOOK PANEL -->
                <div class="row">
                    <div class="panel panel-main">
                        <div class="panel-heading">
                            <h3 class="panel-title">All Webhooks</h3>
                            <span class="client-server stripe-blue">SERVER SIDE</span>
                        </div>
                        <div class="panel-body" id="webhook-panel-body">
                            <div class="panel-group project-accordion webhook" id="webhook-item">
                                <div class="panel project-milestone webhook">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a href="#collapse1" data-toggle="collapse" data-parent="#accordion" class="collapsed" aria-expanded="false">
                                                 <span class="milestone-title">
                                                     <span class="label label-success plan-status label-webhook" id="event-type"></span>
                                                     <span id="event-id"></span>
                                                     <span class="event-time" id="event-time"></span>
                                                 </span>
                                                <i class="fa toggle-icon fa-plus-circle"></i>
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapse1" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
                                        <div class="panel-body">
                                            <div class="milestone-section">
                                                <h4 class="milestone-heading" id="event-type-content"></h4>
                                                <p class="milestone-description">
                                                    <pre id="webhook-content"></pre>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END PLAN PANEL -->
            </div>
            <!-- END MAIN CONTENT -->
        </div>
        <!-- END MAIN -->
    </div>
    <!-- END WRAPPER -->
    <!-- Javascript -->
    <script src="<c:url value="/resources/vendor/jquery/jquery.min.js"/>"></script>
    <script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/resources/vendor/pace/pace.min.js"/>"></script>
    <script src="<c:url value="/resources/vendor/toastr/toastr.min.js"/>"></script>
    <script src="<c:url value="/resources/scripts/klorofilpro-common.js"/>"></script>
    <script src="<c:url value="/resources/scripts/stripe-playground.js"/>"></script>
    <script src="https://js.stripe.com/v3/"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8.0.3/dist/sweetalert2.all.min.js"></script>
    <script>
        $(function() {
            receiveWebhook();
            // toggle nav active
            $('#navBilling').toggleClass('active');
            $('#navPlan').toggleClass('active');

            $('#webhook-item').hide();


            // accordion toggle collapse
            $('.project-accordion [data-toggle="collapse"]').on('click', function () {
                alert("CLICK");
                $(this).find('.toggle-icon').toggleClass('fa-minus-circle fa-plus-circle');
            });

            receiveWebhook();
        });

        function receiveWebhook(){
            var source = new EventSource("/webhook/update");

            source.onmessage = function(webhook) {

                if (webhook.data != 'null'){
                    var webhookCollection = JSON.parse(webhook.data);
                    var dataList = webhookCollection.data;

                    console.log(dataList.length);

                    for (var i=0; i<dataList.length; i++){
                        var event = JSON.parse(dataList[i]);

                        console.log(event);
                        var id = event.id;
                        var created = new Date(event.created*1000).toLocaleString();
                        var type = event.type;

                        var newWebhook = $('#webhook-item').clone().show();
                        newWebhook.attr("id", id);

                        $('#webhook-item').after(newWebhook);
                        $('#' + id +' #event-type').text(type);
                        $('#' + id +' #event-id').text(id);
                        $('#' + id +' #event-time').text(created);
                        $('#' + id +' #event-type-content').text(type);
                        $('#' + id +' #webhook-content').text(JSON.stringify(event, undefined, 3));

                        $('#' + id +' .collapsed').attr("href", "#col-" + id);
                        $('#' + id +' .panel-collapse').attr("id", "col-" + id);

                        showNotification("New webhook received!", type);
                    }
                }
            };
        };

    </script>

</body>
</html>
