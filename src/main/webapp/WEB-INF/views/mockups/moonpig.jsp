<%--
  Created by IntelliJ IDEA.
  User: chenma
  Date: 2019-06-05
  Time: 13:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- saved from url=(0036)https://www.moonpig.com/uk/checkout/ -->
<html xmlns:ng="http://angularjs.org" id="ng-app" ng-app="moonpigApp"
      class="u-newHeaderDesign u-newHeaderDesign--desktop ng-scope desktop">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style type="text/css">

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


    <title>Payment</title>

    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, minimal-ui,  target-densityDpi=device-dpi" name="viewport">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="cleartype" content="on">
    <meta property="og:image" content="https://d1xkhapf8f3lxw.cloudfront.net/cdn/3.0.0.16978/responsivemasterpage/img/moonpig-logo-256.png">
    <meta http-equiv="content-language" content="en-gb">
    <meta name="robots" content="index, follow">
    <link rel="icon" href="https://d1xkhapf8f3lxw.cloudfront.net/cdn/3.0.0.16978/responsivemasterpage/img/favicon.png">
    <link href="https://d1xkhapf8f3lxw.cloudfront.net/cdn/3.0.0.16978/pages/searchresults/css/bazaar-voice-ratings.min.css" rel="stylesheet" media="screen">
    <link href="https://d1xkhapf8f3lxw.cloudfront.net/cdn/3.0.0.16978/responsivemasterpage/css/style.min.css" rel="stylesheet" media="screen">
    <link href="https://d1xkhapf8f3lxw.cloudfront.net/cdn/3.0.0.16978/responsivemasterpage/css/style-print.min.css" rel="stylesheet" media="print">
    <link href="https://d1xkhapf8f3lxw.cloudfront.net/cdn/3.0.0.16978/responsivemasterpage/css/base.min.css" rel="stylesheet" media="screen">
    <link rel="canonical" href="https://www.moonpig.com/uk/checkout/">

</head>
<body data-js-init="offlineCheck" class="country-UK  u-backgroundColorLighterGray  globalSearchBar block-links ng-scope"
      ng-controller="mainAppController" id="mainAppController"
      data-cdn-url="https://d1xkhapf8f3lxw.cloudfront.net/cdn/3.0.0.16978/" data-mobile-device="false"
      ng-class="{&#39;u-frozen&#39;: cap.show}">



<header role="banner" class="c-header c-header--minimal clearfix">
    <div class="o-container">
        <input type="hidden" value="/uk/" id="urlRoot" autocomplete="off">

        <div class="o-fullWidthToHalf@md">
            <div class="u-textCentered u-textLeft@md">
                <a href="https://www.moonpig.com/uk/" class="c-utilLogoGrey__item"><span class="u-visuallyHidden">Moonpig</span></a>
            </div>
        </div>

        <div class="o-fullWidthToHalf@md">
            <p class="c-header__help u-textCentered u-textRight@md">
                <strong>Questions? Call <span class="u-hiddenToInlineBlock@md">us on</span> 0345 4500 100</strong>
            </p>
        </div>
    </div>
</header>

