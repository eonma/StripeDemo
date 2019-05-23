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
                        <h1 class="page-title-st">Plans</h1>
                    </div>
                    <ul class="breadcrumb">
                        <li><a href="#"><i class="fa fa-home"></i>Home</a></li>
                        <li><a href="#">Billing</a></li>
                        <li class="active">Plans</li>
                    </ul>
                </div>
                <!-- END HEADING AND BREADCRUMB -->
                <!-- PLAN PANEL -->
                <div class="row">
                    <div class="panel panel-main">

                        <div class="panel-heading">
                        <form:form class="form-horizontal" id="acct-form" method="post" action="plan" modelAttribute="stripeAccount">
                            <h3 class="panel-title">All Plans - ${fn:length(plans)}</h3>
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
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-md-3">
                                        <button type="submit" class="btn btn-primary-stripe-blue btn-toggle-create btn-plan"><i class="fa fa-plus"></i>New plan</button>
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <c:forEach items="${plans}" var="plan">
                                        <div class="col-md-6 col-lg-4">
                                            <c:choose>
                                                <c:when test="${plan.active}">
                                                    <div class="panel panel-second active project-item">
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="panel panel-second inactive project-item">
                                                </c:otherwise>
                                            </c:choose>

                                                <div class="panel-heading">
                                                    <h2 class="panel-title"><a href="#" id="${plan.id}" class="plan-id">${plan.id}</a></h2>
                                                    <div class="right">
                                                        <c:choose>
                                                            <c:when test="${plan.active}">
                                                                <span class="label label-success plan-status">ACTIVE</span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span class="label label-danger plan-status">INACTIVE</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <div class="dropdown" style="float: right;">
                                                            <a href="#" class="toggle-dropdown" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                                                            <ul class="dropdown-menu dropdown-menu-right">
                                                                <li><a href="#" class="delete-plan" id="${plan.id}"><i class="fa fa-fw fa-trash-o"></i>Delete</a></li>
                                                                <c:choose>
                                                                    <c:when test="${plan.active}">
                                                                        <li><a href="#" class="deactive-plan" id="${plan.id}"><i class="fa fa-fw fa-stop-circle-o"></i>Deactive</a></li>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <li><a href="#" class="active-plan" id="${plan.id}"><i class="fa fa-fw fa-play-circle-o"></i>Active</a></li>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="panel-body">
                                                    <div class="left">
                                                        <div class="info">
                                                            <span class="title">CURRENCY - AMOUNT</span>
                                                            <span class="value">${plan.currency} - ${plan.amount}</span>
                                                        </div>
                                                        <div class="info">
                                                            <span class="title">INTERVAL - COUNT</span>
                                                            <span class="value">${plan.interval} - ${plan.intervalCount}</span>
                                                        </div>
                                                        <div class="info">
                                                            <span class="title">BILLING_SCHEME</span>
                                                            <span class="value">${plan.billingScheme}</span>
                                                        </div>
                                                    </div>
                                                    <div class="right">
                                                        <div class="info">
                                                            <span class="title">CREATED</span>
                                                            <jsp:useBean id="dateValue" class="java.util.Date"/>
                                                            <jsp:setProperty name="dateValue" property="time" value="${plan.created}"/>
                                                            <span class="value"><fmt:formatDate value="${dateValue}" pattern="dd-MMM-yy HH:mm:SS"/></span>
                                                        </div>
                                                        <div class="info">
                                                            <span class="title">USAGE_TYPE</span>
                                                            <span class="value">${plan.usageType}</span>
                                                        </div>
                                                        <div class="info">
                                                            <span class="title">TRIAL_PERIOD_DAYS</span>
                                                            <span class="value">${plan.trialPeriodDays}</span>
                                                        </div>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                    <c:if test="${plan.billingScheme == 'tiered'}">
                                                        <div class="row">
                                                            <div class="panel project-item panel-plan-tiered">
                                                                <div class="panel-heading">
                                                                    <h2 class="panel-title">TIERS_MODE - ${plan.tiersMode}</h2>
                                                                </div>
                                                                <div class="panel-body body-plan-tiered">
                                                                    <c:forEach items="${plan.tiers}" var="tier">
                                                                        <div class="col-md-6 col-lg-6">
                                                                            <div class="info">
                                                                                <span class="title">UNIT_AMOUNT</span>
                                                                                <span class="value">${tier.unitAmount}</span>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-6 col-lg-6">
                                                                            <div class="info">
                                                                                <span class="title">UP_TO</span>
                                                                                <span class="value">${tier.upTo}</span>
                                                                            </div>
                                                                        </div>
                                                                    </c:forEach>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                    <div class="controls">
                                                        <a href="#" class="product-id" id="${plan.product}"><i class="fa fa-product-hunt"></i>${plan.product}</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                <!-- END PLAN PANEL -->
        </div>
        <!-- END MAIN CONTENT -->

        <!-- CREATE A PLAN -->
        <jsp:useBean id="now" class="java.util.Date"/>
        <div id="sidebar-right" class="right-sidebar">
            <div class="sidebar-widget">
                <h4 class="widget-heading"><i class="fa fa-shopping-basket"></i> CREATE A NEW PLAN</h4>
            </div>
            <div class="sidebar-widget">

                <form:form class="form-horizontal" id="plnForm" method="post" action="plan" modelAttribute="planReq">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="form-group">
                            <label class="col-xs-5 control-label" style="padding-top: 5px;"><a href="#" class="list-product" style="color: #f1f1f1; text-decoration: underline;">product</a></label>
                            <div class="col-xs-7">
                                <form:input path="product" cssStyle="height: 25px;" class="form-control" id="product" value="${planReq.product}" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-5 control-label" style="padding-top: 5px;">nickname</label>
                            <div class="col-xs-7">
                                <form:input path="nickname" cssStyle="height: 25px;" class="form-control" id="nickname" value="${planReq.nickname}" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-5 control-label" style="padding-top: 5px;">currency</label>
                            <div class="col-xs-7">
                                <form:input path="currency" cssStyle="height: 25px;" class="form-control" id="currency" value="${planReq.currency}" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-5 control-label" style="padding-top: 5px;">amount</label>
                            <div class="col-xs-7">
                                <form:input path="amount" cssStyle="height: 25px;" class="form-control" id="amount"  value="${planReq.amount}"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-5 control-label">interval</label>
                            <div class="col-sm-7">
                                <form:select path="interval" id="interval" class="form-control" itemValue="${planReq.interval}" cssStyle="height: 26px;">
                                    <form:option value="month" label="month"/>
                                    <form:option value="day" label="day"/>
                                    <form:option value="week" label="week"/>
                                    <form:option value="year" label="year"/>
                                </form:select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-5 control-label" style="padding-top: 5px;">interval_count</label>
                            <div class="col-xs-7">
                                <form:input path="interval_count" cssStyle="height: 25px;" class="form-control" id="intervalCount" value="${planReq.interval_count}" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-5 control-label">usage_type</label>
                            <div class="col-sm-7">
                                <form:select path="usage_type" id="usageType" class="form-control" itemValue="${planReq.usage_type}" cssStyle="height: 26px;">
                                    <form:option value="licensed" label="licensed"/>
                                    <form:option value="metered" label="metered"/>
                                </form:select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-5 control-label" style="padding-top: 5px;">transform_usage</label>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-7 control-label" style="padding-top: 5px;">dived_by</label>
                            <div class="col-xs-5">
                                <form:input path="transform_usage.divide_by" cssStyle="height: 25px;" class="form-control" id="divideBy" value="${planReq.transform_usage.divide_by}" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-xs-7 control-label" style="padding-top: 5px;">round</label>
                            <div class="col-xs-5">
                                <form:select path="transform_usage.round" id="round" class="form-control" itemValue="${planReq.transform_usage.round}" cssStyle="height: 26px;">
                                    <form:option value="" label="----"/>
                                    <form:option value="up" label="up"/>
                                    <form:option value="down" label="down"/>
                                </form:select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-5 control-label">billing_scheme</label>
                            <div class="col-sm-7">
                                <form:select path="billing_scheme" id="billingScheme" class="form-control" itemValue="${planReq.billing_scheme}" cssStyle="height: 26px;">
                                    <form:option value="per_unit" label="per_unit"/>
                                    <form:option value="tiered" label="tiered"/>
                                </form:select>
                            </div>
                        </div>
                        <div class="widget-header tiered-pricing">
                            <div class="form-group">
                                <label class="col-sm-5 control-label">tiers_mode</label>
                                <div class="col-sm-7">
                                    <form:select path="tiers_mode" id="tiersMode" class="form-control" itemValue="${planReq.tiers_mode}" cssStyle="height: 26px;">
                                        <form:option value="volume" label="volume"/>
                                        <form:option value="graduated" label="graduated"/>
                                    </form:select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-5 control-label" style="padding-top: 5px;">tiers</label>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-7 control-label" style="padding-top: 5px;">up_to[0]</label>
                                <div class="col-xs-5">
                                    <form:input path="tiers[0].up_to" cssStyle="height: 25px;" class="form-control" id="upto0"  />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-7 control-label" style="padding-top: 5px;">unit_amount[0]</label>
                                <div class="col-xs-5">
                                    <form:input path="tiers[0].unit_amount" cssStyle="height: 25px;" class="form-control" id="uamt1"  />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-7 control-label" style="padding-top: 5px;">up_to[1]</label>
                                <div class="col-xs-5">
                                    <form:input path="tiers[1].up_to" cssStyle="height: 25px;" class="form-control" id="upto1"  />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-7 control-label" style="padding-top: 5px;">unit_amount[1]</label>
                                <div class="col-xs-5">
                                    <form:input path="tiers[1].unit_amount" cssStyle="height: 25px;" class="form-control" id="uamt1"  />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-7 control-label" style="padding-top: 5px;">up_to[2]</label>
                                <div class="col-xs-5">
                                    <form:input path="tiers[2].up_to" cssStyle="height: 25px;" class="form-control" id="upto2"  />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-7 control-label" style="padding-top: 5px;">unit_amount[2]</label>
                                <div class="col-xs-5">
                                    <form:input path="tiers[2].unit_amount" cssStyle="height: 25px;" class="form-control" id="uamt2"  />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </form:form>
                <div class="row">
                    <div class="col-xs-12">
                        <button class="btn btn-primary-stripe-green btn-toggle-create" id="create-plan-btn"><i class="fa fa-plus"></i>New plan</button>
                    </div>
                </div>
            </div>



        </div>
        <!-- END CREATE A PLAN -->
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

    $(function()
    {
        // toggle nav active
        $('#navBilling').toggleClass('active');
        $('#navPlan').toggleClass('active');


        // accordion toggle collapse
        $('.project-accordion [data-toggle="collapse"]').on('click', function()
        {
            $(this).find('.toggle-icon').toggleClass('fa-minus-circle fa-plus-circle');
        });

        // create a new plan
        $('.btn-toggle-create').on('click', function() {
            if(!$('.right-sidebar').hasClass('active')) {
                $('.right-sidebar').addClass('active');
            } else {
                $('.right-sidebar').removeClass('active');
            }
        });

        // show tiers form
        $('.tiered-pricing').hide();
        $('#billingScheme').on('change', function() {
            //alert("CHANGE!!");

            var bs = $(this). children("option:selected").val();
            if (bs === "tiered"){
                $('.tiered-pricing').show();
            } else {
                $('.tiered-pricing').hide();
            }

        });

        // Show error message
        if (${error != null}){
            showErrorMsg("${error.event}", "${error.message}");
        }

        // show notification message
        if (${notification != null}){
            showNotification("${notification.title}", "${notification.message}");
        }

        $('#stripe-account').on('change', function () {
            var accountName = $(this).children("option:selected").val();

            $(this).parent().append('<input type="hidden" name="accountName" value="' + accountName + '" /> ');
            $(this).parent().submit();
        });

        // preselect account
        var accountName = "${account.accountName}";
        $('#stripe-account option').each(function () {
            var name = $(this).val();
            if (name === accountName){
                $(this).attr("selected", "selected");
            }
        });



        $('#create-plan-btn').on('click', function () {
            $('#plnForm').append('<input type="hidden" name="accountForNewProd" value="' + accountName + '" /> ');
            $('#plnForm').append('<input type="hidden" name="createNewPlan" value="true" /> ');
            $('#plnForm').submit();
        });


        // retrieve plan details
        $('.plan-id').on('click', function()
        {
            retrieveDetails("https://api.stripe.com/v1/plans/" + $(this).get(0).id, "${account.accountSecretKey}");
        });

        // retrieve product details
        $('.product-id').on('click', function()
        {
            retrieveDetails("https://api.stripe.com/v1/products/" + $(this).get(0).id, "${account.accountSecretKey}");
        });

        // retrieve all active products
        $('.list-product').on('click', function()
        {
            Swal.fire({
                html: '<h4>All active products</h4><pre class="product-class" style="text-align: left !important;"></pre>',
                onBeforeOpen: (
                    Swal.showLoading(),
                        function(){
                            $.ajax({
                                type : "GET",
                                url : "https://api.stripe.com/v1/products",
                                data: "active=true&limit=100",
                                beforeSend: function (xhr) {
                                    /* Authorization header */
                                    xhr.setRequestHeader("Authorization", "Bearer ${account.accountSecretKey}");
                                    xhr.setRequestHeader("X-Mobile", "false");
                                },
                                success: function(result){
                                    var product = result.data;
                                    //console.log(product);
                                    $.each( product, function( key, value ) {
                                        $('.product-class').append("product : <a href=\"#\" class=\"product-id\" id=\"" + value.id + "\">" + value.id + "</a> / " + value.name + " / " + value.type +"<br>")
                                    });

                                    // set product.id
                                    $('.product-id').on('click', function () {
                                        $('#product').val($(this).get(0).id);
                                        Swal.close();
                                    })
                                }
                            })
                        }
                )
            });

        });

        // delete a plan
        $('.delete-plan').on('click', function () {
            var planId = $(this).get(0).id;

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
                        url: "https://api.stripe.com/v1/plans/" + planId,
                        beforeSend: function (xhr) {

                            xhr.setRequestHeader("Authorization", "Bearer ${account.accountSecretKey}");
                            xhr.setRequestHeader("X-Mobile", "false");
                        },
                        success: function(result){
                            console.log(result);
                            Swal.fire({
                                text: 'The plan '  + planId + ' has been deleted.',
                                type: 'success'
                            }).then(function(result){
                                if (result.value){
                                    window.location = getURL(window.location.href, "${account.accountName}");
                                }
                            });
                        }
                    });
                }
            });
        });

        // reactive a plan
        $('.active-plan').on('click', function () {
            var planId = $(this).get(0).id;
            $.ajax({
                type: "POST",
                url: "https://api.stripe.com/v1/plans/" + planId,
                data: "active=true",
                beforeSend: function (xhr) {

                    xhr.setRequestHeader("Authorization", "Bearer ${account.accountSecretKey}");
                    xhr.setRequestHeader("X-Mobile", "false");
                },
                success: function(result){
                    console.log(result);
                    Swal.fire({
                        text: 'The plan '  + planId + ' has been reactived.',
                        type: 'success'
                    }).then(function(result){
                        if (result.value){
                            window.location = getURL(window.location.href, "${account.accountName}");
                        }
                    });
                }
            });
        });

        // deactive a plan
        $('.deactive-plan').on('click', function () {
            var planId = $(this).get(0).id;
            $.ajax({
                type: "POST",
                url: "https://api.stripe.com/v1/plans/" + planId,
                data: "active=false",
                beforeSend: function (xhr) {

                    xhr.setRequestHeader("Authorization", "Bearer ${account.accountSecretKey}");
                    xhr.setRequestHeader("X-Mobile", "false");
                },
                success: function(result){
                    console.log(result);
                    Swal.fire({
                        text: 'The plan '  + planId + ' has been deactived.',
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
