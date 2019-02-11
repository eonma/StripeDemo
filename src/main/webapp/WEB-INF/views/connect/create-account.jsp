<%--
  Created by IntelliJ IDEA.
  User: chenma
  Date: 2019-01-14
  Time: 14:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
                        <h1 class="page-title-st">Connect Account</h1>
                    </div>
                    <ul class="breadcrumb">
                        <li><a href="#"><i class="fa fa-home"></i>Home</a></li>
                        <li><a href="#">Connect</a></li>
                        <li class="active">Create a Connect Account</li>
                    </ul>
                </div>
                <!-- END HEADING AND BREADCRUMB -->
                <div class="row">
                    <!-- REQUEST PANEL -->
                    <div class="panel panel-tab std-account">
                        <div class="panel-heading">
                            <h3 class="panel-title">Create a connect account</h3>
                            <ul class="nav nav-tabs pull-right">
                                <li id="tabStandard" class="active"><a href="#standardTab" data-toggle="tab"></i> Standard Account</a></li>
                                <li id="tabCustom"><a href="#customTab" data-toggle="tab"></i> Custom Account </a></li>
                            </ul>
                        </div>
                        <div class="panel-body">
                            <div class="tab-content no-padding">
                                <div class="tab-pane fade in active" id="reqTab">

                                    <p><em> OAuth parameters</em></p>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-horizontal">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label">client_id</label>
                                                    <div class="col-sm-8">
                                                        <input class="form-control" id="client_id" type="text" value="ca_EBTHAsdydFCt6CBHfBPNQMH9nIxESXpN" disabled="disabled"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label">response_type</label>
                                                    <div class="col-sm-8">
                                                        <input class="form-control" id="response_type" type="text" value="code" disabled="disabled"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label">redirect_uri</label>
                                                    <div class="col-sm-8">
                                                        <input class="form-control" id="redirect_uri" type="text"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label">scope</label>
                                                    <div class="col-sm-8">
                                                        <input class="form-control" id="scope" type="text"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label">state</label>
                                                    <div class="col-sm-8">
                                                        <input class="form-control" id="state" type="text"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label">stripe_landing</label>
                                                    <div class="col-sm-8">
                                                        <input class="form-control" id="stripe_landing" type="text"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label">always_prompt</label>
                                                    <div class="col-sm-8">
                                                        <input class="form-control" id="always_prompt" type="text"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-horizontal">
                                                <div class="form-group">
                                                    <label class="col-sm-6 control-label"><b>stripe_user[email]</b></label>
                                                    <div class="col-sm-6">
                                                        <input class="form-control" id="stripe_user[email]" type="text"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-6 control-label"><b>stripe_user[url]</b></label>
                                                    <div class="col-sm-6">
                                                        <input class="form-control" id="stripe_user[url]" type="text"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-6 control-label">stripe_user[country]</label>
                                                    <div class="col-sm-6">
                                                        <input class="form-control" id="stripe_user[country]" type="text"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-6 control-label">stripe_user[phone_number]</label>
                                                    <div class="col-sm-6">
                                                        <input class="form-control" id="stripe_user[phone_number]" type="text"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-6 control-label">stripe_user[business_name]</label>
                                                    <div class="col-sm-6">
                                                        <input class="form-control" id="stripe_user[business_name]" type="text"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-6 control-label">stripe_user[business_type]</label>
                                                    <div class="col-sm-6">
                                                        <input class="form-control" id="stripe_user[business_type]" type="text"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-6 control-label">stripe_user[first_name]</label>
                                                    <div class="col-sm-6">
                                                        <input class="form-control" id="stripe_user[first_name]" type="text"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-6 control-label">stripe_user[last_name]</label>
                                                    <div class="col-sm-6">
                                                        <input class="form-control" id="stripe_user[last_name]" type="text"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-horizontal">
                                                <div class="form-group">
                                                    <label class="col-sm-6 control-label">stripe_user[dob_day]</label>
                                                    <div class="col-sm-6">
                                                        <input class="form-control" id="stripe_user[dob_day]" type="text"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-6 control-label">stripe_user[dob_month]</label>
                                                    <div class="col-sm-6">
                                                        <input class="form-control" id="stripe_user[dob_month]" type="text"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-6 control-label">stripe_user[dob_year]</label>
                                                    <div class="col-sm-6">
                                                        <input class="form-control" id="stripe_user[dob_year]" type="text"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-6 control-label">stripe_user[street_address]</label>
                                                    <div class="col-sm-6">
                                                        <input class="form-control" id="stripe_user[street_address]" type="text"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-6 control-label">stripe_user[city]</label>
                                                    <div class="col-sm-6">
                                                        <input class="form-control" id="stripe_user[city]" type="text"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-6 control-label">stripe_user[state]</label>
                                                    <div class="col-sm-6">
                                                        <input class="form-control" id="stripe_user[state]" type="text"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-6 control-label">stripe_user[zip]</label>
                                                    <div class="col-sm-6">
                                                        <input class="form-control" id="stripe_user[zip]" type="text"/>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-sm-6 control-label">stripe_user[currency]</label>
                                                    <div class="col-sm-6">
                                                        <input class="form-control" id="stripe_user[currency]" type="text"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- END REQUEST PANEL -->
                </div>

                <!-- PI CLIENT PANEL -->
                <c:if test="${pageElement.response && !pageElement.error}">
                    <div class="row">
                        <div class="panel pi-client" id="piClient">
                            <div class="panel-heading">
                                <h3 class="panel-title">PaymentIntent created - "${pi.id}", complete payment at client side</h3>
                            </div>
                            <div class="panel-body">
                                <div class="col-md-6 col-md-offset-3 card-form">
                                    <div class="form-horizontal">
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">Name</label>
                                            <div class="col-sm-8">
                                                <input class="form-control" id="cardholder-name" type="text" />
                                            </div>

                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">Card details</label>
                                            <div class="col-sm-8">
                                                <div id="card-element"></div>
                                            </div>

                                        </div>
                                        <!-- Create a PaymentIntent-->
                                        <div class="form-group">
                                            <div class="col-sm-8 col-sm-offset-4">
                                                <button id="card-button" class="btn btn-primary-stripe-blue" data-secret="${pi.clientSecret}" style="width: 100%"><span>Complete Payment</span></button>
                                            </div>
                                        </div>
                                        <!-- Retrieve a PaymentIntent-->
                                        <div class="form-group pi-retrieve" style="display: none;">
                                            <div class="col-sm-8 col-sm-offset-4">
                                                <button class="btn btn-primary-stripe-blue pi-retrieve-btn" style="width: 100%"><span>Retrieve ${pi.id}</span></button>
                                            </div>
                                        </div>


                                    </div>
                                </div>
                                <div class="col-md-6 pi-response">
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
                <!-- END PI CLIENT PANEL -->

                <!-- PI DETAILS PANEL -->

                <div class="row retrieve-pi-row" style="display: none;">
                    <div class="panel pi-details" id="piDetails">
                        <div class="panel-heading">
                            <h3 class="panel-title">Retrieve PaymentIntent - "${pi.id}" at server side</h3>
                        </div>
                        <div class="panel-body">
                            <pre class="pi-details-response"></pre>
                        </div>
                    </div>
                </div>

                <!-- END PI DETAILS PANEL -->







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

        // show connect parameters
        if (${pageElement.connect}){
            $('.connect').show();
        }

        // show error
        if (${pageElement.error}){
            showErrorMsg("RequestID: ${error.requestId}", "Error message: ${error.message}");
        } else if (${pageElement.response}) {
            renderStripeElements("${pi.clientSecret}","${pageElement.publishKey}");
        }

        // retrieve a PaymentIntent
        $('.pi-retrieve-btn').on('click', function(){
            $.ajax({
                type : "POST",
                url : "retrieve-paymentintent",
                data : "pi=${pi.id}",
                dataType : "json",
                success: function(result){
                    console.log(result.body);
                    if (result.error){
                        console.log("Error");
                        showErrorMsg(result.body.code, "Request ID: " + result.body.requestId + " Message: " + result.body.message);
                    } else {
                        console.log("Success");
                        $('.retrieve-pi-row').show();
                        $('.pi-details-response').html(JSON.stringify(result.body, undefined, 2));
                    }

                }
            });

        });
    });

    // Stripe elements
    function renderStripeElements(clientSecret, publishKey){

        /* do some toggles*/
        $('.pi-response').hide();

        var stripe = Stripe(publishKey, {
            betas: ['payment_intent_beta_3']
        });

        var elements = stripe.elements();

        var style = {
            base: {
                color: '#5e6773',
                fontSize: '14px',
                '::placeholder': {
                    color: '#ccc',
                },
            },
            invalid: {
                color: '#e5424d',
                ':focus': {
                    color: '#303238',
                },
            },
        };

        /**
         * standard card details
         */
        var cardElement = elements.create('card', {hidePostalCode:true, style:style});
        cardElement.mount('#card-element');

        /**
         * customised card details
         */
        /*
        var cardNumber = elements.create('cardNumber', {placeholder:'123123123'});
        cardNumber.mount('#card-number');
        var cardExpire = elements.create('cardExpiry');
        cardExpire.mount('#card-expire');
        var cardCvc = elements.create('cardCvc');
        cardCvc.mount('#card-cvc');
        */

        $('#card-button').on('click', function(){

            // disable button
            $('#card-button').append("<i class=\"fa fa-spinner fa-spin card-btn-spinner\"></i>");
            $('#card-button').prop('disabled', true);


            var cardholderName = $('#cardholder-name').val();
            stripe.handleCardPayment(
                clientSecret, cardElement, {
                    source_data: {
                        owner: { name: cardholderName }
                    }
                }
            ).then(function (result) {

                // keep card form on the left
                var hasResponse = $('.pi-response:visible').length;
                console.log(hasResponse);
                if (hasResponse===0){
                    $('.card-form').toggleClass('col-md-offset-3', 500);
                }

                // remove pi-response-log
                $('.pi-response').find('.alert').remove();

                if (result.error) {
                    // Display error.message in your UI.
                    $('.pi-response').append("<div class=\"alert alert-danger\"><i class=\"fa fa-times-circle\"></i> Error!</div>");
                    $('.pi-response').find('.alert').append("<pre class=\"pi-response-log\"></pre>")
                    $('.pi-response-log').text(JSON.stringify(result.error, null, 3));
                    $('.pi-response').show(500);
                    $('#card-button').find('.card-btn-spinner').remove();
                    $('#card-button').prop('disabled', false);
                } else {
                    $('.pi-response').append("<div class=\"alert alert-success\"><i class=\"fa fa-check-circle\"></i> PaymentIntent completed!</div>");
                    $('.pi-response').find('.alert').append("<pre class=\"pi-response-log\"></pre>");
                    $('.pi-response-log').text(JSON.stringify(result.paymentIntent, null, 3));
                    $('.pi-response').show(500);
                    $('#card-button').find('.card-btn-spinner').remove();
                    //$('#card-button').prop('disabled', false);
                    $('.pi-retrieve').show();
                }
            });
        });
    };

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
        }
        toastr.error(msg, title);
    };
</script>


</body>
</html>
