/**
 * 
 */
(function($){
	var predefinedarray =  window.messages;
	 var ifvalidationerrorexists = $('#validationerror').val();
	 if( $(".ukregionsdropdown").css("display") == 'none' ){
		 var shipcountry = $(".internationaldropdown").find("select").val();	
	 }else{
		 var shipcountry = $('#scountry').val();
	 }
	var shippostcode = $('#spostcode').val();
	if(typeof(shipcountry) != undefined && ifvalidationerrorexists > 0){
		if(shipcountry == '777' && shippostcode != ''){ 
			getCarriagesOptions(shipcountry, 0, shippostcode);
		}else if(shipcountry != '777'){
			getCarriagesOptions(shipcountry, 1, shippostcode);
		}
		
	}
	$("div.address-confirm-col input[type='radio']").click(function() {
		$(".address-confirm-col").addClass('address-confirm-col confirm-success');							
	}); 
	$('.order-place-btn').on('click',function(){
		formsubmition();
	});
//checkout module js starts here...
	$('.contact-detail .userTypeSelect').on('change',function(){ 
		if($(this).val()=='r'){
			$('.contact-info-form').show();		
			$('.registerPassword').show();
			$('.registerCpassword').show();			
			$('.sign-form').hide();			
		}else if($(this).val()=='g'){		
			$('.contact-info-form').show();		
			$('.registerPassword').hide();
			$('.registerCpassword').hide();
			$('.sign-form').hide();	
		}else if($(this).val()=='s'){
			$('.contact-info-form').hide();		
			$('.sign-form').show();			
		}
	});
	
	//custom codes for popups
	$('#signinbtn').on('click',function(){ 
		userEmail = $('#emailid').val();
		userPassword = $('#spassword').val();
		
		if (!validateEmail(userEmail) || userPassword=='') {
			$('#singinerror').text(messages.loginHeader.invalidemailpassword);
			$('#singinerror').show();
		}else{
			$('#singinerror').hide();	
			$.ajax({
			      type: "POST",			     
			      url: ECP.getBase() + "/login", 
			      data: {'email': userEmail,'password': userPassword},
			      success: function(data) {			    	  
			    	  if(typeof(data.form.errors.error.email) != undefined && data.form.errors.error.email=='invalidemail'){
			    		  $('#singinerror').show();
			    		  $('#singinerror').text(messages.loginHeader.invalidemailpassword);
			    	  }else if(data.form.errors.error.email=='callback'){
			    		  $('#singinerror').show();
			    		  $('#singinerror').text(messages.loginHeader.emailerror);
			    	  }else if(typeof(data.form.errors.error.formError) != undefined && data.form.errors.error.formError=='mismatch'){
			    		  $('#singinerror').show();
			    		  $('#singinerror').text(messages.loginHeader.formerror);
			    	  }else if(data.form.success.status==1){
			    		  
			    		  //google Event tracking
			    		  ga('send', {
								hitType : 'event',
							    eventCategory: 'Sign In',
							    eventAction: 'click',
							    eventLabel: 'Sign In',
							    transport: 'beacon'
							  });
							
			    		  
			    		  window.location.href=window.location.href;
			    	  }
			      }
		    });
		}
		return false;
	});
	$('#slot2, #register').click(function(){
		$("#guest").next('label').removeClass('checked');
		
	});
	$("#clickCollect").on('click', function(){
		removeshippingfromorderdetail();
		$(".profile-info li:nth-child(3)").hide();
		$(".registerPassword, .registerCpassword").val('').hide();
		$('#slot2').removeAttr('checked');
		$('#register').removeAttr('checked');
		$('#guest').attr('checked','checked');
		$('#guest').next('label').addClass('checked');
		$('.sign-form').hide();
		$('.contact-info-form').show();		
		$("#hdsteps3").hide();
		$('#hdstep4n5').hide();	
		$("#homedeliveryshipping").hide(); 
		$('.billing-col.delivery-option').hide();
		//$('.billing-col.delivery-msg').hide();
		if($('#branchid').val() != '' &&	$('#cncpostcode').val() != ''){
			$("#hdsteps3").hide();
			$("#cncstep").show();
		}else{
			$('#clickncollectdetails').show();
		}
	});
	
	
	$("#ukDelivery").on('click', function(){
		var shipcountry = $(".ukregionsdropdown").find('#scountry').val();
		gethomedeliverysteps(shipcountry);
		//clearaddressfields();
		$(".ukregionsdropdown").show();	
		$(".afdpostcode").show();
		$(".ukregionsdropdown").find("#scountry").removeAttr('disabled');
		$(".internationaldropdown").find("#scountry").attr('disabled','disabled');
		$(".ukregionsdropdown").find("#country").removeAttr('disabled');
		$(".internationaldropdown").find("#country").attr('disabled','disabled');
		$(".internationaldropdown").hide();		
	});
	
	
	$("#interDelivery").on('click', function(){
		var shipcountry = $(".internationaldropdown").find('#scountry').val();
		gethomedeliverysteps(shipcountry);	
		//clearaddressfields();
		$(".ukregionsdropdown").hide();		
		$(".afdpostcode").hide();
		$(".billingAddressDiv").hide();
		$(".shipAddressDiv").hide();
		$(".internationaldropdown").find("#scountry").removeAttr('disabled');
		$(".ukregionsdropdown").find("#scountry").attr('disabled','disabled');
		$(".internationaldropdown").find("#country").removeAttr('disabled');
		$(".ukregionsdropdown").find("#country").attr('disabled','disabled');
		$(".internationaldropdown").show();	
	});
	
	$('#changeAddress').on('click',function(){ 
		$('.registered-address').hide();
		$('#shippingform').show();
		$('#changedaddress').val('yes');
		
		
	});
	
	$('.delivery-method-toggle').on('click',function(){
		$("#hdsteps3").hide();
		$("#hdstep4n5").hide();	
		$("#cncstep").hide(); 
	});
	
	
	$('#changeuserbtn').on('click',function(){
		$.ajax({
			type:"GET",
			url: ECP.getBase()+"/users/home/clearonlyusersession",
			  success: function(data) {
				  window.location.href=window.location.href;
			  }
		});
		
	});
	
	if($('#shippingform #scountry option:selected').attr('international')=='0'){
		$('#shippingafdpostcode').removeClass('disable');
	}
	if($('.ukregionsdropdown #country option:selected').attr('international')=='0'){
		$('#billingafdpostcode').removeClass('disable');
	}
	
	$('.ukregionsdropdown #scountry, .internationaldropdown #scountry').on('change',function(){
		var international = $('option:selected', this).attr('international');
		var countryVal = $(this).val();
		var postcodeVal = '';
		
		if(international=='0'){ 
			$('#shippingafdpostcode').removeClass("disable");
		}else{
			$('#shippingafdpostcode').addClass("disable");
		}
		getCarriagesOptions(countryVal, international, postcodeVal);
		
		$('#shippingAddressAfdPostcode, #saddress1, #saddress2, #stown, #scounty, #spostcode').val('');
		$('.shipAddressDiv').hide();
	}); 

	$('.ukregionsdropdown #country').on('change',function(){
		var international = $('option:selected', this).attr('international');
		var countryVal = $(this).val();	
		if(international=='0'){ 
			$('#billingafdpostcode').removeClass("disable");
		}else{
			$('#billingafdpostcode').addClass("disable");
		}
		$('#billingAddressAfdPostcode, #address1, #address2, #town, #county, #postcode').val('');
		$('.billingAddressDiv').hide();
	}); 
	 
	 $('#shipping-find-address-btn').on('click',function(){
		var findPostcodeVal = $( "#shippingAddressAfdPostcode" ).val();
		var findCountry = $('#scountry').val();
		if($('#shippingafdpostcode').hasClass('disable')){
			return false;
		}
		$('#shipping-find-address-btn').addClass('wait');
		if($.trim(findPostcodeVal)){				
			$.ajax({
			      type: "POST",			     
			      //url: ECP.getBase() + "/secure/services/getAFDAddresses",
			      url: ECP.getBase() + "/secure/services/findAddressLookup",
			      data: {'postcode': findPostcodeVal, 'country': findCountry},
			      success: function(data) {
					  
					  var gaVal = findPostcodeVal.toUpperCase();
					  gaVal = gaVal.replace(/ /g,'');
					  //google Event tracking
					  ga('send', {
						hitType : 'event',
						eventCategory: 'Postcode - Check out - HWD',
						eventAction: 'click',
						eventLabel: gaVal
					  });
					  
			    	  addressDropdown = jQuery(data).find('#selectInner').html();
			    	  $('#shippingAddress .secDropDown').remove();
			    	  $('#shippingAddress .outer-select select').remove();
			    	  $('#shippingAddress .outer-select').html(addressDropdown);
			    	  $('.shipAddressDiv').show();
			    	  $('#shippingAddress').show();
			    	  $('#shipping-find-address-btn').removeClass('wait');
			      }
		    });
			return false;
		}else{
			 $('#shipping-find-address-btn').removeClass('wait');
			ECP.alert(messages.checkout.adressfindererror.title, messages.checkout.adressfindererror.error);
			return false;
		}		
	});
	  
	  $( ".delivery-detail #spostcode" ).change(function() {
				var postcodeVal = $(this).val();
				 if( $(".ukregionsdropdown").css("display") == 'none' ){
					 var countryVal = $(".internationaldropdown").find("select").val();	
				 }else{
					 var countryVal = $('#scountry').val();
					 var international = $('option:selected', "#scountry").attr('international');
					 //if(countryVal == '777'){
						 getCarriagesOptions(countryVal, international, postcodeVal);
					// }
				 }				
					
		});
	  
	  $('.payment-detail .differentbilling').on('change', function(){
			if($(this).val() == 'yes'){
				$('.billingform').show();
			}else{
				$('.billingform	').hide();
			}
	  });
	 
	 if($('.contact-billing #country').val()=='777'){
		$('#billingafdpostcode').removeClass('disable');
	 }
	 
	 
	 $('.contact-billing #country').on('change', function(){
		 	if($(this).val() == '777'){
		 		$('#billingafdpostcode').removeClass('disable');
		 	}else{
		 		$('#billingafdpostcode').addClass('disable');
		 	}
	 });
	 
	  $('#billing-find-address-btn').on('click', function(){
			var billingpostcode = $('#billingAddressAfdPostcode').val();
			var findCountry = $('#country').val();
			if($('#billingafdpostcode').hasClass('disable')){
				return false;
			}
			$('#billing-find-address-btn').addClass('wait');
			if($.trim(billingpostcode)){
				$.ajax({
					type: "POST",		
					  //url: ECP.getBase() + "/secure/services/getAFDAddresses",
					  url: ECP.getBase() + "/secure/services/findAddressLookup",
					  data: {'postcode': billingpostcode, 'country': findCountry},
				        success: function(data) {
				    	  addressDropdown = jQuery(data).find('#selectInner').html();
				    	  $('#billingAddress .secDropDown').remove();
				    	  $('#billingAddress .outer-select select').remove();
				    	  $('#billingAddress .outer-select').html(addressDropdown);
				    	  $('.billingAddressDiv').show();
				    	  $('#billingAddress').show();
				    	  $('#billing-find-address-btn').removeClass('wait');
				      }
			    });
				return false;
			}else{
				$('#billing-find-address-btn').removeClass('wait');
				ECP.alert(messages.checkout.adressfindererror.title, messages.checkout.adressfindererror.error);
				return false;
			}		
		});
	
	
	
})(jQuery);

