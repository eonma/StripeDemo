$(function(){
	var InfoUrl = window.location.href;
	
	if(parseInt(InfoUrl.indexOf("/international-customer")) > 0){
		$('html, body').animate({
			scrollTop: ($('#restofworld').offset().top-100)
		},500);
	}
});

(function($){

/** 898 :- EPL-7096 : mobile rotation **/
  $(window).on("orientationchange",function(){
	var width = screen.availWidth;
	var height = screen.availHeight;	
	var isiPad = navigator.userAgent.toLowerCase().indexOf("ipad");
	if(isiPad < 0) {	
		if(width >= 768 && (width <= 1024 && height <= 1024)){
			$.ajax({
				type: "POST",                 
				url: ECP.getBase()+"/users/home/resetMobileCheck", 
				data: {'mobile': 2},
				success: function(data) {
					location.reload();
				}        
			});	
		} else if(width < 768 && height > 768){
			$.ajax({
				type: "POST",                 
				url: ECP.getBase()+"/users/home/resetMobileCheck", 
				data: {'mobile': 1},
				success: function(data) {
					location.reload();
				}        
			});	
		}
	}
  });
 /** 898 :- EPL-7096 : mobile rotation **/ 
	var animation = false;
	var getWidth  = $(window).width();
	
	$(document).ajaxSend(function( event, jqxhr, settings ) {
		ECP.showloader();
	});	
	$(document ).ajaxComplete(function( event, xhr, settings ) {
		ECP.loaderClose();
		ECP.addCart();
	});	
	$(document ).ajaxError(function( event, xhr, settings ) {		
		ECP.loaderClose();
	});
	
	// Scroll to top on click
	$('#scrollToTop').on('click', function(){
	    $("html, body").animate({ scrollTop: 0 }, 600);
	    return false;
	 });
	
	$('.modal').on('hidden.bs.modal', function () {
	    $('.addtocartbtn').removeClass('wait');
	});
	
	$(document).on('change','select#makeSelection',function(){
		$(this).parents('form').find('select').removeAttr('disabled');
		$('select#engineSelection,select#yearSelection,select#fuelSelection').attr('disabled','disabled');
		
		var make = $(this).val();
		var modelsets = jQuery.parseJSON($('input[name=jsonmodels]').val());
		var option = $('#modelSelection').find('option').get(0);
		 $('select#modelSelection').find('option').remove();
		 $('select#modelSelection').append(option);
		 option = $('#engineSelection').find('option').get(0);
		 $('select#engineSelection').find('option').remove();
		 $('select#engineSelection').append(option);
		 option = $('#yearSelection').find('option').get(0);
		 $('select#yearSelection').find('option').remove();
		 $('select#yearSelection').append(option);
		 option = $('#fuelSelection').find('option').get(0);
		 $('select#fuelSelection').find('option').remove();
		 $('select#fuelSelection').append(option);
		 $.each(modelsets, function(i, modelset) {		 
			 if(modelset.make == make){
				 	$('select#modelSelection').append('<option  value="'+modelset.model+'">'+modelset.model+'</option>');
				}
		    });	
	});
	
	// For less content hide view more link in tier pages
	if($('.tierseocontent > span').length > 0){
		var contentEl 		= $('.tierseocontent > span');
		if (contentEl[0].offsetHeight < contentEl[0].scrollHeight || contentEl[0].offsetWidth < contentEl[0].scrollWidth) {
			$('.tierseocontent > .view-more').show();
		}
	}
	
	$(document).on('change','select#modelSelection',function(){
		$(this).parents('form').find('select').removeAttr('disabled');
		$('select#yearSelection,select#fuelSelection').attr('disabled','disabled');
			var model = $(this).val();
			var make = $('select#makeSelection').val();
			var engineSets = jQuery.parseJSON($('#jsonengines').val());
			var option = $('#engineSelection').find('option').get(0);
			$('select#engineSelection').find('option').remove();
			$('select#engineSelection').append(option);
			option = $('#yearSelection').find('option').get(0);
			 $('select#yearSelection').find('option').remove();
			 $('select#yearSelection').append(option);
			 option = $('#fuelSelection').find('option').get(0);
			 $('select#fuelSelection').find('option').remove();
			 $('select#fuelSelection').append(option);
			$.each(engineSets, function(i,engineset){				
				if(engineset.make == make && engineset.model == model){
					if(engineset.engine != "Not"){
						$('select#engineSelection').append('<option value="'+engineset.engine+'">'+engineset.engine+'</option ');
					}
						
				}
			});
	});
	
	$(document).on('change','select#engineSelection',function(){
		$(this).parents('form').find('select').removeAttr('disabled');
		$('select#fuelSelection').attr('disabled','disabled');
		var engine  = $(this).val();
		var model = $('select#modelSelection').val();
		var make = $('select#makeSelection').val();
		var yearSets = jQuery.parseJSON($('#jsonyears').val());
		var option = $('#yearSelection').find('option').get(0);
		$('select#yearSelection').find('option').remove();
		$('select#yearSelection').append(option);
		option = $('#fuelSelection').find('option').get(0);
		 $('select#fuelSelection').find('option').remove();
		 $('select#fuelSelection').append(option);
		$.each(yearSets, function(i,yearSet){				
			if(yearSet.make == make && yearSet.model == model && yearSet.engine == engine){
					$('select#yearSelection').append('<option value="'+yearSet.year+'">'+yearSet.year+'</option ');
			}
		});
	});
	
	$(document).on('change','select#yearSelection',function(){
		var engine  = $(this).val();
		var model = $('select#modelSelection').val();
		var make = $('select#makeSelection').val();
		var engine = $('select#engineSelection').val();
		var year = $('select#yearSelection').val();
		var fuelSets = jQuery.parseJSON($('#jsonfuels').val());
		var option = $('#fuelSelection').find('option').get(0);
		$('select#fuelSelection').find('option').remove();
		$('select#fuelSelection').append(option);
		$.each(fuelSets, function(i,fuelSet){				
			if(fuelSet.make == make && fuelSet.model == model && fuelSet.engine == engine  && fuelSet.year == year){
				$('select#fuelSelection').append('<option value="'+fuelSet.fuel+'">'+fuelSet.fuel+'</option ');
				$('select#fuelSelection').removeAttr('disabled');
			}
		});
	});
	
	$(document).on('submit','form[name=partvehicleselection]',function(){
		
	});
	
	ECP.addCart = function(){
		 /* $(".cart-btn-outer").hoverIntent({
			over: function(){
				$(this).children('.cart-btn-dropdown').animate({opacity:1, height:'toggle'}, 300);
			},
			timeout: 200, // number = milliseconds delay before onMouseOut
			out: function(){
				$(this).children('.cart-btn-dropdown').animate({opacity:0, height:'toggle'}, 300);
			}
		}); */
		if(getWidth >= 768){
			$(".cart-btn-outer").on('click',function(e){
				//$(this).children('.cart-btn-dropdown').animate({opacity:1, height:'toggle'}, 300);
				$(this).children('.cart-btn-dropdown').slideToggle(400);
				e.stopPropagation();
			});
			$(document).click(function(e){
				if(e.target.class != 'cart-btn-dropdown' && !$('.cart-btn-dropdown').find(e.target).length){
					$(".cart-btn-dropdown").hide();
				}
			});
		}
	}
	

	
	/* Product Listing Page */
	
	// For mobiles
	if(getWidth < 768){
		// To show popup of Error messages
		if($('.info-box').length > 0){
			var htmlObj = $("<div>"+$('.info-box').html()+"</div>");
			htmlObj.find('img').addClass('warning-icon');
			ECP.alert('',htmlObj.html());
		}
		
		// Mobile Reg input tap clear all selection
		if($('.vrmInp').prop("disabled") == true){
			$('.vrmInp').closest("span").on('click', function(){
				$('a.clearselection').trigger('click');
			});
		}
	}

	$(document).on('click','.product-listing-col .right-col .brand-list li',function(){
	  if(animation){
		  return true;
	  }
	//  animation = true;
	  var currentEle  = $(this);
	  var productclass  = '.'+ currentEle.data('productdetailclass');
	  currentEle.parents('.productbrandslisting').find('.product_brand_detail').not(productclass).slideUp(400);
	  
	  $(productclass).slideDown(400,function(){
	   animation = false;
	  });
	  currentEle.parent('.brand-list').children('li').removeClass('active');
	  currentEle.addClass('active');
	  var getWidth = $(window).width();
	});
	
	//var url = new URL(window.location.href);
	if(GetURLParameter('Brand')) {	
	    var brandChk         = $('#carpartslistingsection .brand-list').hasClass('brand-already-selected');
	    if(brandChk){
	        $('.brand-list').each(function(){
	            $(this).find('li:visible:first').trigger('click');
	        });
	    }
	}
	// Maxlength Fix for Android Devices
	if(getWidth < 768){
		$("input[type='text']").on("keydown", function(e) {
	        if(e.keyCode != 8) {
	            maxlength = $(this).attr('maxlength');
	            if(this.value.length >= maxlength ) {
	                var curIndex = $(this).attr('tabindex');
	                $('[tabindex=' + curIndex + ']').focus();
	                return false;
	            }
	        }
	    });
	}
	
	$('.numeric').on('keyup', function(e) {
	  $(this).val($(this).val().replace(/[^0-9]/g, ''));
	});
	$('.prdQty').on('blur', function(){
		if($(this).val() < 1){
			$(this).val(1);
		}
	});
	
	
	
	/* Product Detail Page */
	
	$(document).on('show.bs.modal', '#zoom-image', function (e) {
		$(this).find('img').attr('src', '');
		var src = $(e.relatedTarget).find('img').data('zoomimg');
		$(this).find('img').attr('src', src);
	});

	$('#referFriend').on('show.bs.modal', function () {
		  $('.success').html('');
		  $('#referForm .error').html('');
		  $('#referFriend input').val('');
		  $('#referFriend .referFormCont').show();
	})
	
	$('#referForm').submit(function(){
		var err 		= false;
		$(this).find('.error').html('');
		$(this).find('.error').show();
		$(this).find('.required').each(function(){
			var val 	= $.trim($(this).val());
			if(val == ''){
				$(this).parent('fieldset').find('.error').html('This field is required.');
				err 	= true;
			}
		});
		if(err == false){
			if(!validateEmail($.trim($('#referEmail').val()))){
				$('#referEmail').parent('fieldset').find('.error').html('Please enter valid email address.');
				err 		= true;
			}
			if(!validateMultipleEmail($('#referfriendEmail').val())){
				$('#referfriendEmail').parent('fieldset').find('.error').html('Please enter valid email address.');
				err 		= true;
			}
		}
		if(err == false){
			var formData = $(this).serializeArray();
			formData.push({name:'link', value: window.location.href});
			$.ajax({
			      type: "POST",			     
			      url: ECP.getBase() + "/users/referFriend", 
			      data: formData,
			      success: function(data) {	
			    	  if(data.hasOwnProperty('errors')){
			    		  $.each(data.errors, function(index, value){
			    			  if(value == 'emptyfield'){
			    				  $('#refer' + capitalizeFirstLetter(index) + 'Err').html(messages.referFriend.empty);
			    			  }
			    			  else if(value == 'invalidemail' || value == 'callback'){
			    				  $('#refer' + capitalizeFirstLetter(index) + 'Err').html(messages.referFriend.invalidEmail);
			    			  }
			    		  });
			    	  }
			    	  else if(data.hasOwnProperty('success') && data.success == 1){
			    		 $('#referFriend').modal('hide');
			    		 var msg 	= '<div class="popNotificationMessage success">'+ messages.referFriend.success +'</div>';
			    		 ECP.alert('', msg);
			    	  }
			      }
		    });
		}
		return false;
	});
	
	
	/*$('[data-toggle="tooltip"]').tooltip()
    $(".tip-top").tooltip({placement : 'top'});
    $(".tip-right").tooltip({placement : 'right'});
    $(".tip-bottom").tooltip({placement : 'bottom'});
    $(".tip-left").tooltip({ placement : 'left'});*/
    // EPL-7172
    if ( $.isFunction($.fn.jBox) ) {
    	$('.jtooltip:not(.disable)').jBox('Tooltip');
	}
    
	ECP.setConfig(settings);
	ECP.AdsLookup.loadMakers(function(data){
		var make = $('select[name=make]');
		var option = $(make).find('option').get(0);
		$(make).find('option').remove();
		make.append(option);
		$.each(data['manufacturers'],function(index,maker){
			make.append('<option value="'+maker.Id+'">' + maker.Maker + '</option>');
		});
		$("select[name=model],select[name=year],select[name=engine],select[name=fuel]").attr('disabled',true);
	});
	
	$('select[name=make]').on('change',function(){
		ECP.AdsLookup.__data.makestr = $(this).find('option:selected').text();
		$('select[name=model] option').not('option:first').remove();
		$('select[name=year] option').not('option:first').remove();
		$('select[name=engine] option').not('option:first').remove();
		$('select[name=fuel] option').not('option:first').remove();
		ECP.AdsLookup.loadModel(this.value,function(data){
			var model = $('select[name=model]');
			var option = $(model).find('option').get(0);
			model.find('option').remove();
			model.append(option);
			$.each(data['models'],function(index,modelObj){
				model.append('<option value="'+modelObj.Id+'">' + modelObj.Model + '</option>');
			});
			$("select[name=year],select[name=engine],select[name=fuel]").attr('disabled',true);
			//$("select[name=model]").val('');
			$("select[name=model]").removeAttr('disabled');
		});
	});
	
	$('select[name=model]').on('change',function(){
		ECP.AdsLookup.__data.modelstr = $(this).find('option:selected').text();
		var year = $('select[name=year]');
		var option = $(year).find('option').get(0);
		$('select[name=year] option').not('option:first').remove();
		$('select[name=engine] option').not('option:first').remove();
		$('select[name=fuel] option').not('option:first').remove();
		ECP.AdsLookup.loadYear(this.value,function(data){
			
			year.find('option').remove();
			year.append(option);
			$.each(data['years'],function(index,yearObj){
				year.append('<option value="'+yearObj.Id+'">' + yearObj.Year + '</option>');
			});
			$("select[name=year],select[name=engine],select[name=fuel]").attr('disabled',true);
			//$("select[name=year]").val('');
			$("select[name=year]").removeAttr('disabled');
		});
	});
	
	$('select[name=year]').on('change',function(){
		var engine = $('select[name=engine]');
		var option = $(engine).find('option').get(0);
		$('select[name=engine] option').not('option:first').remove();
		$('select[name=fuel] option').not('option:first').remove();
		ECP.AdsLookup.loadEngine(this.value,function(data){			
			engine.find('option').remove();
			engine.append(option);
			$.each(data['engines'],function(index,engineObj){
				engine.append('<option value="'+engineObj.Id+'">' + engineObj.Engine + '</option>');
			});
			$("select[name=fuel]").attr('disabled',true);
			//$("select[name=engine]").val('');
			$("select[name=engine]").removeAttr('disabled');
		});
	});
	
	$('select[name=engine]').on('change',function(){
		var fuel = $('select[name=fuel]');
		var option = $(fuel).find('option').get(0);
		$('select[name=fuel] option').not('option:first').remove();
		ECP.AdsLookup.loadFuel(this.value,function(data){
			fuel.find('option').remove();
			fuel.append(option);
			$.each(data['fules'],function(index,fuelObj){
				fuel.append('<option value="'+fuelObj.Fuel+'">' + fuelObj.Fuel + '</option>');
			});
			//$("select[name=fuel]").val('');
			$("select[name=fuel]").removeAttr('disabled');
		});
	});
	
	$('select[name=width]').on('change',function(){
		var width = $(this).val();
		var profile = $('select[name=profile]');
		var option = $(profile).find('option').get(0);
		if(width!=''){
			$.ajax({
			      type: "POST",			     
			      url: ECP.getBase()+"/catalog/categories/getTyreProfile", 
			      data: {'width': width},
			      dataType: "json",
			      success: function(data) {	
			    	  profile.find('option').remove();
		    		  profile.append(option);
			    	  $.each( data.profiles, function( index, profileObj ) {
			    		  profile.append('<option value="'+profileObj.profile+'">' + profileObj.profile + '</option>');
			    	  });  	  
			      }
		    });
		}
		$("select[name=profile]").removeAttr('disabled');
	});
	
	$('select[name=profile]').on('change',function(){
		var profile = $(this).val();
		var width = $('select[name=width]').val();
		var tyresize = $('select[name=tyresize]');
		var option = $(tyresize).find('option').get(0);
		if(width!=''){
			$.ajax({
			      type: "POST",			     
			      url: ECP.getBase()+"/catalog/categories/getTyreSizes", 
			      data: {'width': width, 'profile': profile},
			      dataType: "json",
			      success: function(data) {	
			    	  tyresize.find('option').remove();
			    	  tyresize.append(option);
			    	  $.each( data.tyresizes, function( index, tyresizeObj ) {
			    		  tyresize.append('<option value="'+tyresizeObj.rim+'">' + tyresizeObj.rim + '</option>');
			    	  });  	  
			      }
		    });
		}
		$("select[name=tyresize]").removeAttr('disabled');
	});
	
	$('.vehicle-form').on('submit',function(){
		if(window.settings.ads.enabled == 0){
			ECP.alert('', window.messages.modules.error.ads);
			return false;
		}
		ECP.AdsLookup.__data.fuel = $('select[name=fuel]').val();
		if(ECP.AdsLookup.__data.fuel == ''){
			ECP.alert('','Please select all the required fields.');
		}else{
			if($(this).hasClass('portraitform')){
				global 	= false;
				$('.portrait').hide();
				$('.loading-screen').show();
			} else{
				global 	= true;
			}
			ECP.AdsLookup.getCompoents(function(data){
				if(data.result.success==1){
					var eventLabelStr = $('select[name=make]').val()+', '+$('select[name=model]').val()+', '+$('select[name=year]').val()+', '+$('select[name=engine]').val()+', '+$('select[name=fuel]').val();
					//google Event tracking
					ga('send', {
						hitType : 'event',
					    eventCategory: 'MVL lookup',
					    eventAction: 'click',
					    eventLabel: eventLabelStr,
						transport: 'beacon'
					  });
					
					var strURL = window.location.href;
				
					if(parseInt(strURL.indexOf("engine-oils-fluids")) > 0){
						window.location.href = "/engineoil";
						return true;
					}
					
					if(parseInt(strURL.indexOf("battery")) > 0){
						window.location.href = "/car-battery";
						return true;
					}
					var currentUrl 		= window.location.href.split('?')[0];
					if(currentUrl == window.settings.docroot+'/' || currentUrl == window.settings.docroot){
						window.location.href = window.settings.vrm.redirecturl;
					} else{


						if($('#ismanufacturer').length >0){
							window.location.href = window.settings.vrm.redirecturl;
							return true;
						} else{
							location.reload();
						}

					}
				}else{
					$('.loading-screen').hide();
					$('.portrait').show();
					ECP.alert('','Invalid REG.');
				}
			}, global);
		}
		return false;
	});
	
	$('.search-selection-filter form').on('submit',function(){
		if(window.settings.ads.enabled == 0){
			ECP.alert('', window.messages.modules.error.ads);
			return false;
		}
		ECP.AdsLookup.__data.make = $('select[name=makeSelection]').val();
		ECP.AdsLookup.__data.fuel = $('select[name=fuelSelection]').val();
		ECP.AdsLookup.__data.engine = $('select[name=engineSelection]').val();
		ECP.AdsLookup.__data.year = $('select[name=yearSelection]').val();
		ECP.AdsLookup.__data.model = $('select[name=modelSelection]').val();
		//alert(ECP.AdsLookup.__data.fuel)
		if(typeof ECP.AdsLookup.__data.fuel == 'undefined' || ECP.AdsLookup.__data.fuel == ''){
			ECP.alert('','Please select all the required fields.');
		}else{
			if($(this).hasClass('portraitform')){
				global 	= false;
				$('.portrait').hide();
				$('.loading-screen').show();
			} else{
				global 	= true;
			}
			ECP.AdsLookup.getCompoents(function(data){
				if(data.result.success==1){
					if(window.location == window.settings.docroot+'/' || window.location == window.settings.docroot){
						window.location.href = window.settings.vrm.redirecturl;
					} else{
						window.location.href = window.location.href;
					}
				}else{
					$('.loading-screen').hide();
					$('.portrait').show();
					ECP.alert('','Invalid REG.');
				}
			}, global);
		}
		return false;
	});
	
	$('a.clearselection').on('click',function(){
		var href= this.href;
		var strURL = window.location.href;
 		var gclid= strURL.indexOf("gclid");
		var optimizlyCode=strURL.indexOf("optimizely_token");
		var skip = false;
		if(gclid!=-1){	var skip = true;	}
		if(optimizlyCode!=-1){	var skip = true;	}
		$.post(href,{},function(data){
			if($('.section3bo').length > 0){
				window.location.href	= window.location.pathname;
				return true;
			} else{
				var strURL = window.location.href;
				if(parseInt(strURL.indexOf("?")) > 0 && skip==false){
					var currentUris = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
					window.location.href = "/search/"+currentUris[0];
				} else {
					window.location.href = window.location.href;
				}
			}
		});
		return false;
	});
	
	$('#vrmForm').on('submit',function(){
		if(window.settings.vrm.enabled == 0){
			ECP.alert('', window.messages.modules.error.vrm);
			return false;
		}
		if($(this).hasClass('portraitform')){
			global 	= false;
			$('.portrait').hide();
			$('.loading-screen').show();
		} else{
			global 	= true;
		}
		var reg 			= $('#vrmReg').val();
		if(reg == ''){
			ECP.alert('Registration no not given.','Please enter valid REG no.');
			return false;
		}
		ECP.VrmLookup.getDetailByReg(reg,function(data){
			if(data.result.success==1){
				var eventLabelString = data.result.make+', '+data.result.model+', '+data.result.year+', '+data.result.engine+', '+data.result.fuel;
				//google Event tracking
				ga('send', {
					hitType : 'event',
					eventCategory: 'VRM Lookup',
					eventAction: 'click',
					eventLabel: eventLabelString,
					transport: 'beacon'
				});
				var strURL = window.location.href;
				
				if($('.section3bo').length > 0){
					window.location.href	= window.location.pathname;
					return true;
				}
				if(parseInt(strURL.indexOf("engine-oils-fluids")) > 0){
					window.location.href = "/engineoil";
					return true;
				}
				
				if(parseInt(strURL.indexOf("battery")) > 0){
					window.location.href = "/car-battery";
					return true;
				}
				var currentUrl 		= window.location.href.split('?')[0];
				if(currentUrl == window.settings.docroot+'/' || currentUrl == window.settings.docroot || currentUrl == 'http:'+window.settings.docroot || currentUrl == 'http:'+window.settings.docroot+'/'){
					window.location.href = window.settings.vrm.redirecturl;
				} else{
				 	if($('#ismanufacturer').length >0){
						window.location.href = window.settings.vrm.redirecturl;
						return true;
					} else{
					window.location.href = window.location.href;
				  }
				}
			}else{
				$('.loading-screen').hide();
				$('.portrait').show();
				ECP.alert('Invalid Reg No.','Please enter valid REG no.');
				return false;
			}		
		}, global);
		return false;
	});
	
	//login email error
	/*$(".login-form #email, .checkout .sign-form #emailid").focusout(function(){
		var $this = $(this);
		userEmail = $this.val();
		var $errorDiv = $(".login-form .loginEmailError");
		$errorDiv.hide();
		$(this).removeClass('invalid');
		if(userEmail!=''){
			if (!validateEmail(userEmail)) {
				$(this).removeClass('valid');
				$(this).addClass('invalid');
				$errorDiv.show();
				$errorDiv.text(messages.forgotpassword.invalidemail);
			}else{
				$.ajax({
				      type: "POST",			     
				      url: ECP.getBase()+"/users/login/checkifemailexists", 
				      data: {'email': userEmail},
				      success: function(data) {	
				    	  if(typeof data.form !== 'undefined'){
				    		  if(data.form.success.status==0){
				    			  $errorDiv.show();
					    		  $errorDiv.text(messages.loginHeader.emailerror);
				    			  $this.removeClass('valid');
				    			  $this.addClass('invalid');
					    	  }else if(data.form.success.status==1){
					    		  $this.removeClass('invalid');
					    		  $this.addClass('valid');
					    	  }
				    	  }			    	  
				      }
			    });
			}
		}	
		return false;
	});
	*/
	// register email error
	$(".login-info-form #email").focusout(function(){
		callAjaxFlag = true;
		var savedemail = $("#savedemail").val();		
		var $this = $(this);
		userEmail = $this.val();
		if(typeof savedemail !== 'undefined'){
			$("#email").removeClass('valid');
			$("#email").removeClass('invalid');
			if(savedemail == userEmail) {
				callAjaxFlag = false;
			}	
		}	
		if(callAjaxFlag){
			var $errorDiv = $(".login-info-form .registerEmailError");
			$errorDiv.hide();
			$(this).removeClass('invalid');
			if(userEmail!=''){
				if (!validateEmail(userEmail)) {
					$(this).removeClass('valid');
					$(this).addClass('invalid');				
					$errorDiv.show();
					$errorDiv.text(messages.forgotpassword.invalidemail);
				}else{
					
					$.ajax({
					      type: "POST",			     
					      url: ECP.getBase()+"/users/login/checkifemailexists", 
					      data: {'email': userEmail},
					      async: false,
					      success: function(data) {	
					    	  if(typeof data.form !== 'undefined'){
					    		  if(data.form.success.status==1){
					    			  $errorDiv.show();
						    		  $errorDiv.text(messages.loginHeader.callback);
					    			  $this.removeClass('valid');
					    			  $this.addClass('invalid');
						    	  }else if(data.form.success.status==0){
						    		  $this.removeClass('invalid');
						    		  $this.addClass('valid');
						    		  
						    		  //check bronto subscription
										$.ajax({
										      type: "POST",			     
										      url: ECP.getBase()+"/secure/newsletter/checkIfEmailExists", 
										      data: {'email': userEmail},
										      success: function(data) {	
										    	  if(typeof data.form !== 'undefined'){
										    		  if(data.form.success.status==1){
										    			  $("#bsubscribe").prop("checked", true);
										    			  $('#main-bsubscribe').hide();
											    	  }else if(data.form.success.status==0){
											    		  $('#main-bsubscribe').show();
											    		  $("#bsubscribe").prop("checked", false);
											    		  $("#main-bsubscribe").removeClass("hidden");
											    	  }
										    	  }			    	  
										      }
									    });
						    	  }
					    	  }			    	  
					      }
				    });
				}
			}			
		}		
		return false;
	});
	
	
	//custom codes for popups
	$('#loginSubmitBtn').click(function(){
		userEmail = $('.login-box .login-form .email').val();
		userPassword = $('.login-box .login-form #password').val();
		if (!validateEmail(userEmail) || userPassword=='') {
			$('.login-box .login-form .error').text(messages.loginHeader.invalidemailpassword);
			$('.login-box .login-form .error').show();
		}else{
			$('.login-box .login-form .error').hide();	
			$.ajax({
			      type: "POST",			     
			      url: ECP.getBase()+"/login", 
			      data: {'email': userEmail,'password': userPassword},
			      success: function(data) {	
			    	  if(typeof data.form !== 'undefined'){
			    		  if ( typeof data.form.errors.error.email !== 'undefined' && data.form.errors.error.email == 'invalidemail' ) {
				    		  $('.login-box .login-form .error').show();
				    		  $('.login-box .login-form .error').text(messages.loginHeader.invalidemailpassword);
				    	  }else if(data.form.errors.error.email=='callback'){
				    		  $('.login-box .login-form .error').show();
				    		  $('.login-box .login-form .error').text(messages.loginHeader.emailerror);
				    	  }else if(data.form.errors.error.formError=='mismatch'){
				    		  $('.login-box .login-form .error').show();
				    		  $('.login-box .login-form .error').text(messages.loginHeader.formerror);
				    	  }else if(data.form.success.status==1){
							  
							  //google Event tracking
							 ga('send', {
								hitType : 'event',
							    eventCategory: 'Sign In',
							    eventAction: 'click',
							    eventLabel: 'Sign In',
							    transport: 'beacon'
							  });
							  
				    		  location.reload();
				    	  }
			    	  }			    	  
			      }
		    });
		}
		return false;
	});
	
	$('form.login-form').submit(function(){
		var userEmail = $(this).find('#email').val();
		var userPassword = $(this).find('#password').val();
		if (validateEmail(userEmail) || userPassword!='') {
			//google Event tracking
			ga('send', {
				hitType : 'event',
			    eventCategory: 'Sign In',
			    eventAction: 'click',
			    eventLabel: 'Sign In',
			    transport: 'beacon'
			  });
		}
	});
	
	$('#forgot_password_popup .okay-btn').click(function(){
		userEmail = $('#forgot_password_popup #email').val();	
		if($('#forgot_password_popup .okay-btn').hasClass( "disable" )){
			return false;
		}
		if($.trim(userEmail)!=''){
			$('#forgot_password_popup .error').hide();
			$('.modal-body .forgotflashMessages').hide();
			$.ajax({
			      type: "POST",			     
			      url: ECP.getBase()+"/forgot-password", 
			      data: {'email': userEmail},
			      beforeSend: function(){
		    	     // Handle the beforeSend event
			    	 $('#forgot_password_popup .okay-btn').addClass('disable');
		    	  },
		    	  complete: function(){
	    		     // Handle the complete event
		    		  $('#forgot_password_popup .okay-btn').removeClass('disable');
	    		  },
			      success: function(data) {			    	 
			    	  if(data.form.errors.error.email=='invalidemail'){
			    		  //if invalid email
			    		  $('#forgot_password_popup .error').text(messages.forgotpassword.invalidemail);
			    		  $('#forgot_password_popup .error').show();
			    	  }else if(data.form.errors.error.email=='callback'){
			    		  //if email not exists
			    		  $('#forgot_password_popup .error').text(messages.forgotpassword.callback);
			    		  $('#forgot_password_popup .error').show();
			    	  }else if(data.form.errors.error.email=='emptyfield'){
			    		  //if empty submit
			    		  $('#forgot_password_popup .error').text(messages.forgotpassword.invalidemail);
			    		  $('#forgot_password_popup .error').show();
			    	  }else if(data.form.success.status==1){
			    		  //if email sent
			    		  $('#forgot_password_popup .error').hide();
			    		  $('.modal-body #forgotflashMessages').show();
			    		  $('#forgot_password_popup #email').val('');
			    	  }
			      }
		    });
		}else{			
			$('#forgot_password_popup .error').text(messages.forgotpassword.invalidemail);
			$('#forgot_password_popup .error').show();
		}
		return false;
	});
	
	$('#change_password_popup .okay-btn').click(function(){
		userPassword = $('#change_password_popup #password').val();
		userCpassword = $('#change_password_popup #cpassword').val();
		var userPasswordLength = userPassword.length;
		var userCpasswordLength = userCpassword.length;
		if(userPasswordLength < 8 && userCpasswordLength < 8) {
			//if noth fields not valid
			$('#change_password_popup #cpasswordError').text(messages.changepassword.minlength);
  		  	$('#change_password_popup #cpasswordError').show();
  		  	$('#change_password_popup #passwordError').text(messages.changepassword.minlength);
		  	$('#change_password_popup #passwordError').show();
  		  	return false;
		}else if(userPasswordLength < 8) {
			//if invalid password
			$('#change_password_popup #cpasswordError').hide();
			$('#change_password_popup #passwordError').text(messages.changepassword.minlength);
  		  	$('#change_password_popup #passwordError').show();
  		  	return false;
		}else if(userCpasswordLength < 8){
			//if invalid password
			$('#change_password_popup #passwordError').hide();
			$('#change_password_popup #cpasswordError').text(messages.changepassword.minlength);
  		  	$('#change_password_popup #cpasswordError').show();
  		  	return false;
		}else if(userPassword != userCpassword) {
			//if password fields not same
			$('#change_password_popup #passwordError').hide();
			$('#change_password_popup #cpasswordError').text(messages.changepassword.notsametofield);
  		  	$('#change_password_popup #cpasswordError').show();
  		  	return false;
		}		
		$('#change_password_popup .error').hide();
		$('.modal-body .changeflashMessages').hide();
		$.ajax({
		      type: "POST",			     
		      url: ECP.getBase()+"/my-account/change-password", 
		      data: {'password': userPassword,'cpassword': userCpassword},
		      success: function(data) {			    	 
		    	  if(data.form.errors.error.password=='emptyfield' || data.form.errors.error.password=='minlength'){
		    		  //if invalid password		  				
		  				$('#change_password_popup #passwordError').text(messages.changepassword.minlength);
		    		  	$('#change_password_popup #passwordError').show();
		    	  }else{
		    		  	$('#change_password_popup #passwordError').hide();
		    	  }
		    	  if(data.form.errors.error.cpassword=='emptyfield' || data.form.errors.error.cpassword=='minlength'){
		    		  //if email not exists
		    		  	$('#change_password_popup #cpasswordError').text(messages.changepassword.minlength);
		    		  	$('#change_password_popup #cpasswordError').show();
		    	  }else{
		    		  	$('#change_password_popup #cpasswordError').hide();
		    	  }
		    	  
		    	  if(data.form.errors.error.cpassword=='notsametofield'){
	    		  	  //if password fields not same
	  					$('#change_password_popup #passwordError').hide();
	  					$('#change_password_popup #cpasswordError').text(messages.changepassword.notsametofield);
	  					$('#change_password_popup #cpasswordError').show();
		    	  }
		    	  
		    	  if(data.form.success.status==1){
		    		  //if email sent
		    		  $('#change_password_popup .error').hide();
		    		  $('.modal-body #changeflashMessages').show();
		    		  $('#change_password_popup .InputTxtBox').val('');		    		  
		    	  }
		      }
	    });
		return false;
	});
	
	$('#forgot_password_popup').keydown(function(event){
	    if(event.keyCode == 13) {
	    	$('#forgot_password_popup .okay-btn').trigger( "click" );
	    	event.preventDefault();
	    	return false;
	    }
	});
	
	$('.login-box .login-form').keydown(function(event){
	    if(event.keyCode == 13) {
	    	$('.login-box .login-form #loginSubmitBtn').trigger( "click" );
	    	event.preventDefault();
	    	return false;
	    }
	});
	
	$('.login-info-form .post-find-btn').on('click',function(){
		var obj = $(this);
		$(this).addClass('wait');
		var findPostcodeVal = $( "#findPostcode" ).val();
		var findCountry = $('#country').val();
		if(findPostcodeVal){
			$.ajax({
			      type: "POST",			     
			      //url: ECP.getBase()+"/secure/services/getAFDAddresses",
			      url: ECP.getBase()+"/secure/services/findAddressLookup",
			      data: {'postcode': findPostcodeVal, 'country': findCountry},
			      success: function(data) {
			    	  obj.removeClass('wait');
			    	  addressDropdown = jQuery(data).find('#selectInner').html();
			    	  $('.registration-col .address-finder select').remove();
			    	  $('.registration-col .address-finder .outer-select').html(addressDropdown);
			    	  $('.registration-col #registrationAfdDiv').show();
					  
					  var gaVal = findPostcodeVal.toUpperCase();
					  gaVal = gaVal.replace(/ /g,'');
					  if($('.enableUpdateEmail').length){
						  var eventPageType = 'Postcode - My Account';
					  }else{
						  var eventPageType = 'Postcode - Registration';
					  }
					  //google Event tracking
					  ga('send', {
							hitType : 'event',
							eventCategory: eventPageType,
							eventAction: 'click',
							eventLabel: gaVal
					  });
			      }
		    });
			return false;
		}else{
			ECP.alert('Form Error.','Please enter you postcode to use address finder.');
			$(this).removeClass('wait');
			return false;
		}		
	});
	
	$('#change_password_popup').keydown(function(event){
	    if(event.keyCode == 13) {
	    	$('#change_password_popup .okay-btn').trigger( "click" );
	    	event.preventDefault();
	    	return false;
	    }
	});	
	
	// Store Locator Js
	
	$('.searchStore').on('submit',function(){
		var search		= $(this).find('input[name="search"]').val();
		if($.trim(search) == ''){
			ECP.alert('', 'Search field cannot be empty.');
			return false;
		} else{
			return true;
		}
	});
	
	// Store Locator for static page
	$('.searchStorePage').on('submit',function(){
		var search		= $(this).find('input[name="search"]').val();
		$('.searchStoreMsg').remove();
		if($.trim(search) == ''){
			ECP.alert('', 'Search field cannot be empty.');
		} else{
			var msg 	= '';
			var search 	= $(this).find('input[name="search"]').val();
			var form 	= $(this);
			$.ajax({
			      type: "POST",			     
			      url: ECP.getBase()+$(this).data('href'),
			      data: {'search': search, 'isajax': 'true'},
			      success: function(data) {
			    	  if(data == 'true'){
			    		 msg  = '<p class="searchStoreMsg succMsg"><img src="' + $("body").data("statichost") + '/product-list-icon.jpg"  /> ' + window.messages.sddsearch.success + '</p>';
			    	  }else{
			    		 msg  = '<p class="searchStoreMsg errMsg">' + window.messages.sddsearch.error + '</p>';
			    	  }
			    	 form.append(msg);
			      }
		    });
		}
		return false;
	});
		
	if($('div.flashmessage').length>0){
		var msgstr = '';
		var notifClass = '';
		$('div.flashmessage').each(function(){
				var message = $(this).data('message');
				notifClass = $(this).data('errorclass');				
				console.log(message);
				var messageArray = message.split('.');
				var predefinedarray =  window.messages;
				while(index = messageArray.shift()){					
					if(index in  predefinedarray){
						predefinedarray = predefinedarray[index];
					}
				}
				if(typeof predefinedarray !='undefined'){
					msgstr += predefinedarray;
				}
				
				msgstr = '<div class="popNotificationMessage '+notifClass+'">'+msgstr+'</div>';				
		});
		notifClass = messages.notificationalert[notifClass];		
		ECP.alert(notifClass,msgstr);
	}
	ECP.addCart();
	var branch = $(".branchselector").val();
	if(typeof branch != undefined){
		$('#branchbox_'+branch).show();
	}
	$(document).on('change','.branchselector',function(){
			$('div [id^=branchbox_]').hide();
			var branchid = $('.branchselector').val();
			$('#branchbox_'+branchid).show();
	});	
	
	//hide sign in box on body click
	$('body').click(function(evt){    
	       if(evt.target.class == "login-box")
	          return;
	       //For descendants of menu_content being clicked, remove this check if you do not want to put constraint on descendants.
	       if($(evt.target).closest('.login-box').length)
	          return;             
	       
	       if(evt.target.class == "signin")
		          return;
		       //For descendants of menu_content being clicked, remove this check if you do not want to put constraint on descendants.
	       if($(evt.target).closest('.signin').length)
		          return;             
	       if(evt.target.id == "cls-popup")
		          return;
		       //For descendants of menu_content being clicked, remove this check if you do not want to put constraint on descendants.
	       if($(evt.target).closest('#cls-popup').length)
		          return;             
		         
	      //Do processing of click event here for every element except with id menu_content
	       if($(document).scrollTop()=='0'){
	    	   $('header').removeClass('slide--up').addClass('slide--reset');
	       	   $('header .login-box').slideUp(400);
	       }
	});
	
	var hash = window.location.hash;

    if (hash) {
        var selectedTab = $('.order-heading a[href="' + hash + '"]');
        selectedTab.trigger('click', true);
    }
	
	$('.geolocation').on('click', function(){
		if (navigator.geolocation) {
	        navigator.geolocation.getCurrentPosition(function(position){
	        	window.location  = ECP.getBase() + '/store-locator/locate/lat/' + position.coords.latitude + '/lon/' + position.coords.longitude;
	        });
	    } else { 
	       alert("Geolocation is not supported by this browser.");
	    }
	});
	
	$(document).ready(function(){
		if($('.storeAutocomplete').length>0){
			$('.storeAutocomplete').autocomplete({
			    serviceUrl: '/stores/store/getStoreNamesAutocomplete',
			    ajaxSettings: {
			    	global: false,
			    }
			});	
		}		
	});
	
	$(document).on('click','.tiercatcontentheader .view-more',function(){
		
		if($(this).text()==$(this).data('more')){
			$(this).text($(this).data('less'));
			$(this).parents('.tiercatcontentheader').find('article.moretext').css({'display':'inline'});
		}else{
			$(this).parents('.tiercatcontentheader').find('article.moretext').css({'display':'none'});
			$(this).text($(this).data('more'));
		}
		return false;
	});
	
	$('#feedbackForm').on('submit', function(){
		$('.error').html('');
		$('.error').hide();
		var error 			= false;
		var option1 		= $('#feedbackForm input[name="option1"]:checked').length;
		var option2 		= $('#feedbackForm input[name="option2"]:checked').length;
		var msg 			= $('#feedbackForm textarea[name="msg"]').val();
		var name 			= $('#feedbackForm input[name="name"]').val();
		var email 			= $('#feedbackForm input[name="email"]').val();
		if(option1 < 1){
			$('.option1Err').html(window.messages.feedback.error.required);
			error 			= true;
		}
		if(option2 < 1){
			$('.option2Err').html(window.messages.feedback.error.required);
			error 			= true;
		}
		if(msg == ''){
			$('.msgErr').html(window.messages.feedback.error.required);
			error 			= true;
		}
		if(name == ''){
			$('.nameErr').html(window.messages.feedback.error.required);
			error 			= true;
		}
		if(email == ''){
			$('.emailErr').html(window.messages.feedback.error.required);
			error 			= true;
		} else if(!validateEmail(email)){
			$('.emailErr').html(window.messages.feedback.error.validEmail);
			error 			= true;
		}
		if(error){
			$('.error').show();
			return false;
		}
		return true;
	});
	
	$('.tyresize-form').on('submit',function(){ 
		width = $('select[name=width] option:selected').val();
		profile = $('select[name=profile] option:selected').val();
		tyresize = $('select[name=tyresize] option:selected').val();
		if(width == '' || tyresize == '' || profile == ''){
			ECP.alert('',window.messages.snowchains.error.required);
		}else{
			return true;
		}
		return false;
	});
	
    $('[data-toggle="popover"]').popover();
    showFilterCount();
    
    // 3bo module
    $(document).on('click', '.o3b-section .next.active', function(e){ //shafali
		e.preventDefault();   
		var pageDiv 	= $('.o3b-section .current-page');
		var page 		= Number(pageDiv.html()) + 1;
		var totalPages 	= pageDiv.data('totalpages');
		window.location	= updateUrlParameters(window.location.href, 'page', page);
	});
    $(document).on('click', '.o3b-section .prev.active', function(e){
		e.preventDefault();   
		var pageDiv 	= $('.o3b-section .current-page');
		var page 		= Number(pageDiv.html()) - 1;
		/* EPL-6561 */
		var urlParams = getUrlParameters();
		var limitVal = urlParams.limit || 0;
        if(page == 1 && parseInt(limitVal) === 0){
            window.location    = removeURLParameter(window.location.href, 'page');
        } else{
            window.location    = updateUrlParameters(window.location.href, 'page', page);
        }
		//window.location	= updateUrlParameters(window.location.href, 'page', page);
		/* End EPL-6561 */
		
	});
	$(document).on('click', '#tab-filters input[type=checkbox]', function(){
		var pageDiv 	= $('.current-page');
		pageDiv.html(1);
		ajaxProductsPagination(1, updatePagination, $(this));
	});
    $(document).on('click', '#carousalFilter input[type=checkbox]', function(){
        var pageDiv     = $('.current-page');
        ajaxProductsPagination(1, updatePagination, $(this), 'topFilter');
    });
	$(document).on('change', '#car-tab-filters select', function(){
		var pageDiv 	= $('.current-page');
		pageDiv.html(1);
		ajaxProductsPagination(1, updatePagination, $(this));
	});
	$(document).on('click', '#car-tab-filters input[type=checkbox]', function(){
		var pageDiv 	= $('.current-page');
		pageDiv.html(1);
		ajaxProductsPagination(1, updatePagination, $(this));
	});
	$(document).on('click', '#category-filters input[type=radio]', function(){
		var pageDiv 	= $('.current-page');
		pageDiv.html(1);
		ajaxProductsPagination(1, updatePagination, $(this));
	});
	$(document).on('click', '.clear-category-refine', function(){
		var pageDiv 	= $('.current-page');
		pageDiv.html(1);
		$('#category-filters input[type=radio]').prop('checked', false);
		ajaxProductsPagination(1, updatePagination);
	});
	$(document).on('click', '.reset-btn', function(){
		$('#category-filters input[type=radio]').prop('checked', false);
		$('.clear-refine').trigger('click');
	});
	$(document).on('click', '#tab-filters .clear-refine', function(){
		var pageDiv 	= $('.current-page');
		$('#tab-filters input[type=checkbox]').prop('checked', false);
		ajaxProductsPagination(1, updatePagination);
	});
	$(document).on('click', '#car-tab-filters .clear-refine', function(){
		clearAllFilters();
		if($('#filtervehiclespec select').length < 1){
			ajaxProductsPagination(1, updatePagination);
		}
	});
	
	$(document).on('click', '.page-list .showall', function(){ 
		$(this).addClass('active');
		ajaxProductsPagination(1, updatePagination);
	});	
	
	/* EPl-5248 */
 	$(document).on('change', '.sort-col select', function(){ 
        var value     = $(this).val();    
        var url         = updateUrlParameters(window.location.href, 'page', 1);
        window.location    = updateUrlParameters(url, 'sort', value);
    });
	/* EPl-5248 */

	// easyAsk
	$(document).on('click', '.page-list .changelimit', function(){ 
		var datalimit = $('.changelimit').attr('data-limit');	
		var url 		= updateUrlParameters(window.location.href, 'page', 1);
		window.location	= updateUrlParameters(url, 'limit', datalimit);
	});
	
	/** window.onpopstate = function(){
		$.ajax({
		      type: "GET",			     
		      url: window.location.href, 
		      success: function(data) {	
		    	  $('.section3bo').hide().html(data).fadeIn(1000);
		    	  $('.filtercheckboxes').removeAttr('disabled');
		    	  $('.wait-box').hide();
		    	  $('.zoom').zoom();
				  popoverDiv();
		    	  if(callback != ''){
		    	  	callback(data);
		      	}
		      }
		});
	} */
	/** EPL-4152 - cookie banner **/	
 	$("#cookieBarCloseId").on('click', function(){
		setCookie('cookiealert','1', 30);
	}); 
	/** EPL-4152 - cookie banner **/	
	
    
})(jQuery);