<div class="o-container">
    <div class="contentContainer clearfix js-contentContainer" role="main">
        <h1 class="h1 u-textCentered u-mediumBottomPadding u-darkerGrayBottomBorder">Checkout</h1>
        <div data-currentmonth="6" data-currentyear="2019">
            <div class="o-row">
                <div class="u-overFlowX">
                    <div class="o-col-xs-12 o-col-md-3 o-col-md-push-9">
                        <aside class="u-topXxlSizeMargin@md">
                            <div class="u-table u-backgroundColorLightGray u-fullWidth u-F37GingerFont">
                                <p class="u-tableCell u-mediumPadding"><strong>Total to pay</strong></p>
                                <p class="u-tableCell u-textRight u-mediumPadding"><strong>£62.00</strong></p>
                            </div>
                        </aside>
                    </div>
                    <div class="o-col-xs-12 o-col-md-4 o-col-md-pull-3">
                        <div data-payment-option-panel="options" class="c-slidePanel c-slidePanel--first is-offscreen">
                            <h2 class="h2 u-textCenteredToLeft">Select a payment method</h2>
                            <ul class="u-listReset">
                                <li class="u-bottomLargeMargin@md">
                                    <div id="payment-request-button" >
                                        <!-- A Stripe Element will be inserted here. -->
                                    </div>
                                </li>
                            </ul>


                            <ul class="u-listReset">
                                <li class="u-bottomLargeMargin@md">
                                    <label data-payment-option-target="card" data-payment-panel="card" for="plastic"
                                           class="js-paymentOption c-paymentChoiceLabel is-selected"
                                           data-target-panel="payByCardPanel">
                                        <input type="radio" name="paymentType" class="u-visuallyHidden" checked=""
                                               id="plastic">
                                        <label for="plastic" class="c-paymentChoiceLabel__content">
                                            <div class="o-row">
                                                <div class="o-col-xs-11 o-col-md-10 o-col-md-push-2">
                                                    <span class="site-sprite sprite-paymentcard sprite-cardVisa">VISA</span>
                                                    <span class="site-sprite sprite-paymentcard sprite-cardMastercard">Mastercard</span>
                                                    <span class="site-sprite sprite-paymentcard sprite-cardMaestro">Maestro</span>
                                                </div>

                                                <div class="o-col-xs-1 o-hidden-md o-hidden-lg">
                                                    <i class="icon-chevron-right u-floatRight u-topSmallMargin c-paymentChoiceLabel__chevron"></i>
                                                </div>
                                            </div>

                                        </label>
                                    </label>
                                </li>

                            </ul>
                        </div>

                        <a class="c-button u-topSmallMargin u-displayNone u-block@md" id="back-button" title="Back"
                           href="https://www.moonpig.com/uk/basket/"><span class="c-button__text ">Back</span></a>
                    </div>


                    <div class="o-col-xs-12 o-col-md-4 o-col-md-pull-3">

                        <div data-payment-option-panel="card" class="c-slidePanel c-slidePanel--last is-selected ">

                            <div id="panel-card-details" data-card-option-panel="new" class="js-savedCardsCheck">


                                <div class="baseline c-cardDetails">

                                    <h2 class="h2 o-hidden-xs o-hidden-sm">Enter your card details</h2>

                                    <ol class="form-layout border-box card-details-form">
                                        <li class="form-row-text">

                                            <div class="c-textField">
                                                <label class=" c-label" for="cc-number">Card details</label>
                                                <%--<input aria-labelledby="" name="cc-number" class="c-input"
                                                                     autocomplete="off" maxlength="19"
                                                                     placeholder="xxxx-xxxx-xxxx-xxxx" id="cardNumber"
                                                                     data-validation-key="cardNumber"
                                                                     data-validation-input="" data-validation-output=""
                                                                     type="text">--%>
                                                <div class="c-input" id="card-element" style="padding-top:10px;"></div>
                                                <span data-validation-error="" class="c-errorMessage" id="card-errors"></span>
                                            </div>

                                            <span class="c-errorMessage c-errorMessage--hidden"
                                                  data-automation="cardNumberError" data-validation-key="cardNumber"
                                                  data-validation-output="">Please enter a valid Visa, Mastercard or Maestro card number with no dashes or spaces</span>
                                        </li>
                                        <li class="form-row-text">

                                            <div class="c-textField"><label class=" c-label" for="cc-name">Name on
                                                card</label><input aria-labelledby="" name="cc-name" class="c-input"
                                                                   data_encrypted_name="holderName" data_val="true"
                                                                   data_val_required="" autocomplete="off"
                                                                   data-validation-key="nameOnCard"
                                                                   data-validation-input="" data-validation-output=""
                                                                   type="text" placeholder="e.g. Jenny Hubble"
                                                                   id="nameOnCard"><span data-validation-error=""
                                                                                         class="c-errorMessage"></span>
                                            </div>

                                            <span class="c-errorMessage c-errorMessage--hidden"
                                                  data-automation="cardNameError" data-validation-key="nameOnCard"
                                                  data-validation-output="">Please enter the name as it appears on your card</span>
                                        </li>

                                    </ol>
                                </div>

                                <div class="ng-pristine ng-valid"><input name="__RequestVerificationToken"
                                                                          type="hidden"
                                                                          value="Nd3iGXQwL5zDCNSv8_ugm6Wseopz7ISxIXFr_mErub4CXXpKUZyfnEMgrlXuoLBJrYSVnNvPvZoWUku8TcFJql8EpUg1"
                                                                          autocomplete="off"> <input type="hidden"
                                                                                                     value="2019-06-13T08:24:35.35Z"
                                                                                                     data-encrypted-name="generationtime"
                                                                                                     id="adyen-encrypted-form-generationtime"
                                                                                                     autocomplete="off">
                                    <input id="encryptedNewCardData" name="EncryptedCardData" type="hidden" value=""
                                           autocomplete="off">
                                    <div class="baseline c-cardDetails">
                                        <ol class="form-layout border-box card-details-form">

                                            <li class="form-row-radio u-topXlSizeMargin">
                                                <label for="rememberMe" class="remember-me"
                                                       data-automation="remember-me-check-box">
                                                    <div class="u-relative">
                                                        <input type="checkbox"
                                                               class="c-checkbox u-visuallyHidden u-bottomMediumMargin u-F37GingerFont"
                                                               name="Save" value="true" id="Save">

                                                        <label for="Save"
                                                               class="c-checkboxLabel u-bottomMediumMargin u-F37GingerFont">

                                                            Remember my details for future use

                                                        </label>
                                                    </div>

                                                </label>
                                            </li>
                                            <li class="textCenter">


                                                <input value="complete order" type="submit" id="checkout-newcard-button"
                                                       data-formid="newCardDetails"
                                                       class="js-submitNewCardOnDesktopButton c-button c-button--alpha u-bottomLargeMargin o-hidden-xs o-hidden-sm">
                                            </li>
                                        </ol>
                                    </div>
                                </div>


                                <div class="form-row-radio">
                                    <p class="u-textCentered u-F37GingerFont u-bottomXlSizeMargin strong">By placing
                                        this order, you are accepting Moonpig's <a
                                                href="https://www.moonpig.com/uk/terms-and-conditions/" target="_blank">Terms
                                            and Conditions </a>
                                    </p>
                                </div>
                            </div>
                        </div>


                    </div>


                </div>
            </div>
        </div>

        <span id="message-CCVcode" class="c-cvvHelper mobile-modal box-padded box-shaded">
    <p>
	On Visa, Mastercard and Maestro cards the security code is the last three digits in the signature area on the back of the card. On American Express cards the security code is the four digits on the front of the card.
    </p>

    <p class="textCenter is-mobile">
        <a href="https://www.moonpig.com/uk/checkout/#" class="btn-primary" id="CCV-confirm">Got it</a>
    </p>
