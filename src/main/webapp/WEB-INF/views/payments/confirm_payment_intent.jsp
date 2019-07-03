<%--
  Created by IntelliJ IDEA.
  User: chenma
  Date: 2019-04-14
  Time: 10:27
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
    <link rel="stylesheet" href="<c:url value="/resources/vendor/bootstrap-multiselect/bootstrap-multiselect.css"/>">

    <!-- MAIN CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/stripe.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/skins/sidebar-nav-darkgray.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/css/skins/navbar3.css" />">

    <!-- ICONS -->
    <link rel="icon" type="image/png" href="<c:url value="/resources/img/favicon.ico" />">

</head>

<body class="layout-topnav">
<div id="wrapper">
    <!-- NAVBAR -->
    <jsp:include page='../navbar.jsp'/>
    <!-- END NAVBAR -->

    <!-- MAIN -->
    <div class="main">
        <div class="main-content">
            <div class="container">
                <!-- HEADING AND BREADCRUMB -->
                <div class="content-heading clearfix">
                    <div class="heading-left">
                        <h1 class="page-title-st">Confirm a PaymentIntent</h1>
                    </div>
                    <!-- Account selection -->
                    <div class="account-select">
                        <select id="stripe-account" class="acct-sel" >
                            <option value="" label="Select account"/>
                            <c:forEach items="${viewObj.allAccounts.accountPropertiesList}" var="account">
                                <option value="${account.accountName}" label="Account - ${account.accountName}"/>
                            </c:forEach>
                        </select>
                    </div>
                    <ul class="breadcrumb">
                        <li><a href="/"><i class="fa fa-home"></i>Home</a></li>
                        <li><a href="/payments">Payments</a></li>
                        <li class="active">Confirm a PaymentIntent</li>
                    </ul>
                </div>
                <!-- END HEADING AND BREADCRUMB -->

                <!-- SERVER SIDE PANEL - Confirm PI -->
                <div class="row" id="confirm-params">
                    <div class="panel panel-main panel-server panel-tab">
                        <div class="panel-heading">
                            <span class="client-server stripe-blue">SERVER</span>
                            <a name="server"><h3 class="panel-title"><span class="label label-success api-method">POST</span>/v1/payment_intents/:id/confirm</h3></a>
                            <ul class="nav nav-tabs pull-right">
                                <li id="tabReq-conf" class="active"><a href="#reqTab-conf" data-toggle="tab"></i> REQUEST</a></li>
                                <li id="tabRes-conf"><a href="#resTab-conf" data-toggle="tab"></i> RESPONSE </a></li>
                            </ul>
                        </div>
                        <div class="panel-body tab-content">
                            <!-- REQUEST TAB -->
                            <div class="tab-pane fade in active" id="reqTab-conf">
                                <div class="form-horizontal" >
                                    <!-- BASIC PARAMETERS -->
                                    <div class="row">
                                        <form id="piConfForm">
                                            <!-- HIDDEN PARAMS -->
                                            <input type="hidden" name="accountName" value=""/>
                                            <!-- END HIDDEN PARAMS -->
                                            <div class="col-md-4">
                                                <div class="form-group last-row">
                                                    <label class="col-sm-5 control-label">payment_intent_id</label>
                                                    <div class="col-sm-7">
                                                        <input class="form-control" id="intent" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group last-row">
                                                    <label class="col-sm-5 control-label">off_session</label>
                                                    <div class="col-sm-7 dropdown-select">
                                                        <select name="off_session" id="offSession" class="form-control">
                                                            <option value="" label="----"/>
                                                            <option value="recurring" label="recurring"/>
                                                            <option value="one_off" label="one_off"/>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group last-row">
                                                    <label class="col-sm-5 control-label">save_payment_method</label>
                                                    <div class="col-sm-7 dropdown-select">
                                                        <select name="save_payment_method" id="savePM" class="form-control">
                                                            <option value="" label="----"/>
                                                            <option value="true" label="true"/>
                                                            <option value="false" label="false"/>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <!-- END BASIC PARAMETERS -->
                                </div>
                            </div>

                            <!-- RESPONSE TAB -->
                            <div class="tab-pane fade" id="resTab-conf">
                                <h5>Confirm PaymentIntent Response</h5>
                                <pre id="piConfResponse"></pre>
                            </div>


                        </div>
                        <div class="panel-footer">
                            <button data-toggle="" class="btn btn-primary-stripe-blue" id="pi-confirm-btn">Confirm a Payment Intent</button>
                        </div>
                    </div>
                </div>
                <!-- END SERVER SIDE PANEL - Confirm PI -->
            </div>
        </div>
    </div>
    <!-- END MAIN -->
</div>

<!-- Javascript -->
<script src="<c:url value="/resources/vendor/jquery/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/pace/pace.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/toastr/toastr.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/bootstrap-multiselect/bootstrap-multiselect.js"/>"></script>
<script src="<c:url value="/resources/scripts/klorofilpro-common.js"/>"></script>
<script src="<c:url value="/resources/scripts/stripe-playground.js"/>"></script>
<script src="<c:url value="/resources/scripts/serializeToJSON.js"/>"></script>

<script src="https://js.stripe.com/v3/"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8.0.3/dist/sweetalert2.all.min.js"></script>

