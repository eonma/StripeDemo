/* CI-512 */

function delete_cookie(name) {
    document.cookie = name + '=; Path=/; Expires=Thu, 01 Jan 1970 00:00:01 GMT;';
}
function setCookie(name,value,days) {
    var expires = "";
    if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (days*24*60*60*1000));
        expires = "; expires=" + date.toUTCString();
    }
    document.cookie = name + "=" + (value || "")  + expires + "; path=/";
}


function clearSearch() {
    delete_cookie('ecp-sh');
    setCookie('ecp-sh-delete', 1, 1);
    jQuery('.searchHistory').remove();
    //window.location.reload();
    return false;
}

var bindAutoComplete = function () {
	$('.searchAutoComplete').autocomplete({
		serviceUrl: ECP.getBase() + '/search/index/getSearchAutoComplete',
		 appendTo: ".searchbox-home",
		beforeRender: function (container) {
			
			
$('.autocomplete-suggestions').addClass("mainsearch");
},
		onSelect: function (event, ui) { 
	    	$(this).closest('.search-from').submit();
	    },
		ajaxSettings: {
		    	global: false,
		    }
		});

};

/* CI-512 */
$(document).ready(function () {
    /* CI-512 */

    $(document).on('click', 'body', function (e) {

        if ($(e.target).closest(".searchHistory").length > 0 && !$(e.target).is('a')) {
            return false;
        }

        $('.searchHistory').hide();
	});


    $(document).on('keydown keyup click', '.searchAutoComplete', function (e) {
        if (e.keyCode == 9)
        {
            $('.searchHistory').hide();
            return true;
        }

        if ($(this).val().length > 0) {
            $('.searchHistory').hide();
        } else {
            $('.searchHistory').show();
			
			if($('.searchbox-home').length<1){
				$('<div class="searchbox-home"></div>').insertAfter(this);
			}
			
            bindAutoComplete();
        }
    });

    $(document).on('click', '.searchAutoComplete', function () {
        if ($(this).val().length == 0) {
            $('.searchHistory').show();
            return false;
        }
        $('.searchHistory').hide();

    });
    /* CI-512 */
	var getWidth = $(window).width();
	//Fixed Header
	if(getWidth >= 768){
		//checkout Dropdown
		var checkout = {
			over: function(){
				$(this).children('.drop-arrow').animate({opacity:1, height:'toggle'}, 150);
				$(this).children('.cart-dropdown').animate({opacity:1, height:'toggle'}, 150);
			},
			timeout: 100, // number = milliseconds delay before onMouseOut
			out: function(){
				$(this).children('.drop-arrow').animate({opacity:0, height:'toggle'}, 150);
				$(this).children('.cart-dropdown').animate({opacity:0, height:'toggle'}, 150);
			}
		};
		$("header .right-col li.fourth-col").hoverIntent(checkout);
		//Cookie Bar
		if($('.cookie-bar').length){
			$('.content-section').addClass('cookiebar');
		}else{
			$('.content-section').removeClass('cookiebar');
		}
		$('.cookie-bar.active .close-btn').click(function(){
			$('.cookie-bar').slideUp(400).removeClass('active');
			$('header').removeClass('extbar');
			$('.content-section').removeClass('cookiebar');
		});
		//vrm focus
		$('.search-detail-box .reg-field input').focus(function(){
			$(this).parents('.reg-field').addClass('focus');
			$('.search-detail-box .select-vehicle').addClass('disable');
		}).blur(function(){
			$(this).parents('.reg-field').removeClass('focus');
			$('.search-detail-box .search-wrapper .select-vehicle').removeClass('disable');
		});
		$('.search-detail-box .select-vehicle select').focus(function(){
			$(this).parents('.select-vehicle').addClass('focus');
			$('.search-detail-box .reg-field').addClass('disable');
		}).blur(function(){
			$(this).parents('.select-vehicle').removeClass('focus');
			$('.search-detail-box .reg-field').removeClass('disable');
		});
		//Brands Logo List
		$('.brand-slider .bxslider li:nth-child(7)').nextAll().css( "margin-bottom", "0px" );
		var logohover = {
			over: function(){
				$(this).children('.hover').hide();
				$(this).children('.normal').show();
			},
			timeout: 100, // number = milliseconds delay before onMouseOut
			out: function(){
				$(this).children('.normal').hide();
				$(this).children('.hover').show();
			}
		};
		$(".brand-slider .bxslider li").hoverIntent(logohover);
		//3bo info popup
		popoverDiv();
		//custom dropdown
		if($('.custom-select').length){
			$('.custom-select').niceSelect();
		}
	}
	if(getWidth >= 1025){
		var timer;
		$("header .nav-col nav li.tier1nav").mouseenter(function(){
			var that = this;
			timer = setTimeout(function(){
				$("header .nav-col nav li.tier1nav .sub-nav").hide();
				$(that).children(".sub-nav").show();
				$(that).children(".sub-li").addClass('active');
				$($(that).find(".sub-li").get(0)).addClass('active');
			}, 100);
		}).mouseleave(function(){
			var that = this;
			clearTimeout(timer);
			$("header .nav-col nav li.tier1nav .sub-nav").hide();
			$("header .nav-col nav li.tier1nav .sub-nav .sub-li").removeClass('active');
			$($(that).find(".sub-li").get(0)).addClass('active');
		});		
		var navhover = {
			over: function(){
				$(this).siblings().removeClass("active");
				$(this).addClass('active');
				$(this).children('.inner-nav').fadeIn(200);
			},
			timeout: 400, // number = milliseconds delay before onMouseOut
			out: function(){
				
			}
		};
		$("header .nav-col .sub-nav .left-sub-nav .sub-li").hoverIntent(navhover);
	}
	//Tab Menu Navigation
	$('header .tab-menu').click(function(){
		$('header .right-col li.fourth-col .drop-arrow').hide();
		$('header .right-col li.fourth-col .cart-dropdown').hide();
		$(this).toggleClass('active');
		$('header nav').slideToggle(400);
		$('.tab-overlay').fadeToggle(400);
		if($(this).hasClass('active')){
		}else{
			$('.nav-col .outer-ul li').show();
			$('.nav-col .sub-nav, .nav-col .inner-nav').hide();
			$('.nav-col .sub-li').removeClass('active').show();
		}
	});
	$('header .right-col > li.first-col, header .right-col li.third-col, header .right-col li.fourth-col, header .nav-col .tab-nav .search-from').click(function(){
		$('header .nav-col nav, .tab-overlay').hide();
		$('header .nav-col .tab-nav .tab-menu').removeClass('active');
	});
	$('.tab-overlay').click(function(){
		$('header .nav-col nav, .tab-overlay').hide();
		$('header .nav-col .tab-nav .tab-menu').removeClass('active');
		$('.nav-col .outer-ul li').show();
		$('.nav-col .sub-nav, .nav-col .inner-nav').hide();
		$('.nav-col .sub-li').removeClass('active').show();
	});
	//Heroes Page
	if($(".wall-fame-grid").length > 0) {
		$('.wall-fame-grid').masonry({
			layoutMode: 'fitColumns',
			itemSelector: '.grid-item',
			columnWidth: '.grid-sizer',
			percentPosition: true,
			gutter: '.gutter-sizer'
		});
	}
	//Country Dropdown
	$(document).on('click','.country-change-popup .modal-body li',function(){
		$('.country-change-popup .modal-body li').removeClass('active');
		$(this).addClass('active');
		var getLink = $(this).attr('data-href');
		$('.country-change-popup .modal-body .confirm-btn').attr('href', getLink);
	});
	$(document).on('click','.country-change-popup .modal-body .confirm-btn',function(){
		$('#countryChange').modal('hide');
	});
	//Login Bar
	/*$('header .right-col .third-col a').click(function(){
		$('.login-box').slideToggle(400);
		$(this).parent('.third-col').toggleClass('active');
	});*/
	//search
	$('.search-from input').focus(function(){
		$(this).parents('.search-from').addClass('active');
	}).blur(function(){
		$(this).parents('.search-from').removeClass('active');
	});
	//Search Result Popup
	$('.search-result-display .view-btn').click(function(){
		$('.search-result-display .popup-box').fadeOut(400);
		$(this).parent('.left-col').next('.popup-box').fadeIn(400);
	});
	$('.search-result-display .close-btn').click(function(){
		$('.search-result-display .popup-box').fadeOut(400);
		$(this).parents('.popup-box').hide();
	});

	//Product Listing
	$(document).on('click','.product-listing-col .product-btn .quick-btn.desktop',function(){
		$(this).toggleClass('active');
		$(this).parents('.left-col').children('.quick-info-data').slideToggle(400);
	});
	//Shopping Cart
	$('.shopping-cart-col .basket-body .info-btn').click(function(){
		$(this).parents('.left-col').next('.right-col').slideToggle(400);
	});
	//Product Detail
	if($(".product-detail-table").length){
		RESPONSIVEUI.responsiveTabs();
		$('.tabcontrolswrap a.tabcontrols').click(function(){
			var obj = $(this);
			if(getWidth <= 767){
				$("div.product-detail-table .responsive-tabs").find('h4').removeClass('responsive-tabs__heading--active');
				var tab3 = $("div.product-detail-table .responsive-tabs").find('#tablist1-panel2');
				$(tab3).prev('h4').addClass('responsive-tabs__heading--active');
				$(tab3).addClass('responsive-tabs__panel--active').show();
				$('html,body').animate({scrollTop: $("#"+obj.data('id')).offset().top-40}, 500);
				return false;
			}else{
				$("div.product-detail-table .responsive-tabs").find('li').removeClass('responsive-tabs__list__item--active');
				$("div.product-detail-table .table-data").removeClass('responsive-tabs__panel--active').hide();
				var tab2 = $("div.product-detail-table .responsive-tabs").find('#tablist1-tab2');
				$(tab2).addClass('responsive-tabs__list__item--active');
				$("#"+$(tab2).attr('aria-controls')).addClass('responsive-tabs__panel--active').show();
				$('html,body').animate({scrollTop: $("#"+obj.data('id')).offset().top-40}, 500);
				return false;
			}
		});
	}
	//Footer Dropdown
	$('.choose-country .inner-box .country-selector').click(function(e){
		$(this).parent('.inner-box').children('.country-list').slideToggle(200);
		e.stopPropagation();
	});
	//order confirmation tabbing
	$('.order-confirm-col .order-header .tab-link').click(function(){
		$(this).parent('.order-header').next('.order-detail').slideToggle(400);
	});
	$('.order-confirm-col .order-header .tab-link').click(function(event){
		if($(this).hasClass("active")){
			$(this).toggleClass("active").html('-');
			$(this).parent('.order-header').css('margin-bottom','0');
		}else{
			$(this).toggleClass("active").html('+');
			$(this).parent('.order-header').css('margin-bottom','20px');
		}
	});
	//checkout order view toggle
	$(document).on('click','.checkout.delivery-option .table-data .toggle-option',function(){
		$(this).toggleClass('active');
		if($(this).hasClass('active')){
			$(this).children('img').attr('src',ECP.getStatic()+'/'+'open-arrow.png');
		}else{                                                    
			$(this).children('img').attr('src',ECP.getStatic()+'/'+'close-arrow.png');
		}
		$(this).parent('.row-inner').children('.sub-list').slideToggle(400);
	});
	$(document).click(function(e){
		if(e.target.class != 'country-list' && !$('.country-list').find(e.target).length){
			$(".country-list, .first-col .drop-arrow").hide();
		}
	});
	//Static Page Accordion
	$(".static-page #accordion, .garage-local-inner #accordion").on("shown.bs.collapse", function(){
		var myEl = $(this).find('.collapse.in').prev('.panel-heading');
		$('html, body').animate({
			scrollTop:($(myEl).offset().top-200)
		}, 500);
	});
	$(".static-page #accordion1 .panel-group").on("shown.bs.collapse", function(){
		var myEl = $(this).find('.collapse.in').prev('.panel-heading');
		$('html, body').animate({
			scrollTop:($(myEl).offset().top-200)
		}, 500);
	});
	$(".static-page #accordion1").on("shown.bs.collapse", function(event){
		var accParent 	= $(event.target).parent();
		var eleId 		= $(accParent).find('.panel-title').data('parent');
		if(eleId.indexOf('inner') < 0){
			$(eleId).find('.panel-body .in').collapse('hide');
			var myEl = $(event.target).parent();
			$('html, body').animate({
				scrollTop:($(myEl).offset().top-200)
			}, 500);
		}
	});
	//Device Menu close
	if(getWidth >= 768 && getWidth <= 1023){
		$('.content-section, footer').on('click touchstart', function(event){
			if($(event.target).parents().index($('.sub-nav-col')) == -1){
				if($('.sub-nav').is(":visible")){
					$('.sub-nav').hide();
				}
			}
		});
		$('.stock-availability-data .select-store-btn').click(function(){
			$(this).next('.store-btn-popup').slideDown(400);
		}, function(){
			$(this).next('.store-btn-popup').slideUp(400);
		});
	}
	//Sitemap Accordion
	var currentlyAnimating = false;
	$('.sitemap-col .sub-listing span').click(function(){
		if(!currentlyAnimating){
			currentlyAnimating = true;
			$(this).parent('li').toggleClass("active").find('ul').slideToggle(400, function() {
				currentlyAnimating = false;
			});
			
			$('.sitemap-col .sub-listing > li.active').not($(this).parent('li')).removeClass("active");
			$('.sitemap-col .sub-listing ul:visible').not($(this).parent('li').find('ul')).slideUp(400, function() {
				currentlyAnimating = false;
			});
		}
	});
	//Checkout payment view
	$('.checkout.payment-detail .select-payment-mode li input').click(function(){
		if(this.checked){
			$('.checkout.payment-detail .select-payment-mode li').removeClass('active');
			$(this).parent('li').addClass('active');
		}else{
			$('.checkout.payment-detail .select-payment-mode li').removeClass('active');
		}
	});
	$('.checkout.payment-detail .detail-form .address-confirm-col label').click(function(){
		$('.checkout.payment-detail .detail-form .address-confirm-col label').removeClass('active');
		$(this).addClass('active');
	});
	//Product listing Filter
	$(document).on('click','.product-listing-col .sfilter',function(){
		$(this).toggleClass('active');
		if($(this).hasClass('active')){
			$('.filter-box .selection-count').hide();
			$('.product-listing-col .filter-box .filter-overlay').show();
			$('.product-listing-col .filter-box .small-filter').slideDown(200);
			$('.clearance-listing-col.product-listing-col .filter-overlay').hide();
		}else{
			$('.filter-box .selection-count').show();
			$('.product-listing-col .filter-box .filter-overlay').hide();
			$('.product-listing-col .filter-box .small-filter').slideUp(200);
		}
	});
	$(document).on('click','.product-listing-col .lfilter',function(){
		$(this).toggleClass('active');
		if($(this).hasClass('active')){
			$('.filter-box .selection-count').hide();
			$('.product-listing-col .filter-box .filter-overlay').show();
			$('.product-listing-col .filter-box .full-filter').slideDown(200);
			$('.clearance-listing-col.product-listing-col .filter-overlay').hide();
		}else{
			$('.filter-box .selection-count').show();
			$('.product-listing-col .filter-box .filter-overlay').hide();
			$('.product-listing-col .filter-box .full-filter').slideUp(200);
		}
	});
	$(document).on('click','.filter-box .filter-overlay',function(){
		$(this).hide();
		$('.filter-box .selection-count').show();
		$('.filter-box .lfilter').removeClass('active');
		$('.filter-box .sfilter').removeClass('active');
		$('.product-listing-col .filter-box .full-filter').slideUp(200);
		$('.product-listing-col .filter-box .small-filter').slideUp(200);
	});
	//Feedback slide Effect
	$('.feedback-link').hover(function(){
		$(this).animate({right: '0'}, 400);
	}, function(){
		$(this).animate({right: '-92px'}, 400);
	});
	//SEO content effect
	$('.tierseocontent .view-more').click(function(){
		$(this).hide();
		$(this).siblings('span').addClass('expand');
		$(this).siblings('span').find('.view-less').css('display','inline');
	});
	$('.tierseocontent .view-less').click(function(){
		$(this).hide();
		$(this).parents('span').removeClass('expand');
		$(this).parents('span').siblings('.view-more').fadeIn(400);
	});
	$(document).on('click','.order-review .collapse-arrow',function(){
		$(this).toggleClass('active');
		if($(this).hasClass('active')){
			if(getWidth <= 767){
				$(this).children('img').attr('src',ECP.getStatic()+'/'+'checkout-review-arrow-active.png');
			}else{
				$(this).children('img').attr('src',ECP.getStatic()+'/'+'open-arrow.png');
			}
		}else{
			if(getWidth <= 767){
				$(this).children('img').attr('src',ECP.getStatic()+'/'+'checkout-review-arrow.png');
			}else{
				$(this).children('img').attr('src',ECP.getStatic()+'/'+'close-arrow.png');
			}
		}
		$('.toggle-view').slideToggle(400);
	});
	$('.leftcol3bo .refine-parts .refine-col .list-outer li').click(function(){
		$(this).toggleClass('active');
	});
	//Left Refine Section 3BO
	$(document).on('click', '.leftcol3bo #tab-filters .refine-col .heading, .leftcol3bo #car-tab-filters .refine-col .heading ', function(){
		$(this).toggleClass('close').next('.filterSpec').slideToggle(400);
	});
	$(document).on('click', '.leftcol3bo .left-vrm .search-detail-box .separator', function(){
		$(this).next('.select-vehicle').slideToggle(400);
	});
	$(document).on('click','.o3b-section .product-btn .quick-btn.desktop',function(){
        var fitmentDetailHashStateId = "#fitment-detail";
        window.location.hash = fitmentDetailHashStateId;
		$(this).toggleClass('active');
		$(this).parents('.product-content').children('.quick-info-data').show();
	});
    window.onhashchange = function () { 
        if(window.location.hash == "") { 
            $('.quick-btn').removeClass('active');
            $('.quick-info-data').hide();
            $('.overlay-bg').remove();
        } 
    }
	$(document).on('click','.o3b-section.product-listing-col .rightcol3bo .quick-info-data .close-data',function(){
		$(this).parents('.quick-info-data').hide();
		$('.o3b-section.product-listing-col .rightcol3bo .product-btn .quick-btn').removeClass('active');
	});
	$(document).on('click','.o3b-section.product-listing-col .rightcol3bo .quick-info-data .addtocartbtn',function(){
		$(this).parents('.quick-info-data').hide();
		$('.o3b-section.product-listing-col .rightcol3bo .product-btn .quick-btn').removeClass('active');
	});
	$(document).on('click','.o3b-section.product-listing-col .rightcol3bo .quick-info-data .overlay',function(){
		$(this).parent('.quick-info-data').hide();
		$('.o3b-section.product-listing-col .rightcol3bo .product-btn .quick-btn').removeClass('active');
	});
	$(document).on('click','.leftcol3bo #category-filters .clear-category-refine',function(){
		$('.leftcol3bo #category-filters .filter-box .brand-listing li').removeClass('active');
	});
	$(document).on('click','.leftcol3bo .filter-box .brand-listing li.view-link',function(){
		$(this).hide();
		$(this).parent('.filterSpec').children('.list').show();
		$(this).parent('.filterSpec').find('li.view-less').show();
	});
	$(document).on('click','.leftcol3bo .filter-box .brand-listing li.view-less',function(){
		$(this).hide();
		$(this).parent('.filterSpec').children('.list').hide();
		$(this).parent('.filterSpec').find('li.view-link').show();
	});
	//EasyAsk 
	$(document).on('click','.category-tier-col.list-with-products .search-result-list .view-more-link',function(){
		$(this).hide();
		$(this).prev('.data').children('.list-box.products').css('display','block');
	});
	//----------Mobile Device Function-----------
	if(getWidth <= 767){
		//Mobile Header
		$('.cookie-bar.active .close-btn').click(function(){
			$('.cookie-bar').slideUp(400).removeClass('active');
		});
		$('header .right-col li.fourth-col .basket-icon').attr('href','javascript:void(0);');
		//vrm box selection
		$('.car-parts-form .select-vehicle').addClass('nowActive');
		$('.car-parts-form .select-vehicle .heading').click(function(){
			$(this).addClass('open');
			$(this).parent('.select-vehicle').removeClass('nowActive');
			$(this).next('.vehicle-form').slideToggle(400);
			$('.car-parts-form .number-col .vrm-form').slideToggle(400);
			$('.car-parts-form .number-col').addClass('nowActive');
			$('.car-parts-form .number-col .heading').addClass('close');
		});
		$('.car-parts-form .number-col .heading').click(function(){
			$(this).removeClass('close');
			$(this).parent('.number-col').removeClass('nowActive');
			$(this).next('.vrm-form').slideToggle(400);
			$('.car-parts-form .vehicle-form').slideToggle(400);
			$('.car-parts-form .select-vehicle').addClass('nowActive');
			$('.car-parts-form .select-vehicle .heading').removeClass('open');
		});
		$('.car-parts-form.filled-form').click(function(){
			$('.car-parts-form.filled-form .number-col .vrm-form').stop();
		});
		//inner pages vrm box selection
		$('.search-detail-box .select-vehicle').addClass('nowActive');
		$(document).on('click','.search-detail-box .select-vehicle.nowActive .heading',function(){
			$(this).addClass('open');
			$(this).parent('.select-vehicle').removeClass('nowActive');
			$(this).next('.vehicle-form').slideToggle(400);
			$('.search-detail-box .reg-field .vrm-form').slideToggle(400);
			$('.search-detail-box .reg-field').addClass('nowActive');
			$('.search-detail-box .reg-field .heading').addClass('close');
		});
		$(document).on('click','.search-detail-box .reg-field.nowActive .heading',function(){
			$(this).removeClass('close');
			$(this).parent('.reg-field').removeClass('nowActive');
			$(this).next('.vrm-form').slideToggle(400);
			$('.search-detail-box .select-vehicle .vehicle-form').slideToggle(400);
			$('.search-detail-box .select-vehicle').addClass('nowActive');
			$('.search-detail-box .select-vehicle .heading').removeClass('open');
		});
		
		$('.store-finder-detail .find-form input').attr("placeholder", "Search again");
		$('header .right-col li.fourth-col').click(function(){
			$('header .right-col li.first-col .drop-arrow').hide();
			$('header .right-col li.first-col .country-list').hide();
			$('.main-header .mobile-menu').removeClass('active');
			$('header .nav-col').hide();
			$(this).children('.drop-arrow').slideToggle(200);
			$(this).children('.cart-dropdown').slideToggle(200);
		});
		$('header .right-col li.first-col').click(function(){
			$('header .right-col li.fourth-col .drop-arrow').hide();
			$('header .right-col li.fourth-col .cart-dropdown').hide();
			$('header .nav-col').hide();
		});
		//body close navigation
		if( /Android|webOS|iPhone|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)){
			$(document).click(function(e){
				if(e.target.class != 'slide--reset' && !$('.slide--reset').find(e.target).length){
					$('.slide--reset .mobile-menu').removeClass('active');
					$(".nav-col").hide();
				}
			});
		}
		//Mobile Footer
		$('footer h3').click(function(event){
			if($(this).hasClass("open")){
				$('footer ul').slideUp(400);
				$('.choose-country .drop-arrow').slideUp(400);
				$('footer h3').removeClass('open');
				$('footer .col-md-2').removeClass('active');
				event.preventDefault();
			}else{
				$('footer ul').slideUp(400);
				$('.choose-country .drop-arrow').slideUp(400);
				$('footer h3').removeClass('open');
				$('footer .col-md-2').removeClass('active');
				$(this).parent('.col-md-2').addClass('active');
				$(this).addClass('open');
				$(this).parent('div').children('ul').slideDown(400);
			}
		});
		//Mobile Search Bar
		$('.mobile-search').click(function(){
			$('header').css('min-height','47px');
			$('.main-header .right-col, header .nav-col').hide();
			$('.main-header .mobile-menu').removeClass('active');
			$('header .left-grid, .search-from').fadeIn(400);
		});
		$('.search-from .close-btn').click(function(){
			$('.search-from, header .left-grid').hide();
			$('.main-header .right-col').show();
			$('header').css('min-height','unset');
		});
		//Mobile Navigation
		$('.mobile-menu').click(function(){
			$('header .right-col li.fourth-col .drop-arrow').hide();
			$('header .right-col li.fourth-col .cart-dropdown').hide();
			$(this).toggleClass('active');
			$('.nav-col').slideToggle(400);
			$('header .nav-col nav').show();
			if($(this).hasClass('active')){
			}else{
				$('.nav-col .outer-ul li').show();
				$('.nav-col .sub-nav, .nav-col .inner-nav').hide();
				$('.nav-col .sub-li').removeClass('active').show();
			}
		});
		//Product Popup
		$('#product-popup').modal('show');

		//Product Listing
		$(document).on('click', '.product-listing-col .quick-btn.desktop', function(){
            var fitmentDetailHashStateId = "#fitment-detail";
            window.location.hash = fitmentDetailHashStateId;
			var infodivid = $(this).data('quickinfo');
			$(this).parents('.left-col').children('.quick-info-data').find('.popup-title').replaceWith($('#'+infodivid));
			$(this).parents('.left-col').append('<div class="overlay-bg"></div>');
			$(this).parents('.left-col').children('.quick-info-data').fadeIn(400);
		});
		$(document).on('click', '.product-listing-col .quick-info-data .close-data', function(){
			$('.product-listing-col .quick-btn.desktop').removeClass('active');
			$(this).parent('.product-listing-col').children('.quick-btn').removeClass('active');
			$(this).parent('.quick-info-data').fadeOut(400);
			$(this).parent('.quick-info-data').next('.overlay-bg').fadeOut(400,function(){
				$(this).remove();
			});
		});
        $(document).on('click','.product-listing-col .quick-info-data .addtocartbtn',function(){
            $('.product-listing-col .quick-btn.desktop').removeClass('active');
            $('.quick-info-data').fadeOut(400);
            $('.quick-info-data').next('.overlay-bg').remove();
        });
        $(document).on('click','.product-listing-col .overlay-bg',function(){
            $('.product-listing-col .quick-btn.desktop').removeClass('active');
            $(this).prev('.quick-info-data').fadeOut(400);
            $(this).prev('.quick-info-data').next('.overlay-bg').fadeOut(400,function(){
				$(this).remove();
			});
        });
		$(document).on('click', '.mobile-brand-right .viewAllBrands', function(){
			$('.custom-overlay').fadeIn(400);
			$(this).parents('.productbrandslisting').children('.right-col').fadeIn(400);
		});
		$(document).on('click', '.product-listing-col .right-col .close', function(){
			$('.custom-overlay').fadeOut(400);
			$(this).parent('.right-col').fadeOut(400);
		});
		$('.stock-availability-data .select-store-btn').click(function(){
			$(this).next('.store-btn-popup').slideDown(400);
		}, function(){
			$(this).next('.store-btn-popup').slideUp(400);
		});
		$('.cart-btn-outer').click(function(e){
			$(this).children('.cart-btn-dropdown').slideToggle(400);
			e.stopPropagation();
		});
		$(document).click(function(e){
			if(e.target.class != 'cart-btn-dropdown' && !$('.cart-btn-dropdown').find(e.target).length){
				$(".cart-btn-dropdown").hide();
			}
		});
		$('.checkout.delivery-option .table-data .toggle-option').click(function(){
			$(this).children('img').attr('src',ECP.getStatic()+'/'+'open-arrow.png');
			$(this).parent('.row-inner').children('.sub-list').slideDown(400);
		});
		$('.checkout .delivery-method .box').click(function(e){
			/*EPL-5981*/	
			if(e.target.nodeName != 'U') {
			/*EPL-5981*/	
			if($(this).hasClass('disable')){
				$('.checkout .delivery-method .box.disable').show();
			}else{
				$('.checkout .delivery-method-toggle').show();
				$('.checkout .delivery-method .box').removeClass('active');
				$('.checkout .delivery-method .box:not(.active)').hide();
				$(this).not('.disable').toggleClass('active').show();
			}
			$(document).on('click','.checkout .delivery-method-toggle',function(){
				$(this).hide();
				$('#order-place-btn').removeClass('reserve-btn').html('Place Order');
				$('#shippingform .enter-text').show();
			});
			/*EPL-5981*/	
			}
			/*EPL-5981*/	
		});
		$('.checkout .delivery-method-toggle').click(function(){
			$('.checkout .delivery-method .box').fadeIn(400);
			$('.checkout.contact-detail .profile-info li:nth-child(3)').show();
			$('.checkout .delivery-method .box').removeClass('active');
			$('#clickncollectdetails, #homedeliveryshipping').css('display','none');
			$('#hdsteps3').show();
		});
		$(document).on('click','.checkout .delivery-method .box.click-collect',function(){
			$('#order-place-btn').addClass('reserve-btn').html('Reserve');
		});
		$(document).on('click','.checkout .delivery-method .loc-delivery',function(){
			$('#shippingform .enter-text').hide();
		});
		$('.contact-info-form label, .sign-form label').each(function(){
			var getVal = $(this).text();
			$(this).next('input').attr('placeholder', getVal);
			$(this).closest('fieldset').find('select option:first').text(getVal);
		});
		$('#shippingform label, #billingform label').each(function(){
			var getText = $(this).text();
			$(this).next('input').attr('placeholder', getText);
		});
		//SEO content effect
		$('.seo-content .show-more').click(function(){
			$(this).hide();
			$('.seo-content span').addClass('expand');
			$('.seo-content .show-less').css('display','inline');
		});
		$('.seo-content .show-less').click(function(){
			$(this).hide();
			$('.seo-content span').removeClass('expand');
			$('.seo-content .show-more').fadeIn(400);
		});
		//Country Dropdown Navigation
		$('.country-selection').click(function(){
			$(this).children('.country-dropdown').slideToggle(400);
		});
		//VRM error popup
		var dataHtml = '<a class="error-close-btn" href="javascript:void(0);" title="Close">x</a>'
		if($('.content-section .product-listing-col').find('div.error-banner').length > 0 ){
			$('.search-detail-box').addClass('search-popup').append(dataHtml);
			$('.custom-overlay').fadeIn(400);
		}else{
			$('.search-detail-box').removeClass('search-popup');
			$('.search-detail-box').find('.error-close-btn').remove();
			$('.custom-overlay').hide();
		}
		$('.search-detail-box .error-close-btn').click(function(){
			$('.custom-overlay').hide();
			$('.search-detail-box').removeClass('search-popup')
			$('.search-detail-box').find('.error-close-btn').remove();
		});
		$('.custom-overlay').click(function(){
			$(this).hide();
			$('.search-detail-box').removeClass('search-popup')
			$('.search-detail-box').find('.error-close-btn').remove();
			$('.product-listing-col .right-col').hide();
		});
		$(window).scroll(function(){
			if($(window).scrollTop() > 600){
				$('.scrollToTop.float').fadeIn(400);
			}else{
				$('.scrollToTop.float').fadeOut(400);
			}
		});
		//zoom class add
		$('.clearance-listing-col .clearance-list figure').addClass('zoom').attr('data-target','#zoom-image');
		
		//Homepage Top Trending
		if ( $.isFunction($.fn.owlCarousel) ) {
			var winOwl9 = $(".top-tending-offer .owl-carousel").owlCarousel({
				loop:true,
				nav:true,
				navText: ['', ''],
				margin:10,
				responsiveClass: true,
				items:1,
				slideBy: 1,
				responsiveBaseWidth:1000,
				autoHeight: true,
				touchDrag  : true,
				mouseDrag  : true,    
				dots:false,
				responsive:{
					767:{
						items:1,
						slideBy: 1
					}
				}  
			}); 
			winOwl9.on('change.owl.carousel', function(event){
			   $('.owl-item.active').each(function(){
					 $(this).find('.top-tending-offer img').each(function(){
						var imgsrc = $(this).attr('data-src');
						$(this).attr('src', imgsrc).css({'opacity':1});			
					});
				});
			});			
		}
		//Homepage Top Trending
		
		//home page latest offers
		if ( $.isFunction($.fn.owlCarousel) ) {
			var winOwl1 = $(".latest-product-offers .owl-carousel").owlCarousel({
				loop:true,
				nav:true,
				navText: ['', ''],
				margin:10,
				responsiveClass: true,
				items:1,
				slideBy: 1,
				responsiveBaseWidth:1000,
				touchDrag  : true,
				mouseDrag  : true,  
				autoHeight: true,
				dots:false,
				responsive:{
					767:{
						items:1,
						slideBy: 1
					}
				}  
			}); 
			winOwl1.on('change.owl.carousel', function(event){
			   $('.owl-item.active').each(function(){
					 $(this).find('.home-latest-offer img').each(function(){
						var imgsrc = $(this).attr('data-src');
						$(this).attr('src', imgsrc).css({'opacity':1});			
					});
				});
			});			
		}
// CI-510
		if ($('.recent-items').length) {
			var winOwl = $('.recent-items .owl-carousel').owlCarousel({
				lazyLoad: true,
				loop: true,
				loop:($(".recent-items-inner .owl-item").length > 1) ? true: false,
				nav: false,
				margin: 0,
				dots: true,
				responsiveClass: true,
				responsiveBaseWidth: 1000,
				animateOut: 'fadeOut',
				autoHeight: true,
				responsive: {
					300: {
						items: 1,
						dots: true,
						slideBy: 1
					}
				}
			});
			winOwl.on('change.owl.carousel', function (event) {
				$('.owl-item.active').each(function () {
					$(this).find('.recent-image img').each(function () {
						var imgsrc = $(this).attr('data-src');
						$(this).attr('src', imgsrc).css({'opacity': 1});
					});
				});
			});

		}
		//Category toggle section
		$('.tier-one-category .tier-listing .mobile-display').on('click', function(){
			if($(this).hasClass('active')){
				$('.tier-one-category .tier-listing .mobile-display').removeClass('active');
				$('.tier-one-category .tier-listing .mobile-expand').slideUp(400);
			}else{
				$('.tier-one-category .tier-listing .mobile-display').removeClass('active');
				$('.tier-one-category .tier-listing .mobile-expand').slideUp(400);
				$(this).toggleClass('active');
				$(this).next('.mobile-expand').slideToggle(400);
			}
		});
		//Basket Page placeholder
		$('.shopping-cart-col #promotionalCode').attr('placeholder','Enter promo code');
		$(document).on('click','.refine-mobile-btn',function(){
			if($(this).hasClass('open')){
				$(this).removeClass('open');
				$('.leftcol3bo .refine-tabbing').hide();
                $('.leftcol3bo #tab-filters, .leftcol3bo #car-tab-filters, .leftcol3bo #category-filters, .leftcol3bo .left-inner').hide();
				$('.leftcol3bo .refine-tabbing span').removeClass('active');
				$(this).parent('.leftcol3bo').children('.mobile-buttons').hide();
				$('.leftcol3bo .refine-tabbing, .leftcol3bo .mobile-buttons, .leftcol3bo #tab-filters, .leftcol3bo .left-inner,.leftcol3bo #car-tab-filters').removeClass('displayBlock');
			}else{
				$('.refine-mobile-btn').removeClass('open');
				$(this).addClass('open');
				$(this).next('.refine-tabbing').children('span:last-child').addClass('active');
				$(this).next('.refine-tabbing').slideDown(400);
                $(this).parent('.leftcol3bo').children('#tab-filters, #car-tab-filters, .left-inner').slideDown(400);
				$(this).parent('.leftcol3bo').children('.mobile-buttons').show();
			}
		});
		$(document).on('click','.o3b-section .rightcol3bo .product-section .product-btn .quick-btn',function(){
		   $('.quick-info-data :visible').focus();
		});
		$(document).on('click','.o3b-section .leftcol3bo .mobile-buttons .apply-btn',function(){
			$('.refine-mobile-btn').removeClass('open');
			$('.leftcol3bo .refine-tabbing').hide();
            $('.leftcol3bo #tab-filters, .leftcol3bo #car-tab-filters, .leftcol3bo #category-filters, .leftcol3bo .left-inner').hide();
			$('.leftcol3bo .refine-tabbing span').removeClass('active');
			$('.leftcol3bo .mobile-buttons').hide();
			$('.leftcol3bo .refine-tabbing, .leftcol3bo .mobile-buttons, .leftcol3bo #tab-filters, .leftcol3bo .left-inner,.leftcol3bo #car-tab-filters').removeClass('displayBlock');
			$('html, body').animate({
		        'scrollTop' : $('.rightcol3bo').position().top
		    });
		});
		$(document).on('click','.leftcol3bo .refine-tabbing span',function(){
			var getData = $(this).attr('data-id');
			$('.leftcol3bo .refine-tabbing span').removeClass('active');
			$(this).addClass('active');
			$('.leftcol3bo .refine-box').removeClass('displayBlock');
			$('.leftcol3bo .refine-box').hide();
			$(this).parents('.leftcol3bo').find('#'+getData).show();
		});
		$(document).on('click','.o3b-section .rightcol3bo .delivery-option .info-icon',function(){
			if($(this).hasClass("active")){
				$(this).toggleClass("active");
				$('.o3b-section .rightcol3bo .delivery-option .info-icon .popover').hide();
			}else{
				$('.o3b-section .rightcol3bo .delivery-option .info-icon .popover').hide();
				$(this).toggleClass("active");
				$(this).children('.popover').show();
			}
		});
		
		/** EPL-6520 */
		$(".checkout-mobile-info-icon .info-icon").on("click", function (event) {
			event.stopPropagation();
			$( ".checkout-mob-number .checkout-mobile-info-icon .popover" ).toggle();
		});

		$('html').click(function() {
			$( ".checkout-mob-number .checkout-mobile-info-icon .popover" ).hide();
		});
		/** EPL-6520*/	
		
		$(document).on('click','.best-seller-list .info-icon',function(){
			if($(this).hasClass("active")){
				$(this).toggleClass("active");
				$('.best-seller-list .info-icon .popover').hide();
			}else{
				$('.best-seller-list .info-icon .popover').hide();
				$(this).toggleClass("active");
				$(this).children('.popover').show();
			}
		});
		//Heroes Page
		$(window).scroll(function(){
			$('.scroll-top-part .scrollToTop01').click(function(){
				$("html, body").animate({ scrollTop: 0 }, 700);	
			});				
		});
		
		$('.best-seller-list aside .heading').click(function(){
			$(this).next('ul').slideToggle(400);
		});
		
		$(document).on('click','.delivery-mob .delivery-info-icon',function(){
			$(this).next(".delivery-mob .delivery-popover").toggle();
				$(".delivery-popup-overlay.show-delivery-popup").show();
		});
		$(document).on('click','.info-close',function() {
			$(".delivery-popup-overlay.show-delivery-popup").hide();
		});

		//cro-168
		// Set the date we're counting down to
		var startDatemob = $('#timerDate').val();
		if(typeof startDatemob != 'undefined'){
			//var countDownDate = new Date("2018-12-9 14:20").getTime();
			var countDownDate = new Date(startDatemob).getTime();

			// Update the count down every 1 second
			var x = setInterval(function() {
				
				// Get todays date and time
				var now = new Date().getTime();
				
				// Find the distance between now and the count down date
				var distance = countDownDate - now;
				
				// Time calculations for days, hours, minutes and seconds
				var days = Math.floor(distance / (1000 * 60 * 60 * 24));
				var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
				var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
				var seconds = Math.floor((distance % (1000 * 60)) / 1000);
				var timerHtml = '';

				if(days > 0){
					days = days + 1;
					timerHtml = days+' Days';
				}else if(hours > 0){
					if(hours == 1){
						timerHtml = hours+' Hour';
					}else{
						timerHtml = hours+' Hours';
					}
				}else if(minutes > 0){
					if(minutes == 1){
						timerHtml = minutes+' Minute';
					}else{
						timerHtml = minutes+' Minutes';
					}
				}else if(seconds > 0){
					timerHtml = '1 Minute';
					/*if(seconds == 1){
						timerHtml = seconds+' Second';
					}else{
						timerHtml = seconds+' Seconds';
					}*/
				}
				$('#mobile-timer').html(timerHtml);
				if (distance < 0) {
					clearInterval(x);
					$('#mobile-timer').html('PROMOTION EXPIRED');
				}
			}, 1000);
		}
		//cro-168
		// CI-546
	if ( $.isFunction($.fn.owlCarousel) ) {
		var winOwl1 = $(".specialbuy-carousel.owl-carousel").owlCarousel({
			lazyLoad:true,
			loop:true,
			touchDrag:true,
			center: false,
			mouseDrag:false,
			autoplay:false,
			margin:10,
			nav:false,
			responsiveClass: true,
			responsiveBaseWidth:1000,
			animateOut: 'fadeOut',
			animateIn: 'slideInRight',
			autoHeight: false,
			responsive:{
				300:{
					items:2,
					slideBy: 2
				}
			}  
		}); 

	}

	}
	else if(getWidth >= 1024){
		if($('.checkout-right-col').length){
			var didScroll1;
			var lastScrollTop1 = 0;
			var delta1 = 1;
			var headerHeight1 = $('header').outerHeight();
			var getRight = ($(window).width() - ($('.checkout-form').offset().left + $('.checkout-form').outerWidth()));
			$(window).scroll(function(event){
				didScroll1 = true;
			});
			setInterval(function(){
				if(didScroll1){
					hasScrolled1();
					didScroll1 = false;
				}
			}, 100);
			function hasScrolled1(){
			var windowScroll1 = $(window).scrollTop();
				var st = $(this).scrollTop();
				if(Math.abs(lastScrollTop1 - st) <= delta1)
				return;
				if(st > lastScrollTop1 && st > headerHeight1){
					$('.checkout-right-col').css({'top':'20px', 'position':'fixed', 'right':getRight, 'width':'345px'});
				}else if(st < headerHeight1){
					$('.checkout-right-col').css({'top':'0', 'position':'static'});
				}else{
					if(st + $(window).height() < $(document).height()){
						$('.checkout-right-col').css({'top':'150px', 'position':'fixed', 'right':getRight, 'width':'345px'});
					}
				}
				if(windowScroll1 >= $('.checkout-left-col').height()-250){
					$('.checkout-right-col').css({'position':'absolute', 'top':'auto', 'bottom':'20px', 'right':'0'});
				}									
				lastScrollTop1 = st;
			}
		}
		var timeoutId;
		$('header .nav-col nav .sub-nav').hover(function(){
			if(!timeoutId){
				timeoutId = window.setTimeout(function(){
					timeoutId = null;
					$(".search-detail-box .vehicle-form .field").hide();
				}, 200);
			}
		},function(){
			if(timeoutId){
				window.clearTimeout(timeoutId);
				timeoutId = null;
			}else{
				$(".search-detail-box .vehicle-form .field").show();
			}
		});
		
		//IE9 placeholder
		var getDefault = $('input').attr('placeholder');
		if($('HTML.lt-ie10').length && getDefault){
			$('input').each(function(){
				var getText = $(this).attr('placeholder');
				$(this).attr('value',getText);
				$(this).focus(function(){
					$(this).attr('value',' ');
				}).blur(function(){
					$(this).attr('value',getText);
				});
			});
		}
		$('.checkout .delivery-method .box').click(function(){
			if(!$(this).hasClass('disable')){
				$('.checkout .delivery-method .box').removeClass('active');
			}
			$(this).not('.disable').toggleClass('active');
		});
	}else{
		$('.stock-availability-data .select-store-btn').hover(function(){
			$(this).next('.store-btn-popup').slideDown(400);
		}, function(){
			$(this).next('.store-btn-popup').slideUp(400);
		});
		$('.checkout .delivery-method .box').click(function(){
			if(!$(this).hasClass('disable')){
				$('.checkout .delivery-method .box').removeClass('active');
			}
			$(this).not('.disable').toggleClass('active');
		});
	}
	if(getWidth >= 320 && getWidth <= 1024){
	$('.nav-col .tier1nav').click(function(event){
		if(event.target.nodeName.toUpperCase() == 'A' && $(event.target).parent('.back-link').length==0){
			window.location.href = $(event.target).attr('href');
			return true;
		}else{
		 $(this).addClass('main');
		 $('.nav-col .country-selection, .nav-col .tier1nav:not(.main)').hide();
		 $(this).children('.sub-nav').fadeIn(400);
		}
		$(this).children('.out-list').find('li').show();
	});
	$(document).on('click','.nav-col .sub-li',function(){
		$(this).addClass('active');
		$('.nav-col .country-selection, .nav-col .tier1nav:not(.main)').hide();
		$(".left-sub-nav .sub-li").not(this).removeClass('active').hide();
		$(this).children('.inner-nav').fadeIn(400);
	});
	$(document).on('click','.nav-col .back-link',function(event){
		if($(this).closest('li').parent('ul.outer-ul').length>0){
			$('.nav-col .country-selection, .nav-col .tier1nav').removeClass('main').show();
		}
		$(this).parent('.out-list').fadeOut(400);
		$(this).parents('li.active').show();
		event.stopPropagation();
	});
	
		/**
		EPL-6520
		*/
		$(".checkout-mob-more").on("click", function (event) {
			event.stopPropagation();
			$(".checkout-mobile-info-icon .info-icon .popover").hide();
			$(".checkout-mob-overlay").show();
			$(".checkout-mob-list").show();
		});
		$(".close-mob-checkout").on("click", function (event) {
			event.stopPropagation();
			$(".checkout-mob-overlay").hide();
			$(".checkout-mob-list").hide();
		});
		/**
		EPL-6520
		*/
	}
	ipadZoomDisable();
	$('.addtocartbtn').click(function(){
		$(this).addClass('wait');
	});
});