</span>


        <div class="mobile-modal-overlay"></div>


        <div class="o-hidden-md o-hidden-lg">
            <div class="u-fixedBottom u-smallTopPadding u-smallBottomPadding u-backgroundColorLightGray">

                <div data-payment-option-panel="card" class="o-container c-slidePanelButtons ">
                    <div class="o-row">
                        <div class="o-col-xs-6 u-topMediumMargin u-bottomMediumMargin">
                            <a class="c-button " onclick="trackMobileBackButton()" title="back"
                               href="https://www.moonpig.com/uk/basket/"><span class="c-button__text ">back</span></a>
                        </div>
                        <div class="o-col-xs-6 u-topMediumMargin u-bottomMediumMargin">
                            <button class="c-button c-button--beta js-submitNewCardOnMobileButton c-slidePanelButtons__button "
                                    id="submit-newCardDetails" data-card-option-button="new" type="submit"><span
                                    class="c-button__text ">complete order</span></button>


                        </div>
                    </div>
                </div>


                <div data-payment-option-panel="paypal" class="o-container c-slidePanelButtons is-offscreen">
                    <div class="o-row">
                        <div class="o-col-xs-6 u-topMediumMargin u-bottomMediumMargin">
                            <a class="c-button " onclick="trackMobileBackButton()" title="back"
                               href="https://www.moonpig.com/uk/checkout/#"><span
                                    class="c-button__text ">back</span></a>
                        </div>
                        <div class="o-col-xs-6 u-topMediumMargin u-bottomMediumMargin">
                            <button class="c-button c-button--beta " id="submit-paypal" value="Pay by PayPal"
                                    type="submit"><span class="c-button__text ">Pay by PayPal</span></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>
