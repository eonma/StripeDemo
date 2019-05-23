<%--
  Created by IntelliJ IDEA.
  User: chenma
  Date: 2019-03-06
  Time: 14:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- saved from url=(0054)https://www.matchesfashion.com/checkout/review-and-pay -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- saved from url=(0054)https://www.matchesfashion.com/checkout/review-and-pay -->
<html lang="en"
      class=" js no-touch geolocation draganddrop backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns csstransforms csstransforms3d csstransitions fontface generatedcontent video audio svg inlinesvg smil svgclippaths">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=EDGE">


    <title>Checkout | MATCHESFASHION.COM UK</title>

    <meta name="title" content="Checkout | MATCHESFASHION.COM UK">
    <meta name="robots" content="noindex, nofollow">
    <link rel="dns-prefetch" href="https://assets.matchesfashion.com/">
    <link rel="dns-prefetch" href="https://assetsprx.matchesfashion.com/">

    <link rel="shortcut icon" type="image/x-icon" media="all"
          href="https://www.matchesfashion.com/_ui/rwd/common/images/favicon.ico">

    <link rel="stylesheet"
          href="https://www.matchesfashion.com/_ui/rwd/common/styles/css/matchesfashion_font_en.css">
    <link rel="stylesheet" type="text/css" media="all"
          href="https://www.matchesfashion.com/_ui/rwd/common/styles/css/matchesfashion.css">
    <link rel="stylesheet" type="text/css" media="all"
          href="https://www.matchesfashion.com/_ui/rwd/common/styles/css/matchesfashion_checkout_page.css">
    <link rel="stylesheet" type="text/css" media="all"
          href="https://www.matchesfashion.com/_ui/rwd/common/styles/css/matchesfashion_footer_pages.css">
    <link rel="stylesheet" type="text/css" media="all" href="https://assets.matchesfashion.com/css/meta_prd.css">


    <!--<base href="/" target="_self">-->
    <base href="." target="_self">
    <style>@font-face {
        font-family: Group3;
        font-style: normal;
        font-weight: 100;
        src: local("Georgia")
    }

    @font-face {
        font-family: Group3;
        font-style: normal;
        font-weight: 200;
        src: local("Georgia")
    }

    @font-face {
        font-family: Group3;
        font-style: normal;
        font-weight: 300;
        src: local("Georgia")
    }

    @font-face {
        font-family: Group3;
        font-style: normal;
        font-weight: 400;
        src: local("Georgia")
    }

    @font-face {
        font-family: Group3;
        font-style: normal;
        font-weight: 500;
        src: local("Georgia-Bold")
    }

    @font-face {
        font-family: Group3;
        font-style: normal;
        font-weight: 600;
        src: local("Georgia-Bold")
    }

    @font-face {
        font-family: Group3;
        font-style: normal;
        font-weight: 700;
        src: local("Georgia-Bold")
    }

    @font-face {
        font-family: Group3;
        font-style: normal;
        font-weight: 800;
        src: local("Georgia-Bold")
    }

    @font-face {
        font-family: Group3;
        font-style: normal;
        font-weight: 900;
        src: local("Georgia-Bold")
    }

    @font-face {
        font-family: Group3;
        font-style: normal;
        font-weight: 700;
        src: local("Georgia-Bold")
    }

    b, strong {
        font-weight: 900 !important;
        line-height: inherit
    }</style>

</head>

<body class="page-multiStepCheckoutSummaryPage pageType-ContentPage template-pages-MultiStepCheckoutSummaryPageTemplate pageLabel-multiStepCheckoutSummary language-en_GB"
      data-fsm-auto-manual-value="">
<div id="cboxOverlay" style="display: none;"></div>
<div id="colorbox" class="" style="padding-bottom: 0px; padding-right: 1614px; display: none;">
    <div id="cboxWrapper" style="">
        <div id="cboxContent" style="">
            <div id="cboxLoadedContent" class="" style="width: 0px; height: 0px; overflow: hidden; float: left;"></div>
            <div id="cboxLoadingOverlay" class="" style="float: left;"></div>
            <div id="cboxLoadingGraphic" class="" style="float: left;"></div>
            <div id="cboxTitle" class="" style="float: left;"></div>
            <div id="cboxCurrent" class="" style="float: left;"></div>
            <div id="cboxNext" class="" style="float: left;"></div>
            <div id="cboxPrevious" class="" style="float: left;"></div>
            <div id="cboxSlideshow" class="" style="float: left;"></div>
            <a id="cboxClose" href="javascript:void(0);" class="" style="float: left;"></a></div>
    </div>
    <div style="position: absolute; width: 9999px; visibility: hidden; display: none;"></div>
