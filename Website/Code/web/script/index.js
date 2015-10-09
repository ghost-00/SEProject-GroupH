// JavaScript Document
$(document).ready(function(){
  
  $('#form-bg').show(1000);

  $('#login').click(function(){
	$.post("index.php/login", {usernam: $("#email").val(), password: $("#password").val()}, function(data){
		
		$("#message").html(data)
		
	});
  });
	
  $('#new-account').click(function(){
	$('#sign-in-form').hide();
	$('#form-bg').hide();
	$('#form-bg-sign-up').show();
	$('#sign-up-form').show();
  });
  
  $('#error').click(function(){
	$('#sign-in-form').hide();
	$('#password-form').show();
  });
  
  $('#cancel').click(function(){
	$('#password-form').hide();
	$('#sign-in-form').show();
  });
  
  $('#cancel-new').click(function(){
	$('#sign-up-form').hide();
	$('#form-bg-sign-up').hide();
	$('#form-bg').show();
	$('#sign-in-form').show();
  });
	
  $('#my-account').click(function(){
	$('#sign-up-form').hide();
	$('#form-bg-sign-up').hide();
	$('#form-bg').show();
	$('#sign-in-form').show();
  });
  
  $('#valide').click(function(){
	/*To do*/
  });
  
  $('#confirm').click(function(){
	/*To do*/
  });
  	
});