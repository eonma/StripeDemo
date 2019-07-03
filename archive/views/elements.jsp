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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

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
    <jsp:include page='../../src/main/webapp/WEB-INF/views/navbar.jsp'/>
    <!-- END NAVBAR -->

    <!-- MAIN -->
    <div class="main">
        <div class="main-content" style="min-height: 700px">
            <div class="container">
                <!-- HEADING AND BREADCRUMB -->
                <div class="content-heading clearfix">
                    <div class="heading-left">
                        <h1 class="page-title-st">Stripe Elements</h1>
                    </div>
                    <ul class="breadcrumb">
                        <li><a href="/"><i class="fa fa-home"></i>Home</a></li>
                        <li><a href="/payments">Payments</a></li>
                        <li class="active">Elements</li>
                    </ul>
                </div>

                <section class="col-md-6 col-md-offset-3 " style="top:115px;">
                    <fieldset class="card-form">

                        <label>
                            <span style="min-width: 30%">Card</span>
                            <div class="card-form__element" style="width: 100%;" data-input-text="Card Number &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; MM/YY &nbsp; CVC">
                                <ul class="card-form__layers">
                                    <li class="card-form__layer">
                                        <form action="">
                                            <div id="card-element" class="card-form__input card-form__hosted-field" /></form>
                                    </li>
                                </ul>
                            </div>
                        </label>
                        <label>
                            <span style="min-width: 30%">Name</span>
                            <input name="name" class="field" placeholder="Joe Smith" required="true" autocomplete="off">
                        </label>
                        <label>
                            <span style="min-width: 30%">Email</span>
                            <input name="name" class="field" placeholder="joesmith@gmail.com" required="true" autocomplete="off">
                        </label>
                        <label>
                            <span style="min-width: 30%">Address</span>
                            <input name="name" class="field" placeholder="211 Old Street" required="true" autocomplete="off">
                        </label>
                        <label>
                            <span style="min-width: 30%">City</span>
                            <input name="name" class="field" placeholder="London" required="true" autocomplete="off">
                        </label>
                        <label>
                            <span style="min-width: 30%">Postcode</span>
                            <input name="name" class="field" placeholder="EC1V 9NR" required="true" autocomplete="off">
                        </label>
                        <label class="select">
                            <span style="min-width: 30%">Country</span>
                            <div id="country" class="field US">
                                <select name="country">
                                    <option value="AU">Australia</option>
                                    <option value="AT">Austria</option>
                                    <option value="BE">Belgium</option>
                                    <option value="BR">Brazil</option>
                                    <option value="CA">Canada</option>
                                    <option value="CN">China</option>
                                    <option value="DK">Denmark</option>
                                    <option value="FI">Finland</option>
                                    <option value="FR">France</option>
                                    <option value="DE">Germany</option>
                                    <option value="HK">Hong Kong</option>
                                    <option value="IE">Ireland</option>
                                    <option value="IT">Italy</option>
                                    <option value="JP">Japan</option>
                                    <option value="LU">Luxembourg</option>
                                    <option value="MX">Mexico</option>
                                    <option value="NL">Netherlands</option>
                                    <option value="NZ">New Zealand</option>
                                    <option value="NO">Norway</option>
                                    <option value="PT">Portugal</option>
                                    <option value="SG">Singapore</option>
                                    <option value="ES">Spain</option>
                                    <option value="SE">Sweden</option>
                                    <option value="CH">Switzerland</option>
                                    <option value="GB"selected="selected">United Kingdom</option>
                                    <option value="US">United States</option>
                                </select>
                            </div>
                        </label>

                    </fieldset>
                </section>
            </div>
        </div>
    </div>
    <!-- END MAIN -->
</div>