function scrollTo(div){
	$('html, body').animate({
        'scrollTop' : $(div).position().top
    });
}
function getUrlParams(url, param){
	//alert(url);
	 name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	    var regex = new RegExp("[\\?&]" + param + "=([^&#]*)"),
	        results = regex.exec(url);
	    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

function updateUrlParameters(uri, key, value) {
  var re = new RegExp("([?&])" + key + "=.*?(&|$)", "i");
  var separator = uri.indexOf('?') !== -1 ? "&" : "?";
  if (uri.match(re)) {
    return uri.replace(re, '$1' + key + "=" + value + '$2');
  }
  else {
    return uri + separator + key + "=" + value;
  }
}

function removeURLParameter(url, parameter) {
    //prefer to use l.search if you have a location/link object
    var urlparts= url.split('?');   
    if (urlparts.length>=2) {

        var prefix= encodeURIComponent(parameter)+'=';
        var pars= urlparts[1].split(/[&;]/g);

        //reverse iteration as may be destructive
        for (var i= pars.length; i-- > 0;) {    
            //idiom for string.startsWith
            if (pars[i].lastIndexOf(prefix, 0) !== -1) {  
                pars.splice(i, 1);
            }
        }

        url= urlparts[0] + (pars.length > 0 ? '?' + pars.join('&') : "");
        return url;
    } else {
        return url;
    }
}

function  getCarriagesOptions(countryVal, international, postcodeVal){
	if( (countryVal != "" && international == '1' ) || (countryVal == "777"  &&  postcodeVal != "") || (countryVal != "" && countryVal != "777" && international == '0') ){
		if(window.ECP.__loadervisible){
		var overlayq =' left:0; top:0; bottom:0; right:0; background:#233f92; opacity:0.8; height:100%; filter:alpha(opacity=80); z-index:9999999; margin-left:0px; text-align:center;';
		$('.billing-col.delivery-option').html($('<div  class="" style="'+overlayq+'"><img  style="margin-top:20%;margin-bottom:20%;" width="100" src="/assets/img/puff.svg" alt="Loading"/></div>')).fadeIn();
		}
		  $('#deliveryError').hide();
		  $('#spostcode').attr('disabled','disabled');
		  var postedcarriagecode = $('#postedcarriagecode').val();
		  //$(".delivery-overlay").show();
		  $.ajax({
			  type:'POST',
			  url: ECP.getBase()+'/secure/services/getBfpoStatus',
			  data:{'postcode':postcodeVal},
			  success:function(data){
				  if($(window).width() > 768){
					  var obj = $('.select-country fieldset div.bfpomsgdiv');
				  }else{
					  var obj = $('.address-field fieldset div.bfpomsgdiv');
				  }
				   if(data.result != 'N\/A'){					 
					  if(data.result == 'invalid'){
						  obj.addClass('bfpomsgdiv bfpo-info semibold');
						  obj.html(window.messages.bfpo.error.invalidproduct);
					  }else{
						  obj.addClass('bfpomsgdiv bfpo-info');
						  obj.html('<strong>'+window.messages.bfpo.error.validproduct.heading+'</strong>');
						  obj.append(window.messages.bfpo.error.validproduct.msg);
					  }
				  }else{
					  obj.html('');
					  obj.removeClass('bfpo-info');
				  }
			 
		 $.ajax({
		      type: "POST",			     
		      url: ECP.getBase()+"/secure/services/getCarriages", 
		      data: {'countryVal': countryVal,'international': international,'postcodeVal':postcodeVal, 'postedcarriagecode':postedcarriagecode},
		      success: function(data) {		    	  
			    if(!$("#clickCollect").is(':checked')){
		    	//ECP.loaderClose();
		    	  $('.billing-col.delivery-option').show();
		    	  $('.billing-col.delivery-msg').hide();
		    	  $('.billing-col.delivery-option').html(data);
		    	  $('#hdsteps3').show();
				  if($('.billing-col.delivery-option .nodeliveryOptions').length < 1){
		    	  $("#hdstep4n5").show();
				  }else{
					$("#hdstep4n5").hide();  
				  }
				 //$('.checkout.delivery-option .delivery-table .delivery-data:nth-child(3)').addClass('active');
				 /*  $('.checkout.delivery-option .delivery-table .delivery-data').click(function(){
					$('.checkout.delivery-option .delivery-table .delivery-data').removeClass('active');
					$(this).addClass('active');
				  }); */
				  $('.checkout.delivery-option .delivery-table .delivery-data input').click(function(){
				    if(this.checked){
						$('.checkout.delivery-option .delivery-table .delivery-data').removeClass('active');
						$(this).parent('.delivery-data').addClass('active');
					}else{
						$('.checkout.delivery-option .delivery-table .delivery-data').removeClass('active');
					}
				  });
		    	  var deliveryOptionHidden = $('#deliveryOptionHidden').val();
		    	  if(deliveryOptionHidden){
		    		  $('#slot'+deliveryOptionHidden).attr('checked', 'checked');
		    	  }
		    	  var selected = $(".delivery-data input[type='radio']:checked");
		    	  if (selected.length > 0) {
		    	      selectedChargeId = selected.attr('id');
		    	      updateDeliveryAmounts(selectedChargeId);
		    	  }
		    	  $('#spostcode').removeAttr('disabled');
		      }
			  popoverDeleivery();
		     }
	    }); 
			  }
		  });
	}
}

/*
 * Function that validates email address through a regular expression.
 */
function validateEmail(sEmail) {
	sEmail = sEmail.trim();
	var filter = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,7}$/;
	if (filter.test(sEmail)) {
		return true;
	}
	else {
		return false;
	}
}

