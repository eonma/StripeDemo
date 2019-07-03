<!DOCTYPE html>
<!-- saved from url=(0051)https://buy.greenflag-breakdown.com/quote/#/payment -->
<html lang="en"
      class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths reevoomark_GRNF">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style type="text/css" data-di-rand="1554994627932" data-di-res-id="1340f67f-c8cff14d">@charset "UTF-8";
    [ng\:cloak], [ng-cloak], [data-ng-cloak], [x-ng-cloak], .ng-cloak, .x-ng-cloak, .ng-hide:not(.ng-hide-animate) {
        display: none !important;
    }

    ng\:form {
        display: block;
    }

    .ng-animate-shim {
        visibility: hidden;
    }

    .ng-anchor {
        position: absolute;
    }</style>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="noindex">
    <link rel="icon" type="image/png" href="https://buy.greenflag-breakdown.com/quote/lib/img/logos/favicon.png"
          sizes="128x128">
    <title>GreenFlag: Quote &amp; Buy</title>
    <link rel="stylesheet" type="text/css" href="/resources/site/qab.css">
    <link rel="stylesheet" type="text/css" href="/resources/site/stripe.cfss">


    <!--SETTINGS FILE-->


    <!--ANALYTICS HEAD FILE-->
    <!-- Google Tag Manager -->



    <!-- End Google Tag Manager -->


    <!-- Adobe Tag Manager -->
    <style data-di-rand="1554994627933" data-di-res-id="abfc911a-9f857387">.mboxDefault {
        visibility: hidden;
    }</style>

    <!-- End Adobe Tag Manager -->
    <meta class="foundation-data-attribute-namespace">
    <meta class="foundation-mq-xxlarge">
    <meta class="foundation-mq-xlarge">
    <meta class="foundation-mq-large">
    <meta class="foundation-mq-medium">
    <meta class="foundation-mq-small">
    <style data-di-res-id="abfc911a-7cb7264d"></style>
    <style type="text/css" data-di-rand="1554994627933" data-di-res-id="912daca-9d5d12a4"></style>

    <meta class="foundation-mq-topbar">


    <link type="text/css" rel="stylesheet" href="/resources/site/reevoomark.css">
    <style type="text/css" data-di-rand="1554994627933" data-di-res-id="abfc911a-8b50d6a7">a.reevoomark {
        display: none;
    }

    a.reevoomark.undecorated {
        display: inline;
    }</style>
    <style type="text/css" data-di-rand="1554994627933"
           data-di-res-id="abfc911a-51d78aa"> .reevoomark_badge.reevoomark_badge_greenflag-default-mark-en-gb-29jun16 a, .reevoomark_badge.reevoomark_badge_greenflag-default-mark-en-gb-29jun16 a span {
        font-weight: normal;
        color: #1278db;
        text-decoration: none;
        line-height: 11;
    }

    .reevoomark_badge.reevoomark_badge_greenflag-default-mark-en-gb-29jun16 a:hover, .reevoomark_badge.reevoomark_badge_greenflag-default-mark-en-gb-29jun16 a:hover span {
        font-weight: normal;
        color: #1278db;
        text-decoration: underline;
    }

    .reevoomark_badge.reevoomark_badge_greenflag-default-mark-en-gb-29jun16 a.reviews span {
        width: 100px;
        text-align: center;
    }

    .reevoomark_badge.reevoomark_badge_greenflag-default-mark-en-gb-29jun16 a.ask_an_owner span {
        width: 50px;
        text-align: center;
    } </style>
    <script src="https://js.stripe.com/v3/"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://pay.google.com/gp/p/js/pay.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8.0.3/dist/sweetalert2.all.min.js"></script>
</head>
<body class="ng-scope">

<!-- ngInclude:  -->
<div id="cookie-banner" data-ng-include="" data-src="&#39;/quote/common/views/_cookie-notice.html&#39;"
     class="ng-scope">
    <div class="cookies-notice light-green-bg dark-grey ng-scope">
        <div class="row">
            <div class="small-12 large-9 columns">
                <p>
                    <span>By using our website you consent to accepting cookies in accordance with our Cookie Policy.</span>
                    <br>
                    <a href="https://www.greenflag.com/cookies-notice" target="_blank" class="white underline"
                       data-di-id="di-id-5d8b3ed5-c89fb2eb">Learn more.</a>
                </p>
            </div>
            <div class="small-12 large-3 columns columns">
                <a class="close-cookies-notice no-underline" data-di-id="di-id-a8046ef4-d2c0aec0">
                    <img src="/resources/site/continue-tick.png" alt="continue" class="continue-tick" width="45">
                    <h4 class="dark-grey">Close</h4>
                </a>
            </div>
        </div>
    </div>