</div>


<script>
    (function (w) {
        w.moonpig = w.moonpig || {};
        w.moonpig.config = w.moonpig.config || {};
        w.moonpig.config.isMobile = false;
    }(window));
</script>



<!-- Tracking -->
<!-- ~Tracking -->


<!-- Custom Messages Popup-->
<div class="c-modal" data-modal-name="Are you sure you want to leave this page?" id="server-error-dialog"
     ng-class="{&quot;is-active&quot;: cap.show}">
    <div class="c-modal__content " data-js-elem="modal__content" role="dialog" aria-label="">
        <div>
            <div class="o-row">
                <div class="o-col-xs-10"></div>
                <div class="o-col-xs-2 u-noRightPadding@upto-md">
                    <span class="c-modal__close u-smallBottomPadding icon-close u-floatRight"
                          ng-click="cap.closeBtnEvent()"></span>
                </div>
            </div>

            <p class="u-topNoMargin u-bottomLargeMargin h1 ng-binding">Are you sure you want to leave this page?</p>
            <p class="ng-binding">By leaving, any changes you have made will not be saved. To keep your changes, please
                continue with your order.</p>
            <div class="clearfix">
                <!-- ngIf: cap.confirm -->
                <div class="o-row u-topMediumMargin ng-scope" ng-if="cap.confirm">
                    <div class="o-col-xs-12 o-col-sm-6">
                        <button class="c-button "
                                ng-click="cap.confirm ? cap.confirmBtnEvent(cap.confirmBtnParams) : cap.saveBtnEvent()"
                                ng-attr-data-automation="{{cap.confirm ? &quot;another-day-btn&quot; : &quot;&quot;}}"
                                data-automation="another-day-btn"><span class="c-button__text  ng-binding">Leave this page</span>
                        </button>
                    </div>
                    <div class="o-col-xs-12 o-col-sm-6 u-topMediumMargin u-topNoMargin@sm">
                        <button class="c-button c-button--beta " ng-click="cap.closeBtnEvent()"
                                data-automation="today-btn"><span
                                class="c-button__text  ng-binding">Stay on this page</span></button>
                    </div>
                </div><!-- end ngIf: cap.confirm -->
                <!-- ngIf: !cap.confirm -->
            </div>

        </div>
    </div>
</div>


<!-- Cookies law compliance panel -->
<!-- ngIf: currentCountry == 'UK' -->
<div class="c-cookiesPanel u-fullWidth ng-scope" ng-class="{isEnabled: !cookiesAccepted}"
     ng-if="currentCountry == &#39;UK&#39;">
    <p class="c-cookiesPanel__textContent u-textCentered o-col-xs-10 o-col-sm-10 o-col-sm-push-1 u-topXlSizeMargin u-bottomXlSizeMargin">
        By using Moonpig you agree to our <a ng-href="https://www.moonpig.com/uk/cookies"
                                             href="https://www.moonpig.com/uk/cookies">use of cookies</a> to make your
        experience one of a kind
    </p>
    <div class="c-cookiesPanel__closeButton icon-close o-col-xs-2 o-col-sm-1 u-textRight u-mediumRightPadding"
         ng-click="acceptCookies()" title="Accept and dismiss"></div>
</div><!-- end ngIf: currentCountry == 'UK' -->


