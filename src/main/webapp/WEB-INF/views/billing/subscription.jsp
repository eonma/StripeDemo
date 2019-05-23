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
    <link rel="stylesheet" href="<c:url value="/resources/vendor/sweetalert2/sweetalert2.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/vendor/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" />">

    <!-- MAIN CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/stripe.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/skins/sidebar-nav-darkgray.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/skins/navbar3.css" />">

    <!-- ICONS -->
    <link rel="icon" type="image/png" href="<c:url value="/resources/img/favicon.ico" />">
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
                        <h1 class="page-title-st">Subscriptions</h1>
                    </div>
                    <ul class="breadcrumb">
                        <li><a href="#"><i class="fa fa-home"></i>Home</a></li>
                        <li><a href="#">Billing</a></li>
                        <li><a href="#">Subscription</a></li>
                        <li class="active">Create a Subscription</li>
                    </ul>
                </div>
                <!-- END HEADING AND BREADCRUMB -->
                <div class="row">
                    <div class="col-md-12 source-panel">
                        <!-- CREATE A SOURCE -->
                        <div class="panel panel-main sub-client panel-client">
                            <div class="panel-heading">
                                <span class="client-server stripe-green">CLIENT SIDE</span>
                                <h3 class="panel-title">Create a source - client side</h3>
                                <select id="stripe-account" class="panel-title right">
                                    <option value="" label="Select account"/>
                                    <c:forEach items="${viewObj.allAccounts.accountPropertiesList}" var="account">
                                        <option value="${account.accountName}" label="Account - ${account.accountName}"/>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="panel-body">
                                <div class="col-md-6 col-md-offset-2 card-form">
                                    <div class="form-horizontal" id="client-form">
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">Name</label>
                                            <div class="col-sm-8">
                                                <input class="form-control" id="cardholder-name" type="text" value=""/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">Email</label>
                                            <div class="col-sm-8">
                                                <input class="form-control" id="cardholder-email" type="text" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">Card details</label>
                                            <div class="col-sm-8" id="stripe-card">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-8 col-sm-offset-4">
                                                <button id="source-button" class="btn btn-primary-stripe-blue" style="width: 100%"><span>Create a Source / Customer</span></button>
                                            </div>
                                        </div>
                                        <div class="form-group" id="source-display">
                                            <div class="col-sm-12">
                                                <div class="alert alert-success source" style="margin-bottom: 0; padding: 5px 10px 5px 15px;">
                                                    source_id: <a href="#" class="source-id" id="source-id"></a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group" id="customer-display">
                                            <div class="col-sm-12">
                                                <div class="alert alert-success customer" style="margin-bottom: 0; padding: 5px 10px 5px 15px;">
                                                    customer_id: <a href="#" class="customer-id" id="customer-id"></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6 pi-response">
                                </div>
                            </div>
                        </div>
                        <!-- END CREATE A SOURCE -->
                    </div>
                    <div class="col-md-7 sub-panel">
                        <div class="panel panel-main panel-tab">
                            <div class="panel-heading">
                                <span class="client-server stripe-blue">SERVER SIDE</span>
                                <h3 class="panel-title">Create a subscription</h3>
                            </div>
                            <div class="panel-body">
                                <form:form class="form-horizontal" id="subForm"  modelAttribute="subReq">
                                    <div class="project-info">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-sm-6 control-label">customer</label>
                                                    <div class="col-sm-6">
                                                        <form:input path="customer" class="form-control" id="customer" value="${subReq.customer}" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-6 control-label"><a href="#" class="list-plan" id="0">items[0][plan]</a></label>
                                                    <div class="col-sm-6">
                                                        <form:input path="items[0].plan" class="form-control" id="item0plan" value="${subReq.items[0].plan}" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-6 control-label">items[0][quantity]</label>
                                                    <div class="col-sm-6">
                                                        <form:input path="items[0].quantity" class="form-control" id="item0quantity" value="${subReq.items[0].quantity}" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-6 control-label"><a href="#" class="list-plan" id="1">items[1][plan]</a></label>
                                                    <div class="col-sm-6">
                                                        <form:input path="items[1].plan" class="form-control" id="item1plan" value="${subReq.items[1].plan}" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-6 control-label">items[1][quantity]</label>
                                                    <div class="col-sm-6">
                                                        <form:input path="items[1].quantity" class="form-control" id="item1quantity" value="${subReq.items[1].quantity}" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-6 control-label">coupon</label>
                                                    <div class="col-sm-6">
                                                        <form:input path="coupon" class="form-control" id="coupon" value="${subReq.coupon}" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-6 control-label">app_fee_percent</label>
                                                    <div class="col-sm-6">
                                                        <form:input path="application_fee_percent" class="form-control" id="appFeePercent" value="${subReq.application_fee_percent}" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-sm-6 control-label">billing</label>
                                                    <div class="col-sm-6">
                                                        <form:select path="billing" id="billing" class="form-control" itemValue="${subReq.billing}">
                                                            <form:option value="charge_automatically" label="auto"/>
                                                            <form:option value="send_invoice" label="invoice"/>
                                                        </form:select>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-6 control-label">cancel_at_end</label>
                                                    <div class="col-sm-6">
                                                        <form:select path="cancel_at_period_end" id="cancelAtEnd" class="form-control" itemValue="${subReq.cancel_at_period_end}">
                                                            <form:option value="" label="----"/>
                                                            <form:option value="true" label="true"/>
                                                            <form:option value="false" label="false"/>
                                                        </form:select>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-6 control-label">prorate</label>
                                                    <div class="col-sm-6">
                                                        <form:select path="prorate" id="prorate" class="form-control" itemValue="${subReq.prorate}">
                                                            <form:option value="" label="----"/>
                                                            <form:option value="true" label="true"/>
                                                            <form:option value="false" label="false"/>
                                                        </form:select>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-6 control-label">billing_cycle_anchor</label>
                                                    <div class="col-sm-6">

                                                        <%--<form:input path="billing_cycle_anchor" class="form-control" id="billingCycleAnchor" value="${subReq.billing_cycle_anchor}" />--%>

                                                        <div class="input-group date" data-date-autoclose="true" data-provide="datepicker">
                                                            <form:input path="billing_cycle_anchor" type="text" class="form-control" value="${subReq.billing_cycle_anchor }"/>
                                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-6 control-label">tax_percent</label>
                                                    <div class="col-sm-6">
                                                        <form:input path="tax_percent" class="form-control" id="taxPercent" value="${subReq.tax_percent}" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-6 control-label">days_until_due</label>
                                                    <div class="col-sm-6">
                                                        <form:input path="days_until_due" class="form-control" id="daysUntilDue" value="${subReq.days_until_due}" />
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-6 control-label">trial_period_days</label>
                                                    <div class="col-sm-6">
                                                        <form:input path="trial_period_days" class="form-control" id="trialPeriodDays" value="${subReq.trial_period_days}" />
                                                    </div>
                                                </div>
                                                <input type="hidden" id="account-name" name="accountName" value=""/>
                                            </div>
                                        </div>
                                    </div>
                                </form:form>
                                <div class="row">
                                    <div class="col-md-6 col-md-offset-6">
                                        <button class="btn btn-primary-stripe-blue create-sub-req">Submit Request</button>
                                    </div>
                                </div>

                                <div class="row sub-result">
                                    <br>
                                    <div class="col-sm-12">
                                        <div class="alert alert-success subscription" style="margin-bottom: 0; padding: 5px 10px 5px 15px;">
                                            subscription_id: <a href="#" class="sub-id" id="sub-id"></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
