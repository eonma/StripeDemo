<%--
  Created by IntelliJ IDEA.
  User: chenma
  Date: 2019-05-10
  Time: 22:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


    <title>Booking | The Plum Guide</title>
    <meta content="Collection of the world’s most professional, creative, inspiring apartments and rentals in London"
          name="description">
    <meta content="The Plum Guide" property="og:site_name">
    <meta content="Booking | The Plum Guide" property="og:title">
    <meta content="website" property="og:type">
    <meta content="https://www.plumguide.com/book/payment?code=FD7SNM" property="og:url">
    <meta content="Collection of the world’s most professional, creative, inspiring apartments and rentals in London"
          property="og:description">
    <meta content="https://static.plumcache.com/static/prince_luxe_plumguide.jpg" property="og:image">
    <meta content="https://static.plumcache.com/static/prince_luxe_plumguide.jpg" property="og:image:secure_url">


    <!--view port meta tag-->
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <link rel="icon" type="image/png" sizes="32x32" href="https://www.plumguide.com/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="https://www.plumguide.com/favicon-16x16.png">
    <link rel="manifest" href="https://www.plumguide.com/webmanifest.json">
    <link rel="mask-icon" href="https://www.plumguide.com/safari-pinned-tab.svg" color="#5bbad5">
    <meta name="msapplication-TileColor" content="#603cba">
    <meta name="msapplication-TileImage" content="/mstile-144x144.png">
    <meta name="theme-color" content="#ffffff">


    <!--Force IE to use the most recent rendering engine-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--Cleartype on mobile IE-->
    <meta http-equiv="cleartype" content="on">

    <!-- stop ios formatting phone number -->
    <meta name="format-detection" content="telephone=no">

    <!-- load main styles -->
    <link rel="stylesheet" href="/resources/mockups/plum_guide/main.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/mockups/plum_guide/app.css">

    <script src="https://js.stripe.com/v3/"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://pay.google.com/gp/p/js/pay.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8.0.3/dist/sweetalert2.all.min.js"></script>
</head>


<body class="user-logged-in" ontouchstart="">


<div id="react-cookie-disclaimer"></div>


<div class="mega-menu hidden container-fluid">
    <div class="mega-menu__overlay"></div>
    <div class="mega-menu__content">
        <p class="mega-menu__header">Explore locations</p>
        <div class="mega-menu__close"><span class="plum-icon-cross"></span></div>
        <nav>
            <ul>
                <li class="mega-menu__city mega-menu__city--has-details active" data-city-id="1">
                    <h3>
                        <a class="btn-caps btn-white-transparent" href="https://www.plumguide.com/london">London</a>
                    </h3>
                </li>
                <li class="mega-menu__city mega-menu__city--has-details" data-city-id="2">
                    <h3>
                        <a class="btn-caps btn-white-transparent" href="https://www.plumguide.com/paris">Paris</a>
                    </h3>
                </li>
                <li class="mega-menu__city mega-menu__city--has-details" data-city-id="3">
                    <h3>
                        <a class="btn-caps btn-white-transparent" href="https://www.plumguide.com/new-york">New York</a>
                    </h3>
                </li>
                <li class="mega-menu__city mega-menu__city--has-details" data-city-id="4">
                    <h3>
                        <a class="btn-caps btn-white-transparent" href="https://www.plumguide.com/los-angeles">Los
                            Angeles</a>
                    </h3>
                </li>
                <li class="mega-menu__city mega-menu__city--has-details" data-city-id="5">
                    <h3>
                        <a class="btn-caps btn-white-transparent" href="https://www.plumguide.com/rome">Rome</a>
                    </h3>
                </li>
                <li class="mega-menu__city mega-menu__city--has-details" data-city-id="6">
                    <h3>
                        <a class="btn-caps btn-white-transparent" href="https://www.plumguide.com/milan">Milan</a>
                    </h3>
                </li>
            </ul>
        </nav>


        <div class="row mega-menu__information">
            <h2 class="mega-menu__title mega-menu__showable-element col-xs-12 active" data-city-id="1">
                <a href="https://www.plumguide.com/london">Apartments in London</a>
            </h2>
            <h2 class="mega-menu__title mega-menu__showable-element col-xs-12" data-city-id="2">
                <a href="https://www.plumguide.com/paris">Apartments in Paris</a>
            </h2>
            <h2 class="mega-menu__title mega-menu__showable-element col-xs-12" data-city-id="3">
                <a href="https://www.plumguide.com/new-york">Apartments in New York</a>
            </h2>
            <h2 class="mega-menu__title mega-menu__showable-element col-xs-12" data-city-id="4">
                <a href="https://www.plumguide.com/los-angeles">Apartments in Los Angeles</a>
            </h2>
            <h2 class="mega-menu__title mega-menu__showable-element col-xs-12" data-city-id="5">
                <a href="https://www.plumguide.com/rome">Apartments in Rome</a>
            </h2>
            <h2 class="mega-menu__title mega-menu__showable-element col-xs-12" data-city-id="6">
                <a href="https://www.plumguide.com/milan">Apartments in Milan</a>
            </h2>

        </div>
    </div>
</div>


<div id="react-app">
    <div></div>
</div>