<div class="dialog-modal-overlay ">True</div>
<div id="dialog-browser-incompatibility" class="dialog-browser-incompatibility ">
    <div class="dialog-title">
        <p class="h2">Did you know that your internet browser is out of date?</p>
        <a href="https://www.moonpig.com/uk/checkout/#" class="js-close-browser-incompatibility closeDialogBtn"
           title="Close"><i class="icon-close"></i></a>
    </div>

    <p>Some of our pages could not work for you and you may not be able to make a purchase using your browser. We
        recommend that you download the latest version by clicking on the icons to get to the download page.</p>

    <div class="browsers">
        <div class="browserIcon">
            <a href="https://www.google.com/chrome" target="_blank" class="browserLogo browserLogo--chrome"></a>
            <span class="browserText">Google Chrome</span>
        </div>
        <div class="browserIcon">
            <a href="https://www.mozilla.org/firefox/" target="_blank" class="browserLogo browserLogo--firefox"></a>
            <span class="browserText">Mozilla Firefox</span>
        </div>
        <div class="browserIcon">
            <a href="https://www.microsoft.com/microsoft-edge" target="_blank"
               class="browserLogo browserLogo--edge"></a>
            <span class="browserText">Microsoft Edge</span>
        </div>

        <a id="browserIncompatibilityConfirm"
           class="js-close-browser-incompatibility browserIncompatibilityConfirm c-button"
           href="javascript:window.history.back();">Close</a>

    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function (event) {
            var elements = document.querySelectorAll('.js-close-browser-incompatibility');
            Array.prototype.forEach.call(elements, function (element, i) {
                element.addEventListener('click', function (event) {
                    event.preventDefault();
                    var className = 'show';
                    var classNameRegExp = new RegExp('(^|\\b)' + className.split(' ').join('|') + '(\\b|$)', 'gi');
                    var dialogElement = document.getElementById('dialog-browser-incompatibility');
                    var dialogOverlay = document.getElementsByClassName('dialog-modal-overlay')[0];
                    if (dialogElement.classList) {
                        dialogElement.classList.remove(className);
                        dialogOverlay.classList.remove(className);
                    } else { // to support lack of .classList on IE9
                        dialogElement.className = dialogElement.className.replace(classNameRegExp, ' ');
                        dialogOverlay.className = dialogElement.className.replace(classNameRegExp, ' ');
                    }
                })
            });
        });
    </script>
</div>

<script type="text/ng-template" id="serverErrorPopup.html">

    <div class="c-modal" data-modal-name="{{serverErrorPopupCtrl.title}}" ng-cloak id='server-error-dialog'
         ng-class='{"is-active": serverErrorPopupCtrl.show}'>
        <div class="c-modal__content " data-js-elem="modal__content" role="dialog" aria-label="">
            <div>

                <p class="u-topNoMargin u-bottomLargeMargin h1">{{serverErrorPopupCtrl.title}}</p>
                <p>{{serverErrorPopupCtrl.description}}</p>
                <div class="clearfix">
                    <div class="o-row u-topMediumMargin" ng-if="serverErrorPopupCtrl.confirm">
                        <div class="o-col-xs-12 o-col-sm-6">
                            <button class='c-button ' ng-click='serverErrorPopupCtrl.closeBtnEvent()'><span
                                    class='c-button__text '>{{serverErrorPopupCtrl.closeBtnLabel}}</span></button>
                        </div>
                        <div class="o-col-xs-12 o-col-sm-6 u-topMediumMargin u-topNoMargin@sm">
                            <button class='c-button c-button--beta '
                                    ng-click='serverErrorPopupCtrl.confirmBtnEvent(serverErrorPopupCtrl.confirmBtnParams)'>
                                <span class='c-button__text '>{{serverErrorPopupCtrl.confirmBtnLabel}}</span></button>
                        </div>
                    </div>
                    <div class="o-row u-topMediumMargin" ng-if="!serverErrorPopupCtrl.confirm">
                        <div class="o-col-xs-12 o-col-sm-6 o-col-sm-push-3">
                            <button class='c-button c-button--beta ' ng-click='serverErrorPopupCtrl.closeBtnEvent()'>
                                <span class='c-button__text '>{{serverErrorPopupCtrl.closeBtnLabel}}</span></button>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>