<script>
    $(function(){
        var stripe;

        // toggle nav active
        $('#navPayment').toggleClass('active');
        $('#navPi').toggleClass('active');
        $('#navConfirmPi').toggleClass('active');

        // accordion toggle collapse
        $('.project-accordion [data-toggle="collapse"]').on('click', function() {
            $(this).find('.toggle-icon').toggleClass('fa-minus-circle fa-plus-circle');
        });

        // drop down
        $('fieldset [data-toggle="collapse"]').on('click', function() {
            $(this).find('.toggle-icon').toggleClass('fa-caret-up fa-caret-down ');
        });

        /**
         * Select a Stripe account to make API calls
         */
        $('#stripe-account').on('change', function () {
            var accountName = $(this).children("option:selected").val();
            $( "input[name='accountName']").val(accountName);
            if (accountName !== ""){
                $.ajax({
                    type : "GET",
                    url : "getAccount",
                    data: "acctName="+accountName,
                    success: function(result){
                        stripe = Stripe(result.accountPublishKey);
                    }
                });
            }
        });

        /**
         * Confirm a PaymentIntent
         */
        $('#pi-confirm-btn').on('click', function () {
            $('#pi-confirm-btn').append("<i class=\"fa fa-spinner fa-spin pi-btn-spinner\"></i>");
            $('#pi-confirm-btn').prop('disabled', true);
            $('#toast-container').remove();
            var data = $('#piConfForm').serializeToJSON();

            var id = $('#intent').val();
            //console.log(id);

            $.ajax({
                type: "POST",
                url: "payment-intent/"+id+"/confirm",
                data: JSON.stringify(data),
                dataType: "json",
                contentType: "application/json",

                success: function (response) {

                    $('.pi-btn-spinner').remove();

                    //console.log(response);
                    $('#piConfResponse').html(response.apiResponse);
                    handleActions(response, '#pi-confirm-btn');

                }
            });
        })

        /**
         * Set PaymentIntent actions
         * @param response
         * @param selector
         */
        function handleActions(response, selector) {
            var responseObj = JSON.parse(response.apiResponse);
            var id = responseObj.id;
            switch (response.code){
                case 'SUCCESS':
                    $(selector).after('<div class="alert alert-success alert-action"><i class="fa fa-check-circle"></i><span>&nbsp;&nbsp;Payment completes: payment_intent_id: <b>' + id + '</b> </span></li></div>');
                    break;

                case 'SUCCESS_PROCESSING':
                    // TODO: handle processing status
                    break;

                case 'SUCCESS_CANCELED':
                    // TODO: handle cancle status
                    break;

                case 'ERROR':
                    showErrorMsg(responseObj.code, responseObj.message);
                    $(selector).prop('disabled', false);
                    break;

                case 'REQUIRE_ACTION':
                    var action = response.action;
                    switch (action.code){
                        case 'REDIRECT_TO_URL':
                            //$('#redirect').attr('href', action.body);
                            //$('#pi-redirect').show();
                            $(selector).after('<div class="alert alert-warning alert-action"><li><i class="fa fa-exclamation-triangle"></i><span>&nbsp;&nbsp;<b>REDIRECT_TO_URL: </b><a href="' + action.body + '" target="_blank">STRIPE_3DS_PAGE</a> </span></li></div>');
                            break;

                        case 'USE_STRIPE_SDK':
                            $('#client-secret').val(action.body);
                            $(selector).after('<div class="alert alert-warning alert-action"><li><i class="fa fa-exclamation-triangle"></i><span>&nbsp;&nbsp;Action required: <b>USE_STRIPE_SDK</b> </span></li></div>');
                            $('#client-action').insertAfter($(selector).parent().parent().parent());
                            $('#client-action').show();
                            $('html, body').animate({scrollTop: $('#client-action').offset().top}, 500);
                            break;

                        case 'REQUIRES_PAYMENT_METHOD':
                            //$(selector).prop('disabled', false);
                            $(selector).after('<div class="alert alert-warning alert-action"><li><i class="fa fa-exclamation-triangle"></i><span>&nbsp;&nbsp;Action required: <b>REQUIRES_PAYMENT_METHOD</b> </span></li></div>');
                            $('#pi-button').attr('data-toggle', responseObj.client_secret);
                            $('html, body').animate({scrollTop: $('#client-params').offset().top}, 500);
                            break;

                        case 'REQUIRES_CONFIRMATION':
                            $(selector).after('<div class="alert alert-warning alert-action"><li><i class="fa fa-exclamation-triangle"></i><span>&nbsp;&nbsp;Action required: <b>REQUIRES_CONFIRMATION</b> </span></li></div>');
                            $('#pi-confirm-btn').attr('data-toggle', responseObj.id);
                            $('#confirm-params').find($('.api-method')).after('/v1/payment_intents/' + responseObj.id + '/confirm');
                            $('#confirm-params').show();
                            $('html, body').animate({scrollTop: $('#confirm-params').offset().top}, 500);
                            break;

                        case 'REQUIRES_CAPTURE':
                            $(selector).after('<div class="alert alert-warning alert-action"><li><i class="fa fa-exclamation-triangle"></i><span>&nbsp;&nbsp;Action required: <b>REQUIRES_CAPTURE</b> </span></li></div>');
                            $('#pi-capture-btn').attr('data-toggle', responseObj.id);
                            $('#capture-params').find($('.api-method')).after('/v1/payment_intents/' + responseObj.id + '/capture');
                            $('#capture-params').show();
                            $('html, body').animate({scrollTop: $('#capture-params').offset().top}, 500);
                            break;
                    }
                    break;
            }
        }
    });

</script>
</body>
</html>