if ( $.isFunction($.fn.bxSlider) ) {
// Brands Slider Code
	if($('.brand-slider').length){
		var sliderActive = false;
		var slider;
		function createSlider(noofslides){
			if(slider==null){
				slider = $('.brand-slider .bxslider').bxSlider({
					pager: false,
					controls: false,
					auto: true,
					minSlides: noofslides,
					maxSlides: noofslides,
					slideWidth: 130,
					slideMargin: 10,
					swipeThreshold: 0
				});
			}else{
				slider.reloadSlider({
					pager: false,
					controls: false,
					auto: true,
					minSlides: noofslides,
					maxSlides: noofslides,
					slideWidth: 130,
					slideMargin: 10,
					swipeThreshold: 0
				});
			}
			return true;
		}
		$(document).ready(function(){
			if(window.innerWidth >= 768){
			
			}else if(window.innerWidth >= 414 && window.innerWidth <= 767){
				createSlider(3);
			}else if(window.innerWidth <= 413){
				createSlider(2);	
			}
			$(window).resize(function(){
				if(window.innerWidth >= 768){
					if(slider!=null){
						slider.destroySlider();
						slider = null;
					}
				}else if(window.innerWidth >= 414 && window.innerWidth <= 767){
					createSlider(3);
				}
				else if(window.innerWidth <= 413){
					createSlider(2);
				}
			});
		});
	}
	if($('#bx-pager').length){
		$('.product-thumb .bxslider').bxSlider({
			mode: 'horizontal',
			auto: false,
			pagerCustom: '#bx-pager',
			pagerSelector: 'jQuery selector',
			useCSS: false,
			controls: false,
			maxSlides: 1,
			minSlides: 1
		});
		var mySettings = { slideWidth: 70,
						   useCSS: false,
						   pager: false,
						   infiniteLoop: false,
						   autoStart: false,
						   maxSlides: 3,
						   moveSlides: 1,
						   slideMargin: 10
						};
		var maxSlides= 3;
		var pagerr;
		var wiidth = $(window).innerWidth();
		$(document).ready(function(){
			var alterSettings = mySettings;
			if(wiidth <= 480){
				alterSettings.maxSlides = 2;
			}else if(wiidth > 481 && wiidth <= 767){
				alterSettings.maxSlides = 2;
			}else{
				alterSettings.maxSlides = 3;
			}
			pagerr = $('.product-thumb #bx-pager').bxSlider(alterSettings);
			$(window).resize(function(){
				$(window).on("orientationchange",function(){
					var alterSettings = mySettings;
					if(wiidth <= 480){
						alterSettings.maxSlides = 2;
					}else if(wiidth > 481 && wiidth <= 767){
						alterSettings.maxSlides = 2;
					}else{
						alterSettings.maxSlides = 3;
					}
					pagerr.destroySlider();
					setTimeout(function(){
						pagerr.reloadSlider(alterSettings); 
					}, 100);
				});
			});
		});
	}
}