<div class="container-fluid no-max-width plum-content">


    <div class="full-bleed header-container">

        <header class="main-header clearfix">
            <div class="container-fluid">
                <h1 class="logo-container"><a href="https://www.plumguide.com/" class="logo">The Plum Guide</a></h1>

                <div class="mobile-nav-button" data-test="mobile-nav-button">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>


                <form action="https://www.plumguide.com/account/logoff" class="navbar-right" id="logoutForm"
                      method="post"><input name="__RequestVerificationToken" type="hidden"
                                           value="XdVAnw5VWBCA-8tRYS1Tg0ZcWOlXGYbMBN32rdVekv_Pn8pIrFj6dtGBQtRgdWnwFAXTOuf9xhHhlb4zigsw6qJxqxHEAbjesbRNxpAV0Z8bKvggYd9NzSF-LJBbaEbbJoOdukko9qbG2G_Xodo6nw2">
                    <nav class="main-nav nav-avatar-align visible-xs">
                        <ul>
                            <li><a href="https://www.plumguide.com/book/payment?code=FD7SNM#" class="mega-menu-trigger">Locations</a>
                            </li>
                            <li><a href="https://plumguide.giftpro.co.uk/vouchers/stay-in-one-of-the-worlds-best-homes/"
                                   target="_blank">Gift vouchers</a></li>
                            <li>
                                <a href="https://www.plumguide.com/dashboard/trips">
                                    <div class="icons-container">
                                        <img class="icon circle-crop user-image"
                                             src="/resources/mockups/plum_guide/test-profile.jpg">
                                    </div>
                                    <span class="visible-xs">John</span>
                                </a>
                            </li>
                            <li><a href="https://www.plumguide.com/dashboard/trips">Your trips</a></li>
                            <li><a href="https://www.plumguide.com/dashboard/profile">Edit profile</a></li>
                            <li><a href="javascript:document.getElementById(&#39;logoutForm&#39;).submit()">Logout</a>
                            </li>
                            <li class="wishlist-link-container">
                                <a href="https://www.plumguide.com/wishlist" class="wishlist-link">
                                    <div class="icons-container">
                                        <span class="plum-icon-new-heart-filled icon background-icon"></span>
                                        <span class="plum-icon-my-heart icon"></span>
                                    </div>
                                    <span class="visible-xs">Favourites</span>
                                </a>
                                <span class="wishlist-helper-msg msg-1 hidden-xs">View your favourites here</span>
                            </li>
                            <li class="mail-link hidden-xs">
                                <a href="https://www.plumguide.com/conversations">
                                    <span class="plum-icon-envelope-alt icon"></span>
                                </a>
                            </li>
                            <li class="search-link js-search-link hidden-sm"><a href="https://www.plumguide.com/search"
                                                                                title="Search"><span
                                    class="icon plum-icon-search-magnifying-glass"></span></a></li>
                            <li class="visible-xs">
                                <a href="https://www.plumguide.com/conversations">
                                    <div class="icons-container mail-icon-notifiers">
                                        <span class="plum-icon-envelope-alt icon"></span>
                                    </div>
                                    <span> Messages</span>
                                </a>
                            </li>
                            <li>
                                <a href="https://www.plumguide.com/contact-us">Contact us</a>
                            </li>
                            <li class="hidden-sm">
                                <a href="http://help.plumguide.com/" target="_blank">Help</a>
                            </li>
                            <li class="btn-link browse-link">
                                <a href="https://www.plumguide.com/search?CityId=1" class="custom-ga-tracking"
                                   data-ga-trigger="click" data-ga-category="hamburger" data-ga-action="clicked"
                                   data-ga-label="hamburger--browse-london">
                                    Browse homes in London
                                </a>
                            </li>
                            <li class="btn-link browse-link">
                                <a href="https://www.plumguide.com/search?CityId=2" class="custom-ga-tracking"
                                   data-ga-trigger="click" data-ga-category="hamburger" data-ga-action="clicked"
                                   data-ga-label="hamburger--browse-paris">
                                    Browse homes in Paris
                                </a>
                            </li>
                            <li class="speak-to-an-expert speak-to-an-expert--mobile-nav clearfix">


                                <button class="btn plum-btn-primary btn-matchmaking-contact hidden-sm custom-ga-tracking"
                                        data-action="matchmaking:openmodal" data-ga-trigger="click"
                                        data-ga-category="navigation" data-ga-action="clicked"
                                        data-ga-label="nav-bar--expert-button"
                                        data-test="open-matchmaking-modal-button"><span class="plum-icon-call"></span>Speak
                                    to an expert
                                </button>
                                <button class="btn plum-btn-primary btn-matchmaking-contact visible-sm custom-ga-tracking"
                                        data-action="matchmaking:openmodal" data-ga-trigger="click"
                                        data-ga-category="navigation" data-ga-action="clicked"
                                        data-ga-label="nav-bar--expert-button"
                                        data-test="open-matchmaking-modal-button"><span class="plum-icon-call"></span>Speak
                                    to us
                                </button>

                            </li>
                        </ul>
                    </nav>
                    <nav class="main-nav nav-avatar-align hidden-xs">
                        <ul>
                            <li><a href="https://www.plumguide.com/book/payment?code=FD7SNM#" class="mega-menu-trigger">Locations</a>
                            </li>
                            <li><a href="https://plumguide.giftpro.co.uk/vouchers/stay-in-one-of-the-worlds-best-homes/"
                                   target="_blank">Gift vouchers</a></li>
                            <li>
                                <a href="https://www.plumguide.com/contact-us">Contact us</a>
                            </li>
                            <li class="hidden-sm">
                                <a href="http://help.plumguide.com/" target="_blank">Help</a>
                            </li>
                            <li class="wishlist-link-container">
                                <a href="https://www.plumguide.com/wishlist" class="wishlist-link">
                                    <div class="icons-container">
                                        <span class="plum-icon-new-heart-filled icon background-icon"></span>
                                        <span class="plum-icon-my-heart icon"></span>
                                    </div>
                                    <span class="visible-xs">Favourites</span>
                                </a>
                                <span class="wishlist-helper-msg msg-1 hidden-xs">View your favourites here</span>
                            </li>
                            <li class="mail-link hidden-xs">
                                <a href="https://www.plumguide.com/conversations">
                                    <span class="plum-icon-envelope-alt icon"></span>
                                </a>
                            </li>
                            <li class="search-link js-search-link hidden-sm"><a href="https://www.plumguide.com/search"
                                                                                title="Search"><span
                                    class="icon plum-icon-search-magnifying-glass"></span></a></li>
                            <li class="visible-xs">
                                <a href="https://www.plumguide.com/conversations">
                                    <div class="icons-container mail-icon-notifiers">
                                        <span class="plum-icon-envelope-alt icon"></span>
                                    </div>
                                    <span> Messages</span>
                                </a>
                            </li>
                            <li class="user-dropdown has-dropdown">
                                <a href="https://www.plumguide.com/dashboard/trips">
                                    <div class="icons-container">
                                        <img class="icon circle-crop user-image"
                                             src="/resources/mockups/plum_guide/test-profile.jpg"
                                             data-test="user-image">
                                        <span class="plum-icon-chevron-down"></span>
                                    </div>
                                </a>
                                <ul>
                                    <li><a href="https://www.plumguide.com/dashboard/trips">Dashboard</a></li>
                                    <li><a href="https://www.plumguide.com/dashboard/trips">Your trips</a></li>
                                    <li><a href="https://www.plumguide.com/dashboard/profile">Edit profile</a></li>
                                    <li><a href="javascript:document.getElementById(&#39;logoutForm&#39;).submit()">Logout</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="speak-to-an-expert">

                                <button class="btn plum-btn-primary btn-matchmaking-contact hidden-sm custom-ga-tracking"
                                        data-action="matchmaking:openmodal" data-ga-trigger="click"
                                        data-ga-category="navigation" data-ga-action="clicked"
                                        data-ga-label="nav-bar--expert-button"
                                        data-test="open-matchmaking-modal-button"><span class="plum-icon-call"></span>Speak
                                    to an expert
                                </button>
                                <button class="btn plum-btn-primary btn-matchmaking-contact visible-sm custom-ga-tracking"
                                        data-action="matchmaking:openmodal" data-ga-trigger="click"
                                        data-ga-category="navigation" data-ga-action="clicked"
                                        data-ga-label="nav-bar--expert-button"
                                        data-test="open-matchmaking-modal-button"><span class="plum-icon-call"></span>Speak
                                    to us
                                </button>

                            </li>
                        </ul>
                    </nav>
                </form>
                <div class="header-search user-logged-in">
                    <div id="react-header-search">
                        <div class="header-search-input">
                            <div class="react-autosuggest__container"><input type="text" autocomplete="off"
                                                                             role="combobox" aria-autocomplete="list"
                                                                             aria-owns="react-autowhatever-1"
                                                                             aria-expanded="false"
                                                                             class="react-autosuggest__input"
                                                                             autocapitalize="off" autocorrect="off"
                                                                             placeholder="Search for a specific home name"
                                                                             spellcheck="false" value="">
                                <div id="react-autowhatever-1" class="react-autosuggest__suggestions-container"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>

    </div>
    <div class="content-container1 full-bleed" style="margin-top: 85px;">


        <div class="notification support always-visible in-page before-bar">
            <p><strong>Need help?</strong> <span class="hidden-xs hidden-sm">Contact The Plum Guide and we'll be happy to assist you.</span>
                Call <a id="booking_form" href="tel: +44 (0) 203 795 1390" class="text-white show-underline">+44 (0) 203
                    795 1390</a> or email <a href="mailto:guests@plumguide.com" class="text-white show-underline">guests@plumguide.com</a>
            </p>
        </div>

        <section class="container-fluid ribbon plum-promise">
            <div class="plum-promise__wrapper col-xs-12 col-lg-10 col-lg-offset-1">
                <div class="promise-stamp-container col-xs-12 col-sm-6">
                    <img src="/resources/mockups/plum_guide/plum-guide-logo--official-selection--dark.svg"
                         alt="Plum Official Selection">
                </div>
                <div class="ribbon-container col-xs-12 col-sm-6">
                    <ul>
                        <li>Independently reviewed by <a href="https://www.plumguide.com/our-critics" target="_blank"
                                                         class="show-underline critics-page">hospitality experts</a>
                        </li>
                        <li>Only 1 in 100 homes pass our 150 check test</li>
                        <li>Team available 24/7 on <a href="tel:+44 (0) 203 795 1390">+44 (0) 203 795 1390</a></li>
                    </ul>
                </div>
            </div>
        </section>

        <section class="container-fluid clearfix booking-form-content">
            <div class="row">

                <div class="col-xs-12 col-sm-5 col-sm-push-7 col-lg-4 summary-section">


                    <div class="summary-container">
                        <div class="row">
                            <img class="img-responsive"
                                 src="https://static.plumcache.com/listings/2635/hero/51f1c884-ec94-4b10-bbe5-ed76342c5112.jpg?w=800&q=55&auto=format">
                        </div>

                        <div class="summary-row key-info">
                            <h4>The Sailor</h4>
                            <p class="location"><span class="icon-location-purple icon"></span>Chelsea, London</p>
                            <p>
                                1 Bedroom,
                                1 Bathroom,
                                Sleeps 2
                            </p>

                        </div>

                        <div class="hidden-summary-container">

                            <div class="summary-row booking-dates-row">
                                <div class="clearfix">
                                    <div class="pull-left">
                                        <p>Check in</p>
                                        <p><strong>01/06/2019</strong></p>
                                    </div>
                                    <span class="icon plum-icon-right-light-chevron"></span>
                                    <div class="pull-right">
                                        <p>Check out</p>
                                        <p><strong>07/06/2019</strong></p>
                                    </div>
                                </div>
                            </div>

                            <div class="summary-row coupon-row">

                                <div class="clearfix">
                                    <div class="pull-left">
                                        <p><span class="js-guest-currency-symbol">£</span><span
                                                class="js-average-nightly-price-with-fee">226.00</span> x 6 nights</p>
                                    </div>
                                </div>
                                <div class="discounts discount-display-row collapse">
                                    <p>
                                        Discount<span class="pull-right">
                        -
                        <span class="discount-value">
                        </span>
                    </span>
                                    </p>
                                    <p><a href="https://www.plumguide.com/book/removepromotion?code=FD7SNM"
                                          class="remove-coupon link-primary">Remove coupon</a></p>
                                </div>
                                <div class="coupon-widget-container ">
                                    <div class="coupon-link-wrapper">
                                        <div class="custom-ga-tracking" data-ga-trigger="click" data-ga-target="child"
                                             data-ga-category="booking" data-ga-action="clicked"
                                             data-ga-label="voucher-code-link">
                                            <a href="https://www.plumguide.com/book/payment?code=FD7SNM#"
                                               class="coupon-link">Add voucher code</a>
                                        </div>
                                    </div>

                                    <div class="coupon-form-wrapper collapse">
                                        <form action="https://www.plumguide.com/book/addpromotion"
                                              class="standard-layout form-horizontal plum-form" method="post"
                                              novalidate="novalidate">
                                            <div class="form-group inputs-same-row pull-together">
                                                <label class="control-label col-xs-12" for="PromotionCode">Coupon
                                                    code</label>

                                                <div class="col-xs-6 col-xs-480-6 col-sm-8 pad-right-0">
                                                    <input class="form-control text-box single-line" data-val="true"
                                                           data-val-required="Enter coupon code" id="PromotionCode"
                                                           name="PromotionCode" placeholder="Enter code" type="text"
                                                           value="">
                                                    <span class="field-validation-valid text-danger"
                                                          data-valmsg-for="PromotionCode"
                                                          data-valmsg-replace="true"></span>
                                                </div>

                                                <div class="col-xs-6 col-xs-480-6 col-sm-4 pad-left-0">
                                                    <div class="loader-wrapper">
                                                        <input data-val="true"
                                                               data-val-required="The BookingCode field is required."
                                                               id="BookingCode" name="BookingCode" type="hidden"
                                                               value="FD7SNM">
                                                        <input type="submit" value="Apply"
                                                               class="btn plum-btn-primary plum-btn-primary-larger btn-full-width">

                                                        <div class="loader" title="0">
                                                            <svg version="1.1" id="loader-1"
                                                                 xmlns="http://www.w3.org/2000/svg"
                                                                 xmlns:xlink="http://www.w3.org/1999/xlink" x="0px"
                                                                 y="0px" width="30px" height="30px" viewBox="0 0 40 40"
                                                                 enable-background="new 0 0 40 40" xml:space="preserve">
                      <path opacity="0.2" fill="#000" d="M20.201,5.169c-8.254,0-14.946,6.692-14.946,14.946c0,8.255,6.692,14.946,14.946,14.946
                        s14.946-6.691,14.946-14.946C35.146,11.861,28.455,5.169,20.201,5.169z M20.201,31.749c-6.425,0-11.634-5.208-11.634-11.634
                        c0-6.425,5.209-11.634,11.634-11.634c6.425,0,11.633,5.209,11.633,11.634C31.834,26.541,26.626,31.749,20.201,31.749z">
                      </path>
                                                                <path fill="#000" d="M26.013,10.047l1.654-2.866c-2.198-1.272-4.743-2.012-7.466-2.012h0v3.312h0
                        C22.32,8.481,24.301,9.057,26.013,10.047z">
                                                                </path>
                      </svg>
                                                        </div>
                                                    </div>

                                                    <p><a href="https://www.plumguide.com/book/payment?code=FD7SNM#"
                                                          class="coupon-close link-primary">Cancel</a></p>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>

                                <div class="partner partner-display-row collapse">
                                    <p>Partner code<span class="pull-right"></span></p>
                                    <p><a href="https://www.plumguide.com/book/payment?code=FD7SNM#"
                                          class="remove-partner link-primary">Remove partner code</a></p>
                                </div>
                                <div class="partner-widget-container ">
                                    <div class="partner-link-wrapper">
                                        <a href="https://www.plumguide.com/book/payment?code=FD7SNM#"
                                           class="partner-link custom-ga-tracking" data-ga-trigger="click"
                                           data-ga-category="booking" data-ga-action="clicked"
                                           data-ga-label="partner-code-link">Add partner code</a>
                                    </div>

                                    <div class="partner-form-wrapper collapse">

                                        <form action="https://www.plumguide.com/book/validatepartnercode"
                                              class="standard-layout form-horizontal plum-form" method="post">
                                            <div class="form-group inputs-same-row pull-together">

                                                <div class="col-xs-6 col-xs-480-6 col-sm-8 pad-right-0">
                                                    <input class="form-control partner-code-input text-box single-line"
                                                           id="PartnerCode" name="PartnerCode"
                                                           placeholder="Enter partner code" type="text" value="">
                                                    <span class="field-validation-valid text-danger"
                                                          data-valmsg-for="PartnerCode"
                                                          data-valmsg-replace="true"></span>
                                                </div>

                                                <div class="col-xs-6 col-xs-480-6 col-sm-4 pad-left-0">
                                                    <div class="loader-wrapper">
                                                        <input type="submit" value="Apply"
                                                               class="btn plum-btn-primary plum-btn-primary-larger btn-full-width">
                                                    </div>

                                                    <div class="loader">
                                                        <svg version="1.1" id="loader-1"
                                                             xmlns="http://www.w3.org/2000/svg"
                                                             xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                                             width="30px" height="30px" viewBox="0 0 40 40"
                                                             enable-background="new 0 0 40 40" xml:space="preserve">
                    <path opacity="0.2" fill="#000" d="M20.201,5.169c-8.254,0-14.946,6.692-14.946,14.946c0,8.255,6.692,14.946,14.946,14.946
                    s14.946-6.691,14.946-14.946C35.146,11.861,28.455,5.169,20.201,5.169z M20.201,31.749c-6.425,0-11.634-5.208-11.634-11.634
                    c0-6.425,5.209-11.634,11.634-11.634c6.425,0,11.633,5.209,11.633,11.634C31.834,26.541,26.626,31.749,20.201,31.749z">
                    </path>
                                                            <path fill="#000" d="M26.013,10.047l1.654-2.866c-2.198-1.272-4.743-2.012-7.466-2.012h0v3.312h0
                    C22.32,8.481,24.301,9.057,26.013,10.047z">
                                                            </path>
                </svg>
                                                    </div>

                                                    <p><a href="https://www.plumguide.com/book/payment?code=FD7SNM#"
                                                          class="partner-close link-primary">Cancel</a></p>

                                                </div>
                                            </div>
                                        </form>
                                    </div>


                                </div>

                            </div>

                            <div class="summary-row totalprice-row">
                                <div class="js-total-loader loader loader--purple" title="0">
                                    <svg version="1.1" id="loader-1" xmlns="http://www.w3.org/2000/svg"
                                         xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="30px"
                                         height="30px" viewBox="0 0 40 40" enable-background="new 0 0 40 40"
                                         xml:space="preserve">
    <path opacity="0.2" fill="#fff" d="M20.201,5.169c-8.254,0-14.946,6.692-14.946,14.946c0,8.255,6.692,14.946,14.946,14.946
            s14.946-6.691,14.946-14.946C35.146,11.861,28.455,5.169,20.201,5.169z M20.201,31.749c-6.425,0-11.634-5.208-11.634-11.634
            c0-6.425,5.209-11.634,11.634-11.634c6.425,0,11.633,5.209,11.633,11.634C31.834,26.541,26.626,31.749,20.201,31.749z"></path>
                                        <path fill="#fff" d="M26.013,10.047l1.654-2.866c-2.198-1.272-4.743-2.012-7.466-2.012h0v3.312h0
            C22.32,8.481,24.301,9.057,26.013,10.047z">
                                        </path>