</div>
<div class="off-canvas-wrap" data-offcanvas="">
    <div class="inner-wrap">
        <!-- ngInclude:  -->
        <div data-ng-include="" data-src="&#39;/quote/common/views/_quote-header.html&#39;" class="ng-scope">
            <!-- Mobile header with nav menu -->
            <nav class="tab-bar panel dark-grey-bg hide-for-large-up hide-for-print ng-scope">
                <div class="small-9 columns">
                    <img src="/resources/site/logo.png" alt="The Green Flag logo" width="300px" height="30px">
                </div>
                <div class="small-3 columns text-right">
                    <a class="right-off-canvas-toggle icon-phone light-green no-underline medium-tiny"
                       href="javascript:;"><span></span><span class="screenreader">menu icon</span></a>
                </div>
            </nav>
            <!-- Mobile off canvas menu -->
            <aside class="right-off-canvas-menu hide-for-large-up telephone-widget ng-scope">
                <h2 class="white">Need help?</h2>
                <div>
                    <p class="no-margin white">Call us on</p>
                    <h4 class="white"><strong>0345 246 2447</strong></h4>
                </div>
                <div class="small-3 left text-right">
                    <p class="no-margin">
                        <small class="no-wrap white">Mon-Fri: 8am-9pm</small>
                        <small class="no-wrap white">Saturday: 9am-5pm</small>
                        <small class="no-wrap white">Sunday: 10am-5pm</small>
                    </p>
                </div>
            </aside>
            <!-- Desktop Header -->
            <!-- ngInclude:  -->
            <div data-ng-include="" data-src="&#39;common/views/_common-header.html&#39;" class="ng-scope">
                <header class="show-for-large-up panel dark-grey-bg ng-scope">
                    <div class="row">
                        <div class="medium-6 columns">
                            <img class="hide-for-print" src="/resources/site/logo.png" alt="The Green Flag logo" width="300px"
                                 height="30px">
                            <img class="hide show-for-print" src="/resources/site/logo-black.png" alt="The Green Flag logo">
                        </div>
                        <div class="medium-4 columns text-right">
                            <div class="white">Call us on</div>
                            <div class="light-green">0345 246 2447</div>
                        </div>
                        <div class="opening-hours medium-2 columns light-green collapse text-right">
                            <div class="opening-hours-time"><span class="white">Mon-Fri&nbsp;&nbsp;</span>8am - 9pm
                            </div>
                            <div class="opening-hours-time"><span class="white">Saturday&nbsp;&nbsp;</span>9am - 5pm
                            </div>
                            <div class="opening-hours-time"><span class="white">Sunday&nbsp;&nbsp;</span>10am - 5pm
                            </div>
                        </div>
                    </div>
                </header>
            </div>
        </div>
        <progress-bar>
            <section class="panel dark-grey-bg no-padding progress-bar-container">
                <div class="row hide-for-print">
                    <div class="small-12 columns">
                        <ul class="small-block-grid-6 text-center progress-bar">
                            <li ng-class="getClass(1)" class="light-blue" style="">
                                <span class="show-for-small-up hide-for-large-up">1</span>
                                <span class="show-for-large-up">Start</span>
                            </li>
                            <li ng-class="getClass(2)" class="light-blue" style="">
                                <span class="show-for-small-up hide-for-large-up">2</span>
                                <span class="show-for-large-up">Your Quote</span>
                            </li>
                            <li ng-class="getClass(3)" class="light-blue" style="">
                                <span class="show-for-small-up hide-for-large-up">3</span>
                                <span class="show-for-large-up">Your Details</span>
                            </li>
                            <li ng-class="getClass(4)" class="light-blue" style="">
                                <span class="show-for-small-up hide-for-large-up">4</span>
                                <span class="show-for-large-up">Review</span>
                            </li>
                            <li ng-class="getClass(5)" class="light-blue" style="">
                                <span class="show-for-small-up hide-for-large-up">5</span>
                                <span class="show-for-large-up">Payment</span>
                            </li>
                            <li ng-class="getClass(6)" class="white">
                                <span class="show-for-small-up hide-for-large-up">6</span>
                                <span class="show-for-large-up">Confirmation</span>
                            </li>
                        </ul>
                    </div>
                </div>
            </section>
        </progress-bar>
        <!-- ngInclude:  -->
        <div data-ng-include="" data-src="&#39;/quote/common/views/_header-triangle.html&#39;" class="ng-scope">
            <!-- ngIf: pageTitle -->
            <div ng-if="pageTitle" class="ng-scope" style="">
                <section class="panel dark-grey triangle-sub-header-padding padding-top-30 hide-for-print">
                    <div class="row small-collapse large-uncollapse">
                        <div class="small-12 columns">
                            <h1 class="white ng-binding">Payment details</h1>
                        </div>
                    </div>
                </section>
                <section class="triangle-uphill grey hide-for-print">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100" preserveAspectRatio="none"
                         data-di-rand="1554994627937" data-di-res-id="249e064d-a72a5b0">
                        <polygon fill="white" points="0,100 100,0 100,100"></polygon>
                    </svg>
                </section>
            </div><!-- end ngIf: pageTitle -->
        </div>
        <!-- ngView:  -->
        <main ng-view="" class="row ng-scope" autoscroll="" style="">
            <div id="payment-page" ng-hide="hasModalBeenSeen === false" class="ng-scope" style="">
                <div ng-show="false" id="worldpayDiv" class="ng-hide"></div>
                <div class="small-12 large-8 columns">
                    <div id="paymentForm" name="qnbPayment" novalidate=""
                          class="ng-pristine ng-invalid ng-invalid-required ng-valid-pattern ng-valid-minlength ng-valid-maxlength ng-valid-greater-than ng-valid-less-than"
                          style="">

                        <div class="row ng-hide" ng-show="isDDDisabled">
                            <div class="small-12 columns">
                                <h1>&pound;<span ng-bind="paymentOptions.ssingle | number:2" class="ng-binding">117.60</span>
                                </h1>
                                <p>Annual Payment by Credit or Debit Card</p>
                            </div>
                        </div>
                        <div id="payment-method-type" ng-show="!isDDDisabled"
                             ng-class="{true : &#39;error&#39;}[qnbPayment.$submitted &amp;&amp; selectedPaymentType === &#39;&#39; ]"
                             class="">
                            <div class="row message ng-hide"
                                 ng-show="qnbPayment.$submitted &amp;&amp; selectedPaymentType === &#39;&#39; "
                                 data-test-id="isPaymentTypeError">
                                <div class="small-12 columns">
                                    <span>Please select a payment method</span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="radio-button-group" role="group" aria-label="Choose payment type">
                                    <div class="small-12 medium-6 columns">
                                        <button type="button" class="expand selected"
                                                ng-click="selectedPaymentType=&#39;cc&#39;;updateCoverOptionsWithPaymentDetails()"
                                                id="payment-method-cc"
                                                ng-class="{selected: selectedPaymentType===&#39;cc&#39;, &#39;payment-button-error&#39; : qnbPayment.$submitted &amp;&amp; selectedPaymentType === &#39;&#39;}"
                                                data-test-id="paymentType-cc" data-di-id="#payment-method-cc" style="">
                                            <span>Annual payment</span>
                                            <br>
                                            <span>&pound;</span>
                                            <span ng-bind="paymentOptions.ssingle | number:2"
                                                  class="ng-binding">117.60</span>
                                        </button>
                                    </div>
                                    <div class="small-12 medium-6 columns">
                                        <button type="button" class="expand"
                                                ng-click="selectedPaymentType=&#39;dd&#39;;updateCoverOptionsWithPaymentDetails()"
                                                id="payment-method-dd"
                                                ng-class="{selected: selectedPaymentType===&#39;dd&#39;, &#39;payment-button-error&#39; : qnbPayment.$submitted &amp;&amp; selectedPaymentType === &#39;&#39;}"
                                                data-test-id="paymentType-dd" data-di-id="#payment-method-dd" style="">
                                            <span>Monthly payment</span>
                                            <span id="analytics-get-monthly">
                                    <br>
                                    <span>&pound;</span>
                                    <span ng-bind="paymentOptions.instalSubsequent | number:2"
                                          class="ng-binding">10.78</span>
                                </span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ngIf: selectedPaymentType ==='' || selectedPaymentType ==='cc' -->
                        <div class="annual-payment ng-scope"
                             ng-if="selectedPaymentType ===&#39;&#39; || selectedPaymentType ===&#39;cc&#39;" style="">
                            <div class="row monthly-payment-breakdown" ng-hide="isDDDisabled">
                                <div class="small-12 columns text-left">
                                    <h4 class="push-up-10 push-down-20">Representative example if you pay monthly</h4>
                                    <hr>
                                </div>
                                <dl class="small-12 medium-6 columns no-margin">
                        <span class="clearfix">
                            <dt class="left">1st payment:</dt>
                            <dd id="c-1st-payment" class="right">&pound;<span ng-bind="paymentOptions.instalFirst | number:2"
                                                                        class="ng-binding">10.78</span></dd>
                        </span>
                                    <span class="clearfix">
                            <dt class="left">Remaining instalments:</dt>
                            <dd id="c-remaining-installments" class="right">&pound;<span
                                    ng-bind="paymentOptions.instalSubsequent | number:2" class="ng-binding">10.78</span></dd>
                        </span>
                                    <span class="clearfix">
                            <dt class="left">Total amount of credit:</dt>
                            <dd id="c-total-amount-of-credit" class="right">&pound;<span
                                    ng-bind="paymentOptions.ssingle | number:2" class="ng-binding">117.60</span></dd>
                        </span>
                                    <span class="clearfix">
                            <dt class="left">Total amount payable:</dt>
                            <dd id="c-total-amount-payable" class="right">&pound;<span
                                    ng-bind="paymentOptions.totalPrem | number:2" class="ng-binding">129.36</span></dd>
                        </span>
                                </dl>
                                <dl class="small-12 medium-6 columns no-margin">
                        <span class="clearfix">
                            <dt class="left">Interest rate fixed:</dt>
                            <dd id="c-interest-rate-fixed" class="right ng-binding">10%</dd>
                        </span>
                                    <span class="clearfix">
                            <dt class="left">Representative APR:</dt>
                            <dd id="c-representative-apr" class="right ng-binding">20.9%</dd>
                        </span>
                                    <span class="clearfix">
                            <dt class="left">Agreement term:</dt>
                            <dd id="c-agreement-term" class="right ng-binding">12 months</dd>
                        </span>
                                </dl>
                            </div>
                            <p>You have 14 days to change your mind
                                <br>Inclusive of Insurance Premium Tax where applicable</p>
                            <div class="row">
                                <div class="small-12 columns">

                                    <hr class="small push-up-20 push-down-30">
                                    <h4 class="push-down-30">Your payment details</h4>
                                    <div id="payment-request-button" style="margin-bottom: 20px; border: 0; padding: 0;">
                                        <!-- A Stripe Element will be inserted here. -->
                                    </div>
                                    <h4 class="push-down-30 paymentRequestText" style="display: none;">Or pay with credit or debit card</h4>
                                </div>
                            </div>
                            <div id="isPaymentErrorCC" class="row" ng-class="{error: paymentErrorCC }">
                                <div class="row message small-collapse medium-uncollapse ng-hide"
                                     ng-show="paymentErrorCC" data-test-id="isPaymentErrorCC">
                                    <div class="small-12 columns">
                                        <span class="ng-binding"></span>
                                    </div>
                                </div>
                            </div>
                            <div id="is-card-holder-id" class="row"
                                 ng-class="{true : &#39;error&#39;}[qnbPayment.$submitted &amp;&amp; isCardHolder === &#39;&#39; ]">
                                <div class="row message small-collapse medium-uncollapse ng-hide"
                                     ng-show="qnbPayment.$submitted &amp;&amp; isCardHolder === &#39;&#39; "
                                     data-test-id="isCardHolderError">
                                    <div class="small-12 medium-12 columns">
                                        <span>Let us know whether the card you want to use is in your name</span>
                                    </div>
                                </div>
                                <div class="small-10 medium-4 text-left columns">
                                    <label>Is the card in your name?</label>
                                </div>
                                <div class="small-2 medium-1 columns text-center"></div>
                                <div class="small-12 medium-7 columns">
                                    <div class="radio-button-group" role="group" aria-label="Is the card in your name?">
                                        <button id="isCardHolderYes" type="button"
                                                ng-click="isCardHolder=&#39;yes&#39;;changeIsCardHolder(isCardHolder)"
                                                ng-class="{selected: isCardHolder===&#39;yes&#39;}"
                                                class="tertiary selected" data-di-id="#isCardHolderYes">
                                            <span class="screenreader">Is the card in your name </span>Yes
                                        </button>
                                        <button id="isCardHolderNo" type="button"
                                                ng-click="isCardHolder=&#39;no&#39;;changeIsCardHolder(isCardHolder)"
                                                ng-class="{selected: isCardHolder===&#39;no&#39;}" class="tertiary"
                                                data-di-id="#isCardHolderNo">
                                            <span class="screenreader">Is the card in your name </span>No
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <!-- ngIf: isCardHolder==='no' -->
                            <div id="cardHolderName-div" class="row"
                                 ng-class="{error: validation.invalidF(&#39;cardHolderName&#39;)}">
                                <div class="row message small-collapse medium-uncollapse ng-hide"
                                     ng-show="validation.invalidF(&#39;cardHolderName&#39;)"
                                     data-test-id="cardHolderName-invalid-error">
                                    <div ng-messages="qnbPayment.cardHolderName.$error" class="ng-active">
                                        <!-- ngMessage: required -->
                                        <div ng-message="required" class="small-10 medium-11 columns ng-scope">
                                            <span>Please enter the cardholder's name</span>
                                        </div>
                                        <!-- ngMessage: minlength -->
                                        <!-- ngMessage: pattern -->
                                    </div>
                                </div>
                                <div class="small-12 medium-5 text-left columns">
                                    <label for="cardHolderName" class="inline">Cardholder's name:</label>
                                    <span tabindex="0" data-tooltip="" load-tooltip="" role="tooltip"
                                          show-tooltip-on-focus="" class="icon-info tiny medium-green"
                                          data-selector="tooltip-jucrlay31q" aria-describedby="tooltip-jucrlay31q"
                                          title="">
                        <span class="screenreader">Information. Cardholder's name. Enter the cardholder's name as it appears on the card</span>
                        </span>
                                </div>
                                <div class="small-12 medium-7 columns">
                                    <input data-recording-mask="" id="cardHolderName" type="text" autocomplete="off"
                                           name="cardHolderName" ng-model="cc.holderName" required="" ng-minlength="2"
                                           maxlength="20" ng-pattern="/^[a-zA-Z-&#39; .]{2,61}$/"
                                           ng-model-options="rescueAppConfig.defaultModelOptions"
                                           class="ng-pristine ng-untouched ng-invalid ng-invalid-required ng-valid-pattern ng-valid-minlength ng-valid-maxlength"
                                           data-di-id="#cardHolderName" value="John Smith">
                                </div>
                            </div>
                            <div id="cardNumber-div" class="row"
                                 ng-class="{error: validation.invalidF(&#39;cardNumber&#39;)}">
                                <div class="row message small-collapse medium-uncollapse"
                                     ng-show="validation.invalidF(&#39;cardNumber&#39;)"
                                     data-test-id="cardNumber-invalid-error">
                                    <div ng-messages="qnbPayment.cardNumber.$error" class="ng-active">
                                        <!-- ngMessage: required -->
                                        <div ng-message="required" class="small-10 medium-11 columns ng-scope">
                                            <div id="card-errors" role="alert"></div>
                                        </div>
                                        <!-- ngMessage: minlength -->
                                        <!-- ngMessage: pattern -->
                                        <!-- ngMessage: serverError -->
                                    </div>
                                </div>
                                <div class="small-12 medium-5 text-left columns">
                                    <label for="cardNumber" class="inline">Card details:</label>
                                    <span tabindex="0" data-tooltip="" load-tooltip="" role="tooltip"
                                          show-tooltip-on-focus="" class="icon-info tiny medium-green"
                                          data-selector="tooltip-jucrlay31r" aria-describedby="tooltip-jucrlay31r"
                                          title="">
                            <span class="screenreader">Information. card number. Enter the long number on the front of the card</span>
                        </span>
                                </div>
                                <div class="small-12 medium-7 columns left">
                                    <%--<input data-recording-mask="" id="cardNumber" type="tel" autocomplete="off"
                                           name="cardNumber" ng-model="cc.cardNumber" required="" ng-minlength="13"
                                           ng-maxlength="16" maxlength="16" ng-pattern="/^[0-9]{13,16}$/"
                                           ng-model-options="rescueAppConfig.defaultModelOptions"
                                           class="ng-pristine ng-untouched ng-invalid ng-invalid-required ng-valid-pattern ng-valid-minlength ng-valid-maxlength"
                                           data-di-id="#cardNumber">--%>
                                        <div id="card-element">
                                            <!-- A Stripe Element will be inserted here. -->
                                        </div>

                                        <img src="/resources/site/payment-cards.jpg" class="cards-accepted" width="177"
                                             alt="We accept Mastercard, Visa, AMEX, Maestro">
                                </div>
                            </div>

                            <div id="uk-billing-address-id" class="row"
                                 ng-class="{true : &#39;error&#39;}[qnbPayment.$submitted &amp;&amp; ukBillingAddress === &#39;&#39; ]">
                                <div class="row message small-collapse medium-uncollapse ng-hide"
                                     ng-show="qnbPayment.$submitted &amp;&amp; ukBillingAddress === &#39;&#39; "
                                     data-test-id="isUKBillingAddressError">
                                    <div class="small-12 columns">
                                        <span>This field is required</span>
                                    </div>
                                </div>
                                <div class="small-12 medium-5 text-left columns">
                                    <label for="" class="inline">Is this a UK <br class="show-for-medium-up">billing
                                        address?</label>
                                    <span tabindex="0" data-tooltip="" load-tooltip="" role="tooltip"
                                          show-tooltip-on-focus="" class="icon-info tiny medium-green"
                                          data-selector="tooltip-jucrlay31u" aria-describedby="tooltip-jucrlay31u"
                                          title="">
                            <span class="screenreader">Information. billing address. Is the card registered to an address in the UK? If you answer 'no' to this question, you will need to enter the country the card is registered to below</span>
                        </span>
                                </div>
                                <div class="small-12 medium-7 columns">
                                    <div class="radio-button-group" role="group"
                                         aria-label="Is this a UK billing address?">
                                        <button class="selected" id="ukBillingAddressYes" type="button"
                                                ng-click="ukBillingAddress=&#39;yes&#39;;changeIsUKBillingAddress(ukBillingAddress)"
                                                ng-class="{selected: ukBillingAddress===&#39;yes&#39;}"
                                                data-di-id="#ukBillingAddressYes">
                                            <span class="screenreader">Is this a UK billing address </span>Yes
                                        </button>
                                        <button id="ukBillingAddressNo" type="button"
                                                ng-click="ukBillingAddress=&#39;no&#39;;changeIsUKBillingAddress(ukBillingAddress)"
                                                ng-class="{selected: ukBillingAddress===&#39;no&#39;}"
                                                data-di-id="#ukBillingAddressNo">
                                            <span class="screenreader">Is this a UK billing address </span>No
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div id="billingLine1-div" class="row"
                                 ng-class="{error: validation.invalidF(&#39;billingLine1&#39;)}">
                                <div class="row message small-collapse medium-uncollapse ng-hide"
                                     ng-show="validation.invalidF(&#39;billingLine1&#39;)"
                                     data-test-id="billingLine1-invalid-error">
                                    <div ng-messages="qnbPayment.billingLine1.$error" class="ng-active">
                                        <!-- ngMessage: required -->
                                        <div ng-message="required" class="small-10 medium-11 columns ng-scope">
                                            <span>Please enter the 1st line of the card billing address</span>
                                        </div>
                                        <!-- ngMessage: pattern -->
                                    </div>
                                </div>
                                <div class="small-12 medium-5 text-left columns">
                                    <label for="billingLine1" class="inline">First line of card billing address: <span
                                            tabindex="0" data-tooltip="" load-tooltip="" role="tooltip"
                                            show-tooltip-on-focus="" class="icon-info tiny medium-green"
                                            data-selector="tooltip-jucrlay31v" aria-describedby="tooltip-jucrlay31v"
                                            title="">
                            <span class="screenreader">Information. First line of card billing address. Enter the address that the card is registered to</span>
                        </span></label>

                                </div>
                                <div class="small-12 medium-7 columns">
                                    <input data-recording-mask="" id="billingLine1" type="text" autocomplete="off"
                                           name="billingLine1" ng-model="cc.billingAddress.line1" required=""
                                           maxlength="30" ng-pattern="/^[a-zA-Z0-9_ \-&#39;.]*$/"
                                           ng-model-options="rescueAppConfig.defaultModelOptions"
                                           class="ng-pristine ng-untouched ng-invalid ng-invalid-required ng-valid-pattern ng-valid-maxlength"
                                           data-di-id="#billingLine1"
                                    value="211 Old Street">
                                </div>
                            </div>
                            <div id="billingPostCode-div" class="row"
                                 ng-class="{error: validation.invalidF(&#39;billingPostCode&#39;)}">
                                <div class="row message small-collapse medium-uncollapse ng-hide"
                                     ng-show="validation.invalidF(&#39;billingPostCode&#39;)"
                                     data-test-id="billingPostCode-invalid-error">
                                    <div ng-messages="qnbPayment.billingPostCode.$error" class="ng-active">
                                        <!-- ngMessage: required -->
                                        <div ng-message="required" class="small-10 medium-11 columns ng-scope">
                                            <span>Please enter your card's postcode</span>
                                        </div>
                                        <!-- ngMessage: pattern -->
                                    </div>
                                </div>
                                <!-- ngIf: ukBillingAddress === '' || ukBillingAddress === 'yes' -->
                                <div class="small-10 medium-4 text-left columns postcode ng-scope"
                                     ng-if="ukBillingAddress === &#39;&#39; || ukBillingAddress === &#39;yes&#39; ">
                                    <label for="billingPostCode">Card billing postcode:</label>
                                </div><!-- end ngIf: ukBillingAddress === '' || ukBillingAddress === 'yes' -->
                                <!-- ngIf: ukBillingAddress === 'no' -->
                                <div class="small-2 medium-1 columns text-center">
                                </div>
                                <!-- ngIf: ukBillingAddress === '' || ukBillingAddress === 'yes' -->
                                <div class="small-12 medium-3 left columns medium-offset-1 ng-scope"
                                     ng-if="ukBillingAddress === &#39;&#39; || ukBillingAddress === &#39;yes&#39; ">
                                    <input data-recording-mask="" id="billingPostCode" type="text" autocomplete="off"
                                           name="billingPostCode" ng-model="cc.billingAddress.postCode" required=""
                                           maxlength="8" title="Please enter your card&#39;s postcode"
                                           ng-pattern="/^(([gG][iI][rR] {0,}0[aA]{2})|((([a-pr-uwyzA-PR-UWYZ][a-hk-yA-HK-Y]?[0-9][0-9]?)|(([a-pr-uwyzA-PR-UWYZ][0-9][a-hjkstuwA-HJKSTUW])|([a-pr-uwyzA-PR-UWYZ][a-hk-yA-HK-Y][0-9][abehmnprv-yABEHMNPRV-Y]))) {0,}[0-9][abd-hjlnp-uw-zABD-HJLNP-UW-Z]{2}))$/"
                                           ng-model-options="rescueAppConfig.defaultModelOptions"
                                           class="ng-pristine ng-untouched ng-invalid ng-invalid-required ng-valid-pattern ng-valid-maxlength"
                                           data-di-id="#billingPostCode" value="EC1V 9NR">
                                </div><!-- end ngIf: ukBillingAddress === '' || ukBillingAddress === 'yes' -->
                                <!-- ngIf: ukBillingAddress === 'no' -->
                            </div>
                        </div><!-- end ngIf: selectedPaymentType ==='' || selectedPaymentType ==='cc' -->
                        <!-- ngIf: selectedPaymentType ==='dd' -->
                        <!-- ngIf: selectedPaymentType ==='dd' -->
                        <hr class="hide-for-small push-up-20 push-down-40">

                        <!-- ngIf: selectedPaymentType==='cc' -->
                        <div class="row ng-scope" ng-if="selectedPaymentType===&#39;cc&#39;" style="">
                            <div class="small-12 columns">
                                <p>When you press BUY NOW we will begin processing your payment. Please do not click the
                                    button again or refresh the page.</p>
                            </div>
                        </div><!-- end ngIf: selectedPaymentType==='cc' -->

                        <div class="row" data-test-id="coverDetails-panel-buttons">
                            <div class="small-12 medium-4 medium-push-8 columns">
                                <!-- ngIf: selectedPaymentType==='cc' -->
                                <button id="order-place-btn" type="button" ng-click="next()"
                                        class="primary expand width-exception no-abandon-alert ng-scope ladda-button"
                                        data-test-id="payment-next-button" ladda="nextInProgress"
                                        ng-if="selectedPaymentType===&#39;cc&#39;" data-style="zoom-in" style=""
                                        data-di-id="di-id-a8046ef4-85fbbc66"><span
                                        class="ladda-label">Buy Now</span><span class="ladda-spinner"></span></button>
                                <!-- end ngIf: selectedPaymentType==='cc' -->
                                <!-- ngIf: selectedPaymentType==='dd' -->
                            </div>
                            <!-- ngIf: selectedPaymentType==='dd' -->
                            <div class="small-12 medium-4 medium-pull-8 columns">
                                <button type="button" ng-click="back()" class="tertiary expand width-exception"
                                        data-test-id="payment-back-button" data-di-id="di-id-6cdbd1d4-30ebb12c">Back
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="small-12 large-4 columns show-for-large-up">
                    <!-- ngInclude:  -->
                    <div data-ng-include="" data-src="&#39;right-panel/_right-panel-premium.html&#39;" class="ng-scope">
                        <aside class="show-for-large-up panel dark-grey-bg hide-for-print ng-scope">
                            <!-- ngIf: !hasSecondVehicle() -->
                            <!-- ngIf: hasSecondVehicle() -->
                            <div ng-if="hasSecondVehicle()" data-test-id="cover-level-extras" class="ng-scope">
                                <h4 class="white push-down-10">Your cover</h4>
                                <div ng-show="selectedCover.level" class="">
                                    <div class="row">
                                        <div class="small-8 columns">
                                            <span class="light-green ng-binding">Recovery Plus</span>
                                        </div>
                                        <h5 class="small-4 columns light-green">
                                            &pound;<span data-test-id="rescue-cover-cost"
                                                   ng-bind="selectedCover.rescueCoverCost | number:2"
                                                   class="ng-binding">117.60</span>
                                        </h5>
                                    </div>
                                </div>
                                <span class="white">For two vehicles</span>
                            </div><!-- end ngIf: hasSecondVehicle() -->
                            <hr class="medium">
                            <h4 class="white push-down-10">Your premium</h4>
                            <div class="row ng-hide" ng-show="!selectedCover.level">
                                <div class="small-12 columns">
                                    <p class="white bold">Please select a premium from the list</p>
                                </div>
                            </div>
                            <div ng-show="selectedCover.level" class="">
                                <div ng-switch="selectedCover.paymentType">
                                    <div class="row dark">
                                        <div class="small-12 columns">
                                            <p class="light-green">Pay annually</p>
                                        </div>
                                        <div class="small-5 columns">
                                            <span class="white">Total<br>per year</span>
                                        </div>
                                        <div class="small-7 columns text-right">
                                            <h3 class="light-green">&pound;<span data-test-id="premium-cost-per-year"
                                                                           ng-bind="selectedCover.total | number:2"
                                                                           class="ng-binding">117.60</span></h3>
                                        </div>
                                        <!-- ngIf: (monthlyPaymentData.instalSubsequent | number:2) > 0.00 -->
                                        <div ng-if="(monthlyPaymentData.instalSubsequent | number:2) &gt; 0.00"
                                             class="ng-scope">
                                            <div class="small-12 columns text-center white">or</div>
                                            <div class="small-12 columns">
                                                <p class="light-green">Pay monthly</p>
                                            </div>
                                            <div class="small-5 columns">
                                                <span class="white">Monthly by<br>Direct Debit</span>
                                            </div>
                                            <div class="small-7 columns text-right">
                                                <h3 class="light-green">&pound;<span data-test-id="premium-cost-per-month"
                                                                               ng-bind="monthlyPaymentData.instalSubsequent | number:2"
                                                                               class="ng-binding">10.78</span></h3>
                                            </div>
                                            <div class="small-12 columns white underline push-up-20 push-down-20">
                                                Monthly representative example
                                            </div>
                                            <div class="small-12 columns white push-down-5">
                                                <span>Representative APR</span>
                                                <span class="right"><span
                                                        ng-bind="monthlyPaymentData.aprrate | number:1"
                                                        class="ng-binding">20.9</span>%</span>
                                            </div>
                                            <div class="small-12 columns white push-down-5">
                                                <span>Interest rate fixed</span>
                                                <span class="right"><span ng-bind="monthlyPaymentData.intRate"
                                                                          class="ng-binding">10</span>%</span>
                                            </div>
                                            <div class="small-12 columns white push-down-5">
                                                <span>Agreement term</span>
                                                <span class="right">12 months</span>
                                            </div>
                                            <div class="small-12 columns white push-down-5">
                                                <span>First instalment</span>
                                                <span class="right">&pound;<span
                                                        ng-bind="monthlyPaymentData.instalFirst | number:2"
                                                        class="ng-binding">10.78</span></span>
                                            </div>
                                            <div class="small-12 columns white push-down-5">
                                                <span>Remaining payments</span>
                                                <span class="right">&pound;<span
                                                        ng-bind="monthlyPaymentData.instalSubsequent | number:2"
                                                        class="ng-binding">10.78</span></span>
                                            </div>
                                            <div class="small-12 columns white push-down-5">
                                                <span>Total credit amount</span>
                                                <span class="right">&pound;<span ng-bind="selectedCover.total | number:2"
                                                                           class="ng-binding">117.60</span></span>
                                            </div>
                                            <div class="small-12 columns white push-down-5">
                                                <span>Total payable</span>
                                                <span class="right">&pound;<span
                                                        ng-bind="monthlyPaymentData.totalPrem | number:2"
                                                        class="ng-binding">129.36</span></span>
                                            </div>
                                        </div><!-- end ngIf: (monthlyPaymentData.instalSubsequent | number:2) > 0.00 -->
                                        <!-- ngIf: (monthlyPaymentData.instalSubsequent | number:2) <= 0.00 && pageNumber === 2 -->
                                    </div>
                                </div>
                                <br>
                            </div>
                            <p class="white text-small">Online discount included. Includes Insurance Premium Tax where
                                applicable.</p>
                            <hr class="medium">
                            <!-- ngIf: pageNumber<5 -->
                            <!-- ngInclude:  -->
                            <div data-ng-include="" data-src="&#39;common/views/_payment-logos.html&#39;"
                                 class="ng-scope">
                                <div class="panel white text-center no-padding ng-scope">
                                    <img class="small-all-round-spacer" src="/resources/site/mastercard.png" height="25"
                                         width="70" alt="MasterCard logo">
                                    <img class="small-all-round-spacer" src="/resources/site/visa.png" height="36" width="70"
                                         alt="Verified by Visa logo">
                                    <img class="small-all-round-spacer" src="/resources/site/norton.png" height="39" width="70"
                                         alt="Norton Secure logo">
                                </div>
                            </div>
                        </aside>

                        <!-- ngIf: pageNumber<5 -->
                    </div>
                </div>
            </div>
        </main>
        <!-- ngInclude:  -->
        <div data-ng-include="" data-src="&#39;/quote/common/views/_quote-footer.html&#39;" class="ng-scope">
            <section class="triangle-downhill hide-for-print ng-scope">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100" preserveAspectRatio="none"
                     data-di-rand="1554994627943" data-di-res-id="1417ea72-893f80ca">
                    <polygon fill="#1b1d1b" points="0,100 100,0 100,100"></polygon>
                </svg>
            </section>
            <footer class="panel dark-grey-bg ng-scope">
                <div class="row">
                    <!-- ngInclude:  -->
                    <div data-ng-include="" data-src="&#39;/quote/common/views/_common-footer.html&#39;"
                         class="ng-scope" style="">
                        <div class="small-12 columns ng-scope">
                            <p>
                                <img src="/resources/site/greenflag-icon-only.png" alt="Green Flag logo" width="57px"
                                     height="40px">
                                <small class="light-green">© GreenFlag Limited 2019.</small>
                            </p>
                            <p>
                                <small class="white">Green Flag Limited is an Introducer Appointed Representative of U K
                                    Insurance Limited. U K Insurance Limited is authorised by the Prudential Regulation
                                    Authority and regulated by the <a href="http://www.fca.org.uk/" target="_blank"
                                                                      data-di-id="di-id-75b7b4d5-f4b2cfa9">Financial
                                        Conduct Authority</a> and the Prudential Regulation Authority. Green Flag
                                    Breakdown Cover is underwritten by U K Insurance Limited. Registered office: The
                                    Wharf, Neville Street, Leeds LS1 4AZ. Registered in England and Wales No.1179980.
                                    Calls may be recorded. Green Flag Limited 2012. All rights reserved. iPhone and iPod
                                    touch are trademarks of Apple Inc.
                                </small>
                            </p>
                        </div>
                    </div>
                    <div class="small-12 columns hide-for-large-up panel text-center">
                        <img src="/resources/site/mastercard.png" height="25" width="70" alt="MasterCard logo">
                        <img src="/resources/site/visa.png" height="36" width="70" alt="Verified by Visa logo">
                        <img src="/resources/site/norton.png" height="39" width="70" alt="Norton Secure logo">
                    </div>
                </div>
            </footer>
        </div>
    </div>