</script>


<server-error-popup-component class="ng-isolate-scope">

    <div class="c-modal" data-modal-name="" id="server-error-dialog"
         ng-class="{&quot;is-active&quot;: serverErrorPopupCtrl.show}">
        <div class="c-modal__content " data-js-elem="modal__content" role="dialog" aria-label="">
            <div>

                <p class="u-topNoMargin u-bottomLargeMargin h1 ng-binding"></p>
                <p class="ng-binding"></p>
                <div class="clearfix">
                    <!-- ngIf: serverErrorPopupCtrl.confirm -->
                    <!-- ngIf: !serverErrorPopupCtrl.confirm -->
                    <div class="o-row u-topMediumMargin ng-scope" ng-if="!serverErrorPopupCtrl.confirm">
                        <div class="o-col-xs-12 o-col-sm-6 o-col-sm-push-3">
                            <button class="c-button c-button--beta " ng-click="serverErrorPopupCtrl.closeBtnEvent()">
                                <span class="c-button__text  ng-binding"></span></button>
                        </div>
                    </div><!-- end ngIf: !serverErrorPopupCtrl.confirm -->
                </div>

            </div>
        </div>
    </div>


</server-error-popup-component>


<script>window['adrum-start-time'] = new Date().getTime();</script>

<div class="ui-dialog ui-widget ui-widget-content ui-corner-all ui-front" tabindex="-1" role="dialog"
     aria-describedby="dialog-confirm" style="display: none;" aria-labelledby="ui-id-1">
    <div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix"><span id="ui-id-1"
                                                                                            class="ui-dialog-title">Are you sure?</span>
        <button type="button"
                class="ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only ui-dialog-titlebar-close"
                role="button" aria-disabled="false" title="close"><span
                class="ui-button-icon-primary ui-icon ui-icon-closethick"></span><span
                class="ui-button-text">close</span></button>
    </div>
    <div id="dialog-confirm" class="mobile-modal box-padded box-shaded ui-dialog-content ui-widget-content"
         style="display: block;">
        <p id="confirm-message"></p>
        <p class="textCenter">
            <a href="https://www.moonpig.com/uk/checkout/#" class="btn-tertiary" id="confirm-cancel">Cancel</a>
            <a href="https://www.moonpig.com/uk/checkout/#" class="btn-primary" id="confirm-proceed">Continue</a>
        </p>
    </div>
</div>
<div class="ui-dialog ui-widget ui-widget-content ui-corner-all ui-front" tabindex="-1" role="dialog"
     aria-describedby="dialog-error" aria-labelledby="ui-id-2" style="display: none;">
    <div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix"><span id="ui-id-2"
                                                                                            class="ui-dialog-title">Oh No!</span>
        <button type="button"
                class="ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only ui-dialog-titlebar-close"
                role="button" aria-disabled="false" title="close"><span
                class="ui-button-icon-primary ui-icon ui-icon-closethick"></span><span
                class="ui-button-text">close</span></button>
    </div>
    <div id="dialog-error" class="mobile-modal box-padded box-shaded ui-dialog-content ui-widget-content"
         style="display: block;">
        <p id="error-message"></p>
        <p class="textCenter">
            <a href="https://www.moonpig.com/uk/checkout/#" class="btn-primary" id="error-ok">Ok</a>
        </p>
    </div>