</svg>

                                </div>
                                <div class="js-total-and-currency-container">
                                    <div class="pull-left">
                                        <h4>Total</h4>
                                    </div>
                                    <div class="pull-right">
                                        <h4>
                        <span class="guest-total">
                            <span class="js-guest-currency-symbol">£</span><span
                                class="js-guest-total text-header-font">1356.00</span>
                        </span>
                                            <sup><span class="js-guest-currency-code"
                                                       style="display: none">GBP</span></sup>
                                        </h4>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div>
                                        <p class="exchange-rate-msg exchange-rate-msg-crossborder"
                                           style="display: none">
                                            <span>Final cost, inclusive of all taxes and fees.</span>
                                        </p>
                                        <p class="exchange-rate-msg exchange-rate-msg-unsupported-currency"
                                           style="display: none">
                                            <span>The price is shown in <span class="display-code">GBP</span> based on today's exchange rate.</span>
                                            <span>Your payment will be made in <span class="host-code">GBP</span>, the local currency of the host.</span>
                                            <span>The total charge is <span
                                                    class="display-hosttotal">£1356.00</span>.</span>
                                            <span>Exchange rates and fees may vary depending on your card issuer.</span>
                                        </p>
                                    </div>
                                </div>
                                <br>
                                <div class="inline-modal-container">
                                    <p>
                                        Guest cancellation policy:
                                        <span class="custom-ga-tracking display-block" data-ga-trigger="click"
                                              data-ga-target="child" data-ga-category="booking" data-ga-action="clicked"
                                              data-ga-label="cancellation-policy-link-reasonable">
                        <a class="link-primary inline-trigger" data-type="Reasonable" data-overlay="full-scroll-y"
                           href="https://www.plumguide.com/cancellation-policy#Reasonable">
                            Reasonable
                        </a>
                    </span>
                                    </p>


                                    <div class="inline-content hidden" id="cancellation-policy-modal">
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-6 col-sm-offset-3 col-md-4 col-md-offset-4">
                                                    <article
                                                            class="inline-modal-content modal-content bg-white text-center">
                                                        <span class="icon plum-icon-cross close-btn"></span>
                                                        <h4>Cancellation Policy: Reasonable</h4>
                                                        <p>Free cancellation for 24 hours then 100% refund (except
                                                            fees), up until 5 days prior to arrival.</p>
                                                        <p><a class="show-underline"
                                                              href="https://www.plumguide.com/cancellation-policy#Reasonable"
                                                              target="_blank"><i>See full terms</i></a></p>
                                                    </article>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>


                                <br>
                                <div class="inline-modal-container">
                                    <p>
                                        House rules:
                                        <span class="custom-ga-tracking display-block" data-ga-trigger="click"
                                              data-ga-target="child" data-ga-category="booking" data-ga-action="clicked"
                                              data-ga-label="house-rules-link">
                            <a class="link-primary inline-trigger house-rules-link" data-overlay="full-scroll-y"
                               href="https://www.plumguide.com/homes/london/the-sailor#house-rules">Read policy</a>
                        </span>
                                    </p>

                                    <div class="inline-content hidden" id="house-rules-modal">
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-6 col-sm-offset-3 col-md-4 col-md-offset-4">
                                                    <article
                                                            class="inline-modal-content modal-content bg-white text-center">
                                                        <span class="icon plum-icon-cross close-btn"></span>
                                                        <h4>House rules</h4>
                                                        <p>Please treat my studio as your home and enjoy the wonderful
                                                            area! Strictly no smoking. And please respect my neighbours
                                                            by being considerate and not playing loud music after
                                                            11pm. </p>
                                                    </article>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <br>
                                <div class="inline-modal-container">
                                    <p>
                                        Security deposit:
                                        <span class="custom-ga-tracking display-block" data-ga-trigger="click"
                                              data-ga-target="child" data-ga-category="booking" data-ga-action="clicked"
                                              data-ga-label="security-deposit-link">
                            <a class="link-primary inline-trigger security-deposit-link"
                               href="https://www.plumguide.com/homes/london/the-sailor#security-deposit"
                               data-overlay="full-scroll-y">

                                    <span>No upfront charge</span>
                            </a>
                        </span>
                                    </p>
                                    <div class="inline-content hidden">
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-6 col-sm-offset-3 col-md-4 col-md-offset-4">
                                                    <article
                                                            class="inline-modal-content modal-content bg-white text-center">
                                                        <span class="icon plum-icon-cross close-btn"></span>
                                                        <h4>Security deposit</h4>
                                                        <p>No deposit is taken as part of the booking. For the host to
                                                            dispute the deposit they must provide evidence of the
                                                            damage, and in turn you will be notified to discuss this.
                                                            Deposit is never taken without consultation and
                                                            notification.</p>
                                                    </article>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- TrustBox widget - Mini -->
                                <div class="summary-row trustpilot-widget-container margin-top-20 hidden-xs">
                                    <div class="trust-logos">
                                        <div class="trust-logos__element trust-logos__element--trustpilot">
                                            <a href="https://uk.trustpilot.com/review/plumguide.com" target="_blank">
                                                <div class="trust-logos__score">
                                                    <p><span>9.5</span> on</p>
                                                    <img src="/resources/mockups/plum_guide/reviews--logo-trustpilot-black.svg"
                                                         alt="Trust Pilot">
                                                </div>
                                                <div class="trust-logos__stars">
                                                    <img src="/resources/mockups/plum_guide/reviews--star-trustpilot.svg"
                                                         alt="Star">
                                                    <img src="/resources/mockups/plum_guide/reviews--star-trustpilot.svg"
                                                         alt="Star">
                                                    <img src="/resources/mockups/plum_guide/reviews--star-trustpilot.svg"
                                                         alt="Star">
                                                    <img src="/resources/mockups/plum_guide/reviews--star-trustpilot.svg"
                                                         alt="Star">
                                                    <img src="/resources/mockups/plum_guide/reviews--star-trustpilot.svg"
                                                         alt="Star">
                                                </div>
                                                <p class="trust-logos__review-number">Based on 387 reviews</p>
                                            </a>
                                        </div>

                                        <div class="trust-logos__element trust-logos__element--google">
                                            <a href="https://www.google.co.uk/search?q=plum+guide" target="_blank">
                                                <div class="trust-logos__score">
                                                    <p><span>4.9</span> on</p>
                                                    <img src="/resources/mockups/plum_guide/reviews--logo-google-colour.svg"
                                                         alt="Google">
                                                </div>
                                                <div class="trust-logos__stars">
                                                    <img src="/resources/mockups/plum_guide/reviews--star-google.svg"
                                                         alt="Star">
                                                    <img src="/resources/mockups/plum_guide/reviews--star-google.svg"
                                                         alt="Star">
                                                    <img src="/resources/mockups/plum_guide/reviews--star-google.svg"
                                                         alt="Star">
                                                    <img src="/resources/mockups/plum_guide/reviews--star-google.svg"
                                                         alt="Star">
                                                    <img src="/resources/mockups/plum_guide/reviews--star-google.svg"
                                                         alt="Star">
                                                </div>
                                                <p class="trust-logos__review-number">Based on 120 reviews</p>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>

                                </div>
                                <!-- End TrustBox widget -->

                                <div class="summary-row hidden-xs">
                                    <div class="trust-identifiers">
                                        <div class="plum-icon-best-price icon"></div>
                                        <div class="copy">
                                            <h5>Lowest price guarantee</h5>
                                            <p>If you find it cheaper elsewhere we'll not only match it, we'll even
                                                throw in a little something extra.</p>
                                        </div>
                                    </div>
                                    <div class="trust-identifiers">
                                        <div class="plum-icon-protection icon"></div>
                                        <div class="copy">
                                            <h5>Payment protection</h5>
                                            <p>We keep you safe by encrypting your payments.</p>
                                        </div>
                                    </div>
                                    <div class="trust-identifiers">
                                        <div class="plum-icon-24hr-support icon"></div>
                                        <div class="copy">
                                            <h5>24 hour support</h5>
                                            <p>Contact The Plum Guide and we'll be happy to assist you. </p>
                                            <p>
                                                Call:
                                                <a id="phone_guest_support"
                                                   class="contact-details-link custom-ga-tracking"
                                                   href="tel:+44 (0) 203 795 1390" target="_blank"
                                                   data-ga-trigger="click" data-ga-category="booking"
                                                   data-ga-action="clicked" data-ga-label="contact-phone-link"><span
                                                        class="line-break-responsive sm">+44 (0) 203 795 1390</span></a>
                                            </p>
                                            <p>
                                                Email:
                                                <a class="contact-details-link custom-ga-tracking"
                                                   href="mailto:guests@plumguide.com" target="_blank"
                                                   data-ga-trigger="click" data-ga-category="booking"
                                                   data-ga-action="clicked" data-ga-label="contact-email-link"><span
                                                        class="line-break-responsive sm">guests@plumguide.com</span></a>
                                            </p>
                                            <p>Read our <a href="http://help.plumguide.com/support/home"
                                                           target="_blank">FAQs</a></p>
                                        </div>
                                    </div>
                                    <div class="copy speak-to-an-expert">

                                        <button class="btn plum-btn-primary btn-matchmaking-contact hidden-sm custom-ga-tracking"
                                                data-action="matchmaking:openmodal" data-ga-trigger="click"
                                                data-ga-category="payment page" data-ga-action="clicked"
                                                data-ga-label="payment-page--contact-section--expert-button"
                                                data-test="open-matchmaking-modal-button"><span
                                                class="plum-icon-call"></span>Speak to an expert
                                        </button>
                                        <button class="btn plum-btn-primary btn-matchmaking-contact visible-sm custom-ga-tracking"
                                                data-action="matchmaking:openmodal" data-ga-trigger="click"
                                                data-ga-category="payment page" data-ga-action="clicked"
                                                data-ga-label="payment-page--contact-section--expert-button"
                                                data-test="open-matchmaking-modal-button"><span
                                                class="plum-icon-call"></span>Speak to us
                                        </button>

                                    </div>


                                </div>

                            </div>

                        </div>
                    </div>

                </div>

                <div class="col-xs-12 col-sm-7 col-sm-pull-5 col-lg-6 col-lg-pull-4 col-lg-offset-1">

                    <input name="__RequestVerificationToken" type="hidden"
                           value="iJZqbeHhCfcPer1gDdY1SUk_40_4ignk9hrF7y9FXKgvhU_X_gd3o52IbFbYyU3-4O6VB8cw1SPDUAZWb5uvEr16LYWmr1Kpp5o5d2fnO3z1vQa-rvfgyhmzefZW2H49EL-vGW12RHY-wxTP0vbxBw2">
                    <div class="row">

                        <input id="FormPartnerCode" name="PartnerCode" type="hidden" value="">

                        <div class="col-xs-12">


                            <section class="checkout-section">

                                <div class="safe-payment-message">
                                    <h1>1. Payment</h1>

                                </div>

                                <div class="validation-summary-errors ajax-errors">
                                    <ul></ul>
                                </div>

                                <div class="form-group show-label select-payment-group ">
                                    <div class="col-xs-12">
                                        <div id="payment-request-button" style="margin-bottom: 15px;">
                                            <!-- A Stripe Element will be inserted here. -->
                                        </div>
                                    </div>

                                    <div class="col-xs-12">
                                        <label class="control-label" id="without-payment-request">Select payment method</label>
                                        <label class="control-label" id="with-payment-request" style="display: none;"><strong>OR</strong> select other payment method</label>
                                    </div>

                                    <div class="col-xs-12 col-md-6 dd-inline-loader">
                                        <div class="select-container">
                                            <div class="custom-ga-tracking" data-ga-trigger="focus"
                                                 data-ga-target="child" data-ga-category="booking"
                                                 data-ga-action="clicked" data-ga-label="field-payment-method">
                                                <select class="form-control" data-val="true"
                                                        data-val-required="Please select your payment method"
                                                        id="PaymentMethod" name="PaymentMethod">
                                                    <option value="cc">Credit card</option>
                                                    <option value="sofort">SOFORT</option>
                                                    <option value="paypal">PayPal</option>
                                                </select>
                                            </div>
                                            <div class="loader inline-loader" title="0" style="display: none;">
                                                <svg version="1.1" id="loader-1" xmlns="http://www.w3.org/2000/svg"
                                                     xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                                     width="30px" height="30px" viewBox="0 0 40 40"
                                                     enable-background="new 0 0 40 40" xml:space="preserve">
    <path opacity="0.2" fill="#fff" d="M20.201,5.169c-8.254,0-14.946,6.692-14.946,14.946c0,8.255,6.692,14.946,14.946,14.946
            s14.946-6.691,14.946-14.946C35.146,11.861,28.455,5.169,20.201,5.169z M20.201,31.749c-6.425,0-11.634-5.208-11.634-11.634
            c0-6.425,5.209-11.634,11.634-11.634c6.425,0,11.633,5.209,11.633,11.634C31.834,26.541,26.626,31.749,20.201,31.749z"></path>
                                                    <path fill="#fff" d="M26.013,10.047l1.654-2.866c-2.198-1.272-4.743-2.012-7.466-2.012h0v3.312h0
            C22.32,8.481,24.301,9.057,26.013,10.047z">
                                                    </path>