//Detecting IE browser
$(document).ready(function(){
	var myNav = navigator.userAgent.toLowerCase();
	var msie = (myNav.indexOf('msie') != -1) ? parseInt(myNav.split('msie')[1]) : false;
	var ua = navigator.userAgent.toString().toLowerCase();
	var match = /(trident)(?:.*rv:([\w.]+))?/.exec(ua) ||/(msie) ([\w.]+)/.exec(ua)||['',null,-1];
	var rv = match[2];
	if (typeof msie == 'number' || rv == '12.0' || rv == '11.0' || rv == '10.0' || rv == '9.0' || rv == '8.0'){
		$('html').addClass('ieView');
	}
});
$(window).resize(function(){
	var getWidth = $(window).width();
	if(getWidth <= 767){
		//zoom class add
		$('.clearance-listing-col .clearance-list figure').addClass('zoom').attr('data-target','#zoom-image');
	}else{
		$('.clearance-listing-col .clearance-list figure').removeClass('zoom').removeAttr('data-target','#zoom-image');
	}
});
function popoverDiv(){
	var infoHover = {
			over: function(){
				$(this).children('.popover').fadeIn(400);
			},
			timeout: 100, // number = milliseconds delay before onMouseOut
			out: function(){
				$(this).children('.popover').fadeOut(400);
			}
		};
		
		/** EPL-6520 */
		$(".o3b-section .rightcol3bo .delivery-option .info-icon,.checkout-mobile-info-icon .info-icon,.checkout-more-info").hoverIntent(infoHover);
		/** EPL-6520*/
		$(".best-seller-list .info-icon").hoverIntent(infoHover);
}
function ipadZoomDisable(){
	var getWidth  = $(window).width();
	var isiPad = /ipad/i.test(navigator.userAgent.toLowerCase());
	if(getWidth >= 1024 && !isiPad){
		if($('.zoom').length > 0){
			//$('.zoom').zoom();
		}
		return;
	}
	//detectOrientation
	detectOrientation();
	window.onorientationchange = detectOrientation;
	orientation = 0
	function detectOrientation(){
		if(typeof window.onorientationchange != 'undefined'){
			 if(orientation == 0 ){
				if($('.zoom').length > 0){
					$('.zoom').trigger('zoom.destroy');
				}
				$('.product-listing-col .thumb-box figure, .product-detail-inner .product-thumb figure').removeClass('zoom');
				$('.product-listing-col .thumb-box figure .zoomImg, .product-detail-inner .product-thumb figure .zoomImg').hide();
				$('header .right-col a.desktop').css('display','none');
				$('header .right-col a.mobile').css('display','block');
			 }
			else if(orientation == 90){
				if($('.zoom').length > 0){
					$('.zoom').trigger('zoom.destroy');
				}
				$('.product-listing-col .thumb-box figure, .product-detail-inner .product-thumb figure').removeClass('zoom');
				$('.product-listing-col .thumb-box figure .zoomImg, .product-detail-inner .product-thumb figure .zoomImg').hide();
				$('header .right-col a.desktop').css('display','none');
				$('header .right-col a.mobile').css('display','block');
			}
			else if(orientation == -90){
				if($('.zoom').length > 0){
					$('.zoom').trigger('zoom.destroy');
				}
				$('.product-listing-col .thumb-box figure, .product-detail-inner .product-thumb figure').removeClass('zoom');
				$('.product-listing-col .thumb-box figure .zoomImg, .product-detail-inner .product-thumb figure .zoomImg').hide();
				$('header .right-col a.desktop').css('display','none');
				$('header .right-col a.mobile').css('display','block');
			}
			else if(orientation == 180){
				if($('.zoom').length > 0){
					$('.zoom').trigger('zoom.destroy');
				}
				$('.product-listing-col .thumb-box figure, .product-detail-inner .product-thumb figure').removeClass('zoom');
				$('.product-listing-col .thumb-box figure .zoomImg, .product-detail-inner .product-thumb figure .zoomImg').hide();
				$('header .right-col a.desktop').css('display','none');
				$('header .right-col a.mobile').css('display','block');
			}
		}
	}
}