</div>
<!--ANALYTICS BODY DTM FILE-->

<script>
    $(function(){
        $('.paymentRequestText').hide();

        var stripe = Stripe('pk_test_1xnx7cgl5GI19qFxg3bOcBD5', {
            betas: ['payment_intent_beta_3']
        });

        // Create an instance of Elements.
        var elements = stripe.elements();

        // Custom styling can be passed to options when creating an Element.
        // (Note that this demo uses a wider set of styles than the guide below.)
        var style = {
            base: {
                color: '#32325d',
                fontFamily: '"Oswald Bold", "Helvetica Neue", Helvetica, sans-serif',
                fontSmoothing: 'antialiased',
                fontSize: '14px',
                '::placeholder': {
                    color: '#aab7c4'
                }
            },
            invalid: {
                color: '#fc005e',
                iconColor: '#fc005e'
            }
        };

        // Create an instance of the card Element.
        var card = elements.create('card', {
            hidePostalCode: true,
            style: style
        });

        console.log(card);
        // Add an instance of the card Element into the `card-element` <div>.
        card.mount('#card-element');

        // Handle real-time validation errors from the card Element.
        var hasError = false;
        card.addEventListener('change', function (event) {
            var displayError = document.getElementById('card-errors');
            if (event.error) {
                displayError.textContent = event.error.message;
                $('#cardNumber-div').toggleClass("error");
                hasError = true;
            } else {
                displayError.textContent = '';
                if (hasError){
                    $('#cardNumber-div').toggleClass("error");
                }
                hasError = false;
            }
        });

        $('#order-place-btn').on('click', function () {

            $.ajax({
                type: "POST",
                url: "https://api.stripe.com/v1/payment_intents",
                data: "payment_method_types[]=card&amount=11760&currency=gbp",
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("Authorization", "Bearer sk_test_9wTiIIE9XtvLgbrpMVSVJrIS");
                    xhr.setRequestHeader("X-Mobile", "false");
                },
                success: function (result) {
                    //console.log(result.client_secret);
                    stripe.handleCardPayment(
                        result.client_secret,
                        card,
                        {
                            payment_method_data: {
                                billing_details: {
                                    name: 'John Smith'
                                }
                            }
                        }
                    ).then(function (result) {
                        if (result.error) {

                        } else {
                            console.log(result);
                            Swal.fire({
                                text: 'You have paid successfully.',
                                type: 'success'
                            })
                        }
                    });
                }
            });
        })

        // Add PaymentRequest Button
        var paymentRequest = stripe.paymentRequest({
            country: 'GB',
            currency: 'gbp',
            total: {
                label: 'Total Amount',
                amount: 11760,
            },

            //requestPayerName: true,
            //requestPayerEmail: true,
            requestShipping: false,


        });

        var prButton = elements.create('paymentRequestButton', {
            paymentRequest: paymentRequest,

        });

        //console.log(paymentRequest);

        var paymentsClient = new google.payments.api.PaymentsClient({environment: 'TEST'});
        var button = paymentsClient.createButton(
            {
                onClick: () => paymentRequest.show(),
                buttonColor: 'black', // black (default) | while
                buttonType: 'long', // long (default) | short
            });


        // Check the availability of the Payment Request API first.
        paymentRequest.canMakePayment().then(function (result) {

            if (result != null){
                if (result.applePay){
                    $('.paymentRequestText').show();
                    prButton.mount('#payment-request-button');
                }
                else if (result) {
                    $('.paymentRequestText').show();
                    //prButton.mount('#payment-request-button');
                    document.getElementById('payment-request-button').appendChild(button);

                } else {
                    document.getElementById('payment-request-button').style.display = 'none';
                }
            }

        });

        paymentRequest.on('paymentmethod', function(ev) {
            $.ajax({
                type: "POST",
                url: "https://api.stripe.com/v1/payment_intents",
                data: "payment_method_types[]=card&amount=11760&currency=gbp",
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("Authorization", "Bearer sk_test_9wTiIIE9XtvLgbrpMVSVJrIS");
                    xhr.setRequestHeader("X-Mobile", "false");
                },
                success: function (result) {
                    console.log(ev.paymentMethod.id);
                    stripe.confirmPaymentIntent(result.client_secret, {
                        payment_method: ev.paymentMethod.id,
                    }).then(function(confirmResult) {
                        if (confirmResult.error) {
                            ev.complete('fail');
                        } else {
                            ev.complete('success');
                            stripe.handleCardPayment(result.client_secret).then(function(result) {
                                if (result.error) {
                                    Swal.fire({
                                        text: 'You have paid successfully.',
                                        type: 'success'
                                    })
                                } else {
                                    Swal.fire({
                                        text: 'You have paid successfully.',
                                        type: 'success'
                                    })
                                }
                            });
                        }
                    });
                }
            });

        });
    });

</script>

</body>
</html>