<script src="<c:url value="/resources/vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js" />"></script>
<script src="https://js.stripe.com/v3/"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8.0.3/dist/sweetalert2.all.min.js"></script>
<script>

    $(function()
    {
        // toggle nav active
        $('#navBilling').toggleClass('active');
        $('#navSub').toggleClass('active');
        $('#navSubCreate').toggleClass('active');

        // accordion toggle collapse
        $('.project-accordion [data-toggle="collapse"]').on('click', function()
        {
            $(this).find('.toggle-icon').toggleClass('fa-minus-circle fa-plus-circle');
        });

        $('.pi-response').hide();
        $('.sub-panel').hide();
        $('#source-display').hide();
        $('#customer-display').hide();
        $('.sub-result').hide();
        $('#client-form').hide();

        // render Stripe elements when changing account
        var account;

        // preselect account
        var currentAccount = "${viewObj.currentAccount.accountName}";
        console.log(currentAccount);

        $('#stripe-account option').each(function () {
            var name = $(this).val();
            if (name === currentAccount){
                $(this).attr("selected", "selected");
            }
        });

        if (currentAccount != ""){
            $('#client-form').show();

            var stripe = Stripe("${viewObj.currentAccount.accountPublishKey}", {
                betas: ['payment_intent_beta_3']
            });

            renderStripeElements(stripe, "${viewObj.currentAccount.accountSecretKey}");
        }

        $('#stripe-account').on('change', function () {
            var accountName = $(this).children("option:selected").val();
            $('#account-name').val(accountName);

            if (accountName != ""){
                $('#client-form').show();
                $.ajax({
                    type : "GET",
                    url : "getAccount",
                    data: "acctName="+accountName,
                    success: function(result){
                        account = result;

                        var stripe = Stripe(result.accountPublishKey, {
                            betas: ['payment_intent_beta_3']
                        });
                        renderStripeElements(stripe, result.accountSecretKey);
                    }
                });
            } else {
                $('#client-form').hide();
                $('#card-element').remove();
            }
        });


        // retrieve source details
        $('.source-id').on('click', function()
        {
            retrieveDetails("https://api.stripe.com/v1/sources/" + $(this).get(0).id, account.accountSecretKey);
        });

        // retrieve customer details
        $('.customer-id').on('click', function()
        {
            retrieveDetails("https://api.stripe.com/v1/customers/" + $(this).get(0).id, account.accountSecretKey);
        });

        // retrieve subscription details
        $('.sub-id').on('click', function()
        {
            retrieveDetails("https://api.stripe.com/v1/subscriptions/" + $(this).get(0).id, account.accountSecretKey);
        });

        // retrieve all active plans
        $('.list-plan').on('click', function()
        {
            var id = $(this).get(0).id;
            console.log(id);
            Swal.fire({
                html: '<h4>All active plans</h4><pre class="plan-class" style="text-align: left !important;"></pre>',
                onBeforeOpen: (
                    Swal.showLoading(),
                        function(){
                            $.ajax({
                                type : "GET",
                                url : "https://api.stripe.com/v1/plans",
                                data: "active=true&limit=100",
                                beforeSend: function (xhr) {
                                    /* Authorization header */
                                    xhr.setRequestHeader("Authorization", "Bearer " + account.accountSecretKey);
                                    xhr.setRequestHeader("X-Mobile", "false");
                                },
                                success: function(result){
                                    var plan = result.data;
                                    $.each( plan, function( key, value ) {
                                       $('.plan-class').append("plan : <a href=\"#\" class=\"plan-id\" id=\"" + value.id + "\">" + value.id + "</a> / " + value.nickname + " / " + value.billing_scheme +"<br>")
                                    });
                                    // set plan.id
                                    $('.plan-id').on('click', function () {
                                        $('#item' + id + "plan").val($(this).get(0).id);
                                        Swal.close();
                                    })
                                }
                            })
                        }
                )
            });

        });

        // date picker
        $('.input-group.date').datepicker({
            daysOfWeekDisabled: "0,6",
            autoclose: true,
            todayHighlight: true
        });

        // create subscription request
        $('.create-sub-req').on('click', function(){
            $('.toast-error').hide();
            $('.create-sub-req').append(" <i class=\"fa fa-spinner fa-spin card-btn-spinner\"></i>");
            $('.create-sub-req').prop('disabled', true);

            $.ajax({
                type : "POST",
                url : "subscription",
                dataType : "json",
                data: $('#subForm').serialize(),
                success: function(result){

                    if (result.error){
                        console.log("Error");
                        showErrorMsg(result.body.event, result.body.message);
                    } else {
                        $('.sub-id').append(result.body.id);
                        $('.sub-id').attr("id", result.body.id);
                        $('.sub-result').show(500);
                    }
                    $('.create-sub-req').find('.card-btn-spinner').remove();
                    $('.create-sub-req').prop('disabled', false);
                }
            });

        });

    });

    // Render Stripe Elements
    function renderStripeElements(stripe, secretKey){
        $('#card-element').remove();
        $('#stripe-card').append("<div id=\"card-element\"></div>");


        var elements = stripe.elements();
        var cardElement = elements.create('card', {hidePostalCode:true, style:style});
        cardElement.mount('#card-element');

        var style = {
            base: {
                color: '#5e6773',
                fontSize: '14px',
                '::placeholder': {
                    color: '#ccc',
                },
            },
            complete: {
                color: '#1ea672',
            },
            invalid: {
                color: '#e5424d',
                ':focus': {
                    color: '#303238',
                },
            },
        };


        $('#source-button').on('click', function(){
            $('#source-button').append("<i class=\"fa fa-spinner fa-spin card-btn-spinner\"></i>");
            $('#source-button').prop('disabled', true);

            stripe.createSource(cardElement, {
                type: 'card',
                owner: {
                    name: $('#cardholder-name').val(),
                    email: $('#cardholder-email').val()
                },
            }).then(function(result) {
                handleResult(result, secretKey);
            });
        });
    }
    function handleResult(result, accountSecretKey){
        // keep card form on the left
        var hasResponse = $('.pi-response:visible').length;
        if (hasResponse===0){
            $('.card-form').toggleClass('col-md-offset-2', 500);
        }

        // remove pi-response-log
        $('.pi-response').find('.alert').remove();

        if (result.error) {
            // Display error.message in your UI.
            $('.pi-response').append("<div class=\"alert alert-danger\"><i class=\"fa fa-times-circle\"></i> Error!</div>");
            $('.pi-response').find('.alert').append("<pre class=\"pi-response-log\"></pre>");
            $('.pi-response-log').text(JSON.stringify(result.error, null, 3));
            $('.pi-response').show(500);
            $('#source-button').find('.card-btn-spinner').remove();
            $('#source-button').prop('disabled', false);
        } else {
            // Move client side panel to left
            $('.source-panel').toggleClass("col-md-12", 500).toggleClass("col-md-5", 500);
            $('.card-form').toggleClass("col-md-6", 500);
            $('#source-button').find('.card-btn-spinner').remove();// remove spinner

            // Show source_id on screen
            $('.source-id').append(result.source.id);
            $('.source-id').attr("id", result.source.id);
            $('#source-display').show();
            // Create a customer using this source
            //var customer = createCustomer(result.source.id, result.source.owner.email, result.source.owner.name);
            $.ajax({
                type : "POST",
                url : "https://api.stripe.com/v1/customers",
                data: "source=" + result.source.id + "&email=" + result.source.owner.email + "&description=" + result.source.owner.name,
                beforeSend: function (xhr) {
                    /* Authorization header */
                    xhr.setRequestHeader("Authorization", "Bearer " + accountSecretKey);
                    xhr.setRequestHeader("X-Mobile", "false");
                },
                success: function(result){

                    $('.customer-id').append(result.id);
                    $('.customer-id').attr("id", result.id);
                    $('#customer-display').show();

                    // Show create subscription panel
                    $('.sub-panel').show(500);
                    $('#customer').val(result.id);


                    // disable account selection
                    $('#stripe-account option').each(function () {
                        $(this).attr("disabled", "disabled");
                    })
                }
            })

        }
    }


</script>

</body>
</html>