function imgcontrol(){
		if ($(window).width() < 768) {
		 $(document).find('.mob_img').each(function(){
					var path = $(this).attr('data-src');
					$(this).attr('src',path);
			 });
	}
	else {
				$(document).find('.desktop_img').each(function(){
					var path = $(this).attr('data-src');
					$(this).attr('src',path);
			 });
	}
}
imgcontrol();

$(window).resize(function(){
	imgcontrol();
});

$(document).ready(function(){
	if ( $.isFunction($.fn.owlCarousel) ) {
		var winOwl1 = $(".home-slider .owl-carousel").owlCarousel({
			lazyLoad:true,
			loop:true,
			touchDrag:true,
			mouseDrag:false,
			autoplay:true,
			nav:false,
			margin:0,
			responsiveClass: true,
			responsiveBaseWidth:1000,
			animateOut: 'fadeOut',
			animateIn: 'slideInRight',
			autoHeight: false,
			responsive:{
				300:{
					items:1,
					slideBy: 1
				},
				768:{
					items:1,
					slideBy: 1
				},
				1024:{
					items:1,
					slideBy: 1
				}
			}  
		}); 

	}
	// CI-546
	if ( $.isFunction($.fn.owlCarousel) ) {
		var winOwl1 = $(".specialbuy-slider .owl-carousel").owlCarousel({
			lazyLoad:true,
			loop:true,
			touchDrag:true,
			mouseDrag:false,
			autoplay:true,
			nav:false,
			margin:0,
			responsiveClass: true,
			responsiveBaseWidth:1000,
			animateOut: 'fadeOut',
			animateIn: 'slideInRight',
			autoHeight: false,
			responsive:{
				300:{
					items:1,
					slideBy: 1
				},
				768:{
					items:1,
					slideBy: 1
				},
				1024:{
					items:1,
					slideBy: 1
				}
			}  
});

	}
});