</div>
<script src="https://js.stripe.com/v3/"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://pay.google.com/gp/p/js/pay.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8.0.3/dist/sweetalert2.all.min.js"></script>
<script>

    $(function () {
        $('.paymentRequestText').hide();

        var stripe = Stripe('pk_test_1xnx7cgl5GI19qFxg3bOcBD5');

        // Create an instance of Elements.
        var elements = stripe.elements();

        // Custom styling can be passed to options when creating an Element.
        // (Note that this demo uses a wider set of styles than the guide below.)
        var style = {
            base: {
                color: '#505050',
                fontFamily: 'F37Ginger, "Helvetica Neue", Helvetica, sans-serif',
                fontSmoothing: 'antialiased',
                fontWeight: 700,
                fontSize: '14px',
                '::placeholder': {
                    color: '#aaa',
                    fontFamily: 'F37Ginger, "Helvetica Neue", Helvetica, sans-serif',
                    fontSize: '16px',
                },
            },
            invalid: {
                color: '#e5424d',
            },
        };

        // Create an instance of the card Element.
        var card = elements.create('card', {
            hidePostalCode: true,
            style: style
        });

        console.log(card);
        // Add an instance of the card Element into the `card-element` <div>.
        card.mount('#card-element');

        card.on('change', function (event) {
            if (event.error) {
                $('#card-errors').html(event.error.message);
                $('#CardNumber').css("border", "1px solid #e5424d");
            } else {
                $('#card-errors').html("");
                $('#CardNumber').css("border", "1px solid #ccc");
            }
        });

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
                if (hasError) {
                    $('#cardNumber-div').toggleClass("error");
                }
                hasError = false;
            }
        });

        var paymentMethod = 'cc';
        var source = '';

        $('#checkout-newcard-button').on('click', function () {

            if (paymentMethod === 'cc'){
                $.ajax({
                    type: "POST",
                    url: "https://api.stripe.com/v1/payment_intents",
                    data: "payment_method_types[]=card&amount=6200&currency=gbp",
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
            } else if (paymentMethod === 'sofort'){
                stripe.createSource({
                    type: 'sofort',
                    amount: 6200,
                    currency: 'eur',
                    redirect: {
                        return_url: 'https://stripe-demo.ngrok.io/plum_guide',
                    },
                    sofort: {
                        country: 'DE',
                    },
                }).then(function(result) {
                    // handle result.error or result.source
                    console.log(result.source.id);
                    var url = result.source.redirect.url;
                    console.log(url);
                    window.location.replace(url);
                });
            }

        })

        // Add PaymentRequest Button
        var paymentRequest = stripe.paymentRequest({
            country: 'GB',
            currency: 'gbp',
            displayItems: [
                {
                    label: 'The Raspberry Ripple',
                    amount: 2200,
                },
                {
                    label: 'The Happy Birthday Gift Set',
                    amount: 3200,
                },
                {
                    label: 'shipping',
                    amount: 800,
                }
            ],
            total: {
                label: 'Total Amount',
                amount: 6200,
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

            if (result != null) {
                if (result.applePay) {
                    prButton.mount('#payment-request-button');
                } else if (result) {
                    //prButton.mount('#payment-request-button');
                    document.getElementById('payment-request-button').appendChild(button);

                } else {
                    document.getElementById('payment-request-button').style.display = 'none';
                }
            }

        });

        paymentRequest.on('paymentmethod', function (ev) {
            $.ajax({
                type: "POST",
                url: "https://api.stripe.com/v1/payment_intents",
                data: "payment_method_types[]=card&amount=100&currency=gbp",
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("Authorization", "Bearer sk_test_9wTiIIE9XtvLgbrpMVSVJrIS");
                    xhr.setRequestHeader("X-Mobile", "false");
                },
                success: function (result) {
                    console.log(ev.paymentMethod.id);
                    stripe.confirmPaymentIntent(result.client_secret, {
                        payment_method: ev.paymentMethod.id,
                    }).then(function (confirmResult) {
                        if (confirmResult.error) {
                            ev.complete('fail');
                        } else {
                            ev.complete('success');
                            stripe.handleCardPayment(result.client_secret).then(function (result) {
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

        $('#PaymentMethod').on('change', function () {
            var value = $('option:selected').val();
            console.log(value);
            if (value === 'sofort'){
                $('.card-wrapper').hide();
                paymentMethod = 'sofort';

            } else if (value === 'cc'){
                $('.card-wrapper').show();
                paymentMethod = 'cc';
            }

        })
    });

</script>

<style>
    .gpay-button {
        width: 100% !important;
    }

    .CardField-expiry{
        padding-right: 10px !important;
    }
</style>
</body>
</html>