/*
 * Function that validates phone no through a regular expression.
 */
function validatePhone(phno) { 
  var regexPattern=new RegExp(/^[0-9-+]+$/);    // regular expression pattern
  return regexPattern.test(phno); 
} 


/*
 * Function that validates email address through a regular expression.
 */
function validateMultipleEmail(value, seperator) {
    seperator = seperator || ',';
    if (value != '') {
        var result = value.split(seperator);
        for (var i = 0; i < result.length; i++) {
            if (result[i] != '') {
                if (!validateEmail($.trim(result[i]))) {
                    return false;
                }
            }
        }
    }
    return true;
}

/*
 * function to update delivery and total amount on change in delivery option
 */ 
function updateDeliveryAmounts(objCheckedId){
	var moneyOff = 0;
	//moneyOff = document.getElementById("moneyOff").value;
	var strDescription = $('#'+objCheckedId).attr("description");
	var strCode = $('#'+objCheckedId).val();
	var dCharge = $('#'+objCheckedId).attr("charge");
	var currencyIcon = $('#currencyIconConatiner').text();
	var objDeliveryAmount = document.getElementById("shippingAmount");
	var shippingAmountConatiner = document.getElementById("shippingAmountConatiner");
	var objDeliveryAmountDesc = document.getElementById("basketDeliveryAmountDesc");
	var objDescription = document.getElementById("basketDeliveryDescription");
	var objTotalAmount = document.getElementById("totalAmountPayable");
	var dBasketPrice = parseFloat(objTotalAmount.getAttribute("basketprice"));	
	var position = $('#totalAmountPayable').data('position');
	var symbol = $('#totalAmountPayable').data('symbol');
	var totalamount = shippingcharges = deliveryAmount = deliveryDesc =  shippingcharges = '';
	dBasketPrice = dBasketPrice - moneyOff;
	
	if(strCode == 'INT_DELIVERY'){
		if (dCharge > 0){
			if(position > 0){
				shippingcharges = deliveryAmount = dCharge + symbol;	;
			}else{
				shippingcharges = deliveryAmount = symbol + dCharge;
			}
		}else{
			deliveryAmount = "TBC";
			shippingcharges = '0.00';
		}		
		deliveryDesc = "(" + strDescription + ")";
	}
	else if (dCharge == 0)
	{
		deliveryAmount = "FREE";
		shippingcharges = '0.00';
		deliveryDesc = "(" + strDescription + ")";
	}
	else
	{
		if(position > 0){
			shippingcharges = deliveryAmount = dCharge + symbol;	;
		}else{
			shippingcharges = deliveryAmount = symbol + dCharge;
		}
		deliveryDesc = "(" + strDescription + ")";
	}
	//objTotalAmount.innerHTML = currencyFormatted(+dBasketPrice + +dCharge);
	
	
	if(position > 0){
		totalamount = currencyFormatted(+dBasketPrice + +dCharge) + symbol;		
	}else{
		totalamount = symbol + currencyFormatted(+dBasketPrice + +dCharge);	
	}
	
	objTotalAmount.innerHTML = totalamount;
	objDeliveryAmount.innerHTML = deliveryAmount;
	objDeliveryAmountDesc.innerHTML  = deliveryDesc;
	
	if($('#totalprice').length > 0){
		$('#totalprice').html(totalamount);
		//$('#summarytotalprice').html(totalamount);
		$('.summarytotalprice').html(totalamount);
	}
	if($('#shippingchrges').length > 0){
		$('#shippingchrges').html(shippingcharges);
		$('#shipdesc').html(deliveryDesc);
		
	} 

}