function homeSlider(){
	var getWidth  = $(window).width();
	$('.home-slider .bxslider li').each(function(){
		var getPath = $(this).find('img').attr('data-path');
		var getSrc = $(this).find('img').attr('data-src');
		var pathSrc = getPath+getSrc;
		var pathSrcTab = getPath+'tab_'+getSrc;
		var pathSrcMob = getPath+'mobile_'+getSrc;
		if(getWidth >= 320 && getWidth <= 767){
			$(this).find('img').attr('src',pathSrcMob);
		}else if(getWidth >= 768 && getWidth <= 1023){
			$(this).find('img').attr('src',pathSrcTab);
		}else{
			$(this).find('img').attr('src',pathSrc);
		}
	});
}

if ( $.isFunction($.fn.FlipClock) ) {
//Sale Counter
var clock;
$(document).ready(function(){
	var timerDate 	= $('#timerDate').val();
	var futureDate  = new Date(timerDate);
	var currentDate = new Date();
	// Calculate the difference in seconds between the future and current date
	var diff = futureDate.getTime() / 1000 - currentDate.getTime() / 1000;
	// Instantiate a coutdown FlipClock
	if(diff < 0){
		diff = 0;
	}
		clock = $('.clock').FlipClock(diff,{
			clockFace: 'DailyCounter',
			countdown: true,
		});
	
});
}
	var requestbrandName = $('#requestbrandName').val();
	if(requestbrandName){
		$(".product-section .productbrandslisting ul.brand-list").each(function(){ 		
				var brandArr = [];
				$(this).find('li').each(function(){ 
					brandArr.push($(this).data('brand'));
				});
				if (brandArr.indexOf(requestbrandName) != -1) {
					$(this).find('li[data-brand^='+requestbrandName+']').eq(0).trigger('click'); 
				} else {
					$(this).children(":first").trigger('click');
				}
		});
	}
	