<style>
    /* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
    * {
        box-sizing: border-box;
    }

    ul {
        margin: 0;
        padding: 0;
        list-style: none;
    }

    li {
        margin: 0;
        padding: 0;
    }



    .card-form {
        position: relative;
        top: 25%;
        -webkit-transform: perspective(1000px) translate3d(0, 0, 0) rotateX(0);
        -moz-transform: perspective(1000px) translate3d(0, 0, 0) rotateX(0);
        -ms-transform: perspective(1000px) translate3d(0, 0, 0) rotateX(0);
        -o-transform: perspective(1000px) translate3d(0, 0, 0) rotateX(0);
        transform: perspective(1000px) translate3d(0, 0, 0) rotateX(0);
        width: 100%;
        height: auto;
        margin: 0 auto;
        /*background-image: linear-gradient(180deg, #FAFAFA 0%, #F2F2F2 100%);*/
        background-color: white;
        border: 1px solid #D8D8D8;
        box-shadow: 0px 0 0 0px rgba(0, 0, 0, 0.1);
        border-radius: 4px;
        -webkit-animation: rotate-form 1200ms 1000ms 1 forwards cubic-bezier(0.44, 0.22, 0, 1);
        -moz-animation: rotate-form 1200ms 1000ms 1 forwards cubic-bezier(0.44, 0.22, 0, 1);
    }

    /*.card-form__inner {
        padding: 24px;
        font-size: 0;
    }*/


    .card-form__input {
        -webkit-transform: translate3d(0, 0, 0);
        -moz-transform: translate3d(0, 0, 0);
        -ms-transform: translate3d(0, 0, 0);
        -o-transform: translate3d(0, 0, 0);
        transform: translate3d(0, 0, 0);
        /*border: 1px solid #d8d8d8;*/
        /*border-radius: 4px;*/
        /*padding: 12px;*/
        width: 100%;
    }
    .card-form__input iframe {
        -webkit-transform: translate3d(0, 0, 0);
        -moz-transform: translate3d(0, 0, 0);
        -ms-transform: translate3d(0, 0, 0);
        -o-transform: translate3d(0, 0, 0);
        transform: translate3d(0, 0, 0);
    }

    .card-form__element {
        -webkit-transform: translate3d(0, 0, 0);
        -moz-transform: translate3d(0, 0, 0);
        -ms-transform: translate3d(0, 0, 0);
        -o-transform: translate3d(0, 0, 0);
        transform: translate3d(0, 0, 0);
        position: relative;
        /*margin-bottom: 12px;*/
        /*font-size: 16px;*/
        background: transparent;
        /*border: 1px solid transparent;*/
        border-radius: 6px;
        -webkit-animation: explode-layers 1200ms 2000ms 1 forwards cubic-bezier(0.44, 0.22, 0, 1);
        -moz-animation: explode-layers 1200ms 2000ms 1 forwards cubic-bezier(0.44, 0.22, 0, 1);
    }
    .card-form__element:before, .card-form__element:after {
        position: absolute;
        top: 0;
        left: 0;
        display: block;
        width: 100%;
        height: 100%;
        border-radius: 6px;
        opacity: 0;
    }
    .card-form__element:after {
        content: attr(data-input-text);
        z-index: -2;
        padding-top: 12px;
        padding-left: 18px;
        box-sizing: border-box;
        -webkit-transform: translate3d(0, 0, 0);
        -moz-transform: translate3d(0, 0, 0);
        -ms-transform: translate3d(0, 0, 0);
        -o-transform: translate3d(0, 0, 0);
        transform: translate3d(0, 0, 0);
        background: rgba(58, 59, 60, 0.05);
        /*border: 1px dashed white;*/
        color: rgba(0, 0, 0, 0.5);
        -webkit-animation: explode-after 1200ms 2000ms 1 forwards cubic-bezier(0.44, 0.22, 0, 1);
        -moz-animation: explode-after 1200ms 2000ms 1 forwards cubic-bezier(0.44, 0.22, 0, 1);
    }
    .card-form__element:before {
        content: '';
        z-index: -1;
        background: rgba(103, 114, 229, 0.4);
        border: 1px solid #6772e5;
        -webkit-animation: explode-before 1200ms 2000ms 1 forwards cubic-bezier(0.44, 0.22, 0, 1);
        -moz-animation: explode-before 1200ms 2000ms 1 forwards cubic-bezier(0.44, 0.22, 0, 1);
        -webkit-transform: perspective(0) translate3d(0, 0, 0);
        -moz-transform: perspective(0) translate3d(0, 0, 0);
        -ms-transform: perspective(0) translate3d(0, 0, 0);
        -o-transform: perspective(0) translate3d(0, 0, 0);
        transform: perspective(0) translate3d(0, 0, 0);
    }

    .card-form__layers {
        height: 100%;
        padding: 4px;
        border-radius: 6px;
        box-shadow: 0 0 0 rgba(0, 0, 0, 0.15);
        background-color: transparent;
        border: none;
    }

    .card-form__layer {

        background-color: transparent;
        width: 100%;
        height: 100%;
        position: relative;
        line-height: 48px;
        border-radius: 6px;
    }

    .StripeElement {
        box-shadow: none !important;
        border: none !important;
        background: transparent !important;
    }

    .half {
        width: 49%;
        display: inline-block;
        margin-right: 1%;
    }
    .half:last-child {
        margin-right: 0;
        float: right;
    }

    @-webkit-keyframes rotate-form {
        to {
            /*box-shadow: 1px 2px 0 #ccc, 3px 4px 0 #ccc;*/
            -webkit-transform: translate3d(0, 0, 0) rotateX(45deg) rotateZ(30deg);
            -moz-transform: translate3d(0, 0, 0) rotateX(45deg) rotateZ(30deg);
            -ms-transform: translate3d(0, 0, 0) rotateX(45deg) rotateZ(30deg);
            -o-transform: translate3d(0, 0, 0) rotateX(45deg) rotateZ(30deg);
            transform: translate3d(0, 0, 0) rotateX(45deg) rotateZ(30deg);
        }
    }
    @-moz-keyframes rotate-form {
        to {
            /*box-shadow: 1px 2px 0 #ccc, 3px 4px 0 #ccc;*/
            -webkit-transform: translate3d(0, 0, 0) rotateX(45deg) rotateZ(35deg);
            -moz-transform: translate3d(0, 0, 0) rotateX(45deg) rotateZ(35deg);
            -ms-transform: translate3d(0, 0, 0) rotateX(45deg) rotateZ(35deg);
            -o-transform: translate3d(0, 0, 0) rotateX(45deg) rotateZ(35deg);
            transform: translate3d(0, 0, 0) rotateX(45deg) rotateZ(35deg);
        }
    }
    @-webkit-keyframes explode-layers {
        to {
            -webkit-transform: translate3d(-38px, -100%, 0);
            -moz-transform: translate3d(-38px, -100%, 0);
            -ms-transform: translate3d(-38px, -100%, 0);
            -o-transform: translate3d(-38px, -100%, 0);
            transform: translate3d(-38px, -100%, 0);
            /*border: 1px solid #BFBFBF;*/
        }
    }
    @-moz-keyframes explode-layers {
        100% {
            -webkit-transform: translate3d(-38px, -100%, 0);
            -moz-transform: translate3d(-38px, -100%, 0);
            -ms-transform: translate3d(-38px, -100%, 0);
            -o-transform: translate3d(-38px, -100%, 0);
            transform: translate3d(-38px, -100%, 0);
            border: 1px solid rgba(0, 0, 0, 0.25);
        }
    }
    @-webkit-keyframes explode-before {
        to {
            opacity: 1;
            -webkit-transform: translate3d(59px, 50%, 0);
            -moz-transform: translate3d(59px, 50%, 0);
            -ms-transform: translate3d(19px, 50%, 0);
            -o-transform: translate3d(19px, 50%, 0);
            transform: translate3d(0px, 0%, 0);
        }
    }
    @-moz-keyframes explode-before {
        to {
            opacity: 1;
            -webkit-transform: translate3d(19px, 50%, 0);
            -moz-transform: translate3d(19px, 50%, 0);
            -ms-transform: translate3d(19px, 50%, 0);
            -o-transform: translate3d(19px, 50%, 0);
            transform: translate3d(19px, 50%, 0);
        }
    }
    @-webkit-keyframes explode-after {
        to {
            opacity: 1;
            -webkit-transform: translate3d(38px, 100%, 0);
            -moz-transform: translate3d(38px, 100%, 0);
            -ms-transform: translate3d(38px, 100%, 0);
            -o-transform: translate3d(38px, 100%, 0);
            transform: translate3d(38px, 95%, 0);
        }
    }
    @-moz-keyframes explode-after {
        to {
            opacity: 1;
            -webkit-transform: translate3d(38px, 100%, 0);
            -moz-transform: translate3d(38px, 100%, 0);
            -ms-transform: translate3d(38px, 100%, 0);
            -o-transform: translate3d(38px, 100%, 0);
            transform: translate3d(38px, 100%, 0);
        }
    }
    .cf:before,
    .cf:after {
        content: " ";
        /* 1 */
        display: table;
        /* 2 */
    }

    .cf:after {
        clear: both;
    }

    .cf {
        *zoom: 1;
    }