function currencyFormatted(dAmount)
{
	var dMoney = parseFloat(dAmount);
	var cMinus = '';
	
	if (isNaN(dMoney))
	{
		dMoney = 0.00;
	}
	
	if (dMoney < 0)
	{
		cMinus = '-';
	}
	dMoney = Math.abs(dMoney);
	dMoney = parseInt((dMoney + .005) * 100);
	dMoney = dMoney / 100;
	var sMoney = new String(dMoney);

	if (sMoney.indexOf('.') < 0)
	{
		sMoney += '.00';
	}

	if (sMoney.indexOf('.') == (sMoney.length - 2))
	{
		sMoney += '0';
	}
	sMoney = cMinus + sMoney;
	return sMoney;  
}


function capitalizeFirstLetter(string) {
    return string.charAt(0).toUpperCase() + string.slice(1);
}
function clearAddress(addressTypePrefix){
	if(addressTypePrefix=='s'){
		$("#shippingAddress #address > option:eq(0)").prop('selected', true);
	}else{
		$("#billingAddress #address > option:eq(0)").prop('selected', true);
	}
	
	$('#'+addressTypePrefix+'address1').val('');
	$('#'+addressTypePrefix+'address2').val('');
	$('#'+addressTypePrefix+'town').val('');
	$('#'+addressTypePrefix+'county').val('');
	$('#'+addressTypePrefix+'postcode').val('');
}