/**EPL-6520*/
	$('#CheckoutInfo').on('hidden.bs.collapse', function () {
      $('.checkout-more-info').text('More..');
    });
    $('#CheckoutInfo').on('shown.bs.collapse', function () {
      $('.checkout-more-info').text('Less');
    });
/**EPL-6520*/

/**detaect any browser*/
var nVer = navigator.appVersion;
var nAgt = navigator.userAgent;
var browserName  = navigator.appName;
var fullVersion  = ''+parseFloat(navigator.appVersion); 
var majorVersion = parseInt(navigator.appVersion,10);
var nameOffset,verOffset,ix;

// In Opera, the true version is after "Opera" or after "Version"
if ((verOffset=nAgt.indexOf("Opera"))!=-1) {
 browserName = "Opera";
 fullVersion = nAgt.substring(verOffset+6);
 if ((verOffset=nAgt.indexOf("Version"))!=-1) 
   fullVersion = nAgt.substring(verOffset+8);
}
// In MSIE, the true version is after "MSIE" in userAgent
else if ((verOffset=nAgt.indexOf("MSIE"))!=-1) {
 browserName = "Microsoft Internet Explorer";
 fullVersion = nAgt.substring(verOffset+5);
}
// In Chrome, the true version is after "Chrome" 
else if ((verOffset=nAgt.indexOf("Chrome"))!=-1) {
 browserName = "Chrome";
 fullVersion = nAgt.substring(verOffset+7);
}
// In Safari, the true version is after "Safari" or after "Version" 
else if ((verOffset=nAgt.indexOf("Safari"))!=-1) {
 browserName = "Safari";
 fullVersion = nAgt.substring(verOffset+7);
 if ((verOffset=nAgt.indexOf("Version"))!=-1) 
   fullVersion = nAgt.substring(verOffset+8);
}
// In Firefox, the true version is after "Firefox" 
else if ((verOffset=nAgt.indexOf("Firefox"))!=-1) {
 browserName = "Firefox";
 fullVersion = nAgt.substring(verOffset+8);
}
// In most other browsers, "name/version" is at the end of userAgent 
else if ( (nameOffset=nAgt.lastIndexOf(' ')+1) < 
          (verOffset=nAgt.lastIndexOf('/')) ) 
{
 browserName = nAgt.substring(nameOffset,verOffset);
 fullVersion = nAgt.substring(verOffset+1);
 if (browserName.toLowerCase()==browserName.toUpperCase()) {
  browserName = navigator.appName;
 }
}
// trim the fullVersion string at semicolon/space if present
if ((ix=fullVersion.indexOf(";"))!=-1)
   fullVersion=fullVersion.substring(0,ix);