</svg>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-md-6">
                                        <div class="cards-accepted">
                                            <p class="hidden-md hidden-lg">Cards accepted:</p>
                                            <div>
                                                <img src="https://static.plumcache.com/images/icons/credit-cards/traditional-set-1/paypal-70.jpg" alt=""
                                                     class="icon paypal-icon paypal-btn"
                                                     style="max-width: 38px !important;">
                                                <img src="https://static.plumcache.com/images/icons/credit-cards/traditional-set-1/visa-70.jpg" alt="" class="icon"
                                                     style="max-width: 38px !important;">
                                                <img src="https://static.plumcache.com/images/icons/credit-cards/traditional-set-1/amex-70.jpg" alt="" class="icon"
                                                     style="max-width: 38px !important;">
                                                <img src="https://static.plumcache.com/images/icons/credit-cards/traditional-set-1/mastercard-70.jpg" alt=""
                                                     class="icon" style="max-width: 38px !important;">
                                                <img src="https://static.plumcache.com/images/icons/credit-cards/traditional-set-1/maestro-70.jpg" alt=""
                                                     class="icon" style="max-width: 38px !important;">
                                                <img src="https://static.plumcache.com/images/icons/credit-cards/traditional-set-1/discover-70.jpg" alt=""
                                                     class="icon" style="max-width: 38px !important;">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xs-12">
                                        <div id="paypal-container">
                                            <div id="paypal-headless" class="collapse" style="display: none;">

                                                <p>Log in with Paypal to continue with your booking:</p>

                                                <a href="https://www.plumguide.com/book/payment?code=FD7SNM#"
                                                   id="paypal-headless-button"><img
                                                        src="/resources/mockups/plum_guide/loginwithpaypalbutton-web.jpg"
                                                        alt="Log in with PayPal"></a>
                                                <div id="braintree-paypal-loggedin" class="collapse"
                                                     style="max-width: 500px; overflow: hidden; padding: 16px; border-top: 1px solid rgb(209, 212, 214); border-bottom: 1px solid rgb(209, 212, 214); background-image: url(&quot;https://checkout.paypal.com/pwpp/2.17.6/images/paypal-small.svg&quot;), none; background-size: 13px 15px; background-position: 20px 50%; background-repeat: no-repeat; display: none;">
                                                    <span id="bt-pp-name"
                                                          style="color: rgb(40, 48, 54); font-size: 13px; font-weight: 800; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; margin-left: 36px; -webkit-font-smoothing: antialiased;">PayPal</span>
                                                    <span id="bt-pp-email"
                                                          style="color: rgb(110, 120, 127); font-size: 13px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; margin-left: 5px; -webkit-font-smoothing: antialiased;"></span>
                                                    <button id="bt-pp-cancel"
                                                            style="color: rgb(61, 149, 206); font-size: 11px; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; line-height: 20px; margin: 0px 0px 0px 25px; padding: 0px; border: 0px; cursor: pointer; text-decoration: underline; float: right; -webkit-font-smoothing: antialiased; background-color: transparent;">
                                                        Cancel
                                                    </button>
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <div class="card-wrapper" style="display: block;">

                                    <div class="form-group show-label">
                                        <div class="form-row">

                                        </div>
                                        <div class="form-row">
                                            <div class="col-xs-12 card-number">
                                                <label class="control-label" for="CardNumber">Card details</label>
                                                <div class="row">
                                                    <div class="col-xs-12 col-md-6">
                                                        <div id="CardNumber"
                                                             class="hosted-field secure-input-container">
                                                            <div style="clear: both; padding-top: 6px; padding-right: 30px;"
                                                                 id="card-element"></div>
                                                        </div>
                                                        <div id="card-errors"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="braintree-message">
                                        <p>Please note: your card will only be charged when the host accepts your booking
                                            (typically within 24 hours)</p>
                                    </div>
                                </div>

                            </section>

                            <section class="checkout-section">
                                <div class="billing-address-wrapper" style="display: block;">

                                    <h1>2. Billing</h1>

                                    <div class="form-group show-label">
                                        <div class="form-row">
                                            <div class="col-xs-12 col-md-6">
                                                <label class="control-label display-inline-block" for="FirstName">First
                                                    name</label>
                                                <div class="custom-ga-tracking" data-ga-target="child"
                                                     data-ga-trigger="focus" data-ga-category="booking"
                                                     data-ga-action="focused" data-ga-label="field-billing-first-name">
                                                    <input class="form-control text-box single-line" data-val="true"
                                                           data-val-requiredif="Your firstname is required"
                                                           data-val-requiredif-propertyname="PaymentMethod"
                                                           id="FirstName" name="FirstName" type="text" value="John">
                                                </div>
                                                <span class="field-validation-valid text-danger"
                                                      data-valmsg-for="FirstName" data-valmsg-replace="true"></span>
                                            </div>

                                            <div class="col-xs-12 col-md-6">
                                                <label class="control-label display-inline-block" for="LastName">Last
                                                    name</label>
                                                <div class="custom-ga-tracking" data-ga-target="child"
                                                     data-ga-trigger="focus" data-ga-category="booking"
                                                     data-ga-action="focused" data-ga-label="field-billing-last-name">
                                                    <input class="form-control text-box single-line" data-val="true"
                                                           data-val-requiredif="Your lastname is required"
                                                           data-val-requiredif-propertyname="PaymentMethod"
                                                           id="LastName" name="LastName" type="text" value="Smith">
                                                </div>
                                                <span class="field-validation-valid text-danger"
                                                      data-valmsg-for="LastName" data-valmsg-replace="true"></span>
                                            </div>
                                        </div>

                                        <div class="form-row">
                                            <div class="col-xs-12 col-md-6">
                                                <label class="control-label display-inline-block" for="Address1">Address
                                                    1</label>
                                                <div class="custom-ga-tracking" data-ga-target="child"
                                                     data-ga-trigger="focus" data-ga-category="booking"
                                                     data-ga-action="focused" data-ga-label="field-billing-address-1">
                                                    <input class="form-control text-box single-line" data-val="true"
                                                           data-val-requiredif="The first line of your address is required"
                                                           data-val-requiredif-propertyname="PaymentMethod"
                                                           id="Address1" name="Address1" type="text" value="1 High Street">
                                                </div>
                                                <span class="field-validation-valid text-danger"
                                                      data-valmsg-for="Address1" data-valmsg-replace="true"></span>
                                            </div>

                                            <div class="col-xs-12 col-md-6">
                                                <label class="control-label display-inline-block" for="Address2">Address
                                                    2</label>
                                                <div class="custom-ga-tracking" data-ga-target="child"
                                                     data-ga-trigger="focus" data-ga-category="booking"
                                                     data-ga-action="focused" data-ga-label="field-billing-address-2">
                                                    <input class="form-control text-box single-line" id="Address2"
                                                           name="Address2" type="text" value="">
                                                </div>
                                                <span class="field-validation-valid text-danger"
                                                      data-valmsg-for="Address2" data-valmsg-replace="true"></span>
                                            </div>
                                        </div>

                                        <div class="form-row">
                                            <div class="col-xs-12 col-md-6">
                                                <label class="control-label display-inline-block"
                                                       for="City">City</label>
                                                <div class="custom-ga-tracking" data-ga-target="child"
                                                     data-ga-trigger="focus" data-ga-category="booking"
                                                     data-ga-action="focused"
                                                     data-ga-label="field-billing-address-city">
                                                    <input class="form-control text-box single-line" data-val="true"
                                                           data-val-requiredif="Your city is required"
                                                           data-val-requiredif-propertyname="PaymentMethod" id="City"
                                                           name="City" type="text" value="London">
                                                </div>
                                                <span class="field-validation-valid text-danger" data-valmsg-for="City"
                                                      data-valmsg-replace="true"></span>
                                            </div>

                                            <div class="col-xs-12 col-md-6">
                                                <label class="control-label display-inline-block" for="PostCode">Post
                                                    code/zip</label>
                                                <div class="custom-ga-tracking" data-ga-target="child"
                                                     data-ga-trigger="focus" data-ga-category="booking"
                                                     data-ga-action="focused"
                                                     data-ga-label="field-billing-address-postcode">
                                                    <input class="form-control text-box single-line" data-val="true"
                                                           data-val-requiredif="Your post code/ zip is required"
                                                           data-val-requiredif-propertyname="PaymentMethod"
                                                           id="PostCode" name="PostCode" type="text" value="N1 1AA">
                                                </div>
                                                <span class="field-validation-valid text-danger"
                                                      data-valmsg-for="PostCode" data-valmsg-replace="true"></span>
                                            </div>
                                        </div>

                                        <div class="form-row">
                                            <div class="col-xs-12 col-md-6">
                                                <label class="control-label display-inline-block" for="CountryIsoCode">Country</label>
                                                <div class="select-container custom-ga-tracking" data-ga-target="child"
                                                     data-ga-trigger="focus" data-ga-category="booking"
                                                     data-ga-action="focused"
                                                     data-ga-label="field-billing-address-country">
                                                    <select class="form-control country-dd" data-val="true"
                                                            data-val-requiredif="Please select your country"
                                                            data-val-requiredif-propertyname="PaymentMethod"
                                                            id="CountryIsoCode" name="CountryIsoCode">
                                                        <option value="GB">United Kingdom</option>
                                                        <optgroup label="Common countries">
                                                            <option value="GB">United Kingdom</option>
                                                            <option value="US">United States</option>
                                                            <option value="CA">Canada</option>
                                                            <option value="AU">Australia</option>
                                                        </optgroup>

                                                    </select>
                                                </div>
                                                <span class="field-validation-valid text-danger"
                                                      data-valmsg-for="CountryIsoCode"
                                                      data-valmsg-replace="true"></span>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <div class="form-group show-label select-payment-group">
                                    <div class="form-row">
                                        <div class="col-xs-12 col-md-6">
                                            <label for="BillingAddress.CountryDialingCodeId" class="control-label">Dialing
                                                code</label>
                                            <div class="select-container custom-ga-tracking" data-ga-target="child"
                                                 data-ga-trigger="focus" data-ga-category="booking"
                                                 data-ga-action="focused" data-ga-label="field-contact-dialing-code">
                                                <select class="form-control code-dd" data-val="true"
                                                        data-val-required="Your country dialing code is required"
                                                        id="CountryDialingCodeIsoCode" name="CountryDialingCodeIsoCode"
                                                        placeholder="Country code">
                                                    <option value="GB">United Kingdom (+44)</option>
                                                    <optgroup label="Common countries">
                                                        <option value="GB">United Kingdom (+44)</option>
                                                        <option value="US">United States (+1)</option>
                                                        <option value="CA">Canada (+1)</option>
                                                        <option value="AU">Australia (+61)</option>
                                                    </optgroup>

                                                </select>
                                            </div>
                                            <span class="field-validation-valid text-danger"
                                                  data-valmsg-for="CountryDialingCodeIsoCode"
                                                  data-valmsg-replace="true"></span>
                                        </div>

                                        <div class="col-xs-12 col-md-6">
                                            <label class="control-label" for="PhoneNumber">Mobile number</label>
                                            <div class="select-container custom-ga-tracking" data-ga-target="child"
                                                 data-ga-trigger="focus" data-ga-category="booking"
                                                 data-ga-action="focused" data-ga-label="field-contact-phone-number">
                                                <input class="form-control text-box single-line" data-val="true"
                                                       data-val-required="Your phone number is required"
                                                       id="PhoneNumber" name="PhoneNumber" placeholder="Mobile number"
                                                       type="text" value="7891234567">
                                            </div>
                                            <span class="field-validation-valid text-danger"
                                                  data-valmsg-for="PhoneNumber" data-valmsg-replace="true"></span>
                                        </div>
                                    </div>
                                </div>
                            </section>

                            <section class="checkout-section">
                                <!-- TODO: Sort out messy logic at some point -->
                                <h1 class="third-section">3. About Your Trip</h1>

                                <div class="about-your-trip col-xs-12">
                                    <img class="host-profile-pic"
                                         src="/resources/mockups/plum_guide/775539c6-630d-4f2f-998d-b11b9f515478.jpeg"
                                         alt="Jennifer">
                                    <div class="message-hints">
                                        <p>Tell Jennifer, your host, a little bit about you, your group and your trip to
                                            London.</p>
                                        <p class="small">Note: Your host is only there to give you the keys, you'll have
                                            the whole home to yourself.</p>
                                    </div>
                                </div>

                                <label class="control-label col-md-2" for="Message">Message</label>
                                <div class="col-xs-12">
                                    <div class="custom-ga-tracking" data-ga-trigger="focus" data-ga-target="child"
                                         data-ga-category="booking" data-ga-action="clicked"
                                         data-ga-label="field-contact-host-message">
                                        <textarea class="form-control introduce-yourself text-box multi-line"
                                                  data-val="true"
                                                  data-val-required="Please let the host know about your trip"
                                                  id="Message" name="Message"
                                                  placeholder="Hello Jennifer, your home looks wonderful! We&#39;re travelling to London for..."></textarea>
                                    </div>
                                    <span class="field-validation-valid text-danger" data-valmsg-for="Message"
                                          data-valmsg-replace="true"></span>
                                </div>

                                <input id="Code" name="Code" type="hidden" value="FD7SNM">
                                <input data-val="true" data-val-number="The field Guests must be a number."
                                       data-val-required="The Guests field is required." id="Guests" name="Guests"
                                       type="hidden" value="1">
                                <input id="payment_method_nonce" name="payment_method_nonce" type="hidden" value="">
                                <input id="device_data" name="device_data" type="hidden" value="">
                                <input data-val="true" data-val-required="The IsInstantBook field is required."
                                       id="IsInstantBook" name="IsInstantBook" type="hidden" value="False">
                                <input data-val="true" data-val-number="The field UserCountryId must be a number."
                                       id="UserCountryId" name="UserCountryId" type="hidden" value="234">

                                <div class="col-xs-12">
                                    <div class="terms-of-services">
                                        <input data-val="true"
                                               data-val-enforcetrue="You must agree to the Terms &amp; Conditions and Cancellation Policy to complete your booking"
                                               data-val-required="The TermsOfServiceAccepted field is required."
                                               id="TermsOfServiceAccepted" name="TermsOfServiceAccepted" type="checkbox"
                                               value="true" checked="checked"><input name="TermsOfServiceAccepted" type="hidden"
                                                                   value="false" >
                                        <label class="display-inline-block padding-left-10"
                                               for="TermsOfServiceAccepted">
                                            I agree to <a class="link-primary" href="https://www.plumguide.com/terms"
                                                          target="_blank">Terms of Service</a> and <a
                                                class="link-primary embedded-modal-link" data-type="Reasonable"
                                                data-target="cancellation-policy-modal"
                                                href="https://www.plumguide.com/cancellation-policy#Reasonable">Cancellation
                                            Policy</a>
                                        </label>
                                    </div>
                                    <span class="field-validation-valid text-danger"
                                          data-valmsg-for="TermsOfServiceAccepted" data-valmsg-replace="true"></span>
                                    <p>
                                        <small>By clicking the button below I agree to pay the total amount shown
                                        </small>
                                    </p>

                                </div>
                            </section>
                        </div>

                    </div>

                    <div class="row submit-section form-group">
                        <div class="col-xs-12">
                            <button class="btn plum-btn-primary-booking plum-btn-primary-larger col-sm-12 col-md-6 book-submit" id="order-place-btn">
                                <span class="plum-icon-padlock"></span>Request to book
                            </button>
                            <div class="loader" title="0">
                                <svg version="1.1" id="loader-1" xmlns="http://www.w3.org/2000/svg"
                                     xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="30px"
                                     height="30px" viewBox="0 0 40 40" enable-background="new 0 0 40 40"
                                     xml:space="preserve">
    <path opacity="0.2" fill="#fff" d="M20.201,5.169c-8.254,0-14.946,6.692-14.946,14.946c0,8.255,6.692,14.946,14.946,14.946
            s14.946-6.691,14.946-14.946C35.146,11.861,28.455,5.169,20.201,5.169z M20.201,31.749c-6.425,0-11.634-5.208-11.634-11.634
            c0-6.425,5.209-11.634,11.634-11.634c6.425,0,11.633,5.209,11.633,11.634C31.834,26.541,26.626,31.749,20.201,31.749z"></path>
                                    <path fill="#fff" d="M26.013,10.047l1.654-2.866c-2.198-1.272-4.743-2.012-7.466-2.012h0v3.312h0
            C22.32,8.481,24.301,9.057,26.013,10.047z">
                                    </path>