function changeAddress(objSelect, strPrefix, strProvider)
{
	var strId = strPrefix + objSelect.value;
	var addressType = objSelect.parentNode.parentNode.id;
	var objOption = $(objSelect).children('#'+strId);
	//console.log($(objOption1).attr('postcode'));
	//var objOption = document.getElementById(strId);
	
	var objButton = document.getElementById("updateButton");
	var objDeleteButton = document.getElementById("deleteButton");
	
	if (strPrefix == "undefined" || strPrefix == undefined)
	{
		strPrefix = "";
	}
			
	if(addressType=="shippingAddress") {
		var objAddress1 = document.getElementById(strPrefix + "saddress1");
		var objAddress2 = document.getElementById(strPrefix + "saddress2");
		var objAddress3 = document.getElementById(strPrefix + "stown");
		var objAddress4 = document.getElementById(strPrefix + "scounty");
		var objPostcode = document.getElementById(strPrefix + "spostcode");
	}else{
		var objAddress1 = document.getElementById(strPrefix + "address1");
		var objAddress2 = document.getElementById(strPrefix + "address2");
		var objAddress3 = document.getElementById(strPrefix + "town");
		var objAddress4 = document.getElementById(strPrefix + "county");
		var objPostcode = document.getElementById(strPrefix + "postcode");
	}
	

	var objInternalId = document.getElementById(strPrefix + "internalId");
	var objContactName = document.getElementById(strPrefix + "contactName");
	
	if (objInternalId)
	{
		objInternalId.value = $(objOption).attr("internalId");
		
	}

	if (objContactName)
	{
		objContactName.value = $(objOption).attr("contactName");
	}
	
	//var strPostcode = $(objOption).attr("postcode").split(" ").join("");	 
	var strPostcode = $(objOption).attr("postcode");	
	if (strProvider == "AFD")
	{
	  $.ajax({
	      type: "POST",			     
	      url: ECP.getBase()+"/secure/services/getAFDAddressesModeSelect",
	      data: {'postcode': strPostcode},
	      success: function(data) {			    	 
	    	  var strPos = data.indexOf('|','6');
	    	  if(strPos != '-1'){
	    		  data = data.replace('<?xml version="1.0"?>','');
	    		  var arrAddress = data.split("|");
	    		  if($.trim(arrAddress[0])==''){
	    			  objAddress1.value = arrAddress[1];
	    			  objAddress2.value = '';
	    		  }else{
	    			  objAddress1.value = arrAddress[0];
	    			  objAddress2.value = arrAddress[1];
	    		  }
	    		  objAddress3.value = arrAddress[2];
	    		  objAddress4.value = arrAddress[3];
	    		  //objPostcode.value = arrAddress[4];
	    		 
	    		 if(addressType=="shippingAddress") {
	    			var postcodeVal = $( ".checkout-form #spostcode" ).val();
	    			var countryVal = $( ".checkout-form #scountry" ).val();
	    			var international = $('option:selected', ".checkout-form #scountry").attr('international');
	    			getCarriagesOptions(countryVal, international, postcodeVal);
	    		  }
	    		  
	    		  
	    		  
	    	  }else{
	    		  objAddress1.value = "";
	    		  objAddress2.value = "";
	    		  objAddress3.value = "";
	    		  objAddress4.value = "";
	    		  //objPostcode.value = "";				
	    	  }
	      }
	  });  
	} else { 	
	    if ($(objOption).attr("internalId") == "0")
	    {
		    if (objButton)
		    {
			    objButton.style.display = "none";
			    objDeleteButton.style.display = "none";
		    }
	    }
	    else
	    {
		    if (objButton)
		    {
			    objButton.style.display = "block";
    			
			    if ( $(objOption).attr("internalId") == "-1")
			    {
				    objDeleteButton.style.display = "none";
			    }
			    else
			    {
				    objDeleteButton.style.display = "block";
			    }
		    }
	    }    	
	    objAddress1.value = $(objOption).attr("address1");
	    objAddress2.value = $(objOption).attr("address2");
	    objAddress3.value = $(objOption).attr("town");
	    objAddress4.value = $(objOption).attr("county");
	    objPostcode.value = $(objOption).attr("postcode");
		
		if(addressType=="shippingAddress") {
			var postcodeVal = $( ".checkout-form #spostcode" ).val();
			var countryVal = $( ".checkout-form #scountry" ).val();
			var international = $('option:selected', ".checkout-form #scountry").attr('international');
			getCarriagesOptions(countryVal, international, postcodeVal);
		  }
    }
	
	
}

function changeCountry(objSelect){
/** 898 :- EPL-4149 **/
	var international = $('option:selected', objSelect).attr('international');
	var selectedCountry = $(objSelect).val();
	// 777 = GB Mainland	
	if(international == 0){
	//if(selectedCountry == '777'){
/** 898 :- EPL-4149 **/
		$(objSelect).parents('fieldset').next('fieldset').find('input').val('');
		$(objSelect).parents('fieldset').next('fieldset').show();
	}else{
		$(objSelect).parents('fieldset').next('fieldset').hide();
		$(objSelect).parents('fieldset').next('fieldset').next().hide();
	}
	$('#registrationAfdDiv').hide();
	$('#findPostcode, #address1, #address2, #town, #county, #postcode').val('');
}

function checkADSFilter(tier5codes){
	console.log(filterstr);
}

function focusChangeStore(){
	javascript:document.getElementById('clickncollectdetails').style.display='block'; 
	$('.checkout.delivery-detail .loc-post-field #changecncpostcode').focus();
	$('.checkout.delivery-detail .loc-data .img-spinner').hide();
	return false;
}

$(document).on('click','#productfilters',function(){
	//$('#filter-popup').find('.modal-content').html();
	$('#filter-popup').modal({backdrop:'static',keyboard:false,show:true});
});

$(document).on('click','#clear-allfilters',function(){
	//$('#filter-popup').find('.modal-content').html();
	$('#filter-popup').modal({backdrop:'static',keyboard:false,show:true});
});

