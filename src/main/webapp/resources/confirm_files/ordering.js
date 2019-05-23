/**
 * 
 */
(function($, window, document, undefined){
	$(document).on('click', "a[id^=cncanchor_ ]", function(ev){	
	    var prdcode = $(this).attr("data-prdcode");
	    $('#cncprdcode').val(prdcode);	
	});
	/* $("#basketdetailsdiv").on('click', ".checkout-btn",function(){
		 window.location.href = ECP.getBase()+'/secure/checkout';
	}); */
	$('#basketdetailsdiv').on('click',"a[id^='delete-btn']",function(){
		window.Basket.removefromcart($(this).attr('data-prdcode'));
	});

	$('#basketdetailsdiv').on('click','.add',function(){
		var $qty = $(this).prev('.qty');
        var currentVal = parseInt($qty.val());
        if(!isNaN(currentVal)){
            $qty.val(currentVal + 1);
        }
    });
	$('#basketdetailsdiv').on('click','.minus',function(){
        var $qty = $(this).next('.qty');
        var currentVal = parseInt($qty.val());
        if(!isNaN(currentVal) && currentVal > 0){
            $qty.val(currentVal - 1);
        }
    });
	/*$('#quickbasketLi').on('click',"a[id^='mini_delete_btn']",function(){
		removefromminicart($(this).attr('data-prdcode'));
	});
	$('#quickbasketLi').on('click','.add',function(){
		var $qty = $(this).prev('.qty');
		var currentVal = parseInt($qty.val());
		if(!isNaN(currentVal)){
			$qty.val(currentVal + 1);
		}
	});
	$('#quickbasketLi').on('click','.minus',function(){
		var $qty = $(this).next('.qty');
		var currentVal = parseInt($qty.val());
		if(!isNaN(currentVal) && currentVal > 0){
			$qty.val(currentVal - 1);
		}
	});*/
	$('#basketdetailsdiv').on('click','#promoUpdate', function(){ 
		/* if($.trim($('#promotionalCode').val()) != ''){
			updateBasket();		
		}else{
			window.ECP.alert($('#promoerror').attr('data-type'), $('#promoerror').val());
		} */
		
		if($.trim($('#promotionalCode').val()) != ''){
			var gaVal = $('#promotionalCode').val().toUpperCase();
			var gaVal = gaVal.replace(/ /g,'');
			//google Event tracking
			ga('send', {
				hitType : 'event',
			    eventCategory: 'Promo Code',
			    eventAction: 'click',
			    eventLabel: gaVal
			  });
		}
		window.Basket.updateBasket();		
	});
	
	$('#basketdetailsdiv').on('click','#promoRemove', function(){ 
		$('#promotionalCode').val('');
		$('#promoRemove').addClass('wait');
		window.Basket.updateBasket();		
	});

	$('#basketdetailsdiv').on('keypress','#promotionalCode', function(e){	
		if(e.which == 13) {
			window.Basket.updateBasket();	
		}
	});	
	
	$('.content-section').on('click','.model-btn', function(){
		$("#"+$(this).data('target')).modal('show');
	});
	$('#cart-button').on('shown.bs.modal', function() {
		$(".pswd-form .error").hide();
	});
	
	//	checkout login error 
	if($('#checkout-form input.userTypeSelect[value="s"]').prop('checked')){
		$("#checkout-form #signinbtn").trigger("click");
	}
	
	//checkout login email error
/*	$(".checkout .sign-form #emailid").focusout(function(){
		var $this = $(this);
		userEmail = $this.val();
		var $errorDiv = $(".checkout .sign-form #loginEmailError");
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
	}); */
	
	//checkout register email error
	$(".checkout .contact-info-form #email").focusout(function(){				    
			var $this = $(this);
			userEmail = $this.val();
			var $errorDiv = $(".checkout .contact-info-form .registerEmailError");
			$errorDiv.hide();
			$(this).removeClass('invalid');
			if(userEmail!=''){
				if (!validateEmail(userEmail)) {
					$(this).removeClass('valid');
					$(this).addClass('invalid');
					$errorDiv.show();
					$errorDiv.text(messages.forgotpassword.invalidemail);
				}else{
					
					//check bronto subscription
					$.ajax({
					      type: "POST",			     
					      url: ECP.getBase()+"/secure/newsletter/checkIfEmailExists", 
					      data: {'email': userEmail},
					      success: function(data) {	
					    	  if(typeof data.form !== 'undefined'){
					    		  if(data.form.success.status==1){
					    			  $('#main-bsubscribe').hide();
						    	  }else if(data.form.success.status==0){
						    		  var checkbox = '<input type="checkbox" value="1" class="chkBox" id="bsubscribe" name="bsubscribe" /><label for="bsubscribe">' + messages.bsubscribe.label + '</label>';
						    		  $('#main-bsubscribe').html(checkbox);
						    		  $('#main-bsubscribe').show();
						    	  }
					    	  }			    	  
					      }
				    });
					
					if($('.checkout .contact-info-form .registerPassword').is(':visible')) {
						$.ajax({
						      type: "POST",			     
						      url: ECP.getBase()+"/users/login/checkifemailexists", 
						      data: {'email': userEmail},
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
							    	  }
						    	  }			    	  
						      }
					    });
					}else{
						$this.removeClass('invalid');
			    		$this.addClass('valid');
					}
				}
			}	
			
		return false;
	});
	
	var getWidth = $(window).width();
	
	if(getWidth <= 767){
		
		$('#shippingform #scountry').on('change', function(){
			if($(this).val()){
				$('#shippingform .select-country').css('opacity', 1);
				$('#shippingform .address-field').css('opacity', 0.5);
			}
		});
		
		$('#shippingform .address-field input').on('focus', function(){
			var country 	= $('#shippingform #scountry').val();
			$('#shippingform .address-field').css('opacity', 1);
			if(country == ''){
				$('#shippingform .select-country').css('opacity', 0.5);
			} else{
				$('#shippingform .select-country').css('opacity', 1);
			}
		});
	}
	
	$('.stock-availability-list .stock-detail').addClass('prev-stock');
	
	$(document).on('change', '.oncCheck', function(){
		var qty		 	= $(this).val();
		var branch 		= $(this).data('branch');
		var branchElem 			= $('#branchstock_' + branch );
		var branchVal 			= branchElem.data('branch-value');
		var currentBranchStockElem 	= $(this).closest('.stock-availability-list li');
		currentBranchStockElem.find('.after-stock').remove();
		if(qty > branchVal){
			var oncbranchVal 		= branchElem.data('onc-value');
			var ndcbranchStatus 	= branchElem.data('onc-status');
			if(qty <= oncbranchVal){
				var oncText 				= $('.oncText').html();
				currentBranchStockElem.find('.stock-detail').addClass('hidden').after(oncText);
				if(ndcbranchStatus == 'next'){
					var oncClass	= '.next-day';
				} else{
					var oncClass	= '.next-working-day';
					currentBranchStockElem.find('.after-stock').find('.next-working-day span').html(ndcbranchStatus);
				}
				currentBranchStockElem.find('.after-stock').find(oncClass).removeClass('hidden');
			} else{
				var outStockText 				= $('.outStockText').html();
				currentBranchStockElem.find('.stock-detail').addClass('hidden').after(outStockText);
			}
		} else{
			currentBranchStockElem.find('.prev-stock').removeClass('hidden');
		}
		
	});
	
	