function gethomedeliverysteps(shipcountry){
	$(".profile-info li:nth-child(3)").show();
	$("#hdsteps3").hide();
	$("#homedeliveryshipping").show(); 		
	$("#cncstep").hide(); 		
	$("#clickncollectdetails").hide(); 		
	/* $('#scountry option').filter(function(){
		if($(this).attr('selected') == 'selected'){
			$(this).removeAttr('selected');
			
		}
	});
	$('#scountry').find('option:eq(0)').attr('selected', 'selected');
	$('#scountry').find('option:eq(0)').prop('selectedIndex', 1); 	 */
	  $('.billing-col.delivery-option').hide();
	  //$('.billing-col.delivery-msg').hide();
	  $("#hdstep4n5").hide();
	var shippostcode = $('#spostcode').val();
	if(typeof(shipcountry) != undefined){
		if(shipcountry == '777' && shippostcode != ''){ 
			getCarriagesOptions(shipcountry, 0, shippostcode);
		}else if(shipcountry != '777'){
			getCarriagesOptions(shipcountry, 1, shippostcode);
		}
		
	}
	$('#order-place-btn').html('<img title="Place Order" alt="Place Order" src="/theme/ecp/assets/images/checkout-lock-icon.png"> Place Order');
}

function clearaddressfields(){
		$('#shippingform .address-field input, #billingform .address-field input').each(function(){
			$(this).val('');
		});
}