$(document).on('click',"#filterProductListing",function(){	
	
	var filterstr='tier5Code='+$('#filtertier5codes').val()+'&';
	var val='';
	var varcheckedfiltres='';
	var selected=0;
	var selectedFilter=0;
	var filterData={};
	var filterapplied = false;
	
	$('#filterform select option:selected').each(function() {
		if($(this).val()==0){val='';}
		else{val=$(this).val();selected=1;selectedFilter++;}		
		filterstr+=$(this).parent().attr('name')+'='+val.replace("-", " ")+'&';		
	});	
	filterstr+='selected='+selected+'&';
	//console.log(filterstr);
	
	var filters = {};
	var checkedfiltercounter=0;
	$("#filterform input:checked").each(function(){
		checkedfiltercounter++;
		var filter= $(this).attr('data-filtertype');
		if(typeof filters[filter]=='undefined'){
			filters[filter] = [];
		}		
		filters[filter].push($(this).val());	
		
		//varcheckedfiltres+=$(this).attr('data-filtertype')+'='+$(this).val()+'&';
		varcheckedfiltres+=$(this).val()+',';
		//console.log($(this).val());
	});	
	var totalfilter=selectedFilter+checkedfiltercounter;
	filterstr+='checkboxfiltres='+varcheckedfiltres+'&totalFilterSelected='+totalfilter+'&';
	//console.log(varcheckedfiltres);
	$.ajax({
		 type: "POST",			     
	      url: $('#filterform').attr('action'), 
	      data: filterstr,
	      async:false,
	      success: function(data) {	
	    	  $('#carpartslistingsection').html(data); 
	    	  $('.custom-select').niceSelect();
	      }
	})	
	
	if($("form.product-content").is(":visible")){
		$("form.product-content").hide();
	}
	$("li.brandselection").hide();
	
	$.each(filters,function(filtername,filterarr){
			
			$('form.product-content').removeAttr(filtername);
			$.each(filterarr,function(index,filter){
				
				$('form.product-content').each(function(){
					
					if($(this).attr('data-'+filtername)==filter && $(this).attr(filtername)!='applied'){
						
						if(filterapplied){
							if($(this).is(":visible")){
								$(this).attr(filtername,'applied');
								$(this).show();
							}
						}else{
							$(this).attr(filtername,'applied');
							$(this).show();
						}
					}
				});
				$('li.brandselection').each(function(){
						if($(this).attr('data-'+filtername)==filter && $(this).attr(filtername)!='applied'){						
						if(filterapplied){
							if($(this).is(":visible")){
								$(this).attr(filtername,'applied');
								$(this).show();
							}
						}else{
							$(this).attr(filtername,'applied');
							$(this).show();
						}
					}
				});
			});
			if(!filterapplied){
				
				filterapplied = true;
			}
			
			$('form.product-content:not(['+filtername+'=applied])').hide();
			//$('li.brandselection:not(['+filtername+'=applied])').hide();

	});
	
	
	if($.isEmptyObject(filters)){
		$("form.product-content").show();
		$("li.brandselection").show();
	} else{
		slideProducts();
	}
	
	hideEmptyProductDiv();
	
	showFilterCount();
	
	$('#zoom-image').on('show.bs.modal', function (e) {
		$(this).find('img').attr('src', '');
		var src = $(e.relatedTarget).find('img').attr('src');
		$(this).find('img').attr('src', src);
	});	
	
	$('[data-toggle="popover"]').popover();
	
	var getWidth  = $(window).width();
	if(getWidth < 768){
		// To show popup of Error messages
		if($('.info-box').length > 0){
			var htmlObj = $("<div>"+$('.info-box').html()+"</div>");
			htmlObj.find('img').addClass('warning-icon');
			ECP.alert('',htmlObj.html());
		}
		$("html, body").animate({ scrollTop: $(".product-listing-col").offset().top - $("html, body").offset().top }, 600);
	}

});

$(document).on('click','#clearallfilters',function(){
	location.reload();
	return true;
	var filterstr='tier5Code='+$('#filtertier5codes').val()+'&';
	var val='';
	var selected=0;
	var totalfilter=0;
	var filterData={};
	var filterapplied = false;
	
	$('#filterform select').each(
		function(i) {						
		$("#" + $(this).attr('id') + " option:selected").prop("selected", false);

	});
	$("#filterform input:checked").each(function(){
		this.checked = false;
	});
		
	$('#filterform select option:selected').each(function() {
		if($(this).val()==0){val='';}
		else{val=$(this).val();selected=1;}
		
		filterstr+=$(this).parent().attr('name')+'='+val.replace("-", " ")+'&';
		
	});	
	filterstr+='selected='+selected+'&totalFilterSelected='+totalfilter+'&';
	
	var filters = {};
	$("#filterform input:checked").each(function(){
		//console.log(($(this).val()));
		var filter= $(this).attr('data-filtertype');
		if(typeof filters[filter]=='undefined'){
			filters[filter] = [];
		}		
		filters[filter].push($(this).val());		
	});
	
	$.ajax({
		 type: "POST",			     
	      url: $('#filterform').attr('action'), 
	      data: filterstr,
	      async:false,
	      success: function(data) {	
	    	  $('#carpartslistingsection').html(data); 
	    	  var getWidth  = $(window).width();
	    	  if(getWidth >= 768){
	    		  $('.custom-select').niceSelect();
	    	  }
	      }
	})
	
	
	$("form.product-content").show();
	$("li.brandselection").show();
})

function slideProducts(){
	var length 			= $('li.productbrandslisting').length;
	$('li.productbrandslisting').each(function (index){
		
		$(this).find('.brand-list  li').removeClass("active");
		$(this).find('.brand-list  li[brand="applied"]').eq(0).addClass("active");
		if($(this).find('.brand-list  li[brand="applied"]').length == 0){
			$(this).find('.brand-list  li[position="applied"]').eq(0).addClass("active");
		}
		$(this).find('.brand-list  .active').trigger('click');	
		if(index == length - 1){
			setTimeout(function(){
				$('.wait-box').hide();
				$('.filtercheckboxes').removeAttr('disabled');
			}, 1000);
		}
	});
	if($('.product_brand_detail:visible').length == 0){
		ECP.alert('', window.messages.refine.error.noProducts);
	}
	
}

function hideEmptyProductDiv(){
	$('li.productbrandslisting').each(function (){
		//console.log($(this).attr('id'));
		if($(this).find(".product-content:visible").length==0){
			$(this).hide();
		}
	});
}


$(document).on('click',"#filterBrandProductListing",function(){	
	var nohide			= $(this).data('nohide');
	if(nohide == '' || nohide == undefined){
		$('.product-listing-col .filter-box .filter-overlay').hide();
		$('.filter-box .sfilter').removeClass('active');
		$('.product-listing-col .filter-box .small-filter').slideUp(200);
		$('.filter-box .selection-count').show();
	}
	
	var val='';
	var varcheckedfiltres='';
	var filterData={};
	var filterapplied = false;	
	
	
	var filters = {};
	var checkedfiltercounter=0;
	$('#filterbrandform input[type="checkbox"]').removeAttr('filterApplied');
	$("#filterbrandform input:checked").each(function(){
		checkedfiltercounter++;
		$(this).attr('filterApplied', true);
		var filter= $(this).attr('data-filtertype');
		if(typeof filters[filter]=='undefined'){
			filters[filter] = [];
		}		
		filters[filter].push($(this).val());	
	});	
	
	if($('.infinite-scroll').data('pages') > 1){
		ajaxProductsPagination(1, function(data){
			$('.infinite-scroll').hide().html(data).fadeIn(1000);
		},$('#filterbrandform'));
	} else{
		$('.filtercheckboxes').attr('disabled', 'disabled');
		$('.wait-box').show();
		
		//console.log(filters);
		$("li.productbrandslisting").show();
		$("form.product-content").hide();
		$("li.brandselection").hide();
		$.each(filters,function(filtername,filterarr){			
				$('form.product-content').removeAttr(filtername);
				$('li.brandselection').removeAttr(filtername);
				$.each(filterarr,function(index,filter){				
					$('form.product-content').each(function(){					
						if($(this).attr('data-'+filtername)==filter && $(this).attr(filtername)!='applied'){						
							if(filterapplied){
								//console.log(this);
								//console.log(filter);
								if($(this).is(":visible")){
									$(this).attr(filtername,'applied');
									$(this).slideDown();
								}
							}else{
								$(this).attr(filtername,'applied');
								$(this).slideDown();
							}						
							//console.log(filter);
						}
					});
					$('li.brandselection').each(function(){
						if($(this).attr('data-'+filtername)==filter && $(this).attr(filtername)!='applied'){
							
							if(filterapplied){
								if($(this).is(":visible")){
									$(this).attr(filtername,'applied');
									$(this).slideDown();
								}
							}else{
								$(this).attr(filtername,'applied');
								$(this).slideDown();
							}
						}else{
							//console.log($(this).attr('data-productdetailclass'));
						}
					});
				});
				if(!filterapplied){				
					filterapplied = true;
				}			
				$('form.product-content:not(['+filtername+'=applied])').hide();
				//$('li.brandselection:not(['+filtername+'=applied])').hide();

		});
		
		if($.isEmptyObject(filters)){
			$("form.product-content").show();
			$("li.brandselection").show();
			$('li.brandselection').removeAttr('brand');
			$('.brand-list').each(function(){
				$(this).find('li:first').attr('brand', 'applied');
			});
		}
		
		$('#selectioncounter').html(checkedfiltercounter);
		$('.filterCount').html(checkedfiltercounter);
		slideProducts();
		hideEmptyProductDiv();
	}
});


$(document).on('click','#clearallbrandfilters',function(){
	if($('.infinite-scroll').data('pages') > 1){
		clearAllFilters();
		ajaxProductsPagination(1, function(data){
			$('.infinite-scroll').hide().html(data).fadeIn(1000);
		});
	} else{
		var getWidth  = $(window).width();
		$("li.productbrandslisting").show();	
		$("li.productbrandslisting").each(function(){
			$(this).find('.brandselection:first').trigger('click');
		});
		
		$("form.product-content").show();
		$("li.brandselection").show();
		
		$('#selectioncounter').html(0);
		$('.filterCount').html(0);
		
		$("#filterbrandform input:checked").each(function(){
			$(this).attr('checked',false);
		});
	}
	var nohide			= $(this).data('nohide');
	if(nohide == '' || nohide == undefined){
		$('.product-listing-col .filter-box .filter-overlay').hide();
		$('.filter-box .sfilter').removeClass('active');
		$('.product-listing-col .filter-box .small-filter').slideUp(200);
		$('.filter-box .selection-count').show();
	}
});

$(document).on('click','.filter-box .filter-overlay',function(){
	$('#filterbrandform .filtercheckboxes').each(function(){
		if($(this).attr('filterApplied')){
			$(this).prop('checked', true);
		} else{
			$(this).prop('checked', false);
		}
	});
});

function showFilterCount(){
	var adscounter=0;
	var checkedfiltercounter=0;
	
	if($('#filterform').length !=0){
		$('#filterform select option:selected').each(function() {
			if($(this).val()!=0){adscounter++;}
		});	
		
		$("#filterbrandform input:checked").each(function(){
			if($.trim($(this).val()) !=''){
				checkedfiltercounter++;
			}
		});
		var totalFilterApplied=adscounter+checkedfiltercounter;
		$('#selectioncounter').html(totalFilterApplied);
	}
}

function searchKeyword(obj){
	var value  = $(obj).parent('.searchFormCont').find('input[name="search"]').val();
	if(value == ''){
		ECP.alert('', window.messages.search.error.required);
		return false;
	} else{
		return true;
	}
}

$(document).on('change','#filtervehiclespec select',function(){
	var filterstr='';
	var selected=0;
	$('#filtervehiclespec select option:selected').each(function() {
		if($(this).val()==0){val='';}
		else{val=$(this).val();selected=1;}		
		filterstr+=$(this).parent().attr('name')+'='+val+'&';		
	});	
	filterstr+='selected='+selected+'&';
	//console.log(ECP.getBase() + "/categories/showDistinctFilters");
	if($('.o3b-section').length > 0){
		var showLabel 			= false;
	} else{
		var showLabel 			= '';
	}
	$('#filterform select').attr('disabled', 'disabled');
	$.ajax({
		 type: "POST",			     
	      url:ECP.getBase() + "/catalog/categories/showDistinctFilters?showmanualfilterlabel="+ showLabel, 
	      data: filterstr,
	      async:false,
	      success: function(data) {	
	    	  $('#filtervehiclespec').html(data); 
	    	  $('#filterform select').attr('disabled', false);
	    	  var getWidth  = $(window).width();
	    	  if(getWidth >= 768){
	    		  $('.custom-select').niceSelect();
	    	  }
	      }
	});
	
})

function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    var expires = "expires="+d.toUTCString();
    document.cookie = cname + "=" + cvalue + "; " + expires;
}

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1);
        if (c.indexOf(name) == 0) return c.substring(name.length, c.length);
    }
    return "";
}

function deleteCookie(cname){
	document.cookie = cname + "=;expires=Wed; 01 Jan 1970";
}