</div>
<div id="page" data-currency-iso-code="GBP">
    <div class="grid-container">
        <div class="checkout-header">
            <a href="https://www.matchesfashion.com/">
                <h1 class="checkout-header__logo"
                    style="background-image: url(https://www.matchesfashion.com/_ui/rwd/common/images/svg/mf-logo_xl.svg);"></h1>
            </a>
            <p class="checkout-header__sub-logo">
                modern luxury shopping</p>

        </div>


        <div id="globalMessages">
        </div>

        <div class="checkout-stage review-stage">


            <div class="progress-bar">
                <ul data-role="navbar" id="checkoutProgress" class="checkout-steps">


                    <li class="step login visited">
                        1. SIGN IN
                    </li>


                    <li class="step shipping visited">
                        2. SHIPPING
                    </li>


                    <li class="step reviewAndPay active">
                        3. REVIEW AND PAY
                    </li>


                </ul>
            </div>
            <div class="footer-page-popup mf-overlay mfp-hide">
                <div class="footer-page-popup__header"><h2>
                    <span>Customer services</span></h2></div>
                <div class="footer-page-popup__content"></div>
            </div>
            <div class="returns-page-popup mf-overlay mfp-hide">
                <div class="returns-page-popup__header"><h2>
                    <span>Customer services</span></h2></div>
                <div class="returns-page-popup__content"></div>
            </div>
            <div class="chk__main__header">
                <h2 class="checkout__header__title">REVIEW AND PAY</h2>
                <div class="helper__icons">
                    <a href="https://www.matchesfashion.com/#" id="deliveryPopupLink">Shipping</a>,
                    <a href="https://www.matchesfashion.com/#" id="returnsPopupLink">Returns</a>
                    and&nbsp;<a href="https://www.matchesfashion.com/#" id="helpPopupLink">Help</a>
                </div>
                <div class="helper__icons__mobile">
                    <a href="https://www.matchesfashion.com/#" id="mobileHelpPopupLink">Need Help?</a>
                </div>
            </div>

            <div id="checkoutReviewAndPay" class="review-stage__wrapper">
                <div class="chk__shipping__address">
                    <div class="shipping-stage__header">
                        <h3 class="checkout__subheader__title">
                            SHIPPING ADDRESS</h3>
                    </div>
                    <div id="shippingAddressSection">
                        <div class="new-address-block chk__wrapper clearfix">


                            <div id="delivery_addressSelector" class="delivery">

                                <div id="saved-address" class="saved-address" data-cs-mask="">
                                    <div class="">
                                        <div class="cr">
                                            <input type="radio" name="delivery_addressType"
                                                   id="delivery_existingAddressRadio" value="existing"
                                                   class="input-width" data-com.agilebits.onepassword.user-edited="yes">


                                            <label id="selected-radio" for="delivery_existingAddressRadio"
                                                   class="form-label-text"><span>USE SAVED ADDRESS</span></label>


                                        </div>

                                        <div class="form_field-elements clearfix">
                                            <div class="control-group custom-address-selector">
                                                <label class="control-label " for="delivery-address.select">
                                                    <span class="control-label-value"></span>
                                                    <div class="custom-select addressSelect">
                                                        <div class="selecter  cover closed" tabindex="0"><select
                                                                data-mf-select="" id="delivery-address.select"
                                                                name="addressSelect" css="" class="cs__element"
                                                                tabindex="-1">
                                                            <option value="9750299934743" selected="selected">
                                                                90 york way
                                                            </option>

                                                            <option value="9750312222743">
                                                                123 east huan cheng road
                                                            </option>
                                                        </select><span class="cs__selected">
            90 york way
        </span>
                                                            <div class="cs__options"><span class="cs__item selected"
                                                                                           data-value="9750299934743">
            90 york way
        </span><span class="cs__item" data-value="9750312222743">
            123 east huan cheng road
        </span></div>
                                                        </div>
                                                    </div>
                                                </label>


                                            </div>
                                        </div>
                                    </div>


                                    <div>

                                        <div class="address-info" data-mode="view">
                                            <div class="form_input mode-view address-view">
                                                <div class="addressDetails">

                                                    <span>Mr Joe Smith</span>
                                                    <span>90 york way</span>


                                                    <span>london</span>
                                                    <span></span>
                                                    <span>n1 9ag</span>

                                                    <span>United Kingdom</span>


                                                </div>
                                            </div>


                                        </div>

                                    </div>

                                </div>

                                <div class="">
                                    <div id="alternate-address-option" class="alternate-option">Or</div>

                                    <div class="delivery--address">
                                        <div class="new-address" data-cs-mask="">
                                            <div class="cr">
                                                <input type="radio" name="delivery_addressType"
                                                       id="delivery_newAddressRadio" value="new" class="input-width">
                                                <label id="unselected-radio" for="delivery_newAddressRadio"
                                                       class="delivery--form-label-text"><span>ENTER NEW SHIPPING ADDRESS</span></label>
                                            </div>

                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>


                        <div class="shipping-country-switcher mfp-hide">
                            <div class="shipping-country-switcher__header">
                                <h2><span>Change of shipping country</span></h2>
                            </div>

                            <div class="shippingmodal-content">
                                <p class="lead">You changed your country of delivery. Please note, available billing
                                    currencies, as well as item availability and pricing, are country specific. By
                                    clicking continue you will be redirected to the relevant MATCHESFASHION.COM
                                    country-specific website where you will be able to review the contents of your
                                    shopping bag before continuing with your purchase.</p>


                                <p class="amend-text">Alternatively if you wish to ship to <strong>United
                                    Kingdom</strong> please amend your shipping address.</p>
                            </div>

                            <div class="modal-action-btn">
                                <button class="cancel-btn">Cancel</button>
                                <button class="continue-btn">Continue</button>
                            </div>
                        </div>
                    </div>
                </div>
                <input id="notNavigatedFromShippingPage" type="hidden" value="true">
                <div id="shippingMethodSection" class="chk__shipping__method">
                    <h3 class="checkout__subheader__title">SHIPPING METHOD</h3>
                    <p class="para-info" style="display: none;">Please save your address for delivery options.</p>


                    <p class="para-info" style="display: none;">Please save your address for delivery options</p>

                    <div class="delivery-method-info" data-mode="edit">
                        <div class="form_input mode-view hidden">
                            <div class="deliveryMethodView">
                                <p class="para-info">

                                    This order will be sent via <span class="upper-text">Express</span> (Delivered in
                                    2-3 working days)

                                </p>
                                <p class="para-info"><a class="editDeliveryMethodLink"
                                                        href="https://www.matchesfashion.com/#">Edit/change shipping
                                    method</a></p>
                            </div>
                        </div>

                        <div class="form_input mode-edit ">
                            <div id="deliveryMethod" class="chk__shipping__method__table" style="display: block;">
                                <div id="deliveryMethodTable">
                                    <div class="delivery-table clearfix">


                                        <div class="delivery-row" id="immediacyDelivery">


                                            <div class="delivery-period">
                                                <div class="delivery-header">90 MINUTES</div>


                                                <div class="delivery-time">

                                                    <div>Get your order in the next 90 minutes.</div>

                                                </div>
                                            </div>

                                            <div class="select-delivery">
                                                <div class="cr">
                                                    <input id="deliverytypesOnTheDot90MinDelivery" type="radio"
                                                           name="deliveryMethod" value="OnTheDot90MinDelivery">
                                                    <label for="deliverytypesOnTheDot90MinDelivery"></label>
                                                </div>
                                            </div>

                                            <div class="delivery-price">&pound;18.00</div>
                                        </div>
                                    </div>

                                    <div class="delivery-table clearfix">

                                        <div class="delivery-row no-hidden-overflow" id="nominatedDelivery">

                                            <div class="delivery-period">
                                                <div class="delivery-header">Premium</div>


                                                <div id="onTheDotDelivery" class="delivery-time">

                                                    <div>Delivery seven days a week, with nominated-hour option.</div>

                                                    <div>
                                                        <div>Select Day:</div>
                                                        <div class="nominatedDays__container" style="border: none;">
                                                            <div class="selecter  cover closed" tabindex="0">
                                                                <span class="cs__selected default-opt">Wed, 06th Mar</span>

                                                            </div>
                                                        </div>
                                                        <div>Select Hour:</div>
                                                        <div class="nominatedDayTimeSlots__container"
                                                             style="border: none;">
                                                            <div class="selecter  cover closed" tabindex="0">
                                                                <span class="cs__selected default-opt">14:00 - 15:00</span>

                                                            </div>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                    </div>

                                                </div>
                                            </div>

                                            <div class="select-delivery">
                                                <div class="cr">
                                                    <input id="deliverytypesOnTheDotNominatedDayDelivery" type="radio"
                                                           name="deliveryMethod" value="OnTheDotNominatedDayDelivery">
                                                    <label for="deliverytypesOnTheDotNominatedDayDelivery"></label>
                                                </div>
                                            </div>

                                            <div class="delivery-price">&pound;12.00</div>
                                        </div>
                                    </div>

                                    <div class="delivery-table clearfix">


                                        <div class="delivery-row">


                                            <div class="delivery-period">
                                                <div class="delivery-header">NEXT DAY</div>


                                                <div class="delivery-time">

                                                    <div>Place order before 7 PM Monday to Thursday for next day
                                                        delivery
                                                    </div>

                                                </div>
                                            </div>

                                            <div class="select-delivery">
                                                <div class="cr">
                                                    <input id="deliverytypesnextday-uk-dc-stock" type="radio"
                                                           name="deliveryMethod" value="nextday-uk-dc-stock">
                                                    <label for="deliverytypesnextday-uk-dc-stock"></label>
                                                </div>
                                            </div>

                                            <div class="delivery-price">&pound;8.00</div>
                                        </div>
                                    </div>

                                    <div class="delivery-table clearfix">


                                        <div class="delivery-row">


                                            <div class="delivery-period">
                                                <div class="delivery-header">Express</div>


                                                <div class="delivery-time">

                                                    <div>Delivered in 2-3 working days</div>

                                                </div>
                                            </div>

                                            <div class="select-delivery">
                                                <div class="cr">
                                                    <input id="deliverytypesexpress" type="radio" name="deliveryMethod"
                                                           value="express" checked="true">
                                                    <label for="deliverytypesexpress"></label>
                                                </div>
                                            </div>

                                            <div class="delivery-price">&pound;5.00</div>
                                        </div>
                                    </div>
                                </div>
                                <div id="adhocDeliveryMessage"></div>
                                <div class="table-line line1"></div>
                                <div class="table-line line2"></div>
                                <div class="table-line line3"></div>
                            </div>
                        </div>
                    </div>


                </div>
                <div id="citesRestrictionOverlay" class="citesRestrictionOverlay mf-overlay mfp-hide notVisible">
                    <div class="citesRestrictionOverlay__header"><h2>
                        <span> Shipping restrictions</span></h2></div>
                    <div class="content ">One or more items in your shopping bag is subject to shipping restrictions
                        that may result in a delay to your order. Please place your order as normal and a member of our
                        MyStylist team will contact you with more information and to arrange the delivery
                    </div>
                    <div class="modal-action-btn">
                        <button class="continue-btn">Continue</button>
                    </div>
                </div>

                <div id="checkoutGiftMessageSection" class="chk__gift__message">
                    <h3 class="checkout__subheader__title">GIFT MESSAGE</h3>


                    <script type="text/template" id="giftMessageInvalid">
                        Please add a gift message
                    </script>


                    <div id="giftMessage" class="clearfix">
                        <form id="giftMessageForm" method="post"
                              action="https://www.matchesfashion.com/checkout/giftMessage/set" data-mode="add"
                              novalidate="novalidate">
                            <div class="form_field-elements">
                                <div class="control-group">

                                    <div class="form_input mode-add mode-view mode-edit hidden" style="display: block;">

                                        <div class="form_input mode-add">
                                            <p class="para-info noMessages">
                                                This order has no gift message.
                                            </p>

                                            <p class="para-info giftMessageWrap">
                                                <a id="addGiftMessageLink" href="https://www.matchesfashion.com/#">Add
                                                    gift message</a>
                                            </p>
                                        </div>

                                        <div class="form_input mode-edit" style="display: none;">
                                            <p class="para-info">To send your gift with an accompanying card, please
                                                type your message below.</p>
                                        </div>

                                        <div class="control-group">
                                            <div class="form_input mode-view" style="display: none;">
                                                <span id="giftMessageView"></span>
                                                <a id="addEditGiftMessageLink" href="https://www.matchesfashion.com/#">Edit/Change
                                                    Gift Message</a>
                                            </div>

                                            <div class="form_input mode-edit" style="display: none;">


                                                <div id="giftMsg" class="gift__container">

                                                    <div class="giftBox dummyTextarea">&nbsp;</div>

                                                    <div class="gift__textarea__wrapper">
                                                        <label class="control-label " for="giftMessageText">
                                                        </label>
                                                        <div class="controls">
                                                            <textarea id="giftMessageText" name="giftMessage"
                                                                      class="giftBox gift__textarea"
                                                                      placeholder="Type your message here (250 characters maximum)"
                                                                      maxlength="250"
                                                                      data-counter-id="#giftMessageCounter"
                                                                      style="padding-top: 117.5px; height: 157.5px;"></textarea>
                                                        </div>

                                                    </div>

                                                    <h1 class="matches__logo"></h1>

                                                    <div class="gift__buttons">

                                                        <button id="removeGiftMessageBtn" type="button"
                                                                class="button-white message-cancel-btn message-save-btn btn-form positive">
                                                            CANCEL
                                                        </button>
                                                        <button id="saveGiftMessageBtn" type="button"
                                                                class="button message-save-btn btn-form positive">SAVE
                                                            MESSAGE
                                                        </button>

                                                    </div>

                                                </div>

                                                <div id="giftMessageCharCountdown" class="para-info">
                                                    You have <span id="giftMessageCounter" class="safe">250</span> of
                                                    250 characters left
                                                </div>

                                            </div>

                                        </div>

                                    </div>

                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div id="packagingOptionsSection" class="chk__packaging__options packaging-wrapper">
                    <h3 class="checkout__subheader__title">
                        PACKAGING OPTIONS</h3>


                    <div id="packagingMessage" class="packaging-options chk__wrapper cr clearfix">
                        <div class="luxury__package clearfix">
                            <div class="package__image">
                                <img src="https://www.matchesfashion.com/_ui/rwd/common/images/luxury-pkg.png">
                            </div>
                            <div class="package__info">
                                <input id="luxuryPackageRadio" type="radio" name="packagingOption" value="marble"
                                       checked="checked">
                                <label for="luxuryPackageRadio">
                                    <div class="package__message">
                                        <h4>MARBLED PACKAGING (FREE)</h4>
                                        <span>Receive your order perfectly packaged in our iconic boxes.</span>
                                    </div>
                                </label>
                            </div>
                        </div>

                        <div class="plain__package">
                            <div class="package__image">
                                <img src="https://www.matchesfashion.com/_ui/rwd/common/images/discreet-pkg.png">
                            </div>
                            <div class="package__info">
                                <input id="plainPackageRadio" type="radio" name="packagingOption" value="plain">
                                <label for="plainPackageRadio">
                                    <div class="package__message">
                                        <h4>ECO PACKAGING (FREE)</h4>
                                        <span>For a more discreet option, choose our recycled and recyclable packaging.</span>
                                    </div>
                                </label>
                            </div>
                        </div>
                    </div>

                </div>
                <div id="checkoutOrderSummarySection" class="ordersummary-review clearfix">
                    <h3 class="checkout__subheader__title">ORDER SUMMARY</h3>


                    <div id="checkoutOrderDetails" class="order__items clearfix">
                        <div>

                            <div class="deliveryCartItems">
                                <div id="mobileorderEntryRow" class="orderitems-list-row clearfix">


                                    <div class="xtr-0 clearfix">

                                        <div class="orderitems-list-row__thumb">
                                            <img src="https://assetsprx.matchesfashion.com/img/product/1241622_1_thumbnail.jpg"
                                                 alt="Balenciaga Derby rope lace leather shoes"
                                                 title="Balenciaga Derby rope lace leather shoes">
                                        </div>

                                        <div class="orderitems-list-row__ordersummary-container">
                                            <div class="item__description">
                                                <div class="itemBrandName">Balenciaga</div>
                                                <div class="itemProdName">Derby rope lace leather shoes</div>
                                                <div class="itemCodeName">(1241622)</div>
                                            </div>

                                            <div class="order__description">
                                                <div class="item__color">
                                                    <div>Colour:&nbsp;Black</div>
                                                </div>

                                                <div class="size">Size: &nbsp;<span class="order-val">42 EU</span></div>

                                                <div class="item__qty">Qty: &nbsp; 1</div>

                                                <div class="unit-price">Unit price:&nbsp;&pound;785.00
                                                </div>


                                            </div>

                                            <div class="item__price">Item total:&nbsp; &pound;785.00</div>
                                        </div>

                                    </div>


                                </div>
                            </div>





                            <div class="deliveryCartItems">
                                <div id="tabletorderEntryRow" class="orderitems-list-row clearfix"></div>
                            </div>




                            <div class="deliveryCartItems">
                                <div id="orderEntryHeader" class="orderheader-row">

                                    <div class="xtr-0">

                                        <div id="header1" class="orderheader-row__thumb">Item</div>
                                        <div id="header2" class="orderheader-row__item__description">Description</div>
                                        <div id="header3" class="orderheader-row__color">Colour</div>
                                        <div id="header4" class="orderheader-row__size">Size</div>
                                        <div id="header5" class="orderheader-row__qty">Qty</div>
                                        <div id="header6" class="orderheader-row__unit-price">Unit price</div>


                                        <div id="header10" class="orderheader-row__item-price">Item total</div>
                                    </div>
                                </div>

                                <div id="orderEntryRow" class="orderitems-list-row clearfix">


                                    <div class="xtr-0 block">

                                        <div class="orderitems-list-row__thumb">
                                            <img src="https://assetsprx.matchesfashion.com/img/product/1241622_1_thumbnail.jpg"
                                                 alt="Balenciaga Derby rope lace leather shoes"
                                                 title="Balenciaga Derby rope lace leather shoes">
                                        </div>
                                        <div class="orderitems-list-row__item__description">
                                            <div class="itemBrandName">Balenciaga</div>
                                            <div class="itemProdName">Derby rope lace leather shoes</div>
                                            <div class="itemCodeName">(1241622)</div>
                                        </div>
                                        <div class="orderitems-list-row__color">Black</div>
                                        <div class="orderitems-list-row__size">42 EU</div>
                                        <div class="orderitems-list-row__qty">1</div>
                                        <div class="orderitems-list-row__unit-price">&pound;785.00</div>


                                        <div class="orderitems-list-row__item-price">&pound;785.00</div>
                                    </div>

                                </div>

                                <div class="edit-order">
                                    <div><a class="edit-order-text" href="https://www.matchesfashion.com/shopping-bag">
                                        Edit order</a>
                                    </div>
                                </div>

                            </div>

                        </div>

                        <div class="order__cart-totals chk__wrapper">


                            <div class="us-tax-layout-totals">

                                <div id="orderTotals">
                                    <table class="cart-totals">
                                        <tbody>
                                        <tr>
                                            <td><p class="cart-description">Unit total</p></td>
                                            <td>
                                                <div id="basket-page-unit-total-totals" class="cart-value">&pound;785.00</div>
                                            </td>
                                        </tr>


                                        <tr>
                                            <td><p class="cart-description">Delivery</p></td>
                                            <td><p id="basket-page-delivery-totals" class="cart-value">&pound;5.00</p></td>
                                        </tr>
                                        <tr class="total-sum">
                                            <td><p class="cart-description"><strong>TOTAL</strong></p></td>
                                            <td><p id="basket-page-total-totals" class="cart-value">
                                                <strong>&pound;790.00</strong></p></td>
                                        </tr>
                                        </tbody>
                                    </table>


                                </div>

                            </div>

                        </div>
                    </div>
                </div>
                <div class="payment__section-block">
                    <div class="payment-header-block">
                        <div class="payment-header">
                            <h3 class="checkout__subheader__title">
                                PAYMENT DETAILS</h3>
                        </div>
                        <div class="generic__error__message">Please correct the following fields</div>
                        <div id="newAddressSelected" class="generic__error__message">
                            Please either save the new address or select an existing address.
                        </div>
                        <div class="payment__error-message" style="display: block;">
                        </div>
                        <div class="nominatedDelivery__error-message" style="display: none;">
                            Please select a delivery time slot.
                        </div>
                        <div class="payment-button">
                            <button class="purchaseNowBtn button btn-form purchase-btn button__sbp-checkout"
                                    type="button" style="opacity: 1;">
                                Purchase Now
                            </button>
                        </div>
                    </div>

                    <div id="checkoutPaymentDetailsSection">
                        <div class="payment-wrapper">
                            <div class="chk__payment__details chk__noCredit">


                                <div id="paymentMethod" class="chk__credit__payments">


                                    <div id="paymentMethod" class="payment-method">
                                        <div class="creditheader-block">
                                            <h4 class="subsection__title">PAYMENT METHOD</h4>
                                            <div id="totalLine" class="totalcredit-info"></div>
                                        </div>


                                        <div class="credit-payments">

                                            <div id="creditPayment" class="notVisible fullcredit-payment">
                                                <div class="cr">
                                                    <input type="radio" name="payment" id="credit" value="credit">
                                                    <label for="credit">PAY WITH CREDIT</label>

                                                </div>
                                            </div>
                                            <div id="partCreditPayment" class="notVisible partcredit-payment">
                                                <div class="cr clearfix">
                                                    <input type="radio" name="payment" id="partcredit"
                                                           value="partcredit">
                                                    <label for="partcredit">PART PAY WITH</label>

                                                </div>
                                                <div id="currencySymbol" class="partpay-amount"></div>
                                            </div>
                                        </div>
                                        <div class="card_and_paypal_container">
                                            <div class="apple-pay-option">
                                                <div class="cr">
                                                    <input type="radio" name="payment" id="apple" value="apple">
                                                    <label for="apple" id="applePay" class="selected-radio">PAY WITH APPLE PAY</label>

                                                    <div class="paypal-option__logos">
                                                        <img srcset="<c:url value="/resources/img/apple-pay.png"/>">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="cardpayment-option">
                                                <div class="cr">
                                                    <input type="radio" name="payment" id="creditcard"
                                                           value="creditcard"
                                                           data-com.agilebits.onepassword.user-edited="yes">
                                                    <label for="creditcard" id="cardPayment" class="selected-radio">PAY WITH CARD</label>

                                                    <div class="cardpayment-option__logos">
                                                        <ul class="cardpayment-option__logos__container">

                                                            <li><img class="cardpayment-option__logos__amex"
                                                                     src="https://www.matchesfashion.com/_ui/rwd/common/images/logos/amex-logo.png">
                                                            </li>

                                                            <li><img class="cardpayment-option__logos__master"
                                                                     src="https://www.matchesfashion.com/_ui/rwd/common/images/logos/master-logo.png">
                                                            </li>

                                                            <li><img class="cardpayment-option__logos__visa"
                                                                     src="https://www.matchesfashion.com/_ui/rwd/common/images/logos/visa-logo.png">
                                                            </li>

                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="paypal-option">
                                                <div class="cr">
                                                    <input type="radio" name="payment" id="paypal" value="paypal">
                                                    <label for="paypal" id="unselected-radio">PAY WITH PAYPAL</label>

                                                    <div class="paypal-option__logos">
                                                        <img srcset="https://www.matchesfashion.com/_ui/rwd/common/images/logos/paypal-logo-large.jpg"
                                                             alt="">
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="bottomLine hidden" style="display: block;"></div>

                                    </div>

                                </div>

                                <div id="checkoutPaymentDetails" style="display: block;">





                                    <div id="existingCardDetails" class="existing-cards notVisible" data-cs-mask=""
                                         style="display: block;">

                                        <div class="cardtype-option">
                                            <p class="selectcard-text" id="selectCardText">PAY WITH CARD:</p>
                                            <p class="selectcard-text" id="selectPaymentText" style="display: none;">PAY
                                                REMAINING BALANCE USING:</p>
                                        </div>
                                    </div>


                                    <div class="selectable-options cr">

                                        <input type="radio" name="cardDetails" value="new" id="newCardEntry"
                                               class="input-width" style="display: none;"
                                               data-com.agilebits.onepassword.user-edited="yes">
                                        <label for="newCardEntry" id="selected-radio" class="newcard-form-label-text">ENTER
                                            CARD DETAILS</label>

                                    </div>

                                    <div id="newCardDetails" class="card-details" data-cs-mask="">


                                        <div id="card-element"></div>

                                    </div>


                                    <div class="billing-address-block billing-address-block__with-PayPal"
                                         data-cs-mask="" style="display: block;">


                                        <div id="billing_addressSelector" class="billing">



                                            <div id="saved-address" class="saved-address" data-cs-mask="">
                                                <div class="">
                                                    <div class="cr">
                                                        <input type="radio" name="billing_addressType"
                                                               id="billing_existingAddressRadio" value="existing"
                                                               class="input-width"
                                                               data-com.agilebits.onepassword.user-edited="yes">


                                                        <label for="billing_existingAddressRadio billing-address"
                                                               id="selected-radio" class="form-label-text"
                                                               style="margin-top: 30px;"><span class="billing-label">SELECT BILLING ADDRESS</span></label>
                                                        <p class="new-billing-text">Please ensure that your billing
                                                            address matches the address held by your card issuer.</p>


                                                    </div>

                                                    <div class="form_field-elements clearfix">
                                                        <div class="control-group custom-address-selector">
                                                            <label class="control-label " for="billing-address.select">
                                                                <span class="control-label-value"></span>
                                                                <div class="custom-select addressSelect">
                                                                    <div class="selecter  cover closed" tabindex="0">
                                                                        <select data-mf-select=""
                                                                                id="billing-address.select"
                                                                                name="addressSelect" css=""
                                                                                class="cs__element" tabindex="-1">
                                                                            <option value="9750299934743"
                                                                                    selected="selected">
                                                                                90 york way
                                                                            </option>

                                                                            <option value="9750312222743">
                                                                                123 east huan cheng road
                                                                            </option>
                                                                        </select><span class="cs__selected">
            90 york way
        </span>
                                                                        <div class="cs__options"><span
                                                                                class="cs__item selected"
                                                                                data-value="9750299934743">
            90 york way
        </span><span class="cs__item" data-value="9750312222743">
            123 east huan cheng road
        </span></div>
                                                                    </div>
                                                                </div>
                                                            </label>


                                                        </div>
                                                    </div>
                                                </div>


                                                <div>
                                                    <div class="address-info" data-mode="view">
                                                        <div class="form_input mode-view address-view">
                                                            <div class="addressDetails">

                                                                <span>Mr Joe Smith</span>
                                                                <span>90 york way</span>


                                                                <span>london</span>
                                                                <span></span>
                                                                <span>n1 9ag</span>

                                                                <span>United Kingdom</span>


                                                            </div>
                                                        </div>


                                                    </div>

                                                </div>

                                            </div>

                                            <div class="">
                                                <div id="alternate-address-option" class="alternate-option">Or</div>

                                                <div class="billing--address">
                                                    <div class="new-address" data-cs-mask="">
                                                        <div class="cr">
                                                            <input type="radio" name="billing_addressType"
                                                                   id="billing_newAddressRadio" value="new"
                                                                   class="input-width">
                                                            <label id="unselected-radio" for="billing_newAddressRadio"
                                                                   class="billing--form-label-text"><span>ENTER A NEW BILLING ADDRESS</span></label>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <p id="validationFailureMessage" class="hidden">
                        <span>checkout.payerAuthValidation.failure.title</span>
                        <span>checkout.payerAuthValidation.failure.description</span>
                    </p>

                    <div id="payerAuthValidation" class="checkout__payer-auth-popup mf-overlay mfp-hide">
                        <p class="payer-auth-popup__guidance-message">
                            Processing your order... Do not click the Refresh or Back button or this transaction may be
                            interrupted.
                        </p>

                        <iframe name="paInlineFrame" src="javascript:false" class="payer-auth-popup__embedded"
                                frameborder="0" src="./Checkout _ MATCHESFASHION.COM UK_files/saved_resource.html">
                        </iframe>

                        <form name="PAReqForm" method="POST" target="paInlineFrame" class="hidden">
                            <input type="hidden" name="PaReq" value="BLANK">
                            <input type="hidden" name="TermUrl" value="BLANK">
                            <input type="hidden" name="MD" value="BLANK">
                        </form>

                        <div class="payer-auth-popup__customer-care">
                            <p>For assistance, or to order by phone call t: | 0 800 009 4123 (UK Toll Free) or +44 (0)20
                                7022 0828 .</p>
                            <p>Or email customer services customercare@matchesfashion.com.</p>
                        </div>

                    </div>
                    <div class="generic__error__message">Please correct the following fields</div>
                    <div id="newAddressSelected2" class="generic__error__message">
                        Please either save the new address or select an existing address.
                    </div>
                    <div class="payment__error-message" style="display: block;">
                    </div>
                    <div class="nominatedDelivery__error-message" style="display: none;">
                        Please select a delivery time slot.
                    </div>
                    <div class="bottom-btn">
                        <div class="payment-button">
                            <button class="purchaseNowBtn button btn-form purchase-btn" type="button"
                                    style="opacity: 1;">
                                Purchase Now
                            </button>
                        </div>
                        <div id="payment-request-button" class="payment-request-button">
                            <!-- A Stripe Element will be inserted here. -->
                        </div>
                    </div>
                </div>

            </div>


            <div class="checkout__mobile-returns-footer clearfix">
                <button class="shipping" id="mobileDeliveryPopupLink">Shipping information</button>
                <button class="returns" id="mobileReturnsPopupLink">Returns</button>
            </div>
        </div>
        <input id="isCardLast" type="text" value="false" hidden="true">
        <input id="isCardUsedBefore" type="text" value="false" hidden="true">
        <input id="isPayPalUsedBefore" type="text" value="false" hidden="true">
        <div class="hidden dutyFreeTextHolder">DUTY FREE</div>


        <div class="hidden edq-config" data-gi-auth-token="e25b565a-c50f-48a7-af8f-4118dad7a312"
             data-gi-search-url="https://api.edq.com/capture/address/v2/search"
             data-gi-address-url="https://api.edq.com/capture/address/v2/format" data-gi-timeout="5000"
             data-gi-max-results="25"
             data-gi-address-not-found="We couldn’t find your address. &lt;span&gt;Enter it manually &gt;&lt;/span&gt;"
             data-gi-logging="true"></div>

        <div class="checkout-footer">
            <div class="checkout-footer__wrapper">
                <ul class="checkout-footer__contact">

                    <li id="ftChkOutNumTollFree" class="non-mobile">Tel. <span>0800 009 4123 (UK Toll Free)</span></li>
                    <li id="ftChkOutNumIntl" class="non-mobile">Tel. <span">+44 (0)20 7022 0828</span"><span">+44 (0)20
                        7022 0828</span">
                    </li>
                    <li id="ftChkOutNumTollFreeMbl" class="mobile">Tel. <span">0800 009 4123 (UK Toll Free)</span"><span">0800
                        009 4123 (UK Toll Free)</span">
                    </li>
                    <li id="ftChkOutNumIntlMbl" class="mobile">Tel. <span">+44 (0)20 7022 0828</span"><span">+44 (0)20
                        7022 0828</span">
                    </li>
                    <li>Or email<a href="mailto:mystylist@matchesfashion.com"> mystylist@matchesfashion.com</a></li>
                </ul>
                <div class="checkout-footer__copyright">
                    <div class="copy">© Copyright 2015</div>
                    <div class="company">matchesfashion.com</div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://js.stripe.com/v3/"></script>