if ((ix=fullVersion.indexOf(" "))!=-1)
   fullVersion=fullVersion.substring(0,ix);

majorVersion = parseInt(''+fullVersion,10);
if (isNaN(majorVersion)) {
 fullVersion  = ''+parseInt(navigator.appVersion); 
 majorVersion = parseInt(navigator.appVersion,10);
}


if(majorVersion >= 11){
 $('body').addClass('safari11');
}

/*$(function() {
 var is_iPad = navigator.userAgent.match(/iPad/i) != null;
 var is_iphone = navigator.userAgent.match(/i(Phone|Pod)/i) != null;
 if(is_iPad || is_iphone){
  if (top.location.pathname === '/black-friday'){
  $('head').append('<style type="text/css">body,html {position:fixed;height:100%;left:0;top:0;overflow:auto;-webkit-overflow-scrolling:touch;width:100%;z-index:9;}</style>');
   }
 }*/

function validImg() {
	if($(window).width() > 767){  
		$('img.desktop').each(function(){
			if($(this).is(":visible")){
				var datasrc =	$(this).data('src');			
				$(this).attr('src',datasrc);
			}
		});	
	}
	else{		
		$('img.mobile').each(function(){
			if($(this).is(":visible")){
				var datasrc =	$(this).data('src');
				$(this).attr('src',datasrc);
			}
		});	
	}
}
validImg() ;
 
function perZoom(){
	
$('.product-detail-section .zoom').hover( function(){
/*EPL-5832*/
	//$('.zoom').hover( function(){
	 var comp = $(this).data('flag');
		if(!comp){
			$(this).data('flag', true);
			var obj 	= $(this);
			var test= $(this).zoom({'callback' : function(){
				obj.trigger('mouseover');
			} });
			console.log(this);
		}
	});
}
$(document).ready(function(){
		perZoom();
});


// Owl for chritmas 
$(document).ready(function(){
if($('.you-love-it').length){	
  $(".you-love-it .owl-carousel").owlCarousel({
    lazyLoad:true,
    loop:true,
	nav:true,
    margin:10,
	responsiveClass: true,
	responsiveBaseWidth:1000,
	animateOut: 'fadeOut',
	autoHeight: true,
	responsive:{
		300:{
			items:1,
			slideBy: 1
		},
		768:{
			items:4,
			slideBy: 4
		},
		1025:{
			items:5,
			slideBy: 5
		}
	} 
  });   
}  
	// new slick slider for christmas and black friday
	if ( $.isFunction($.fn.slick) ) {
	$('.xmas-slickslider').slick({
	  dots: true,
	  infinite: true,
	  speed: 300,
	  arrows:true,
	  slidesToShow: 4,
	  slidesToScroll: 4,
	  responsive: [
		{
		  breakpoint: 1024,
		  settings: {
			slidesToShow: 3,
			slidesToScroll: 3,
			infinite: true,
			dots: true
		  }
		},
		{
		  breakpoint: 767,
		  settings: {
			slidesToShow: 2,
			arrows:false,
			slidesToScroll: 2
		  }
		}
	  ]
	});
	}
	// Owl for Black Friday
	if($('.popular-blkFriday-products').length){
		var winOwl = $('.owl-carousel').owlCarousel({
			lazyLoad:true,
			loop:true,
			nav:true,
			margin:10,
			responsiveClass: true,
			responsiveBaseWidth:1000,
			animateOut: 'fadeOut',
			autoHeight: true,
			responsive:{
				300:{
					items:1,
					slideBy: 1
				},
				568:{
					items:2,
					slideBy: 2
				},
				768:{
					items:3,
					slideBy: 3
				},
				1000:{
					items:4,
					slideBy: 4
				}
			}  
	   }); 
	   winOwl.on('change.owl.carousel', function(event){
		   $('.owl-item.active').each(function(){
				 $(this).find('.gift-image img').each(function(){
					var imgsrc = $(this).attr('data-src');
					$(this).attr('src', imgsrc).css({'opacity':1});			
				});
			});
		});
			
	}
});

function popupResize(){
	$('#ingenico-pp').height($(window).height()* 0.9 - 60);
	$('#legaltext1  .panel-body').height($(window).height()* 0.9 - 100);
	$('#legaltext  .panel-body').height($(window).height()* 0.9 - 100);
}
$(window).resize(function(){
	popupResize();
});
/**
 --- EPL-5606
**/
$(document).ready(function(){
	if ( $.isFunction($.fn.owlCarousel) ) {
		var winOwl1 = $(".tier-latest-offer .owl-carousel").owlCarousel({
			lazyLoad:true,
			loop:true,
			nav:true,
			margin:10,
			responsiveClass: true,
			responsiveBaseWidth:1000,
			animateOut: 'fadeOut',
			autoHeight: true,
			responsive:{
				300:{
					items:1,
					slideBy: 1
				},
				768:{
					items:3,
					slideBy: 3
				},
				1024:{
					items:4,
					slideBy: 4
				}
			}  
		}); 

	    winOwl1.on('change.owl.carousel', function(event){
		   $('.owl-item.active').each(function(){
				 $(this).find('.gift-image img').each(function(){
					var imgsrc = $(this).attr('data-src');
					$(this).attr('src', imgsrc).css({'opacity':1});			
				});
			});
		}); 
			
	}
	popupResize();
});
/** EPL-5981 **/
	$("#text2,#text1").click(function(){
		  $("body").addClass("overflow-visible");
		});

	$("#legaltext .close,#legaltext,#legaltext1 .close,#legaltext1").click(function(){
	  $("body").removeClass("overflow-visible");
	   $(".panel-body").scrollTop(0);
	});
	
	/** EPL-5981 **/
	
	