function ajaxProductsPagination(page, callback, currentElement, topFilter){
	callback 				= callback || '';
	currentElement 			= currentElement || '';
	$('.wait-box').show();
	$('.filtercheckboxes').attr('disabled', 'disabled');
    if (currentElement != '') {
        if(!currentElement.is(':checked')){
            $('.filtercheckboxes').each(function(){
                var currentObj = $(this);
                if (currentObj.data('value') === currentElement.data('value')){
                    currentObj.prop('checked',false);
                }
            });
        }
    } else {
        $('.filtercheckboxes').each(function () {
            var currentObj = $(this);
            currentObj.prop('checked', false);
        });
    }
	var filters 		= getSelectedFilters();
	if($('.page-list .showall').hasClass('active')){
		var showall 			= true;
	} else{
		var showall 			= '';
	}
	
	var currentFilterBlock			= '';
	if(currentElement){
		currentFilterBlock 	= getCurrentSelectedFilterBlock(currentElement);
	}

	$.ajax({
	      type: "POST",			     
	      url: window.location.href, 
	      data: {'page': page, filters: filters, currentFilterBlock:currentFilterBlock, showall: showall, topFilter: topFilter},
	      success: function(data) {	
			  productImpressionArray = [];
	    	  $('.section3bo').hide().html(data).fadeIn(1000, function(){
				//ipadZoomDisable();
				 perZoom();
			  });
			  
	    	  $('.filtercheckboxes').removeAttr('disabled');
	    	  $('.wait-box').hide();
	    	  //$('.zoom').zoom();
			  popoverDiv();
			  var getWidth  = $(window).width();
			  if(getWidth >= 768){
	    		  $('.custom-select').niceSelect();
	    	  }
			  
	    	  if(callback != ''){
	    	  	callback(data);
	      	}
				if (productImpressionArray.length > 0) {
					dataLayer.push({
					'event' : 'productImpressions',
					  'ecommerce': {'impressions': productImpressionArray }
					});
				}
			  var brandChk 		= $('.brandselection').hasClass('active');
	      }
  });
}

function ajaxNonProductsPagination(page, callback){
	var filters 			= getSelectedFilters();
	var filterCounter 		= parseInt($('#selectioncounter').html());
	callback 				= callback || '';
	$('a.jscroll-next').addClass('loader');
	$.ajax({
		type: "POST",			     
		url: window.location.href, 
		data: {'page': page, filters: filters},
		success: function(data) {
			productImpressionArray = [];
			$('a.jscroll-next').parents('li').remove();
			$('.infinite-scroll').append('<div class="newListing" style="display:none;">'+ data +'</div>');
			$('.newListing').fadeIn(1000, function(){
				data 			= $('.newListing').html();
				$('.newListing').remove();
				$('.infinite-scroll').append(data);
				$('.zoom').zoom();
				popoverDiv();
				 if(callback != ''){
		    	  	callback();
		      	}
			});
			if (productImpressionArray.length > 0) {
				dataLayer.push({
				'event' : 'productImpressions',
				  'ecommerce': {'impressions': productImpressionArray }
				});
			}
		}
	});
}

function getCurrentSelectedFilterBlock(currentElement){
	var filters = {};
	var currentFilterBlock 	= currentElement.closest('ul').find('.filtercheckboxes');
	var currentElementVal 	= currentElement.val();
	/*currentFilterBlock.each(function(){
		var filter= $(this).data('filtertype');
		if(filter == 'attr'){	
			var id 		= $(this).data('attrid');
			var value 	= $(this).val();
			var count 	= $(this).data('count');
			if(typeof filters[filter]=='undefined'){
				filters[filter] 	= {};
			}
			if(typeof filters[filter][id] =='undefined'){
				filters[filter][id] 	= [];
			}
			var arr 			= {'value': value, 'count': count};
			filters[filter][id].push(arr);
		} else{
			var value 	= $(this).val();
			var count 	= $(this).data('count');
			if(typeof filters[filter]=='undefined'){
				filters[filter] 	= [];
			}
			var arr 			= {'value': value, 'count': count};
			
			filters[filter].push(arr);
		}
	});	*/
	filters['current']		= {'filterType': currentElement.data('filtertype'), id: currentElement.data('attrid'), value: currentElement.val(), 'type': currentElement.attr('data-type')};
	filters['check']		= currentElement.is(':checked');
	filters['iscurrent']	= currentElement.hasClass('current-selected');
	/*var previousElement = $('.current-selected');
	if(previousElement.length > 0){
		filters['previous']	= {'filterType': previousElement.data('filtertype'), id: previousElement.data('attrid'), value: previousElement.val(), 'check' : previousElement.is(':checked')};
	}*/
	return JSON.stringify(filters);
}
	
function getSelectedFilters(){
	var filters = {};
	var checkedfiltercounter=0;
    $(".filter-box input:checked, .top-filter-box input:checked").each(function(){
		checkedfiltercounter++;
		var filter= $(this).attr('data-filtertype');
		var type = $(this).attr('data-type');
		var value = $(this).val();
		if(filter == 'attr'){	
			var id 		= $(this).data('attrid');
			if(typeof filters[filter]=='undefined'){
				filters[filter] 	= {};
				filters['attrtype']	= {};
			}
			if(typeof filters[filter][id] =='undefined'){
				filters[filter][id] 	= [];
				filters['attrtype'][id] 	= type;
			}
			if (filters[filter][id].indexOf(value) === -1) {
				filters[filter][id].push(value);
            }
		} else{
			if(typeof filters[filter]=='undefined'){
				filters[filter] 	= [];
			}	
			if (filters[filter].indexOf($(this).val()) === -1) {
			filters[filter].push($(this).val());	
		}
		}
		
	});	
	
	var vehSpec 			= 'ManualSelectCarFilter';
	filters[vehSpec] 		= {};
	$(".filter-box select").each(function(){
		var value 		= $(this).val();
		if(value  != ''){
			checkedfiltercounter++;
			var subfilter = $(this).attr('name');
			if(typeof filters[vehSpec][subfilter] == 'undefined'){
				filters[vehSpec][subfilter] = '';
			}		
			filters[vehSpec][subfilter] = $(this).val();
		}
	});
	
	//console.log(filters);
	/*EPL-7338*/
	var url 			= window.location.pathname;
	
	var vars = {};
    var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
        vars[key] = value;
    });
	$.each(vars, function(k,v){
		if(k == 'page'){
			url = updateUrlParameters(url, 'page', v);
		}
		if(k == 'sort'){
			url = updateUrlParameters(url, 'sort', v);
		}
	});
	
	//var url 			= (location.pathname+location.search).substr(1);
	/*End EPL-7338*/
	$.each(filters, function(index, value){
		if(index == 'attr'){
			$.each(value, function(attrid, attrValArr){
				var label 		= $('.attrlabel-'+ attrid).text().replace(/ /g,"_");
				var values 		= '';
				$.each(attrValArr, function(valIndex, value){
					values 		+= value.replace(/ /g,"_") + '|';
				});
				values 			= values.substring(0, values.length-1);
				url 			= updateUrlParameters(url, label, values);
			});
		} else if(index == 'brand'){
			var label 			= 'Brands';
			var brandValues 	= '';
			$.each(value, function(brandIndex, brandValueAarr){
				brandValues 	+= brandValueAarr.replace(/ /g,"_") + '|';
			});
			brandValues 		= brandValues.substring(0, brandValues.length-1);
			url 				= updateUrlParameters(url, label, brandValues);
		} else if(index == 'ManualSelectCarFilter'){
			$.each(value, function(typendex, typeValue){
				url 				= updateUrlParameters(url, 'Vsp' + typendex, typeValue);
			});
		}
	});
	
	window.history.pushState('', '', url);
	
	$('#selectioncounter').html(checkedfiltercounter);
	//$('.filterCount').html(checkedfiltercounter);
	return JSON.stringify(filters);
}

function clearAllFilters(){
	$('#selectioncounter').html(0);
	$('.filterCount').html(0);
	$(".filter-box input:checked").each(function(){
		$(this).attr('checked',false);
	});
	if($('#filtervehiclespec3bo select').length > 0){
		$("#filtervehiclespec3bo select option").each(function(){
			$(this).prop("selected", false);
		});
		$('#filtervehiclespec select:first').trigger('change');
	}
}

function updatePagination(){
	var totalPages 			= $('#paginationData').data('totalpages');
	var totalItems 			= $('#paginationData').data('totalitems');
	var itemsPerPage 		= $('#paginationData').data('itemsperpage');
	var items 				= (totalItems > itemsPerPage) ? itemsPerPage : totalItems;
	if(items > 0){
		$('.rightcol3bo .list-refine').css('visibility', 'visible');
	} else{
		$('.rightcol3bo .list-refine').css('visibility', 'hidden');
	}
	
	var pageDiv 			= $('.o3b-section .current-page');
	if(totalPages > 1){
		$('.o3b-section .next').addClass('active');
	} else{
		$('.o3b-section .next').removeClass('active');
	}
	$('.o3b-section .page-result span').html(items);
	$('.o3b-section .total-pages').html(totalPages);
	$('.o3b-section .category-product-count').html(totalItems);
	pageDiv.data('totalpages', totalPages);
	var getWidth  = $(window).width();
	if(getWidth >= 768){
		scrollTo('.rightcol3bo');
	}
}

$(document).on('click', '.top-brand-select', function(){
	var title 		= $(this).data('value');
	clearAllFilters();
	if(!$('#filterbrandform .filtercheckboxes[data-value="' + title + '"]').is(':checked')){
		$('#filterbrandform .filtercheckboxes[data-value="' + title + '"]').trigger('click');
	}
	scrollTo('.rightcol3bo');
});
function validateMyAccountForm(){	
	
	var attr = $('#email').attr('readonly');	
	if (typeof attr == typeof undefined) {
		var savedemail = $("#savedemail").val();	
		var email = $("#email").val();
		var emailError = $('.registerEmailError').css('display');
		var cemail = $("#cemail").val();
		if (emailError == 'block') {
			return false;
		} else {	
			var $errorDiv = $(".login-info-form .registerEmailError");
			if(savedemail == email){
				$errorDiv.text(messages.editprofile.changeEmail);
				$errorDiv.show();
				return false;
			} else {
				$errorDiv.hide();
				if(cemail == ""){
					$("#CE").text(messages.editprofile.emptyConfirmEmailField);
					$("#CE").show();
					return false;
				} else {
					if(email == cemail) {
						return true;
					} else {
						$("#CE").text(messages.editprofile.notMatchedConfirmEmailField);
						$("#CE").show();
						return false;
					}
				}			
			}
		}
	} 
	return true;	
}
function enableUpdateEmail(){
	var $email = $('#email');
	var attr = $email.attr('readonly');
	var savedemail = $("#savedemail").val();
	$email.removeClass('valid');
	$email.removeClass('invalid');
	var $errorDiv = $(".login-info-form .registerEmailError");
	if (typeof attr !== typeof undefined && attr !== false) {		
		$email.removeAttr('readonly');
		$email.removeClass('greyout');
		$email.focus();
		$email.val('');
		$email.parent().find('label').text(messages.editprofile.editEmailLabel);
		$('.cemail-box').removeClass('disable');
		$('.cemail-box').addClass('enable');
		$('.newsletterBox').removeClass('hide');
	} else {
		$email.val(savedemail);
		$("#cemail").val('');
		$("#CE").hide();
		$errorDiv.hide();
		$email.parent().find('label').text(messages.editprofile.emailLabel);
		$email.attr('readonly','true');
		$email.addClass('greyout');
		$email.blur();
		$('.cemail-box').removeClass('enable');
		$('.cemail-box').addClass('disable');
		$('.newsletterBox').addClass('hide');
	}
}

function changeAddressPCA (objSelect, strPrefix, strProvider) {
	var id = objSelect.value;
	var objOption = $(objSelect).children('#'+id);
	var pcaAddressType = $(objOption).attr("addresstype");
	var containerId = $(objOption).attr("containerid");
	var postcode = $(objOption).attr("postcode");
	var findCountry = $('#country').val();
	
	if (containerId != '') {
		
		//Check if address type not equal to 'address' than hit find address service
		if (pcaAddressType == "BuildingNumber") {
			$.ajax({
			      type: "POST",			     
			      url: ECP.getBase()+"/secure/services/findAddressLookup",
			      data: {'postcode': postcode, 'country': findCountry, 'containerid': containerId},
			      success: function(data) {
			    	  //obj.removeClass('wait');
			    	 
			    	  addressDropdown = jQuery(data).find('#selectInner').html();
			    	  	$(objSelect).parents('fieldset').find('.secDropDown').remove();
						$('<label for="select" class="secDropDown"></label><span class="outer-select secDropDown">'+addressDropdown+'</span>').insertAfter($(objSelect).parents('.outer-select'));
			    
			      }
		    });
			return false;	
		} else {
			$(objSelect).parents("span.outer-select").addClass('wait');
			$(objSelect).attr("disabled", true);
			var addressType = objSelect.parentNode.parentNode.id;
			
			if (strPrefix == "undefined" || strPrefix == undefined)
			{
				strPrefix = "";
			}
			if(addressType=="shippingAddress") {
				var objAddress1 = document.getElementById(strPrefix + "saddress1");
				var objAddress2 = document.getElementById(strPrefix + "saddress2");
				var objAddress3 = document.getElementById(strPrefix + "stown");
				var objAddress4 = document.getElementById(strPrefix + "scounty");
				var objPostcode = document.getElementById(strPrefix + "spostcode");
			}else{
				var objAddress1 = document.getElementById(strPrefix + "address1");
				var objAddress2 = document.getElementById(strPrefix + "address2");
				var objAddress3 = document.getElementById(strPrefix + "town");
				var objAddress4 = document.getElementById(strPrefix + "county");
				var objPostcode = document.getElementById(strPrefix + "postcode");
			}
			
			$.ajax({
				type: "POST",			     
				url: ECP.getBase()+"/secure/services/retrieveAddressLookup",
				data: {'id': containerId},
				success: function(data, status, jqXHR) {
					if(data.result['postcode']){	
						if ($(objSelect).parents('span').hasClass( "secDropDown" ) == false) {
							$(objSelect).parents('fieldset').find('.secDropDown').remove();	
					    }
						objAddress1.value = data.result['address1'];
						objAddress2.value = data.result['address2'];
						objAddress3.value = data.result['address3'];
						objAddress4.value = data.result['address4'];
						objPostcode.value = data.result['postcode'];
											 
						if(addressType=="shippingAddress") {
							var postcodeVal = $( ".checkout-form #spostcode" ).val();
							var countryVal = $( ".checkout-form #scountry" ).val();
							var international = $('option:selected', ".checkout-form #scountry").attr('international');
							getCarriagesOptions(countryVal, international, postcodeVal);
						}
					}else{
					  objAddress1.value = "";
					  objAddress2.value = "";
					  objAddress3.value = "";
					  objAddress4.value = "";
					  objPostcode.value = "";				
					}
					$(objSelect).parents("span.outer-select").removeClass('wait');
					$(objSelect).attr("disabled", false);
				}
			});
		}
		
		
		
	}
}