/**
 * Basket class for handling basket related functions
 */

	var defaults;	
		
	var cncdefaults;	
	window.Basket.Cnc = {
				setConfig:function(options){
					defaults = $.extend({}, cncdefaults, options);
					return this;
				},
				checkPostcode : function (){
					var	postcode = $('#postcode').val();
					if($.trim(postcode) ==''){
						$(".pswd-form .error").html(messages.cncpopup.error.required);
						$(".pswd-form .error").show();		
					} 		
					var	prdcode = $('#cncprdcode').val();
					var	prdurl = $('#cncanchor_'+prdcode).data('link');
					var  qty = $('#cncanchor_'+prdcode).data('qty');
					
					if(qty == undefined){
						qty = 0;
					}
					
					var prdurlparts  = prdurl.split('/?');
					prdurl = prdurlparts[0];	

					var querystring = '/?'+prdcode+'&'+$('#cncanchor_'+prdcode).data('lookup');
					if($.trim($('#cncanchor_'+prdcode).data('hash')) != ''){
						querystring = querystring+'&'+$('#cncanchor_'+prdcode).data('hash');
					}
					querystring = querystring+'&'+$('#cncanchor_'+prdcode).data('catcode');
					//console.log(querystring); return false;
					if($.trim(postcode) !='' && prdcode != ''){
						$('.wait').css("display",'inline-block');
						$.ajax({
							type : "POST",
							url :ECP.getBase()+ "/stores/cnc/checkValidPostcode",
							data : {
								'postcode':postcode
							},
							timeout: 20000,
							success: function(response){
								try {
										var gaVal = postcode.toUpperCase();
										gaVal = gaVal.replace(/ /g,'');
										var eventPageType = $('input[name=eventPageType]').val();
										if(eventPageType){
											//google Event tracking
											ga('send', {
												hitType : 'event',
												eventCategory: eventPageType,
												eventAction: 'click',
												eventLabel: gaVal
												
											});
										}
										var data =  $.parseJSON( response )
									  	window.settings.postcode = postcode;
										window.location.href =prdurl+'/'+data.lat+'/'+data.long+'/'+qty+querystring;						
									} catch(e) {
										$(".pswd-form .error").hide();
										$(".pswd-form .error").html(response);
										$(".pswd-form .error").show();			
										$('.wait').css('display', 'none');
									}
								return false;				
							},
							error: function(xhr, status, message) {
						        if(status == "timeout") {
						        	$(".pswd-form .error").hide();
									$(".pswd-form .error").html('Sorry, Please try after some time.');
									$(".pswd-form .error").show();			
									$('.wait').css('display', 'none');
						       }
						   }
						});		
					}
				},
				 addToCncBasket:function(prdCode, ordertype, branchid,branchaccount){					
					var jsondata =  jQuery.parseJSON($('#product_'+prdCode).attr('data-jsondata'));
					var strFriendlyUrl = $('#PQ_'+prdCode).data('friendlyurl');
					var description = $('#PQ_'+prdCode).data('description');
					var iLookup = $('#PQ_'+prdCode).data('lookup');
					var strHash = $('#PQ_'+prdCode).data('hash');
					var iCollect = $('#PQ_'+prdCode).data('collect');
					var tier5code = $('#PQ_'+prdCode).data('tier5code');
					var productbasketqty = $('#PQ_'+prdCode).data('basketqty');
					var iQuantity = $('#PQ_'+prdCode).val();
					var isHdEnabled = $('#PQ_'+prdCode).data('ishdenabled');
					var isCncEnabled = $('#PQ_'+prdCode).data('iscncenabled');
					var category      = $('#PQ_'+prdCode).data('category');
					var amount 		= $('#PQ_'+prdCode).data('amount');	
					//console.log('#PQ_'+prdCode+'_'+branchid); return false;
					if(typeof($('#PQ_'+prdCode+'_'+branchid).val()) != 'undefined'){  
						var iQuantity = $('#PQ_'+prdCode+'_'+branchid).val();
						var branchname = $('#branchstock_'+branchid).data('branchname');
						
						//var continuelink = ECP.getBase()+'/basket';	
						
					}else{ 
						var iQuantity = $('#PQ_'+prdCode).val();
						var branchname = window.settings.cncselectedbranchname;
						
						//var continuelink =  null;
						
					}
					
					var continuelink = 'javascript:history.go(-1)';
					
					var branchstock = $('#branchstock_'+branchid).val();	
					if(jsondata.tier5code != tier5code){ console.log("tier5code mismatch");
						return false;
					}
					if(jsondata.collect != iCollect){ console.log("collect mismatch");
						return false;
					}
					if(jsondata.lookup != iLookup){ console.log("lookup mismatch");
						return false;
					}
					
					if($.trim(ordertype) == 'clickncollect' || $.trim(ordertype) == 'orderncollect'){
						if((typeof branchstock != undefined) && (parseInt(iQuantity) > parseInt(branchstock))){ 
						//window.ECP.confirm('Confirm',"Order will be delieverd next day since ordered quantity is greater than branch stock.",function(){addToCncBasket(prdCode, 'orderncollect', branchid,branchaccount)});
							window.ECP.alert('Error','Ordered quantity is more than branch stock');
						return false;
						}
					}   

					if(!/[1-9]/.test(iQuantity)) { console.log("invalid quantity");
						window.ECP.alert('Error', "Please enter a valid quantity value",'');	
						return false;
					}
					
					var tier3cat = $('#tier3cat').val();
					tier3cat = encodeURIComponent(tier3cat);
					var productCode = prdCode;
					if(isNaN(prdCode)){
						var productCode = prdCode.replace('_','/');
						productCode = productCode.replace('--','.');
					}
					
					iQuantity = Math.round(iQuantity);

					// it is used for selling products in pair
					var prdMinQty = 1;
					// it is used for selling products in pair
					var prdType = $('#PQ_'+prdCode).data('type') ? $('#PQ_'+prdCode).data('type') : 0;
					if(prdType == 2){
						prdMinQty = 2;
						if(iQuantity % 2 != 0){
							iQuantity = iQuantity - 1;
						}
					}
					
					if(iQuantity == 0) {
						iQuantity = prdMinQty;
					}	
					//for moving product from hd to cnc and selecting branch
					if(productbasketqty != undefined){
						if(iQuantity > productbasketqty){
							iQuantity = iQuantity - productbasketqty;
						}else {
							iQuantity = 0;
						}
					}
					 $('.addtocartbtn').each(function(){	
						 if($(this).attr('onclick').search(prdCode) > 0){
								$(this).addClass('wait addtocartbtn');
							}
							$(this).data('onclick', $(this).attr('onclick'));
							$(this).removeAttr('onclick');
					});
					var gamount = amount * iQuantity;
					gamount = gamount.toFixed(2);
					var gproductCode = prdCode;
					addToCartBranch(gproductCode, productCode, branchid, iQuantity, gamount);
					$.ajax({
					      type: "POST",			     
					      url: ECP.getBase()+"/basket/basket/addtocart", 
					      data: {
					    	  'Productcode': productCode,
					    	  'Quantity':iQuantity,
					    	  'Description':encodeURIComponent(description),
					    	  'ProductUrl':strFriendlyUrl,
					    	  'Tier5Code':tier5code,
					    	  'LookUp':iLookup,
					    	  'ProductHash':strHash,
					    	  'Collect':iCollect,
					    	  'Tier3cat':tier3cat,
					    	  'basketType':'clickncollect',
					    	  'branchid':branchid,
					    	  'ordertype':ordertype,
					    	  'branchname':branchname,
					    	  'branchaccount':branchaccount,
					    	  'ishdenabled':isHdEnabled,
					    	  'iscncenabled':isCncEnabled,
							  'category':category,
					    	  'type':prdType
					    	  },
					      
					      success: function(data) {		
					    	  if(data.success){
								
					    		 window.Basket.__displaySuccessMsg(prdCode,continuelink);
								
					    		 window.Basket.__displayQuickBasket();
					    		 window.Basket.__updateBrontoCart();
					    		 
					    	  }else{
					    		  window.ECP.alert('Error', data.error+data.result);	    	
					    		  //console.log(data.error);
					    		  //console.log(data.result);
					    	  }
					      }
					});		
				},
				changeStore:function(inputid){
					var	postcode = $('#'+inputid).val();					
					$('#'+inputid).next().next().hide();

					if($.trim(postcode) !=''){
						$('.wait').css("display",'inline-block');
						$.ajax({
							type : "POST",
							url :ECP.getBase()+ "/stores/cnc/checkValidPostcode",
							data : {
								'postcode':postcode,
								'storechange':1
							},
							timeout: 20000,
							success: function(response){
								try {
										var gaVal = postcode.toUpperCase();
										gaVal = gaVal.replace(/ /g,'');
										var eventPageType = $('input[name=eventPageType]').val();
										//google Event tracking
										ga('send', {
											hitType : 'event',
										    eventCategory: eventPageType,
										    eventAction: 'click',
										    eventLabel: gaVal
										});
										var data =  $.parseJSON( response )
									  	window.location.href =ECP.getBase()+'/stores/cnc/changecncstore/?lat='+data.lat+'&long='+data.long;						
									} catch(e) {
										$('#'+inputid).next().next().html(response);
										$('#'+inputid).next().next().show();
										$('.wait').css("display",'none');
									}
								return false;				
							},
							error: function(xhr, status, message) {
						        if(status == "timeout") {
						        	
						        	$('#'+inputid).next().next().html('Sorry, Please try after some time.');
									$('#'+inputid).next().next().show();
									$('.wait').css("display",'none');
						        	
						       }
						   }
						});
					}else{
						$('#'+inputid).next().next().html(messages.cncpopup.error.required);
						$('#'+inputid).next().next().show();
						$('.wait').css("display",'none');
					}
					
				},
				changestoreoncheckout:function(inputid){
					var	postcode = $('#'+inputid).val();
					var oncheckout = $('#oncheckout').val();
					
					if($.trim(postcode) !=''){
						$('.order-place-btn').unbind( "click" );
						$('#cncpostcodefindbtn').attr('disabled','disabled');
						$.ajax({
							type : "POST",
							url :ECP.getBase()+ "/stores/cnc/checkValidPostcode",
							data : {
								'postcode':postcode,
								'storechange':1,								
							},
							timeout: 20000,
							success: function(response){
								try {

										var gaVal = postcode.toUpperCase();
										gaVal = gaVal.replace(/ /g,'');
										//google Event tracking
										ga('send', {
											hitType : 'event',
										    eventCategory: 'Postcode - Check out - CNC',
										    eventAction: 'click',
										    eventLabel: gaVal
										});
										var data =  $.parseJSON( response );
										$('#cncerrorspan').hide();
										$('.loc-data').html('<div class="img-spinner"><img id="img-spinner"  width="100" src="/assets/img/puff.svg" alt="Loading"/></div>');
									 $.ajax({
											type : "GET",
											url :ECP.getBase()+ "/stores/cnc/changecncstore",
											data : {
												'lat':data.lat,
												'long':data.long,		
												'oncheckout':oncheckout
											},
											success: function(cncresponse){
												if(cncresponse != 'sessionexpired'){													
													$("#hdsteps3").hide();
													$('.loc-data').html(cncresponse);
													$(document).on('click','.order-place-btn',function(){
														formsubmition();
													});
													$('#cncpostcodefindbtn').removeAttr('disabled');
												}else{
													document.location.href = ECP.getBase()+'/basket';
												}
											}
										
										}); 
									  						
									} catch(e) {
										$('#cncerrorspan').html(response);
										$('#cncerrorspan').show();
										$(document).on('click','.order-place-btn',function(){
											formsubmition();											
										});
										$('#cncpostcodefindbtn').removeAttr('disabled');
									}
									
								return false;				
							},
							error: function(xhr, status, message) {
						        if(status == "timeout") {
						        	$('#cncerrorspan').html('Sorry, Please try after some time.');
									$('#cncerrorspan').show();
									$(document).on('click','.order-place-btn',function(){
										formsubmition();											
									});
									$('#cncpostcodefindbtn').removeAttr('disabled');
						       }
						   }
						});
					}else{
						$('#cncerrorspan').html(messages.cncpopup.error.required);
						$('#cncerrorspan').show();
					}
					
				},
				selectStore:function(branchid, branchAcc, branchName){
					if($.trim(branchid) == '' || $.trim(branchAcc) == '' || $.trim(branchName) == ''){
						return false;
					}
					$.ajax({
						type:'POST',
						url: ECP.getBase()+'/stores/cnc/selectStore',
						data:{
							'branchid':branchid,
							'branchAccount':branchAcc,
							'name':branchName
						},
						
						success:function(data){
							console.log(data);
							if(data.response.success == true){
								var msg 	= '<div class="popNotificationMessage success">' + window.messages.selectstore.success.message + '</div>';
									window.ECP.confirm(window.messages.selectstore.success.label, msg,function(){ window.location.href =ECP.getBase()+'/basket'; });
							}else{
								window.ECP.alert(window.messages.selectstore.error.label,window.messages.selectstore.error.message);
							}
						}
					});
				}, 
				checkoutselectStore:function(changestorebtn, branchid, branchAcc, branchName){
					if($.trim(branchid) == '' || $.trim(branchAcc) == '' || $.trim(branchName) == ''){
						return false;
					}
//CI-318
                    var branchdistance = branchseourl ='';
                    if(changestorebtn !='') {
					var branchdistance = changestorebtn.getAttribute('data-brdistance');
					var branchseourl = changestorebtn.getAttribute('data-brseourl');
                    }
//CI-318
					$.ajax({
						type:'POST',
						url: ECP.getBase()+'/stores/cnc/selectStore',
						data:{
							'branchid':branchid,
							'branchAccount':branchAcc,
							'name':branchName,
							'oncheckout': 1
						},
						
						success:function(data){										
							//window.ECP.alert(window.messages.selectstore.success.label,window.messages.selectstore.success.message);								
							$('#hdstep4n5').hide();						
							$('.loc-selected').show();						
							$('.loc-data').html('');				
							$('#branchid').val(branchid);
							$('#cncselectedbranch').html(branchName);
							$('#cncselectedbranchdistance').html(branchdistance);
							$('#cncselectedbranchlink').attr('href',branchseourl);
							$('#cncstep').show();
							$('#clickncollectdetails').hide();
							$('.delivery-option .detail-box').html(data);
							/* $('.branch_'+branchid).map(function(){
								var oldclass = $(this).attr('class');
								var newclass =  oldclass+' active';
								$(this).attr('class',newclass);
							});
							$(changestorebtn).html('Selected Store');
							$(changestorebtn).attr('title', 'Selected Store');
							$(changestorebtn).attr('class', 'select-store-btn disable-btn');
							$(changestorebtn).removeAttr('onclick');  */
						}
					});
				}
		}
				
		
})(jQuery, window, document);



function moveAllToHomedel(){
	$.ajax({
		type:"POST",
		url:ECP.getBase()+'/basket/basket/moveAllToHomedelivery',
		data: {
			'basketType': 'homedelivery'
		},
		success: function(data){
			if(data.response.success == true){
				window.location.href =ECP.getBase()+'/basket';
			}else{
				console.log(response);
			}
		}
	});
}