<script src="<c:url value="/resources/vendor/jquery/jquery.min.js"/>"></script>
<script>
    $('#checkoutPaymentDetails').hide();
    $('.payment-request-button').hide();
    $('.payment-button').hide();
    $('.apple-pay-option').on('click', function () {
        //alert('apple');
        $('#checkoutPaymentDetails').hide();
        $('.payment-button').hide();
        $('.payment-request-button').show();
    });

    $('.cardpayment-option').on('click', function () {
        //alert('card');
        $('#checkoutPaymentDetails').show();
        $('.payment-button').show();
        $('.payment-request-button').hide();
    })

</script>
<script>
    var stripe = Stripe('pk_test_1xnx7cgl5GI19qFxg3bOcBD5', {
        betas: ['payment_intent_beta_3']
    });

    var style = {
        base: {
            color: '#424770',
            fontSize: '14px',
            '::placeholder': {
                color: '#ccc',
            },
            fontSmoothing: 'antialiased',
        },
        invalid: {
            color: '#e5424d',
            ':focus': {
                color: '#303238',
            },
        },
    };

    var elements = stripe.elements();
    var cardElement = elements.create('card', {hidePostalCode: true, style: style});
    cardElement.mount('#card-element');
</script>

<script>
    var stripe = Stripe('pk_test_1xnx7cgl5GI19qFxg3bOcBD5');

    var paymentRequest = stripe.paymentRequest({
        country: 'GB',
        currency: 'gbp',
        total: {
            label: 'MatchesFashion order',
            amount: 79000,
        },
        requestPayerName: true,
        requestPayerEmail: true
        /*requestShipping: true,
        shippingOptions: [
            {
                id: '1',
                label: 'std delivery',
                amount: 300
            },
            {
                id: '2',
                label: 'express delivery',
                amount: 500
            }
        ]*/

    });

    var elements = stripe.elements();
    var prButton = elements.create('paymentRequestButton', {
        paymentRequest: paymentRequest,
    });

    console.log(paymentRequest);

    // Check the availability of the Payment Request API first.
    paymentRequest.canMakePayment().then(function(result) {
        if (result) {
            prButton.mount('#payment-request-button');
        } else {
            document.getElementById('payment-request-button').style.display = 'none';
        }
    });