$('#contactusform-btn').click(function(){
	var errorName = false;
	var errorEmail = false;
	var errorMsg = false;
	
	if ($("#contactname").val().trim() == '') {
		$("#contactname").siblings('.error').css({"display": "block"}).html(messages.contact.contactname.error);
		errorName = true;
	}else{
		$("#contactname").siblings('.error').css({"display": "none"}).html("");
		errorName = false
	}
	if($("#contactemail").val() == ''){
		$("#contactemail").siblings('.error').css({"display": "block"}).html(messages.contact.contactemail.error);
		errorEmail = true
	}else if(!validateEmail($("#contactemail").val())){
		$("#contactemail").siblings('.error').css({"display": "block"}).html(messages.contact.contactemail.invalidError);
		errorEmail = true
	}else{
		$("#contactemail").siblings('.error').css({"display": "none"}).html("");
		errorEmail = false
	}
	if($("#contactmsg").val().trim() == ''){
		$("#contactmsg").siblings('.error').css({"display": "block"}).html(messages.contact.contactmsg.error);
		errorMsg = true
	}else{
		$("#contactmsg").siblings('.error').css({"display": "none"}).html("");
		errorMsg = false
	}
	if(!errorName && !errorEmail && !errorMsg){
		grecaptcha.execute();
	}
	return true;
});

function contactFormSubmit(){
	$('form[name=contact-form]')[0].submit();
}

$(window).load(function(){
	if(window.location.href.indexOf("toys-and-tech?") > -1){	
		$("html, body").animate({ scrollTop:$('#toy-tech-main-cont').offset().top }, 100);
	}
});
//var url = new URL(window.location.href);
//var url = GetURLParameter(window.location.href);
if(window.location.href.indexOf('?') == -1 || GetURLParameter('page') || GetURLParameter('Categories') || GetURLParameter('Type')) {
	if (productImpressionArray.length > 0) {
		var maxProducts = 8;
		while(productImpressionArray.length ) {
			var productImpression = productImpressionArray.splice(0,maxProducts);
			if (productImpression.length > 0) {
				dataLayer.push({
					'event' : 'productImpressions',
					'ecommerce': {'impressions': productImpression }
				});
			}
		}
	}
}

function productImpression(prdCode, gprdCode) {
	dataLayer.push({
		'event' : 'productImpressions',
		'ecommerce': {
			'impressions': [
				{
					'id': prdCode,
					'name': $('#PQ_'+gprdCode).data('description'),
					'brand': $('#PQ_'+gprdCode).data('brand'),
					'list': $('#PQ_'+gprdCode).data('list'),
					'category': $('#PQ_'+gprdCode).data('category'),
					'price': $('#PQ_'+gprdCode).data('amount'),
					'position': $('#PQ_'+gprdCode).data('listposition')
				}
			]
		}
	});
}

if (promotionsViewArray.length > 0) {
	dataLayer.push({
		'event' : 'promoView',
		'ecommerce': {
			'promoView': {'promotions': promotionsViewArray }
		}
	});
}

function productClick(prdCode) {
	var gprdCode = prdCode.replace(/\./g,'--');
	gprdCode = gprdCode.replace(/\//g,'_');
	dataLayer.push({
		'event': 'productClick',
		'ecommerce': {
			'click': {   
				'actionField': {'list': $('#PQ_'+gprdCode).data('list'), action: 'click'},
				'products': [{
					'id': prdCode,
					'name': $('#PQ_'+gprdCode).data('description'),
					'brand': $('#PQ_'+gprdCode).data('brand'),
					'category': $('#PQ_'+gprdCode).data('category'),
					'price': $('#PQ_'+gprdCode).data('amount'),
					'position' : $('#PQ_'+gprdCode).data('listposition')
				}]
			}
		}
	});
}

function onPromoClick(promoid) {
	var promocode = $('#PC_'+promoid).data('promocode');
	if(promocode != '') {
		dataLayer.push({
			'event' : 'promoClick',
			'ecommerce': {
				'promoClick': {
					'promotions': [
						{
							'id': $('#PC_'+promoid).data('promocode'),
							'name': $('#PC_'+promoid).data('promocode'),
							'creative': $('#PC_'+promoid).data('position'),
							'position': 'banner_slot'+'_'+$('#PC_'+promoid).data('sortorder')
						}
					]
				}
			}
		});
	}
}

function onCheckoutClick(productCheckoutArray) {
	dataLayer.push({
		'event' : 'productCheckout',
		'ecommerce' : { 
			'checkout' : {
				'products' : productCheckoutArray,
				'actionField' : {'step' : 1 }
			}
		}
	});
	window.setTimeout(function () {
        location.href = '/secure/checkout';
    }, 2000);
}

$(document).ready(function(){
	$("#ingenico-policy").click(function(){
		$('.img-spinner').show();
		$.ajax({
			url: ECP.getBase()+"/secure/payment/privacyPolicy", 
			type: 'GET',
			success: function (response) {
				$("#ingenico-pp").html(response.privacyPolicy);
				$('#ingenico-privacy-policy').modal('show');
				$('.img-spinner').hide();
			}
		});
	});
});



function GetURLParameter(sParam){
    var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++)
    { 
		var sParameterName = sURLVariables[i].split('=');
		if (sParameterName[0] == sParam.toLowerCase()) 
        {
			return sParameterName[0]; 
        } 
    } 
}

function popoverDeleivery(){
	var infoHover = {
		over: function(){
			$(this).children('.delivery-popover').fadeIn(100);
		},
		timeout: 100, // number = milliseconds delay before onMouseOut
		out: function(){
			$(this).children('.delivery-popover').fadeOut(100);
		}
	};
    $(".delivery-data .delivery-info-icon").hoverIntent(infoHover);
    $(".info-close").click(function () {
        $('.delivery-popover').fadeOut(100);
    });
}
 
//  EPL-6695
$('#reg-btn').click(function(){
	var errorName = false;
	var errorEmail = false;
	var errorMsg = false;
 
	if ($("#firstname").val().trim() == '') {
		$("#firstname").siblings('.error').css({"display": "block"}).html(window.messages.newsletter.error);
		errorName = true;
	}else{
		$("#firstname").siblings('.error').css({"display": "none"}).html("");
		errorName = false
	}
	if ($("#lastname").val().trim() == '') {
		$("#lastname").siblings('.error').css({"display": "block"}).html(window.messages.newsletter.error);
		errorName = true;
	}else{
		$("#lastname").siblings('.error').css({"display": "none"}).html("");
		errorName = false
	}
	if($("#email").val() == ''){
		$("#email").siblings('.error').css({"display": "block"}).html(window.messages.newsletter.error);
		errorEmail = true
	}else if(!validateEmail($("#email").val())){
		$("#email").siblings('.error').css({"display": "block"}).html(window.messages.newsletter.email.invalidError);
		errorEmail = true
	}else{
		$("#email").siblings('.error').css({"display": "none"}).html("");
		errorEmail = false
	}
	 
	if ($('#tos').is(":checked") ==false || $('#tos2').is(":checked") ==false ) { 
		//ECP.alert('Error',window.messages.newsletter.checkboxerror);
		$("#tos2Error").css({"display": "block"}).html(window.messages.newsletter.checkboxerror);
		errorName = true;
	}
	
	if(!errorName && !errorEmail && !errorMsg){		
		grecaptcha.execute();
	} 
	return true;
});

function newsletterFormSubmit(){
	$('form[name=newsletterform]')[0].submit();
}

/*EPL-6497*/
$(document).ready(function(){
    $('.delivery-inner').find('a.tabcontrols').unbind('click');
    $('.delivery-inner').find('a.tabcontrols').click(function(){
		var parentElem = $(this).parent().attr('class');
        if(parentElem !== undefined){
			parentElem = parentElem.trim();
			$('.responsive-tabs__list').find( "li:last-child" ).trigger('click');
            var sectionId = '';
            if(parentElem.indexOf("delivery-col") != -1){
               sectionId = 'delivey-head-id';
            }
            if(parentElem.indexOf("click-collect") != -1){
                sectionId = 'click-collect-id';
            }
            if(parentElem.indexOf("loc-info") != -1){
                sectionId = 'international-delivery-id';
            }
			

            $('html, body').animate({
                scrollTop: $("#"+sectionId).offset().top - 50
            }, 1000);
        }
        return false;
    });
});
/*end of EPL-6497*/
/* EPL-6561 */
function getUrlParameters() {
    var vars = {};
    var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
        vars[key] = value;
    });
    return vars;
}
/* End EPL-6561 */
/*CI-546*/

$(document).ready(function(){
	$('#sbuscribedToNewsLetter').children('button').click(function(){
		var errorEmail = false
		var email=$("#email").val();
		$('#sbuscribedToNewsLetter').children('.form-group').children('#email').prop("disabled", true);
		$('#sbuscribedToNewsLetter').children('#subscribeToEmailBtn').prop("disabled", true);
		if(email == ''){
			hideJSerror('sbuscribedToNewsLetterSuccess',0);
			$("#sbuscribedToNewsLetterError").css({"display": "block"}).html(window.messages.newsletter.error);
			hideJSerror('sbuscribedToNewsLetterError',3000);
			errorEmail = true
		}else if(!validateEmail(email)){
			hideJSerror('sbuscribedToNewsLetterSuccess',0);
			$("#sbuscribedToNewsLetterError").css({"display": "block"}).html(window.messages.newsletter.email.invalidError);
			hideJSerror('sbuscribedToNewsLetterError',3000);
			errorEmail = true
		}else{
			$("#sbuscribedToNewsLetterError").css({"display": "none"}).html("");
			errorEmail = false
		}
		
		if(errorEmail==true){ 
			$('#sbuscribedToNewsLetter').children('.form-group').children('#email').removeAttr("disabled");
			$('#sbuscribedToNewsLetter').children('#subscribeToEmailBtn').removeAttr("disabled");
		}
		
		
		
		if(errorEmail==false){
			$('#sbuscribedToNewsLetter').children('#email').css('')
			$('#subscribeToEmailBtn').html('Please Wait...');
			$.ajax({
				type: "POST",                 
				url: ECP.getBase()+"/secure/newsletter/othersubscription", 
				data: {'email': $("#email").val()},
				success: function(data) {
					setTimeout(function(){ 
					$('#sbuscribedToNewsLetter').children('.form-group').children('#email').removeAttr("disabled");
					$('#sbuscribedToNewsLetter').children('#subscribeToEmailBtn').removeAttr("disabled");
					$('#sbuscribedToNewsLetter').children('.form-group').children('#email').val('');
					$('#subscribeToEmailBtn').html('Sign up'); 
	$('.emailBrontoSub').hide();
					$('#termtext').hide();
					$('#subscribeToEmailBtn').hide();
					
					
					/*$( "form" ).children('div.form-group.signup-div').removeClass( "form-group signup-div" );*/
					$( "form" ).children('div.form-group.signup-div').addClass( "formsuccessmsg" );
						
					
					$("#thankstextmessage").css({"display": "block"});
					
					$("#sbuscribedToNewsLetterSuccess").css({"display": "block"}).html("You have been successfully subscribed to our newsletter.");
				}, 3000);
				// if($("#sbuscribedToNewsLetterSuccess").css("display")=='block'){
					// setTimeout(function(){ 	
						// $('#sbuscribedToNewsLetterSuccess').html('').css({"display": "none"});	
					// }, 30);		
				// } 
				}        
			});	
			
			
		}
	});
});


function hideJSerror(fieldID,timeInterval){
	setTimeout(function(){ 	
		$("#"+fieldID).css({"display": "none"}).html("");
	}, timeInterval);
}

/*CI-546*/