</svg>

                            </div>
                        </div>
                    </div>

                    <!-- TrustBox widget - Mini -->
                    <div class="summary-row trustpilot-widget-container visible-xs">
                        <div class="trust-logos">
                            <div class="trust-logos__element trust-logos__element--trustpilot">
                                <a href="https://uk.trustpilot.com/review/plumguide.com" target="_blank">
                                    <div class="trust-logos__score">
                                        <p><span>9.5</span> on</p>
                                        <img src="/resources/mockups/plum_guide/reviews--logo-trustpilot-black.svg"
                                             alt="Trust Pilot">
                                    </div>
                                    <div class="trust-logos__stars">
                                        <img src="/resources/mockups/plum_guide/reviews--star-trustpilot.svg"
                                             alt="Star">
                                        <img src="/resources/mockups/plum_guide/reviews--star-trustpilot.svg"
                                             alt="Star">
                                        <img src="/resources/mockups/plum_guide/reviews--star-trustpilot.svg"
                                             alt="Star">
                                        <img src="/resources/mockups/plum_guide/reviews--star-trustpilot.svg"
                                             alt="Star">
                                        <img src="/resources/mockups/plum_guide/reviews--star-trustpilot.svg"
                                             alt="Star">
                                    </div>
                                    <p class="trust-logos__review-number">Based on 387 reviews</p>
                                </a>
                            </div>

                            <div class="trust-logos__element trust-logos__element--google">
                                <a href="https://www.google.co.uk/search?q=plum+guide" target="_blank">
                                    <div class="trust-logos__score">
                                        <p><span>4.9</span> on</p>
                                        <img src="/resources/mockups/plum_guide/reviews--logo-google-colour.svg"
                                             alt="Google">
                                    </div>
                                    <div class="trust-logos__stars">
                                        <img src="/resources/mockups/plum_guide/reviews--star-google.svg" alt="Star">
                                        <img src="/resources/mockups/plum_guide/reviews--star-google.svg" alt="Star">
                                        <img src="/resources/mockups/plum_guide/reviews--star-google.svg" alt="Star">
                                        <img src="/resources/mockups/plum_guide/reviews--star-google.svg" alt="Star">
                                        <img src="/resources/mockups/plum_guide/reviews--star-google.svg" alt="Star">
                                    </div>
                                    <p class="trust-logos__review-number">Based on 120 reviews</p>
                                </a>
                            </div>
                        </div>
                        <div class="clearfix"></div>

                    </div>
                    <!-- End TrustBox widget -->

                </div>
            </div>

            <div id="GuaranteesModalContent" class="plum-modal hidden">
                <div class="modal-content">
                    <button class="btn btn-tertiary-5 btn-icon plum-icon-cross close-btn"></button>
                    <div class="guarantees">
                        <div class="row">
                            <div class="col-xs-12">
                                <span class="img-responsive"></span>
                                <img class="img-responsive"
                                     src="/resources/mockups/plum_guide/plum-promise-stamp-white-bg.png"
                                     alt="Plum Promise stamp">
                                <h3>We Guarantee:</h3>
                                <ul>
                                    <li>Only 5 star homes</li>
                                    <li>Tested by travel experts</li>
                                    <li>24 hour support</li>
                                    <li>Soulful neighbourhoods</li>
                                    <li>Luxurious toiletries</li>
                                    <li>What you see is what you get</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>


    <div id="react-app-footer">
        <div class="full-bleed footer-container text__body--sm">
            <footer class="footer clearfix">
                <div class="container-fluid">
                    <div class="col-xs-12 margin-top-10 margin-bottom-10">
                        <div class="plumui-panel plumcss-panel panelcss-panel--shadow matchmaking-cta-panel cta-panel cta-panel--no-bg ">
                            <div class="cta-panel__text">
                                <div class="cta-panel__title text__title--lg">Can we help?</div>
                                <p>We've visited every home personally. Let one of our expert MatchMakers guide you
                                    through finding your perfect stay with us. Call us, request a callback, message us
                                    or chat now.</p></div>
                            <div class="cta-panel__button">
                                <button class="plumui-button plumui-button__contact  plumui-button--primary plumui-button--medium">
                                    <div class="plumui-button__icon-wrap">
                                        <div class="plumui-button__icon plumui-button--icon-right"><span
                                                class="plum-icon-call plum-icon__animated"></span></div>
                                        <div class="plumui-button__label">Speak to an expert</div>
                                    </div>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6"><a href="https://www.plumguide.com/"><img
                            src="https://static.plumcache.com/images/logo-white2x.png?auto=format&amp;q=55"
                            alt="The Plum Guide logo" class="footer__logo-img lazyload"></a>
                        <div class="row">
                            <div class="col-xs-12 col-sm-4">
                                <ul class="footer__list">
                                    <li><a href="https://www.plumguide.com/about-us">About Us</a></li>
                                    <li><a href="http://help.plumguide.com/support/home" target="_blank">Support</a>
                                    </li>
                                    <li><a href="https://www.plumguide.com/journal">Journal</a></li>
                                    <li><a href="https://www.plumguide.com/contact-us">Contact Us</a></li>
                                    <li><a href="https://www.plumguide.com/apply">Apply to be listed</a></li>
                                    <li><a href="https://www.plumguide.com/Partnership">Travel Partners</a></li>
                                    <li><a href="https://careers.plumguide.com/" target="_blank">Careers</a></li>
                                </ul>
                            </div>
                            <div class="col-xs-12 col-sm-4">
                                <ul class="footer__list">
                                    <li><a href="https://www.plumguide.com/london">London apartments</a></li>
                                    <li><a href="https://www.plumguide.com/paris">Paris apartments</a></li>
                                    <li><a href="https://www.plumguide.com/new-york">New York apartments</a></li>
                                    <li><a href="https://www.plumguide.com/los-angeles">Los Angeles apartments</a></li>
                                    <li><a href="https://www.plumguide.com/rome">Rome apartments</a></li>
                                    <li><a href="https://www.plumguide.com/milan">Milan apartments</a></li>
                                </ul>
                            </div>
                            <div class="col-xs-12 col-sm-4">
                                <ul class="footer__list">
                                    <li><a href="tel:020 3795 1390">United Kingdom: 020 3795 1390</a></li>
                                    <li><a href="tel:+44 (0) 203 795 1390"><span class="fa fa-globe"></span> +44 (0) 203
                                        795 1390</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 footer__right-panel">
                        <div class="icon-links icon-links--social"><a class="social-logos__link"
                                                                      href="https://www.facebook.com/plumguide/"
                                                                      target="_blank" rel="noopener">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 22 22">
                                <path fill="#fff" fill-rule="evenodd"
                                      d="M22 1.375C22 .623 21.377 0 20.625 0H1.375C.623 0 0 .623 0 1.375v19.25C0 21.377.623 22 1.375 22h10.388v-8.55h-2.75v-3.17h2.75V7.541c0-2.503 1.525-4.179 4.544-4.179 1.332 0 2.256.15 2.256.15V6.37H16.5c-.913 0-1.375.516-1.375 1.418v2.492h3.212l-.462 3.17h-2.75V22h5.5c.752 0 1.375-.623 1.375-1.375V1.375z"></path>
                            </svg>
                        </a><a class="social-logos__link" href="https://twitter.com/plumguide" target="_blank"
                               rel="noopener">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 22 19">
                                <path fill="#fff" fill-rule="evenodd"
                                      d="M22 2.942a8.803 8.803 0 0 1-2.6.72 4.475 4.475 0 0 0 1.988-2.503 9.06 9.06 0 0 1-2.847 1.096c-.849-.86-2.02-1.418-3.32-1.418a4.493 4.493 0 0 0-4.5 4.5c0 .355.021.72.096 1.043-3.738-.204-7.046-1.901-9.292-4.63-.376.666-.612 1.354-.612 2.191a4.49 4.49 0 0 0 2.02 3.739A4.524 4.524 0 0 1 .892 7.12v.054a4.51 4.51 0 0 0 3.62 4.426 4.513 4.513 0 0 1-1.203.16c-.28 0-.559-.032-.838-.085.558 1.783 2.245 3.115 4.2 3.136-1.525 1.225-3.491 2.138-5.597 2.138-.365 0-.72-.021-1.074-.075 1.987 1.278 4.383 1.837 6.929 1.837 8.293 0 12.826-6.875 12.826-12.837v-.59A9.141 9.141 0 0 0 22 2.941z"></path>
                            </svg>
                        </a><a class="social-logos__link" href="https://www.instagram.com/plumguide/" target="_blank"
                               rel="noopener">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 22 22">
                                <path fill="#fff" fill-rule="evenodd"
                                      d="M18.788 0A3.214 3.214 0 0 1 22 3.212v15.576A3.214 3.214 0 0 1 18.788 22H3.212A3.214 3.214 0 0 1 0 18.788V3.212A3.214 3.214 0 0 1 3.212 0h15.576zM11 6.875a4.126 4.126 0 0 0 0 8.25 4.126 4.126 0 0 0 0-8.25zm8.712 12.375V9.625h-2.439c.097.44.14.902.14 1.375A6.41 6.41 0 0 1 11 17.413 6.41 6.41 0 0 1 4.587 11c0-.473.043-.935.14-1.375H2.288v9.625c0 .258.204.462.462.462h16.5a.458.458 0 0 0 .462-.462zm0-13.75V2.75a.458.458 0 0 0-.462-.462H16.5a.458.458 0 0 0-.462.462V5.5c0 .258.204.462.462.462h2.75a.458.458 0 0 0 .462-.462z"></path>
                            </svg>
                        </a><a class="social-logos__link" href="https://www.linkedin.com/company/the-plum-guide"
                               target="_blank" rel="noopener">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 22 22">
                                <path fill="#fff" fill-rule="evenodd"
                                      d="M.462 7.788h4.576V22H.462V7.788zm11.913 5.962V22H7.788V11s-.075-2.729-.075-3.212h4.512l.15 1.966c.913-1.375 2.288-2.417 4.125-2.417 3.212 0 5.5 2.288 5.5 6.413V22h-4.587v-7.788c0-2.299-1.117-3.212-2.492-3.212s-2.546.913-2.546 2.75zM2.729 5.5h-.033C1.074 5.5 0 4.383 0 2.976 0 1.558 1.096.462 2.771.462 4.426.462 5.48 1.558 5.5 2.976 5.5 4.383 4.426 5.5 2.729 5.5z"></path>
                            </svg>
                        </a><a class="social-logos__link" href="https://www.pinterest.co.uk/theplumguide/"
                               target="_blank" rel="noopener">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 20 24">
                                <path fill="#fff" fill-rule="evenodd"
                                      d="M10.55 0C4 0 .72 4.7.72 8.613c0 2.356.89 4.465 2.812 5.274.328.117.61 0 .692-.364.058-.222.222-.832.28-1.101.083-.34.048-.445-.198-.75-.551-.668-.914-1.5-.914-2.73 0-3.47 2.613-6.587 6.808-6.587 3.692 0 5.719 2.25 5.719 5.286 0 3.972-1.746 7.336-4.36 7.336-1.453 0-2.53-1.196-2.203-2.672.422-1.746 1.23-3.633 1.23-4.887 0-1.137-.608-2.063-1.862-2.063-1.477 0-2.637 1.5-2.637 3.563 0 1.3.41 2.191.41 2.191s-1.5 6.387-1.746 7.5c-.527 2.227-.082 4.97-.059 5.25.036.141.223.2.34.059.14-.164 1.887-2.332 2.473-4.5.187-.61.973-3.773.973-3.773.492.914 1.886 1.687 3.386 1.687 4.418 0 7.418-4.031 7.418-9.445 0-4.078-3.445-7.887-8.73-7.887z"></path>
                            </svg>
                        </a></div>
                        <div class="icon-links icon-links--settings"><a><span class="icon">£</span></a><a><span
                                class="icon icon-country-flag-en-gb"></span></a></div>
                        <p class="footer__legal">© The Plum Guide 2019 | <a href="https://www.plumguide.com/terms">Terms
                            of use and service</a> | <a href="https://www.plumguide.com/privacy-policy">Privacy
                            policy</a></p></div>
                </div>
            </footer>
        </div>
    </div>