</script>

</body>
</html>


<style type="text/css" media="screen">

    .StripeElement {
        background-color: #fcfcfc;
        color: #424770;
        height: 40px;
        padding: 10px 12px;
        border-radius: 4px;
        border: 1px solid #e1e3ea;
        box-shadow: 0 1px 3px 0 #e6ebf1;
        -webkit-transition: box-shadow 150ms ease;
        transition: box-shadow 150ms ease;
    }

    .payment-request-button {
        border:0;
        padding:0;
    }

    .StripeElement--focus {
        box-shadow: 0 1px 3px 0 #cfd7df;
    }

    .StripeElement--invalid {
        border-color: #fa755a;
    }

    .StripeElement--webkit-autofill {
        background-color: #fefde5 !important;
    }

    #selected-radio:before {
        background-image: url(https://www.matchesfashion.com/_ui/rwd/common/images/svg/mf-icn-radio.svg);
        display: inline-block;
        background-repeat: no-repeat;
        background-size: 14px 14px;
        height: 15px;
        margin-right: 10px;
        left: 0;
        bottom: 1px;
    }


    .selected-radio {
        background-image: url(https://www.matchesfashion.com/_ui/rwd/common/images/svg/mf-icn-radio.svg);
        display: inline-block;
        background-repeat: no-repeat;
        background-size: 14px 14px;
        height: 15px;
        margin-right: 10px;
        left: 0;
        bottom: 1px;
    }

    #unselected-radio:before {
        background-image: url(https://www.matchesfashion.com/_ui/rwd/common/images/svg/mf-icn-radio-border.svg);
        display: inline-block;
        background-repeat: no-repeat;
        background-size: 14px 14px;
        height: 15px;
        margin-right: 10px;
        left: 0;
        bottom: 1px;
    }

    .billing-address {
        margin-top: 30px;
    }

</style>