function removeshippingfromorderdetail(){
	var position = $('#totalAmountPayable').data('position');
	var symbol = $('#totalAmountPayable').data('symbol');
	var totalamountwithoutdelivery = $('#totalAmountPayable').attr('basketprice');
	var shippingcharges;
	if(position > 0){
		shippingcharges = '0.00' + symbol;
		totalamountwithoutdelivery = totalamountwithoutdelivery +  symbol;
	}else{
		shippingcharges =  symbol +  '0.00';
		totalamountwithoutdelivery =  symbol +  totalamountwithoutdelivery;
	}
	$('#shipdesc').html(' delivery');
	$('#shippingchrges').html(shippingcharges);
	$('#totalprice').html(totalamountwithoutdelivery);
	$('#summarytotalprice').html(totalamountwithoutdelivery);
	$('#basketDeliveryAmountDesc').html('');
	$('#shippingAmount').html(shippingcharges);
	$('#totalAmountPayable').html(totalamountwithoutdelivery);
	$('#order-place-btn').html('<img title="Place Order" alt="Place Order" src="/theme/ecp/assets/images/checkout-lock-icon.png">Reserve');
}


function formsubmition(){
	if ($("#clickCollect").is(':checked')) {
		var firstName = $.trim($('input#firstname').val());
		var lastName = $.trim($('input#secondname').val());
		if($("#branchid").val() == ''){
			window.ECP.alert(messages.checkout.cncerror.title, messages.checkout.cncerror.error);
			return false;
		}else if($('input#email').val() == '' || !validateEmail($('input#email').val())){
			window.ECP.alert('', messages.checkout.emailError.error);
			return false;
		}else if(firstName == ''){
			window.ECP.alert('', messages.checkout.firstNameError.error);
			return false;
		}else if(lastName == ''){
			window.ECP.alert('', messages.checkout.secondNameError.error);
			return false;
		}else if($('input#mobileno').val() == '' || !validatePhone($('input#mobileno').val())){
			window.ECP.alert('', messages.checkout.mobilenoError.error);
			return false;
		}else{
			if($('#recaptcha').length > 0){
				grecaptcha.execute();
		}else{
				cncFormSubmit();
			}
		}
	}else{
		if($('#hdsteps3').is(":visible")){
			if($(".delivery-data input[type='radio']:checked").val() == undefined || $(".delivery-data input[type='radio']:checked").val() == 'undefined'){
					if($(".delivery-data.nodeliveryOptions").length < 1){
						$(".delivery-data").attr('class','row row-xs-height delivery-data');
					}
					window.ECP.alert(messages.checkout.deliveryerror.title, messages.checkout.deliveryerror.error);
					$(".delivery-data input[type='radio']").focus();
					return false;				
			} 
			var ischecked = false;
			$(".select-payment-mode li  input[type='radio']").each(function(){
				if($(this).is(':checked')){
					ischecked = true;
				}				
			});
			if(!ischecked){
				window.ECP.alert(messages.checkout.paymenterror.title, messages.checkout.paymenterror.error);
				return false;
			}
			
			var billchecked = false;
			$(".address-confirm-col input[type='radio']").each(function(){
				if($(this).is(':checked')){
					billchecked = true;
				}				
			});
			if(!billchecked){
				//window.ECP.alert(messages.checkout.billingerror.title, messages.checkout.billingerror.error);
				$(".address-confirm-col").addClass('address-confirm-col confirm-error');
				$("div.address-confirm-col input[type='radio']").click(function() {
							$(".address-confirm-col").removeClass('confirm-error');
							$(".address-confirm-col").addClass('address-confirm-col confirm-success');							
				});
				
				return false;
			}
 

			/*
			if($(".select-payment-mode input[name='paymentMethodType']:checked").val() == undefined || $(".select-payment-mode input[name='paymentMethodType']:checked").val() == 'undefined'){
				$(".select-payment-mode li").each(function(){
					$(this).attr('class','');
				});
				window.ECP.alert('Payment Methods  Error', "Please select a payment method.");
				return false;
			}  */
		}
		window.ECP.showloader();
		$('form[name=checkout-form]')[0].submit();
	}
}


function cncFormSubmit(){
	window.ECP.showloader();
	$('form[name=checkout-form]')[0].submit();
	$('.order-place-btn').css('pointer-events','none');
}