</style>

<!-- Javascript -->
<script src="<c:url value="/resources/vendor/jquery/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/pace/pace.min.js"/>"></script>
<script src="<c:url value="/resources/vendor/toastr/toastr.min.js"/>"></script>
<script src="<c:url value="/resources/scripts/klorofilpro-common.js"/>"></script>
<script src="<c:url value="/resources/scripts/stripe-playground.js"/>"></script>
<script src="<c:url value="/resources/scripts/serializeToJSON.js"/>"></script>
<script src="https://js.stripe.com/v3/"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8.0.3/dist/sweetalert2.all.min.js"></script>
<script src="<c:url value="/resources/vendor/bootstrap-multiselect/bootstrap-multiselect.js"/>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>


<script>

    $(function(){
        // toggle nav active
        $('#navPayment').toggleClass('active');
        $('#navPi').toggleClass('active');
        $('#navCreatePiManual').toggleClass('active');



        var stripe = Stripe("pk_test_1xnx7cgl5GI19qFxg3bOcBD5");
        var elements = stripe.elements();

        var style = {
            base: {
                color: '#5e6773',
                fontSize: '14px',
                '::placeholder': {
                    color: '#525f7f'
                },
            },
            invalid: {
                color: '#e5424d',
            },
        };

        var cardElement = elements.create('card', {
            hidePostalCode : true,
            style : style
        });
        cardElement.mount('#card-element');





        // accordion toggle collapse
        $('.project-accordion [data-toggle="collapse"]').on('click', function()
        {
            $(this).find('.toggle-icon').toggleClass('fa-minus-circle fa-plus-circle');
        });


        $('fieldset [data-toggle="collapse"]').on('click', function()
        {
            $(this).find('.toggle-icon').toggleClass('fa-caret-up fa-caret-down ');
        });

        /**
         * Select a Stripe account to make API calls
         */
        $('#stripe-account').on('change', function () {
            var accountName = $(this).children("option:selected").val();
            $('#account-name').val(accountName);

            if (accountName !== ""){
                $.ajax({
                    type : "GET",
                    url : "getAccount",
                    data: "acctName="+accountName,
                    success: function(result){
                        renderStripeElements(result);
                        $('#card-details').show();
                    }
                });

            } else {
                $('#card-details').hide();
                $('#card-element').remove();
            }
        });

        /**
         * Render Stripe Elements
         * @param account
         */
        function renderStripeElements(account){
            $('#card-element').remove();
            $('#stripe-card').append("<div id=\"card-element\"></div>");

            var stripe = Stripe("pk_test_1xnx7cgl5GI19qFxg3bOcBD5");
            var elements = stripe.elements();

            var style = {
                base: {
                    color: '#5e6773',
                    fontSize: '14px',
                    '::placeholder': {
                        color: '#ccc'
                    },
                },
                invalid: {
                    color: '#e5424d',
                },
            };

            var cardElement = elements.create('card', {
                hidePostalCode : true,
                style : style
            });
            cardElement.mount('#card-element');

            cardElement.on('change', function (event) {
                if (event.error){
                    $('#card-errors').html(event.error.message);
                } else {
                    $('#card-errors').html("");
                }
            });

            // create a payment method on client side
            $('#pm-button').on('click', function(){
                $('#pm-button').append("<i class=\"fa fa-spinner fa-spin card-btn-spinner\"></i>");
                $('#pm-button').prop('disabled', true);

                var data = $('#card-form').serializeToJSON();

                stripe.createPaymentMethod('card', cardElement, data).then(function(result) {

                    console.log(result);

                    if (result.error){
                        $('#pm-button').prop('disabled', false);
                        showErrorMsg(result.error.code, result.error.message);
                    } else {
                        // Show payment_method_id result
                        $('.pm-id').append(result.paymentMethod.id);
                        $('.pm-id').attr("id", result.paymentMethod.id);
                        $('#pm-display').show();

                        // add payment_method_id into server params
                        $('#paymentMethod').val(result.paymentMethod.id);

                        // disable account selection
                        $('#stripe-account').attr('disabled', 'disabled');

                        // show and nav to server params
                        $('#server-params').show();
                        $('html, body').animate({scrollTop: $('#server-params').offset().top}, 500);
                    }
                    $('.card-btn-spinner').remove();
                });
            });
        };




        /**
         * Submit createPaymentIntent request to server
         */
        $('#pi-create-btn').on('click', function () {
            var data = $('#piForm').serializeToJSON();
            console.log(data);

            $.ajax({
                type : "POST",
                url : "payment_intent_manual",
                data: JSON.stringify(data),
                dataType: "json",
                contentType: "application/json",

                success: function(response){

                    var apiResponse = response.apiResponse;
                    console.log(apiResponse);
                    //loopObject(apiResponse, '');

                    var responseCode = response.code;
                    switch (responseCode){
                        case 'SUCCESS':
                            console.log("SUCCESS");
                            // show success

                            break;

                        case 'SUCCESS_PROCESSING':

                        case 'SUCCESS_CANCELED':

                        case 'ERROR':
                            console.log("HERE-E");

                            break;

                        case 'REQUIRE_ACTION':
                            console.log("REQUIRE_ACTION");
                            var action = response.action;

                            switch (action.code){
                                case 'REDIRECT_TO_URL':
                                    // go to client and show redirect button
                                    $('html, body').animate({scrollTop: $('#client-params').offset().top}, 500);
                                    $('#card-params').toggleClass('col-md-offset-2', 500);
                                    $('#action-text').html('redirect_to_url');
                                    $('#action-params').show();
                                    $('#redirect-button').show();
                                    $('#redirect-button').attr('data-toggle', action.body);

                                case 'USE_STRIPE_SDK':
                                    // go to client and show handleCardAction button
                                    $('html, body').animate({scrollTop: $('#client-params').offset().top}, 500);
                                    $('#card-params').toggleClass('col-md-offset-2', 500);
                                    $('#action-text').html('use_stripe_sdk');
                                    $('#action-params').show();
                                    $('#sdk-button').show();
                                    $('#sdk-button').attr('data-toggle', action.body);

                                case 'REQUIRES_PAYMENT_METHOD':
                                // this shouldn't happen at all here

                                case 'REQUIRES_CONFIRMATION':
                                    // show confirm PI button
                                    $('#create-btn').toggleClass('col-md-offset-8').toggleClass('col-md-offset-4');
                                    $('#confirm-btn').show();

                                case 'REQUIRES_CAPTURE':
                                    // show capture PI panel
                                    $('#capture-params').show();
                                    $('html, body').animate({scrollTop: $('#capture-params').offset().top}, 500);
                            }

                            break;
                    }

                }
            });
        });


        $('#pi-capture-btn').on('click', function () {

            $('html, body').animate({scrollTop: $('.main').offset().top}, 500);
            $('#card-params').toggleClass('col-md-offset-2', 500);
            $('#action-title').html('redirect_to_url');
            $('#action-content').html('https://hooks.stripe.com/redirect/authenticate/src_1EQDsGGGaTfhElOZBgnychph?client_secret=src_client_secret_Eu1wLZMuH8QMQfu6mkkRAQtF');
            $('#action-params').show();
            $('#sdk-button').show();
            $('#sdk-button').attr('data-toggle', 'client_secret');
        })


        function loopObject(obj, name){
            for (var key in obj) {

                var keyName = key;
                if (name !== ''){
                    keyName = name + "." + key;
                }
                var value = obj[key];

                if (value instanceof Object){
                    console.log(key + " is an OBJECT");
                    loopObject(value, key);

                } else {
                    console.log(keyName + " = " + value);
                }


            };
        };
    });

</script>
</body>
</html>