</div>


<script>
    $(function () {
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
                fontFamily: 'NeueHaas, "Helvetica Neue", Helvetica, sans-serif',
                fontSmoothing: 'antialiased',
                fontSize: '16px',
                '::placeholder': {
                    color: '#aaa',
                    fontFamily: '"Helvetica Neue", Helvetica, sans-serif',
                }
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

        $('#order-place-btn').on('click', function () {

            if (paymentMethod === 'cc'){
                $.ajax({
                    type: "POST",
                    url: "https://api.stripe.com/v1/payment_intents",
                    data: "payment_method_types[]=card&amount=135600&currency=gbp",
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
                    amount: 135600,
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
                    label: '£226.00 x 6 nights',
                    amount: 135600,
                }
            ],
            total: {
                label: 'Total Amount',
                amount: 135600,
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
                    $('#with-payment-request').show();
                    $('#without-payment-request').hide();
                    prButton.mount('#payment-request-button');
                } else if (result) {
                    $('#with-payment-request').show();
                    $('#without-payment-request').hide();
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
    .StripeElement {
        font-family: 'NeueHaas';
    }

    #card-errors {
        color: #fc005e;
        font-family: NeueHaas;
    }

    .gpay-button {
        width: 100% !important;
    }
    .form-control {
        color: #2a213e !important;
    }
</style>
</body>
</html>