!function(window){
  var $q = function(q, res){
        if (document.querySelectorAll) {
          res = document.querySelectorAll(q);
        } else {
          var d=document
            , a=d.styleSheets[0] || d.createStyleSheet();
          a.addRule(q,'f:b');
          for(var l=d.all,b=0,c=[],f=l.length;b<f;b++)
            l[b].currentStyle.f && c.push(l[b]);

          a.removeRule(0);
          res = c;
        }
        return res;
      }
    , addEventListener = function(evt, fn){
        window.addEventListener
          ? this.addEventListener(evt, fn, false)
          : (window.attachEvent)
            ? this.attachEvent('on' + evt, fn)
            : this['on' + evt] = fn;
      }
    , _has = function(obj, key) {
        return Object.prototype.hasOwnProperty.call(obj, key);
      }
    ;

  function loadImage (el, fn) {
    var img = new Image()
      , src = el.getAttribute('data-src');
    img.onload = function() {
      if (!! el.parent)
        el.parent.replaceChild(img, el)
      else
        el.src = src;

      fn? fn() : null;
    }
    img.src = src;
  }

  function elementInViewport(el) {
    var rect = el.getBoundingClientRect()

    return (
       rect.top    >= 0
    && rect.left   >= 0
    && rect.top <= (window.innerHeight || document.documentElement.clientHeight)
    )
  }

    var images = new Array()
      , query = $q('img.lazy')
      , processScroll = function(){
          for (var i = 0; i < images.length; i++) {
            if (elementInViewport(images[i])) {
              loadImage(images[i], function () {
                images.splice(i, i);
              });
            }
          };
        }
      ;
    // Array.prototype.slice.call is not callable under our lovely IE8 
    for (var i = 0; i < query.length; i++) {
      images.push(query[i]);
    };

    processScroll();
    addEventListener('scroll',processScroll);

}(this);
// EPL-7172
if ( $.isFunction($.fn.bxSlider) ) {
	//Home Review Slider
	$('.reviews-loop .bxslider').bxSlider({
		mode: 'fade',
		auto: false,
		touch: true,
		useCSS: false,
		controls: true,
		hideControlOnEnd: true,
		infiniteLoop: false,
		pager: false,
		preventDefaultSwipeY: false,
		onSliderLoad: function(){
			$(".reviews-loop").css("visibility", "visible");
		}
	});
	var GetWidth = $(window).width();
	
	if(GetWidth <= 767){
		$('.mobile-brand .bxslider').bxSlider({
				mode: 'vertical',
				auto: false,
				pager: false,
				slideMargin: 5,
				minSlides: 3,
				maxSlides: 3
		});
		//Product Detail
		$('.cusotmer-bought-list .bxslider').bxSlider({
			mode: 'horizontal',
			auto: true,
			pager: false,
			infiniteLoop: false,
			hideControlOnEnd: true,
			useCSS: false
		});
		//home page latest offers
		$('.latest-product-offers .bxslider').bxSlider({
			mode: 'horizontal',
			auto: false,
			pager: false,
			minSlides: 1,
			maxSlides: 1,
			slideWidth: 270,
			slideMargin: 0,
			infiniteLoop: false,
			hideControlOnEnd: false,
			onSliderLoad: function(){
				$(".home-slider").css("visibility", "visible");
					if($(window).width() > 768){
				$('img.desktop').each(function(){
						if($(this).is(":visible")){
							var datasrc =	$(this).data('src');
							console.log(datasrc);
							$(this).attr('src',datasrc);
						}
				});	
			}
			else{
					$('img.mobile').each(function(){
						if($(this).is(":visible")){
							var datasrc =	$(this).data('src');
							$(this).attr('src',datasrc);
						}
				});	
			
			}
			}
		});
		//home page offer-banner latest offers
		$('.offer-banner .offer-slider').bxSlider({
			mode: 'horizontal',
			auto: false,
			pager: false,
			minSlides: 1,
			maxSlides: 1,
			slideWidth: 270,
			slideMargin: 0,
			infiniteLoop: true,
			hideControlOnEnd: false
		});
		//3b&o section
		$('.shop-brand-list .bxslider').bxSlider({
			mode: 'horizontal',
			auto: false,
			pager: false,
			minSlides: 1,
			maxSlides: 1,
			slideWidth: 270,
			slideMargin: 0,
			infiniteLoop: false,
			hideControlOnEnd: false
		});
		//Christmas page
		$('.gift-box-slider .bxslider').bxSlider({
			mode: 'horizontal',
			auto: false,
			pager: true,
			controls: true,
			minSlides: 1,
			maxSlides: 1,
			slideWidth: 220,
			slideMargin: 0,
			infiniteLoop: false,
			hideControlOnEnd: true
		});
		//Summer Essentials Page
		$('.sellers-list.bxslider').bxSlider({
			mode: 'horizontal',
			auto: false,
			pager: true,
			controls: true,
			minSlides: 1,
			maxSlides: 1,
			useCSS: false,
			slideWidth: 280,
			slideMargin: 0,
			infiniteLoop: true,
			hideControlOnEnd: false,
			swipeThreshold: 50
		});
	}
	else if(GetWidth >= 1024){
	//Product Detail Slider
	$('.cusotmer-bought-list .bxslider').bxSlider({
		mode: 'horizontal',
		auto: true,
		pager: false,
		minSlides: 3,
		maxSlides: 3,
		slideWidth: 320,
		slideMargin: 15,
		infiniteLoop: false,
		hideControlOnEnd: true
	});
	}
	
	//Tier 1 latest offers
	if($('.tier-latest-offer').length){
		var slider1;
		function createSlider1(noofslides1, widthArea){
			if(slider1==null){
				slider1 = $('.tier-latest-offer .bxslider').bxSlider({
					pager: true,
					controls: true,
					auto: false,
					minSlides: noofslides1,
					maxSlides: noofslides1,
					slideWidth: widthArea,
					slideMargin: 9,
					infiniteLoop: false,
					hideControlOnEnd: true,
					touch: false,
					useCSS: false,
					preventDefaultSwipeY: false,
					preventDefaultSwipeX: false,
					oneToOneTouch: true,
					touchEnabled: true,
					swipeThreshold: 0
				});
			}else{
				slider1.reloadSlider({
					pager: true,
					controls: true,
					auto: false,
					minSlides: noofslides1,
					maxSlides: noofslides1,
					slideWidth: widthArea,
					slideMargin: 9,
					infiniteLoop: false,
					hideControlOnEnd: true,
					touch: false,
					useCSS: false,
					preventDefaultSwipeY: false,
					preventDefaultSwipeX: false,
					oneToOneTouch: true,
					touchEnabled: true,
					swipeThreshold: 0
				});
			}
			return true;
		}
		$(window).load(function(){
			//$('.tier-latest-offer').css("display", "block");
			/* $('.tier-one-category .tier-latest-offer .bx-pager .bx-pager-item:first-child a').removeClass('active').addClass('active'); */
			var oldWidth = $(document).width();
			var innerWidth = $(document).width();
			if(innerWidth >= 1024){
				createSlider1(4, 219);
			}else if(innerWidth >= 768 && innerWidth <= 1023){
				createSlider1(3, 219);
			}else if(innerWidth >= 320 && innerWidth <= 767){
				createSlider1(1);	
			}
			$(window).resize(function(){
				var innerWidth = $(document).width();
				if(innerWidth != oldWidth){
					if(innerWidth >= 1024){
						createSlider1(4, 219);
					}else if(innerWidth >= 768 && innerWidth <= 1023){
						createSlider1(3, 219);
					}else if(innerWidth >= 320 && innerWidth <= 767){
						createSlider1(1);	
					}
					oldWidth = innerWidth;
				}
			});
		});
	}
	//super session slider
	if($('.super-session .tier-latest-offer').length){
		var slider1;
		function createSlider1(noofslides1, widthArea){
			if(slider1==null){
				slider1 = $('.tier-latest-offer .bxslider').bxSlider({
					pager: true,
					controls: true,
					auto: false,
					minSlides: noofslides1,
					maxSlides: noofslides1,
					slideWidth: widthArea,
					slideMargin: 9,
					infiniteLoop: false,
					hideControlOnEnd: true,
					touch: false,
					useCSS: false,
					preventDefaultSwipeY: false,
					preventDefaultSwipeX: false,
					oneToOneTouch: true,
					touchEnabled: true,
					swipeThreshold: 0
				});
			}else{
				slider1.reloadSlider({
					pager: true,
					controls: true,
					auto: false,
					minSlides: noofslides1,
					maxSlides: noofslides1,
					slideWidth: widthArea,
					slideMargin: 9,
					infiniteLoop: false,
					hideControlOnEnd: true,
					touch: false,
					useCSS: false,
					preventDefaultSwipeY: false,
					preventDefaultSwipeX: false,
					oneToOneTouch: true,
					touchEnabled: true,
					swipeThreshold: 0
				});
			}
			return true;
		}
		$(window).load(function(){
			//$('.tier-latest-offer').css("display", "block");
			var oldWidth = $(document).width();
			var innerWidth = $(document).width();
			if(innerWidth >= 1024){
				createSlider1(3, 319);
			}else if(innerWidth >= 620 && innerWidth <= 1023){
				createSlider1(2, 319);
			}else if(innerWidth >= 320 && innerWidth <= 767){
				createSlider1(1,300);	
			}
			$(window).resize(function(){
				var innerWidth = $(document).width();
				if(innerWidth != oldWidth){
					if(innerWidth >= 1024){
						createSlider1(3, 319);
					}else if(innerWidth >= 620 && innerWidth <= 1023){
						createSlider1(2, 319);
					}else if(innerWidth >= 320 && innerWidth <= 767){
						createSlider1(1,300);	
					}
					oldWidth = innerWidth;
				}
			});
		});
	}
}
// EPL-7172
// CI-545 
	var getWidth = $(window).width();
	if(getWidth >= 768 && getWidth <= 1024){
		$(window).scroll(function() {
			if ($(this).scrollTop()>400){ 
				$('.hidetandcondition').hide(1000); 
			}
		});
		$(".promodiv").on("click", function (event) {
			event.stopPropagation();
			$( ".hidetandcondition" ).toggle();
		});
	}
// CI-545 